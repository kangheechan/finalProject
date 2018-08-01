package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dto.AdminDTO;
import com.spring.dto.MemberDTO;
import com.spring.dto.NoticeBoardDTO;
import com.spring.dto.ShopReplyDTO;

public interface AdminInter {

    ArrayList<MemberDTO> memberlist();

	ArrayList<MemberDTO> list(HashMap<String, String> map);

	int memdel(String delmem);

	int memstate(int upstate,String upmemid);

	ArrayList<ShopReplyDTO> adminreply();

	int replydel(String delreply);

	ArrayList<ShopReplyDTO> ReplylistSearch(HashMap<String, String> map);

	int adminjoin(AdminDTO dto);

	String admin_login(String id);

	//공지사항 리스트
	ArrayList<NoticeBoardDTO> noticeList();
	
	//공지사항 작성
	int noticeWrite(NoticeBoardDTO dto);

	//공지사항 상세보기
	NoticeBoardDTO a_noticeDetail(String notice_idx);
	
	//공지사항 수정
	int a_noticeUpdate(NoticeBoardDTO dto);
	
	//공지사항 삭제
	int a_noticeDelete(int idx);
	
	//공지사항 조회수
	void upHit(String notice_idx);


}
