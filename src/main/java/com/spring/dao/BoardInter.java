package com.spring.dao;

import java.util.ArrayList;

import com.spring.dto.BoardReplyDTO;
import com.spring.dto.CartDTO;
import com.spring.dto.ProductDTO;
import com.spring.dto.RecentPrdDTO;
import com.spring.dto.RequestBoardDTO;
import com.spring.dto.ShopReplyDTO;
import com.spring.dto.WalletDTO;

public interface BoardInter {

	ArrayList<ShopReplyDTO> reviewList(String idx);// 내 상점 구매후기 리스트

	int reviewWrite(ShopReplyDTO dto);// 후기작성

	int reviewdel(String delreply);// 후기삭제

	int reviewupdate(String sreply, String content, String star);// 수정

	int cartdel(String cartdel); // 찜삭제

	ArrayList<CartDTO> mycartCall(String id);// 찜목록 리스트

	// 구매요청 리스트
	ArrayList<RequestBoardDTO> RequestList();

	// 조회수
	void upHit(String req_idx);

	// 구매요청 상세보기
	RequestBoardDTO RequestDetail(String req_idx);

	// 구매요청 글쓰기
	int RequestWrite(RequestBoardDTO dto);

	// 구매요청 삭제
	int Request_noticeDelete(int idx);

	// 구매요청 수정
	int Request_update(RequestBoardDTO dto);

	// 댓글 리스트
	ArrayList<BoardReplyDTO> replylist(String idx);

	// 댓글 삭제
	int replyDel(String delreply);

	// 댓글 작성
	int replyWrite(BoardReplyDTO dto);

	// 댓글 수정
	int replyup(String upreply, String breply_idx);

	ArrayList<ProductDTO> myproduct(String id); //상품 목록 리스트 

	int prodel(String prodel); //상품 삭제

	ArrayList<WalletDTO> mybuyCall(String id); //구매내역 리스트

	ArrayList<ProductDTO> speller(String id); //맞춤 상품

	int cartInsert(CartDTO dto); //찜 추가

	String getCartIdx(String id, String proIdx); //찜한 사람 카트인덱스 얻기
	
	//최근본상품 입력
	int RecentPrd(String pro_idx, String mem_id);
	
	//최근본상품 리스트
	ArrayList<RecentPrdDTO> recentList(String loginId);

	//최근 본 상품 삭제
	int recentCnt(String mem_id); 
	
	//후기쓸 자격있는지 확인
	ArrayList<ProductDTO> writerCheck(int shop_idx, String login_id);

	int reviewcnt(int shop_idx, String login_id);
	
	
}
