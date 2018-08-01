package com.spring.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.MainInter;
import com.spring.dao.MemberInter;
import com.spring.dto.CartDTO;
import com.spring.dto.MemberDTO;
import com.spring.dto.NoticeBoardDTO;
import com.spring.dto.ProductDTO;
import com.spring.dto.ShopDTO;
@Service

public class MainService {

   private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired SqlSession sqlSession;
   MainInter mainInter;
   MemberInter memInter;
   

   HashMap<String,String> m_fileList = new HashMap<String,String>(); // 메인이미지
   HashMap<String,String> s_fileList = new HashMap<String,String>(); // 서브이미지
   HashMap<String,String> r_fileList = new HashMap<String, String>();
   
   public void getMainList(Model model) {
      logger.info("메인리스트 출력 실행");
      mainInter = sqlSession.getMapper(MainInter.class);   //sql 세션 연결
      model.addAttribute("product", mainInter.getMainList());//출력물 모델에 담기
   }
   
   //상점개설 여부 상태
   public HashMap<String, String> getMemShopState(String id, HttpSession session) {
      logger.info("맴버 상점개설 여부 상태값 반환");
      HashMap<String, String> map = new HashMap<String, String>(); // ajax로 값을 담아 보내줄 맵 생성
      mainInter = sqlSession.getMapper(MainInter.class); //sql 세션 연결
      String result = mainInter.getMemShopState(id); // 상점 개설 상태값 반환 (id :로그인시 아이디 세션값)
      logger.info("상점개설여부값 : {}", result);
      map.put("result", result); // 맵에 담기
      session.setAttribute("shopState", result); // 세션에 담기
      return map;
   }

   //상점개설 -> 상점명 입력값 넣기
   public HashMap<String, Object> setShopName(HashMap<String, Object> params) {
      logger.info("상점명 입력값 넣기");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      String shopName = (String) params.get("shopName");
      String id = (String) params.get("id");
      int success = mainInter.setShopName(shopName,id);
      if(success > 0) {
         logger.info("success : {}", success);
         map.put("success", success);
      }
      return map;
   }
   
   //상점개설 -> 상점명 중복값 확인
   public HashMap<String, Object> shopOverlay(String shopName) {
      logger.info("상점명 중복값 확인");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      String result = mainInter.shopOverlay(shopName);
       boolean overlay = false;
       logger.info("result" + result);
       if (result != null) {
          overlay = true;
       }
       map.put("overlay", overlay);
       return map;
   }
   
   //상점개설 -> 상점개설 여부 상태값 수정
   public HashMap<String, Object> upShopState(String id) {
      logger.info("상점개설 여부 상태값 수정");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      int success = mainInter.upShopState(id);
      if(success > 0) {
         logger.info("success : {}", success);
         map.put("success", success);
      }
      return map;
   }
   
   // 개인 상점 정보 출력
   public HashMap<String, Object> getShopInfo(String id,String shop_idx) {
      logger.info("개인 상점 정보 출력");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      ShopDTO dto = mainInter.getShopInfo(id);
      memInter = sqlSession.getMapper(MemberInter.class);
      MemberDTO mem_dto = memInter.detailView(id);
      int count = mainInter.count(Integer.parseInt(shop_idx));
      logger.info("평점을 위한 변수");
      if (dto != null) {
         logger.info(dto.getMem_id() + "/" + dto.getShop_name() + "/" + dto.getShop_date());
         logger.info(mem_dto.getMem_addr());
         map.put("dto", dto);
         if(count != 0) {
        	 int star_sum = mainInter.star_sum(Integer.parseInt(shop_idx));
        	 double avg = star_sum/count;
        	 map.put("star_avg",avg);
         }
         map.put("mem_dto", mem_dto);
      }
      return map;
   }

   //상점인덱스 세션값 얻기
   public HashMap<String, Object> getShopIdx(String id, HttpSession session) {
      logger.info("상점Idx 세션값 얻기");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      String result = mainInter.getShopIdx(id);
      if(result != null) {
         map.put("shopIdx", result);
         session.setAttribute("shopIdx", result);
      }
      return map;
   }
   
   //테스트값 집어넣기
   public HashMap<String, Object> testInsert(String id, String shopIdx) {
      logger.info("테스트값 삽입");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      int result = mainInter.testInsert(id, shopIdx);
      if(result > 0) {
         map.put("result", result);
      }
      return map;
   }
   
   //상품등록(이미지제외) 및 상품인덱스 값 추출
      public HashMap<String, Integer> proInsert(HashMap<String, String> params) {
         logger.info("이미지를 제외한 상품값 넣기");
         HashMap<String, Integer> map = new HashMap<String,Integer>();
         ProductDTO dto = new ProductDTO();
         dto.setBrand_idx(Integer.parseInt(params.get("brand_idx")));
         dto.setGender_idx(Integer.parseInt(params.get("gender_idx")));
         dto.setShoes_idx(Integer.parseInt(params.get("shoes_idx")));
         dto.setShop_idx(Integer.parseInt(params.get("shop_idx")));
         dto.setPro_name(params.get("pro_name"));
         dto.setPro_size(params.get("pro_size"));
         dto.setPro_price(Integer.parseInt(params.get("pro_price")));
         dto.setPro_memo(params.get("pro_memo"));
         dto.setMem_id(params.get("mem_id"));
         mainInter = sqlSession.getMapper(MainInter.class);
         int success = mainInter.proInsert(dto);
         if(success > 0){
            if(m_fileList.size()>0) {//저장할 파일이 있을 경우
               for(String key : m_fileList.keySet()) {//map 에서 키를 뽑아 온다.
                  mainInter.mainImgInsert(key, dto.getPro_idx());//메인이미지 넣기            
               }
            }
            map.put("success", success);
            map.put("proIdx", dto.getPro_idx());
         }
         m_fileList.clear();
         return map;
      }
     
      //상품등록(메인이미지 업로드)
      public ModelAndView mainUpload(MultipartFile file, String root, HttpSession session) {
          ModelAndView mav = new ModelAndView();      
         String fullPath = root+"resources/upload/";
         logger.info(fullPath);
         //1. 폴더가 없을 경우 폴더 생성
         File dir = new File(fullPath);
         if(!dir.exists()) {
            logger.info("폴더 없음, 생성 시작");
            dir.mkdir();
         }      
         //2. 파일명 추출
         String fileName = file.getOriginalFilename();
         //3. 새로운 파일명 생성
         String newFileName = System.currentTimeMillis()
               +fileName.substring(fileName.lastIndexOf("."));            
         //4. 파일 추출
         try {
            byte[] bytes = file.getBytes();//MultipartFile 에서 부터 바이트 추출
            Path filePath = Paths.get(fullPath+newFileName);//파일 생성 경로
            Files.write(filePath, bytes);//파일 생성
            m_fileList.put(newFileName, fileName);
            logger.info("저장할 메인 파일 갯수 : {}",m_fileList.size());
            mav.addObject("path", "resources/upload/"+newFileName);
            session.setAttribute("pathSession", newFileName);
         } catch (IOException e) {
            e.printStackTrace();
         }
         mav.setViewName("mainUploadForm");      
         return mav;
      }
      
      //사진삭제 (메인이미지)
      public HashMap<String, Integer> mainFileDel(String root, String fileName) {
         HashMap<String, Integer> map = new HashMap<String, Integer>();
         int success = 0;
         try {         
            String fullPath = root+"resources/upload/"+fileName;
            File file = new File(fullPath);
            if(file.exists()) {//삭제할 파일이 존재 한다면
               file.delete();//파일 삭제
               logger.info("파일 삭제");
               m_fileList.remove(fileName);//리스트 삭제
               logger.info("삭제 후 남은 메인파일 갯수 : {}",m_fileList.size());
            }         
            success = 1;
         }catch(Exception e) {
            System.out.println(e.toString());
            success = 0;
         }finally {
            logger.info("success : "+success);
            map.put("success", success);   
         }      
         return map;
      }
   
   //상품등록(서브이미지 업로드)
   public ModelAndView subUpload(MultipartFile file, String root, HttpSession session) {
        ModelAndView mav = new ModelAndView();      
         String fullPath = root+"resources/upload/";
         logger.info(fullPath);
         //1. 폴더가 없을 경우 폴더 생성
         File dir = new File(fullPath);
         if(!dir.exists()) {
            logger.info("폴더 없음, 생성 시작");
            dir.mkdir();
         }      
         //2. 파일명 추출
         String fileName = file.getOriginalFilename();
         //3. 새로운 파일명 생성
         String newFileName = System.currentTimeMillis()
               +fileName.substring(fileName.lastIndexOf("."));            
         //4. 파일 추출
         try {
            byte[] bytes = file.getBytes();//MultipartFile 에서 부터 바이트 추출
            Path filePath = Paths.get(fullPath+newFileName);//파일 생성 경로
            Files.write(filePath, bytes);//파일 생성
            s_fileList.put(newFileName, fileName);
            logger.info("저장할 서브파일 갯수 : {}",s_fileList.size());
            mav.addObject("path", "resources/upload/"+newFileName);
         } catch (IOException e) {
            e.printStackTrace();
         }
         mav.setViewName("subUploadForm");         
         return mav;
   }
   
   //상품등록 (서브이미지)
   public HashMap<String, Object> subImgUpdate(String proIdx) {
      logger.info("서브이미지 까지 추가");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      
       String key ="";
      if(s_fileList.size()>0) {//저장할 파일이 있을 경우   
           java.util.Iterator<String> iterator = s_fileList.keySet().iterator(); //key값 뽑아오기
             while (iterator.hasNext()) {
                 key += (String) iterator.next() + "/"; // key값뒤에 '/' 붙여서 연결하기 
             }
             String subImg = key.substring(0, key.length()-1); //마지막 '/' 지우고 DB에추가함 
             logger.info("subImg : {}", subImg);
             int success = mainInter.subImgUpdate(subImg, proIdx);
             if(success > 0) {
                map.put("success", success);
                map.put("proIdx", proIdx);
             }
      }   
      s_fileList.clear();
      return map;
   }
   
   //사진삭제 (서브이미지)
   public HashMap<String, Integer> subFileDel(String root, String fileName) {
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      int success = 0;
      try {         
         String fullPath = root+"resources/upload/"+fileName;
         File file = new File(fullPath);
         if(file.exists()) {//삭제할 파일이 존재 한다면
            file.delete();//파일 삭제
            logger.info("파일 삭제");
            s_fileList.remove(fileName);//리스트 삭제
            logger.info("삭제 후 남은 서브파일 갯수 : {}",s_fileList.size());
         }         
         success = 1;
      }catch(Exception e) {
         System.out.println(e.toString());
         success = 0;
      }finally {
         logger.info("success : "+success);
         map.put("success", success);   
      }      
      return map;
   }

   //메인사진 세션관리
   public HashMap<String, Integer> fileDel(String root, String fileName, HttpSession session) {
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      int success = 0;
      try {         
         String fullPath = root+"resources/upload/"+fileName;
         File file = new File(fullPath);
         if(file.exists()) {//삭제할 파일이 존재 한다면
            file.delete();//파일 삭제
            logger.info("파일 삭제");
            m_fileList.remove(fileName);//리스트 삭제
            logger.info("삭제 후 남은 메인파일 갯수 : {}", m_fileList.size());
         }         
         success = 1;
      }catch(Exception e) {
         System.out.println(e.toString());
         success = 0;
      }finally {
         logger.info("success : "+success);
         map.put("success", success);
         session.removeAttribute("pathSession");
      }      
      return map;
   }

   public void detail(Model model, String idx) {
	      logger.info("상세정보 보기");
	      mainInter = sqlSession.getMapper(MainInter.class);
	      model.addAttribute("product", mainInter.detail(idx));
	      model.addAttribute("cartcount",mainInter.cartcount(idx));
	      logger.info("주소 : " + mainInter.detail(idx).getMem_addr());
	      
	      ArrayList<CartDTO> cartList = mainInter.getCartList();
	      if(cartList.size() != 0) {
	         model.addAttribute("cartList", cartList);
	         
	      }
      
      //주소끝자리가져오기
      String[] addr = mainInter.detail(idx).getMem_addr().split("/");
      model.addAttribute("addr", addr[addr.length-1]);
      
      if(mainInter.detail(idx).getImg_sub() != null) {
         logger.info("서브이미지" + mainInter.detail(idx).getImg_sub());
         
         ArrayList<String> list = new ArrayList<String>();
         String[] subImg = mainInter.detail(idx).getImg_sub().split("/");
         
         for(int i=0; i<subImg.length; i++) {
            logger.info("서브이미지 : " + subImg[i]);
            list.add(subImg[i]);
         }
         model.addAttribute("subImg", list);
      }
   }
   
   public void myproduct(Model model, String shopIdx) {
      logger.info("상품등록 페이지 이동");
      mainInter = sqlSession.getMapper(MainInter.class);
      ArrayList<ProductDTO> list =  mainInter.myproduct(shopIdx);
      model.addAttribute("myProduct", list);
   }

   public void mybuy(Model model, String shopIdx, HttpSession session) {
	      logger.info("구매 물품 내역 이동");
	      mainInter = sqlSession.getMapper(MainInter.class);
	      String id = (String) session.getAttribute("loginId");
	      model.addAttribute("myBuy", mainInter.mybuy(shopIdx)); 
	      model.addAttribute("myWallet", mainInter.myWallet(id));
	   }

   public void mycart(Model model, String shopIdx) {
      logger.info("찜 목록 내역 이동");
      mainInter = sqlSession.getMapper(MainInter.class);
      model.addAttribute("myCart", mainInter.mycart(shopIdx));      
   }
      
    //구매요청 게시판 이미지 
   public ModelAndView r_upload(MultipartFile file, String root) {
      ModelAndView mav = new ModelAndView();
      String fullPath = root+"resources/upload/";
      logger.info(fullPath);
      
      //1. 폴더가 없을 경우 폴더 생성
      File dir = new File(fullPath);
      if(!dir.exists()) {
         logger.info("폴더 없음, 생성 시작");
         dir.mkdir();
      }
      //2. 파일명 추출
      String fileName = file.getOriginalFilename();
      //3. 새로운 파일명 생성
      String newFileName = System.currentTimeMillis()
            +fileName.substring(fileName.lastIndexOf("."));   
      //4.파일 추출
      try {
         byte[] bytes = file.getBytes();//MultipartFile 에서 부터 바이트 추출
         Path filePath = Paths.get(fullPath+newFileName);//파일 생성 경로
         Files.write(filePath, bytes);//파일생성
         r_fileList.put(newFileName, fileName);
         logger.info("저장할 파일 갯수 : {}",r_fileList.size());
         mav.addObject("path", "resources/upload/"+newFileName);
         
      } catch (IOException e) {
         e.printStackTrace();
      }
      mav.setViewName("RequestUploadFormPage");
       
      
      
      return mav;
   }
   
   //검색
   public ModelAndView m_search(HashMap<String, String> map) {
      logger.info("검색 DB 확인");
      mainInter = sqlSession.getMapper(MainInter.class);
      ArrayList<ProductDTO> list = mainInter.list(map);
      ModelAndView mav = new ModelAndView();
      mav.addObject("list",list);
      mav.addObject("listSize", list.size());
      logger.info("list사이즈화인"+list.size());
      mav.setViewName("Searchlist");
      return mav;
   }

   public void myreview(Model model, String shopIdx) {
      logger.info("찜 목록 내역 이동");
      mainInter = sqlSession.getMapper(MainInter.class);
      model.addAttribute("myReview", mainInter.myreview(shopIdx));
      
   }

   public void myinfo(Model model, String shopIdx) {
      logger.info("내 정보 수정");
      mainInter = sqlSession.getMapper(MainInter.class);
      model.addAttribute("myInfo", mainInter.myinfo(shopIdx));   
   }
   
   //맞춤상품 리스트
   public HashMap<String, Object> SpellertList(String loginId) {
      logger.info("맞춤 상품 리스트");
      mainInter = sqlSession.getMapper(MainInter.class);
      HashMap<String, Object> map = new HashMap<String,Object>();
      ArrayList<ProductDTO> list = mainInter.SpellertList(loginId);
      logger.info("최근 리스트 확인 :" + list.size());
      map.put("list",list);
      return map;
   }

   public HashMap<String, Object> buyerCheck(String buyer) {
      logger.info("구매자 존재 여부 확인");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      String result = mainInter.buyerCheck(buyer);
       boolean overlay = false;
       logger.info("result" + result);
       if (result != null) {
          overlay = true;
       }
       map.put("overlay", overlay);
       return map;
   }

   public HashMap<String, Object> setBuyer(String buyer, String proIdx) {
      logger.info("구매자 업데이트");
      HashMap<String, Object> map = new HashMap<String, Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      int success = mainInter.setBuyer(buyer,proIdx);
      if(success>0) {
         map.put("success", success);
      }
      return map;
   }

   public HashMap<String, Object> upProState(String proIdx) {
      logger.info("판매상태 변경");
      HashMap<String, Object> map = new HashMap<String,Object>();
      mainInter = sqlSession.getMapper(MainInter.class);
      int success = mainInter.upProState(proIdx);
      if(success > 0) {
         map.put("success", success);
      }
      return map;
   }

	public HashMap<String, Object> categorylist(String brand, String gender, String shoes) {
			logger.info("카테고리 검색 서비스");
			mainInter = sqlSession.getMapper(MainInter.class);
	
				HashMap<String, Object> map = new HashMap<>();
				
				int brand_idx = Integer.parseInt(brand);
				int gender_idx = Integer.parseInt(gender);
				int shoes_idx = Integer.parseInt(shoes);
				
				System.out.println(brand_idx + "/" + gender_idx + "/" + shoes_idx);
				
				ArrayList<ProductDTO> list = new ArrayList<>();
				list = mainInter.categorylist(brand_idx,gender_idx,shoes_idx);
				
				map.put("list", list);
				
				return map;
		}

	 //구매내역 삽입
    public HashMap<String, Object> setWallet(String proIdx, String id) {
       logger.info("구매내역 insert");
       HashMap<String, Object> map = new HashMap<String,Object>();
       mainInter = sqlSession.getMapper(MainInter.class);
       int success = mainInter.setWallet(proIdx, id);
       if(success > 0) {
          map.put("success", success);
       }
       return map;
    }

	 //공지사항 상세보기
    public ModelAndView noticeDetail(String notice_idx) {
       logger.info("noticeDetail 서비스 요청");
       ModelAndView mav = new ModelAndView();
       mainInter = sqlSession.getMapper(MainInter.class);
       mainInter.upHit(notice_idx);
       NoticeBoardDTO dto = mainInter.noticeDetail(notice_idx);
       logger.info("idx :{}", notice_idx);
       String page = "noticeDetail";
       mav.addObject("dto", dto);
       mav.setViewName(page);
       return mav;
    }

	public HashMap<String, Object> upSellCount(String shopIdx) {
		logger.info("판매 갯수 올리기");
		HashMap<String, Object> map = new HashMap<String, Object>();
		mainInter = sqlSession.getMapper(MainInter.class);
		int success = mainInter.upSellCount(shopIdx);
		if(success > 0) {
			map.put("success", success);
		}
		return map;
	}

}