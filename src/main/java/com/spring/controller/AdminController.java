package com.spring.controller;


import java.util.HashMap;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.AdminService;



@Controller
public class AdminController {
	@Autowired AdminService aservice;
	
		private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
		String hash="";
		//관리자 로그인 폼 이동

		@RequestMapping(value = "/adminLogin", method = RequestMethod.GET)
		public String adminLogin(Model model) {
			logger.info("관리자 로그인페이지 이동");
			return "adminLogin";
		}
		//회원 리스트보기
			@RequestMapping(value = "/adminmem", method = RequestMethod.GET)
			public String adminmem(Model model) {	
				aservice.memberlist(model);
				return "adminmem";
			}
			//관리자 페이지이동		
			@RequestMapping(value = "/adminpage", method = RequestMethod.GET)
			public String adminpage(Model model) {	
				logger.info("관리자 페이지 이동");
				return "adminpage";
			}
			//관리자 페이지이동		
			@RequestMapping(value = "/admin_menual", method = RequestMethod.GET)
			public String admin_menual(Model model) {	
				logger.info("관리자 페이지 이동");
				return "admin_menual";
			}
	//회원 리스트 카테고리 선택, 검색	
			@RequestMapping(value = "/search")
			public ModelAndView search(@RequestParam HashMap<String, String> map) {
				logger.info("게시글 검색후 리스트로 이동");
				logger.info("검색 카테고리 : {}", map.get("keyField"));
				logger.info("검색 키워드 :{}",map.get("keyWord"));
				return aservice.search(map);
			}
			//회원 리스트에서 회원 삭제
			@RequestMapping(value = "/memdel")
			public @ResponseBody HashMap<String, Integer>memdel(@RequestParam("delmem") String delmem) {
				logger.info("멤버 삭제후 리스트로 이동");
				return aservice.memdel(delmem);
			}
			//회원 리스트에서 상태변경
			@RequestMapping(value = "/memstate")
			public @ResponseBody HashMap<String, Integer>memstate
			(@RequestParam ("upstate") int upstate,@RequestParam("upmemid") String upmemid) {
				logger.info("멤버 상태변경 후 리스트로 이동");
			
				return aservice.memstate(upstate,upmemid);
			}
			//후기 리스트 보기
			@RequestMapping(value = "/adminreply", method = RequestMethod.GET)
			public String adminreply(Model model) {
				logger.info("후기 리스트 뽑아서 이동");
				aservice.adminreply(model);
				return "adminreply";
			}
			//후기 삭제
			@RequestMapping(value = "/replydel")
			public @ResponseBody HashMap<String, Integer>replydel(@RequestParam("delreply") String delreply) {
				logger.info("후기 삭제 후 리스트로 이동");
				return aservice.replydel(delreply);
			}
			//후기 내용,사용자로 검색
			@RequestMapping(value = "/replysearch")
			public ModelAndView replysearch(@RequestParam HashMap<String, String> map) {
				logger.info("게시글 검색후 리스트로 이동");
				logger.info("검색 카테고리 : {}", map.get("keyField"));
				logger.info("검색 키워드 :{}",map.get("keyWord"));
				return aservice.replysearch(map);
			}
			@RequestMapping(value = "/adminjoinForm", method = RequestMethod.GET)
			public String adminjoinForm(Model model) {
				logger.info("관리자 회원가입 페이지 이동");
				return "adminjoinForm";
			}
			@RequestMapping(value = "/adminjoin")
			public @ResponseBody HashMap<String, Object> join(@RequestParam HashMap<String, String> params) {
				logger.info("관리자 회원 아이디:",params.get("mem_id"));
				logger.info("관리자 회원 비밀번호:",params.get("mem_pw"));
				return aservice.adminjoin(params);
			}
			
			@RequestMapping(value="/adminlogin")
			   public @ResponseBody HashMap<String, Object> adminlogin(@RequestParam HashMap<String, String> params
			         ,RedirectAttributes redirectAttr, HttpSession session){
			      logger.info("관리자 로그인 요청");
			      return aservice.adminlogin(params,redirectAttr,session);
			   }
			@RequestMapping(value="/adminlogout")
			   public String adminlogout (HttpSession session){
				  session.removeAttribute("adminId");
			      return "adminLogin";
			   }
			//공지사항 리스트 이동
			@RequestMapping(value="/a_notice")
			public String a_notice(Model model) {
				return "a_notice";
			}
			
			//공지사항 리스트
			@RequestMapping(value="/noticeList")
			public @ResponseBody HashMap<String, Object>noticeList(){
				logger.info("공지사항 리스트");
				return aservice.noticeList();
			}
			
			//공지사항 작성 페이지 이동
			@RequestMapping(value="/a_noticeWrite")
			public String a_noticeWrite() {
				logger.info("a_noticeWrite 요청");
				return "a_noticeWrite";
			}
			
			
			//공지사항 작성
			@RequestMapping(value="/noticeWrite")
			public @ResponseBody HashMap<String, Object>noticeWrite(@RequestParam HashMap<String, String> params){
				logger.info("공지사항 작성 요청");
				return aservice.noticeWrite(params);
			}
			
			//공지사항 상세보기
			@RequestMapping(value="/a_noticeDetail")
			public ModelAndView a_noticeDetail(@RequestParam("notice_idx") String notice_idx) {
				logger.info("a_noticeDetail 상세보기요청");
				logger.info("상세보기 idx : {}",notice_idx);
				
				return aservice.a_noticeDetail(notice_idx);
				
			}
			
			//공지사항 수정 상세보기
			@RequestMapping(value="a_updateForm")
			public ModelAndView a_updateForm(@RequestParam("notice_idx") String notice_idx) {
				logger.info("a_updateForm 요청");
				logger.info("idx : {}", notice_idx);
				return aservice.a_updateForm(notice_idx);
			}
			
			//공지사항 수정
			@RequestMapping(value="a_noticeUpdate")
			public @ResponseBody HashMap<String, Object> a_noticeUpdate(@RequestParam HashMap<String, String> params) {
				logger.info("boardUpdate 요청");
				return aservice.a_noticeUpdate(params);
			} 
			
			//공지사항 삭제
			@RequestMapping(value="a_noticeDelete")
			public@ResponseBody HashMap<String, Object>a_noticeDelete(@RequestParam("idx") int idx){
				logger.info("a_noticeDelete 요청");
				logger.info("idx : {}", idx);
				return aservice.a_noticeDelete(idx);
			}
			
}
