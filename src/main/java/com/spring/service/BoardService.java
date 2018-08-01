package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.dao.BoardInter;
import com.spring.dto.BoardReplyDTO;
import com.spring.dto.CartDTO;
import com.spring.dto.ProductDTO;
import com.spring.dto.RecentPrdDTO;
import com.spring.dto.RequestBoardDTO;
import com.spring.dto.ShopReplyDTO;

@Service
public class BoardService {

	private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	SqlSession sqlSession;
	BoardInter b_inter;

	//찜 리스트
	public HashMap<String, Object> mycartCall(String id) {
		logger.info("찜 목록 리스트 요청");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String , Object> map = new HashMap<String, Object>();
		map.put("mycartCall", b_inter.mycartCall(id));
		return map;
	}
	
	//찜 삭제
		public HashMap<String, Integer> cartdel(String cartdel) {
			logger.info("찜 삭제 ");
			b_inter = sqlSession.getMapper(BoardInter.class);
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			int success = b_inter.cartdel(cartdel);
			if(success>0) {
			logger.info("success : "+success);
			map.put("success", success);	
			}
			return map;
		}

 //후기리스트 출력
 public HashMap<String, Object> reviewList(String idx) {
    logger.info("후기 리스트 요청");
    b_inter = sqlSession.getMapper(BoardInter.class);
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("reviewList", b_inter.reviewList(idx));
    return map;
 }

 // 후기작성
 public HashMap<String, Object> reviewWrite(HashMap<String, String> params) {
    b_inter = sqlSession.getMapper(BoardInter.class);
    HashMap<String, Object>map = new HashMap<>();
    ShopReplyDTO dto = new ShopReplyDTO();
    
    dto.setMem_id(params.get("mem_id"));
    dto.setSreply_content(params.get("sreply_content"));
    dto.setShop_idx(Integer.parseInt((params.get("shop_idx"))));
    dto.setSreply_star(Integer.parseInt(params.get("sreply_star")));
    int success = b_inter.reviewWrite(dto);
    map.put("success", success);
    return map;
 }

 //후기삭제
 public HashMap<String, Integer> reviewdel(String delreply) {
    logger.info("삭제 관련 DB처리요청");
    b_inter = sqlSession.getMapper(BoardInter.class);
    HashMap<String, Integer> map = new HashMap<String, Integer>();
    int success = b_inter.reviewdel(delreply);
    if(success>0) {
    logger.info("success : "+success);
    map.put("success", success);   
    }
    System.out.println(success);
    return map;
 }
 
 
 //후기수정
 public HashMap<String, Object> reviewupdate(String sreply_idx, String reviewcontent, String sreply_star) {
    b_inter = sqlSession.getMapper(BoardInter.class);
    HashMap<String, Object>map = new HashMap<>();
    String sreply = sreply_idx;
    String content = reviewcontent;
    String star = sreply_star;
     int success = b_inter.reviewupdate(sreply,content,star);
    map.put("success", success);
    return map;
 }

	// 구매요청 게시판리스트
	public HashMap<String, Object> RequestList() {
		logger.info("RequestList 서비스 요청");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<RequestBoardDTO> list = b_inter.RequestList();
		logger.info("리스트 확인 :" + list.size());
		map.put("list", list);
		return map;
	}

	// 구매요청 상세보기
	public ModelAndView RequestDetail(String req_idx) {
		logger.info("RequestDetail 서비스 요청");
		ModelAndView mav = new ModelAndView();
		b_inter = sqlSession.getMapper(BoardInter.class);
		b_inter.upHit(req_idx);
		RequestBoardDTO dto = b_inter.RequestDetail(req_idx);
		logger.info("idx : {}", req_idx);
		String page = "RequestDetail";
		mav.addObject("dto", dto);
		mav.setViewName(page);
		return mav;
	}

	// 구매요청 수정상세보기
	public ModelAndView Request_updateForm(String req_idx) {
		logger.info("RequestDetail 서비스 요청");
		ModelAndView mav = new ModelAndView();
		b_inter = sqlSession.getMapper(BoardInter.class);
		RequestBoardDTO dto = b_inter.RequestDetail(req_idx);
		String page = "Request_updateForm";
		mav.addObject("dto", dto);
		mav.setViewName(page);
		return mav;
	}

	// 구매요청 글쓰기
	public HashMap<String, Object> RequestWrite(HashMap<String, String> params) {
		logger.info("boardWrite 서비스 요청");

		HashMap<String, Object> map = new HashMap<String, Object>();
		RequestBoardDTO dto = new RequestBoardDTO();

		String id = params.get("id");
		String subject = params.get("subject");
		String content = params.get("content");
		String mainimg = params.get("mainimg");

		logger.info("id : {}", id);
		logger.info("subject : {}", subject);
		logger.info("content : {}", content);
		logger.info("mainimg : {}", mainimg);

		dto.setMem_id(id);
		dto.setReq_subject(subject);
		dto.setReq_content(content);
		dto.setRimg_path(mainimg);

		b_inter = sqlSession.getMapper(BoardInter.class);

		int result = 0;
		result = b_inter.RequestWrite(dto);
		logger.info("result check : " + result);

		if (result > 0) {
			map.put("success", dto.getReq_idx());
		}
		logger.info("idx : {}", dto.getReq_idx());
		return map;
	}

	// 구매요청 삭제
	public HashMap<String, Object> Request_noticeDelete(int idx) {
		logger.info("Request_noticeDelete 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();

		b_inter = sqlSession.getMapper(BoardInter.class);
		int result = 0;
		result = b_inter.Request_noticeDelete(idx);

		if (result > 0) {
			map.put("success", result);
		}
		return map;
	}

	// 구매요청 수정
	public HashMap<String, Object> Request_update(HashMap<String, String> params) {

		logger.info("Request_update 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		RequestBoardDTO dto = new RequestBoardDTO();

		String idx = params.get("idx");
		String subject = params.get("subject");
		String content = params.get("content");

		logger.info("idx : {}", idx);
		logger.info("subject : {}", subject);
		logger.info("content : {}", content);

		dto.setReq_idx(Integer.parseInt(idx));
		dto.setReq_subject(subject);
		dto.setReq_content(content);

		b_inter = sqlSession.getMapper(BoardInter.class);
		int result = 0;
		result = b_inter.Request_update(dto);

		if (result > 0) {
			map.put("success", dto.getReq_idx());
		}
		return map;
	}

	// 댓글 리스트 요청
	public HashMap<String, Object> replylist(String idx) {
		logger.info("댓글 리스트 요청");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replylist", b_inter.replylist(idx));
		return map;
	}

	// 댓글 삭제
	public HashMap<String, Integer> replyDel(String delreply) {
		logger.info("댓글삭제 관련 DB처리요청");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = b_inter.replyDel(delreply);
		if (success > 0) {
			logger.info("success : " + success);
			map.put("success", success);
		}
		return map;
	}

	// 댓글작성
	public HashMap<String, Integer> replyWrite(HashMap<String, String> params) {
		logger.info("댓글입력 관련 DB처리요청");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		BoardReplyDTO dto = new BoardReplyDTO();

		String breply_content = params.get("breply_content");
		String mem_id = params.get("mem_id");
		String req_idx = params.get("idx");
		logger.info("breply_content");
		logger.info("mem_id");
		logger.info("req_idx");
		dto.setBreply_content(breply_content);
		dto.setMem_id(mem_id);
		dto.setReq_idx(Integer.parseInt(req_idx));
		int success = b_inter.replyWrite(dto);
		if (success > 0) {
			logger.info("success : " + success);
			map.put("success", success);
		}
		return map;
	}

	// 댓글수정
	public HashMap<String, Integer> replyup(String upreply, String breply_idx) {
		logger.info("댓글수정 관련 DB처리요청");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		int success = b_inter.replyup(upreply, breply_idx);
		if (success > 0) {
			logger.info("success : " + success);
			map.put("success", success);
		}
		return map;
	}

	public ModelAndView prodel(String prodel, HttpSession session) {
	      logger.info("상품 삭제 ");
	      b_inter = sqlSession.getMapper(BoardInter.class);
	      ModelAndView mav = new ModelAndView();
	      int success = b_inter.prodel(prodel);
	      if(success>0) {
	      logger.info("success : "+success);
	      mav.setViewName("redirect:/myproduct?shopIdx=" + session.getAttribute("shopIdx"));   
	      }
	      return mav;
	   }



	public HashMap<String, Object> mybuyCall(String id) {
		  logger.info("구매 내역 리스트 요청");
	      b_inter = sqlSession.getMapper(BoardInter.class);
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("mybuyCall", b_inter.mybuyCall(id));
	      return map;
	}
	
	//찜 추가
		public HashMap<String, Object> cartInsert(String id, String shopIdx, String proIdx) {
			logger.info("찜 추가 요청");
			b_inter = sqlSession.getMapper(BoardInter.class);
			HashMap<String, Object> map = new HashMap<String, Object>();
			CartDTO dto = new CartDTO();
			dto.setMem_id(id);
			dto.setShop_idx(Integer.parseInt(shopIdx));
			dto.setPro_idx(Integer.parseInt(proIdx));
			int success = b_inter.cartInsert(dto);
			if (success > 0) {
				logger.info("success : " + success);
				logger.info("cartIdx : " + dto.getCart_idx());
				map.put("success", success);
				map.put("cartIdx", dto.getCart_idx());
			}
			return map;
		}

		public HashMap<String, Object> getCartIdx(String id, String proIdx) {
			logger.info("찜한 사람 인덱스 요청");
			HashMap<String, Object> map = new HashMap<String, Object>();
			b_inter = sqlSession.getMapper(BoardInter.class);
			String idx = b_inter.getCartIdx(id,proIdx);
			if(idx != null) {
				map.put("idx", idx);
			}
			return map;
		}
	
	//최근본상품 요청
	public HashMap<String, Integer> RecentPrd(String idx, String mem_id) {
		logger.info("최근본상품 요청");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String, Integer> map = new HashMap<String,Integer>();
		int success = b_inter.RecentPrd(idx,mem_id);
		if (success > 0) {
			logger.info("success : " + success);
			map.put("success", success);
		}
		return map;
	}
	
	//최근본상품 리스트
	public HashMap<String, Object>recentList(String loginId){
		logger.info("최근본 상품리스트");
		b_inter = sqlSession.getMapper(BoardInter.class);
		HashMap<String, Object>map = new HashMap<String, Object>();
		ArrayList<RecentPrdDTO> list = b_inter.recentList(loginId);
		logger.info("최근 리스트 확인 :" + list.size());
		map.put("list",list);
		return map;
	}
	
	//최근본상품  삭제
	public HashMap<String, Object> recentCnt(String mem_id) {
		logger.info("최근 본 상품 삭제");
		b_inter = sqlSession.getMapper(BoardInter.class);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = b_inter.recentCnt(mem_id);
		
		if(success>0) {
		logger.info("success : "+success);
		map.put("success", success);	
		}
		return null;
	}
	
	public HashMap<String, Object> writerCheck(int shop_idx, String login_id) {
	      logger.info("구매자인지 확인");
	      b_inter = sqlSession.getMapper(BoardInter.class);
	      HashMap<String, Object> map =new HashMap<>();
	      
	      ArrayList<ProductDTO> list = b_inter.writerCheck(shop_idx, login_id);
	      int reviewcnt = b_inter.reviewcnt(shop_idx, login_id);
	      map.put("list", list);
	      map.put("reviewcnt",reviewcnt);
	      return map;
	   }
	

}
