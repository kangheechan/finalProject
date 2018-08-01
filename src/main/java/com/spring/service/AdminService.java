package com.spring.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.AdminInter;
import com.spring.dto.AdminDTO;
import com.spring.dto.MemberDTO;
import com.spring.dto.NoticeBoardDTO;
import com.spring.dto.ShopReplyDTO;

@Service
public class AdminService {

	private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	SqlSession sqlSession;
	AdminInter inter = null;

	// 리스트 호출
	public void memberlist(Model model) {
		logger.info("리스트 관련 DB처리 요청");
		inter = sqlSession.getMapper(AdminInter.class);
		model.addAttribute("memberlist", inter.memberlist());

	}

	public ModelAndView search(HashMap<String, String> map) {
		logger.info("검색 관련 DB처리요청");
		inter = sqlSession.getMapper(AdminInter.class);
		ArrayList<MemberDTO> list = inter.list(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberlist", list);
		mav.setViewName("adminmem");
		return mav;
	}

	public HashMap<String, Integer> memdel(String delmem) {
		logger.info("삭제 관련 DB처리요청");
		inter = sqlSession.getMapper(AdminInter.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = inter.memdel(delmem);
		if (success > 0) {
			logger.info("success : " + success);
			map.put("success", success);
		}
		return map;
	}

	public HashMap<String, Integer> memstate(int upstate, String upmemid) {
		logger.info("상태변경 관련 DB처리요청");
		inter = sqlSession.getMapper(AdminInter.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = inter.memstate(upstate, upmemid);
		if (success > 0) {
			logger.info("success : " + success);
			map.put("success", success);
		}
		return map;
	}

	public void adminreply(Model model) {
		logger.info("후기 리스트 관련 DB요청");
		inter = sqlSession.getMapper(AdminInter.class);
		model.addAttribute("adminreply", inter.adminreply());

	}

	public HashMap<String, Integer> replydel(String delreply) {
		logger.info("삭제 관련 DB처리요청");
		inter = sqlSession.getMapper(AdminInter.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int success = inter.replydel(delreply);
		if (success > 0) {
			logger.info("success : " + success);
			map.put("success", success);
		}
		return map;
	}

	public ModelAndView replysearch(HashMap<String, String> map) {
		logger.info("후기검색 관련 DB처리요청");
		inter = sqlSession.getMapper(AdminInter.class);
		ArrayList<ShopReplyDTO> list = inter.ReplylistSearch(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("adminreply", list);
		mav.setViewName("adminreply");
		return mav;
	}

	public HashMap<String, Object> adminjoin(HashMap<String, String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		AdminDTO dto = new AdminDTO();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String hash = encoder.encode(params.get("mem_pw"));
		dto.setAdmin_id(params.get("mem_id"));
		dto.setAdmin_pw(hash);
		inter = sqlSession.getMapper(AdminInter.class);
		int success = inter.adminjoin(dto);
		logger.info("회원가입 성공 여부 : " + success);

		map.put("success", success);

		return map;
	}

	public HashMap<String, Object> adminlogin(HashMap<String, String> params, RedirectAttributes redirectAttr,
			HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		inter = sqlSession.getMapper(AdminInter.class);
		String id = params.get("id");
		String pw = params.get("pw");
		String encode_pw = inter.admin_login(id);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		boolean success = encoder.matches(pw, encode_pw);
		map.put("success", success);
		session.setAttribute("adminId", inter.admin_login(id));
		return map;
	}

	// 공지사항 리스트
	public HashMap<String, Object> noticeList() {
		logger.info("noticeList 서비스 요청");
		inter = sqlSession.getMapper(AdminInter.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<NoticeBoardDTO> list = inter.noticeList();
		logger.info("리스트 확인 :" + list.size());
		map.put("list", list);
		return map;
	}

	// 공지사항 작성
	public HashMap<String, Object> noticeWrite(HashMap<String, String> params) {
		logger.info("공지사항 작성 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		NoticeBoardDTO dto = new NoticeBoardDTO();

		String id = params.get("id");
		String subject = params.get("subject");
		String content = params.get("content");

		logger.info("id : {}", id);
		logger.info("subject : {}", subject);
		logger.info("content : {}", content);

		dto.setAdmin_id(id);
		dto.setNotice_subject(subject);
		dto.setNotice_content(content);

		inter = sqlSession.getMapper(AdminInter.class);

		int result = 0;
		result = inter.noticeWrite(dto);
		logger.info("result check : " + result);

		if (result > 0) {
			map.put("success", dto.getNotice_idx());
		}
		logger.info("idx:{}", dto.getNotice_idx());

		return map;
	}

	// 공지사항 상세보기
	public ModelAndView a_noticeDetail(String notice_idx) {
		logger.info("a_noticeDetail 서비스 요청");
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(AdminInter.class);
		inter.upHit(notice_idx);
		NoticeBoardDTO dto = inter.a_noticeDetail(notice_idx);
		logger.info("idx :{}", notice_idx);
		String page = "a_noticeDetail";
		mav.addObject("dto", dto);
		mav.setViewName(page);

		return mav;
	}

	// 공지사항 수정상세보기
	public ModelAndView a_updateForm(String notice_idx) {
		logger.info("a_updateForm 서비스 요청");
		ModelAndView mav = new ModelAndView();
		inter = sqlSession.getMapper(AdminInter.class);
		NoticeBoardDTO dto = inter.a_noticeDetail(notice_idx);
		String page = "a_updateForm";
		mav.addObject("dto", dto);
		mav.setViewName(page);

		return mav;
	}

	// 공지사항 수정
	public HashMap<String, Object> a_noticeUpdate(HashMap<String, String> params) {
		logger.info("a_noticeUpdate 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();
		NoticeBoardDTO dto = new NoticeBoardDTO();
		String idx = params.get("idx");
		String subject = params.get("subject");
		String content = params.get("content");

		logger.info("idx : {}", idx);
		logger.info("subject : {}", subject);
		logger.info("content : {}", content);

		dto.setNotice_idx(Integer.parseInt(idx));
		dto.setNotice_subject(subject);
		dto.setNotice_content(content);

		inter = sqlSession.getMapper(AdminInter.class);
		int result = 0;
		result = inter.a_noticeUpdate(dto);

		if (result > 0) {
			map.put("success", dto.getNotice_idx());
		}

		return map;
	}

	// 공지사항 삭제
	public HashMap<String, Object> a_noticeDelete(int idx) {
		logger.info("a_noticeDelete 서비스 요청");
		HashMap<String, Object> map = new HashMap<String, Object>();

		inter = sqlSession.getMapper(AdminInter.class);
		int reslut = 0;
		reslut = inter.a_noticeDelete(idx);

		if (reslut > 0) {
			map.put("success", reslut);
		}

		return map;
	}

}
