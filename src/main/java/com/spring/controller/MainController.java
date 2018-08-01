package com.spring.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.BoardService;
import com.spring.service.MainService;
@Controller
public class MainController<httpservletrequest> {
	
@Autowired MainService mainService;
@Autowired BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);	

	//메인 리스트 출력
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Model model) {
			logger.info("홈 요청!");
			mainService.getMainList(model); // 메인창 들어갔을시 메인리스트(신상품) 뿌리기
			return "main";
		}
		
		//상점개설여부 상태 세션담기
		@RequestMapping(value="/getMemShopState")
		public @ResponseBody HashMap<String, String> 
			getMemShopState(@RequestParam("id") String id, HttpSession session){
			logger.info("멤버 상점개설 상태 가져오기");
			return mainService.getMemShopState(id, session);
		}
		
		//상점 개설 -> 상점명 입력값 넣기
		@RequestMapping(value = "/setShopName")
		public @ResponseBody HashMap<String, Object> setShopName(@RequestParam HashMap<String, Object> params){
			logger.info("상점명 입력값 넣기");
			return mainService.setShopName(params);
		}
		
		//상점 개설 -> 상점명 중복확인
		@RequestMapping(value = "/shopOverlay")
		public @ResponseBody HashMap<String, Object> shopOverlay(@RequestParam("shopName") String shopName){
			logger.info("상점명 중복확인");
			return mainService.shopOverlay(shopName);
		}
		
		//상점 개설 -> 상점생성 여부 상태값 변경
		@RequestMapping(value = "/upShopState")
		public @ResponseBody HashMap<String, Object> upShopState(@RequestParam("id") String id){
			logger.info("상점명 입력값 넣기");
			return mainService.upShopState(id);
		}
		
		//개인상점 정보 출력
	      @RequestMapping(value = "/getShopInfo")
	      public @ResponseBody HashMap<String, Object> getShopInfo(@RequestParam("id") String id,@RequestParam("shop_idx")String shop_idx){
	         logger.info("개인상점 정보 출력");
	         return mainService.getShopInfo(id,shop_idx);
	      }
		
		//상점Idx 세션값 얻기
		@RequestMapping(value = "/getShopIdx")
		public @ResponseBody HashMap<String, Object> getShopIdx(@RequestParam("id") String id, HttpSession session){
			logger.info("상점 인덱스 값 얻기");
			return mainService.getShopIdx(id, session);
		}
	
		//테스트값 넣기
		@RequestMapping(value = "/testInsert")
		public @ResponseBody HashMap<String, Object> testInsert(@RequestParam("id") String id, @RequestParam("shopIdx") String shopIdx){
			logger.info("테스트상품 집어넣기");
			return mainService.testInsert(id,shopIdx);
		}
	
		//상품등록 페이지 이동
		@RequestMapping(value="/regProduct")
		public String regProduct() {
			logger.info("상품등록 페이지 이동");
			return "regProduct";
		}
		
		//상품등록 (이미지 제외)
		@RequestMapping(value = "/proInsert")
		   public @ResponseBody HashMap<String, Integer> proInsert(@RequestParam HashMap<String, String> params){
		      logger.info("상품등록 처리(이미지제외)");
		      return mainService.proInsert(params);
		}
	
		//상품등록 (메인 이미지)
		@RequestMapping(value = "/mainUploadForm")
		public String mainUploadForm() {
			logger.info("메인 파일 업로드 페이지 이동");
			return "mainUploadForm";
		}
		
		//상품업로드 (메인 이미지)
		@RequestMapping(value = "/mainUpload")
		public ModelAndView upload(MultipartFile file, HttpSession session) {
			logger.info("file upload 요청");
			String root = session.getServletContext().getRealPath("/");
			return mainService.mainUpload(file,root,session);
		}
		
		//상품등록 (서브 이미지)
			@RequestMapping(value = "/subUploadForm")
			public String subUploadForm() {
				logger.info("서브 파일 업로드 페이지 이동");
				return "subUploadForm";
			}
			
		//상품업로드 (서브 이미지)
		@RequestMapping(value = "/subUpload")
		public ModelAndView subUpload(MultipartFile file, HttpSession session) {
			logger.info("file upload 요청");
			String root = session.getServletContext().getRealPath("/");
			return mainService.subUpload(file,root,session);
		}	
		
		//상품업로드 (서브 이미지 넣기)
		@RequestMapping(value = "/subImgInsert")
		public @ResponseBody HashMap<String, Object> subImgUpdate(@RequestParam("proIdx") String proIdx){
			logger.info("서브 이미지 넣기");
			return mainService.subImgUpdate(proIdx);
		}
		
		//사진삭제 (메인 이미지)
		@RequestMapping(value = "/mainFileDel")
		public @ResponseBody HashMap<String, Integer> mainFileDel(@RequestParam("fileName") String fileName, HttpSession session) {
			logger.info("file delete 요청");
			String root = session.getServletContext().getRealPath("/");		
			return mainService.mainFileDel(root,fileName);
		}
		
		//사진삭제 (서브 이미지)
		@RequestMapping(value = "/subFileDel")
		public @ResponseBody HashMap<String, Integer> subFileDel(@RequestParam("fileName") String fileName, HttpSession session) {
			logger.info("file delete 요청");
			String root = session.getServletContext().getRealPath("/");		
			return mainService.subFileDel(root,fileName);
		}
		
		//불필요한 사진삭제
		@RequestMapping(value = "/fileDel")
		public @ResponseBody HashMap<String, Integer> fileDel(@RequestParam("fileName") String fileName, HttpSession session) {
			logger.info("file delete 요청");
			String root = session.getServletContext().getRealPath("/");		
			return mainService.fileDel(root,fileName, session);
		}
		
		//상세정보
		@RequestMapping(value = "/detail")
		public String detail(Model model, @RequestParam("idx") String idx) {
			logger.info("상세정보 페이지 요청");
			mainService.detail(model, idx);
			return "detail";
		}
	
	
		//카테고리
		@RequestMapping(value="/category")
		public String category(Model model) {
			return "category";
		}
	
		@RequestMapping(value="/categoryList")
		@ResponseBody
		public HashMap<String, Object> categorylist(@RequestParam(value = "brand", required = false, defaultValue = "0") String brand,
				@RequestParam(value = "gender", required = false, defaultValue = "0") String gender,
				@RequestParam(value = "shoes", required = false, defaultValue = "0") String shoes) {	
			System.out.println("카테고리 리스트");
			System.out.println(brand);
			System.out.println(gender);
			System.out.println(shoes); 
			return mainService.categorylist(brand,gender,shoes);
		}
		
		@RequestMapping(value="/speller")
		public String speller(Model model) {
			return "speller";
		}
		
		@RequestMapping(value="/mypage")
		public String mypage(Model model) {
			return "mypage";
		}
		
		
		@RequestMapping(value="/adminpage")
		public String adminpage(Model model) {
			return "adminpage";
		}
		
		@RequestMapping(value="/myproduct")
		public String myproduct(Model model, @RequestParam("shopIdx") String shopIdx) {
			logger.info("상품 등록 리스트");
			mainService.myproduct(model, shopIdx);
			return "myproduct";
		}
		
		@RequestMapping(value="/prodel")
	      public ModelAndView prodel(@RequestParam("prodel") String prodel, HttpSession session) {
	         logger.info("상품 삭제 불러오기");
	         return boardService.prodel(prodel,session); 
	      }
		
		@RequestMapping(value="/mybuy")
	      public String mybuy(Model model, @RequestParam("shopIdx") String shopIdx, HttpSession session) {
	         logger.info("구매내역 리스트");
	         mainService.mybuy(model, shopIdx, session);
	         return "mybuy";
	      }
		
		@RequestMapping(value="/buyerCheck")
	      public @ResponseBody HashMap<String, Object> buyerCheck(@RequestParam("buyer") String buyer){
	         logger.info("구매자 존재 여부 확인");
	         return mainService.buyerCheck(buyer);
	      }
	      
	      @RequestMapping(value="/setBuyer")
	      public @ResponseBody HashMap<String, Object> setBuyer(@RequestParam("buyer") String buyer, @RequestParam("proIdx") String proIdx){
	         logger.info("구매자 업데이트");
	         return mainService.setBuyer(buyer,proIdx);
	      }
	      
	      @RequestMapping(value="/upProState")
	      public @ResponseBody HashMap<String, Object> upProState(@RequestParam("proIdx") String proIdx){
	         logger.info("판매상태 변경");
	         return mainService.upProState(proIdx);
	      }
	      
	      @RequestMapping(value="/upSellCount")
	      public @ResponseBody HashMap<String, Object> upSellCount(@RequestParam("shopIdx") String shopIdx){
	    	  logger.info("판매갯수 올리기");
	    	  return mainService.upSellCount(shopIdx);
	      }
		
		@RequestMapping(value="/mycart")
		public String mycart(Model model, @RequestParam("shopIdx") String shopIdx) {
			logger.info("찜 목록 리스트");
			mainService.mycart(model, shopIdx);
			return "mycart";
		}
		
		@RequestMapping(value="/mycartCall")
		public @ResponseBody HashMap<String, Object> mycartCall(@RequestParam("id") String id) {
			logger.info("찜 목록 list 요청 ");	
			logger.info("id {}", id);
			return boardService.mycartCall(id);
		}
		
		@RequestMapping(value="/cartInsert")
		public @ResponseBody HashMap<String, Object> cartInsert(@RequestParam("id") String id, @RequestParam("shopIdx") String shopIdx, @RequestParam("proIdx") String proIdx){
			logger.info("찜 추가");
			return boardService.cartInsert(id,shopIdx,proIdx);
		}
		
		@RequestMapping(value = "/getCartIdx")
		public @ResponseBody HashMap<String, Object> getCartIdx(@RequestParam("id") String id, @RequestParam("proIdx") String proIdx){
			logger.info("찜한사람 idx값 얻기");
			return boardService.getCartIdx(id,proIdx);
		}
		
			
		@RequestMapping(value="/cartdel")
		public @ResponseBody HashMap<String, Integer> cardel(@RequestParam("cartdel") String cartdel) {
			logger.info("찜삭제 불러오기");
			logger.info("삭제 {}", cartdel);
			return boardService.cartdel(cartdel); 
		}
		
		@RequestMapping(value="/mybuyCall")
		public @ResponseBody HashMap<String, Object> mybuyCall(@RequestParam("id") String id) {
		      logger.info("구매 내역 리스트 요청");
		      logger.info("id {}", id);
		      return boardService.mybuyCall(id);
		   }
		
		   @RequestMapping(value="/myreview")
		   public String myreview(Model model, @RequestParam("shopIdx") String shopIdx) {
		      logger.info("후기페이지");
			  mainService.myreview(model, shopIdx);
		      return "myreview";
		   }
		
		@RequestMapping(value="/myinfo")
		public String myinfo(Model model, @RequestParam("shopIdx") String shopIdx) {
			logger.info("내정보 수정");
			mainService.myinfo(model, shopIdx);
			return "myinfo";
		}
		
		@RequestMapping(value="/prd_detailForm")
		public String prd_detailForm(Model model) {
			logger.info("상품상세보기");
			return "prd_detailForm";
		}
		
		@RequestMapping(value="/prd_detailcart")
		public String prd_detailsub() {
			logger.info("상품상세보기 팝업창");
			return "prd_detailsub";
		}
		
		//공지사항 게시판이동
		@RequestMapping(value="/NoticeList")
		public String NoticeList(Model model) {
			logger.info("공지사항 게시판 이동");
			return "NoticeList";
		}
		
		//구매요청 게시판이동
		@RequestMapping(value="/Request")
		public String Request(Model model) {
			logger.info("구매요청 게시판 이동");
			return "RequestList";
		}
		
		
		//구매요청 리스트
		@RequestMapping(value="/RequestList")
		public @ResponseBody HashMap<String, Object>RequestList(){
			logger.info("구매요청 리스트");
			return boardService.RequestList();
		}
		
			
		//구매요청 상세보기
		@RequestMapping(value="/RequestDetail")
		public ModelAndView RequestDetail(String req_idx) {
			logger.info("RequestDetail 서비스 요청");
			logger.info("상세보기 idx : {}",req_idx);
			return boardService.RequestDetail(req_idx);
		}
		
		//구매요청 수정상세보기
		@RequestMapping(value="/Request_updateForm")
		public ModelAndView Request_updateForm(String req_idx) {
			logger.info("Request_updateForm 서비스 요청");
			logger.info("상세보기 idx : {}",req_idx);
			return boardService.Request_updateForm(req_idx);
		}
		
		// 구매요청 작성하기 페이지 이동
			@RequestMapping(value = "/RequestWritePage")
			public String boardWritePage() {
				logger.info("RequestWritePage 요청");
				return "RequestWrite";
			}
		
		
		//구매요청 글쓰기
			@RequestMapping(value = "/RequestWrite")
			public @ResponseBody HashMap<String, Object> RequestWrite(@RequestParam HashMap<String, String> params) {
				logger.info("RequestWrite 요청");
				return boardService.RequestWrite(params);
			}
		
		// 구매요청 삭제하기
		@RequestMapping(value = "/Request_noticeDelete")
		public @ResponseBody HashMap<String, Object> boardDelete(@RequestParam("idx") int idx) {
			logger.info("Request_noticeDelete 요청");
			logger.info("idx : {}", idx);
			return boardService.Request_noticeDelete(idx);
		}
		//구매요청 수정하기
		@RequestMapping(value="/Request_update")
		public @ResponseBody HashMap<String, Object> Request_update(@RequestParam HashMap<String, String> params) {
			logger.info("RequestWrite 요청");
			return boardService.Request_update(params);
		}
		
		//구매요청 파일업로드 이동
		@RequestMapping(value="/RequestUploadFormPage")
		public String RequestUploadForm() {
			logger.info("RequestUploadFormPage 요청");
			return "RequestUploadFormPage";
		}
		
		//구매요청 이미지
		@RequestMapping(value="/RequestUpload")
		public ModelAndView r_upload(MultipartFile file, HttpSession session) {
			logger.info("RequestUpload 요청");
			String root = session.getServletContext().getRealPath("/");
			return mainService.r_upload(file,root);
		}
		
		//최근 본 상품
		@RequestMapping(value="/RecentPrd")
		public @ResponseBody HashMap<String, Integer> RecentPrd(@RequestParam("idx") String idx,
				@RequestParam("mem_id") String mem_id) {
			logger.info("최근본상품 ");
			logger.info("idx{}:"+idx);
			logger.info("mem_id{}:"+mem_id);
			return boardService.RecentPrd(idx,mem_id);
		}
		
		//최근 본 상품 리스트
		@RequestMapping(value="/recentList")
		public @ResponseBody HashMap<String, Object>recentList(HttpServletRequest request){
			logger.info("구매요청 리스트 ");
			String loginId = (String) request.getSession().getAttribute("loginId");
			logger.info("구매요청 로그인확인"+loginId);
			return boardService.recentList(loginId);
		}
		
		
		//검색
	      @RequestMapping(value="m_search")
	      public ModelAndView m_search(@RequestParam HashMap<String, String>map) {
	         logger.info("검색 기능 요청");
	         logger.info("검색 키워드 :{}",map.get("MainkeyWord"));
	         return mainService.m_search(map);
	      }
	      
		//맞춤 상품 리스트
		@RequestMapping(value="/SpellertList")
		public @ResponseBody HashMap<String, Object>SpellertList(HttpServletRequest request){
			logger.info("맞춤 상품 리스트 ");
			String loginId = (String) request.getSession().getAttribute("loginId");
			logger.info("구매요청 로그인확인"+loginId);
			return mainService.SpellertList(loginId);
		}
		
		@RequestMapping(value="/setWallet")
        public @ResponseBody HashMap<String, Object> setWallet(@RequestParam("proIdx") String proIdx, @RequestParam("id") String id){
           logger.info("구매내역 삽입");
           return mainService.setWallet(proIdx,id);
        }
		
		//공지사항 리스트 이동
	      @RequestMapping(value="/notice")
	      public String a_notice(Model model) {
	         return "notice";
	      }
		
	    //공지사항 상세보기
	      @RequestMapping(value="/noticeDetail")
	      public ModelAndView a_noticeDetail(@RequestParam("notice_idx") String notice_idx) {
	         logger.info("noticeDetail 상세보기요청");
	         logger.info("상세보기 idx : {}",notice_idx);
	         return mainService.noticeDetail(notice_idx);
	      }
		
		
		
		
		
}













