package com.spring.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.MemberService;

@Controller
public class MemberController {
   
   private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   @Autowired MemberService m_service;
   
   @RequestMapping(value = "/index")
   public String home(Model model) {
      return "index";
   }
   
   @RequestMapping(value = "/joinForm")
   public String joinForm(Model model) {
      return "joinForm";
   }
   
   @RequestMapping(value="/overlay")
   public @ResponseBody HashMap<String, Object> overlay(@RequestParam("id") String id) {
      logger.info("아이디 중복 확인 요청");
      return m_service.overlay(id);
   }
   
   @RequestMapping(value = "/join")
   public @ResponseBody HashMap<String, Object> join(@RequestParam HashMap<String, String> params) {
      logger.info(params.get("userId"));   
      return m_service.join(params);
   }
   
    @RequestMapping(value="/email_check")
      public @ResponseBody HashMap<String, Object> email_check(@RequestParam HashMap<String, String> params) throws FileNotFoundException, URISyntaxException{     
         logger.info("인증번호 보내기 요청");
         HashMap<String, Object> map = new HashMap<>();
         map.put("mail_check", m_service.sendMail(params));
         return map;
      }
   
   @RequestMapping(value="/mail_check")
   public String mail_check() {
      logger.info("이메일 인증 팝업 생성");
      return "mail_check";
   }
   
   @RequestMapping(value="/search_mail_check")
   public String search_mail_check() {      
      logger.info("이메일 인증 팝업 생성");
      return "search_mail_check";
   }
   
   @RequestMapping(value="/login")
      public @ResponseBody HashMap<String, Object> login(@RequestParam HashMap<String, String> params
            ,RedirectAttributes redirectAttr, HttpSession session){
         logger.info("로그인 요청");
         return m_service.login(params,redirectAttr, session);
      }
   
   @RequestMapping(value="/logout")
      public String logout (HttpSession session){
        session.removeAttribute("shopState");
        session.removeAttribute("loginId");
        session.removeAttribute("shopIdx");
         return "redirect:/";
      }
      
   @RequestMapping(value="/mem_search")
   public String mem_search() {      
      logger.info("아이디 비번 찾기 요청");
      return "search";
   }
   
   @RequestMapping(value="/searchID")
   public String searchID() {
      logger.info("회원 아이디 찾기 요청");
      return "searchID";
   }
   
   @RequestMapping(value="/mem_searchID")
   public @ResponseBody HashMap<String, Object> mem_searchID(@RequestParam HashMap<String, String> params){
      logger.info("아이디 찾기 결과 요청");   
      return m_service.searchID(params);
   }
   @RequestMapping(value="/searchPW")
   public String searchPW() {
      logger.info("회원 비밀번호 찾기 요청");
      return "searchPW";
   }
   @RequestMapping(value="/searchPW_email")
   public String searchPW_email() {
      logger.info("회원 비밀번호 찾기 요청");
      return "searchPW_email";
   }
   @RequestMapping(value="/searchPW_question")
   public String searchPW_question() {
      logger.info("회원 비밀번호 찾기 요청");
      return "searchPW_question";
   }
      
   @RequestMapping(value="/email_searchPW")
   public @ResponseBody HashMap<String, Object> email_searchPW(@RequestParam HashMap<String, String> params){
      logger.info("이메일 비밀번호 찾기 결과 요청");
      return m_service.email_searchPW(params);
   }
   
   @RequestMapping(value="/question_searchPW")
   public @ResponseBody HashMap<String, Object> question_searchPW(@RequestParam HashMap<String, String> params){
      logger.info("본인 인증 질문 비밀번호 찾기 결과 요청");   
      return m_service.question_searchPW(params);
   }
   
   @RequestMapping(value="/question_check")
   public ModelAndView question_check(@RequestParam HashMap<String, String> params) {
      ModelAndView mav = new ModelAndView();
      String mem_id = params.get("mem_id");
      String question = params.get("question");
      mav.addObject("mem_id", mem_id);
      mav.addObject("question", question);   
      mav.setViewName("question_access");
      return mav;
   }
   
   @RequestMapping(value="/answer_check")
   public @ResponseBody HashMap<String, Object> answer_check(@RequestParam HashMap<String, String> params) {
      return m_service.answer_check(params);
   }
   
   @RequestMapping(value="/resetPW_call")
   public ModelAndView resetPW_call(@RequestParam HashMap<String, String> params) {
      ModelAndView mav = new ModelAndView();
      mav.addObject("mem_id", params.get("mem_id"));
      mav.setViewName("resetPW_Form");
      return mav;
   }
   
   @RequestMapping(value="/reset_pw")
   public @ResponseBody HashMap<String, Object> reset_pw(@RequestParam HashMap<String, String> params) {
      return m_service.reset_pw(params);
   }
   
   @RequestMapping(value = "/detailView")
   public @ResponseBody HashMap<String, Object> detailView(@RequestParam HashMap<String,String> params,HttpServletRequest request){
      logger.info("회원정보 수정 요청");
      return m_service.detailView(params,request);
   }
   
   @RequestMapping(value="/updateChk")
   public String updateChk(HttpServletRequest request) {
      logger.info("회원 정보수정 본인 인증");
      return "updateChk";
   }
   
   @RequestMapping(value="/pwCheck")
   public @ResponseBody HashMap<String, Object> pwCheck(@RequestParam HashMap<String, String> params,HttpServletRequest request){
      logger.info("정보수정 비밀번호 확인");
      return m_service.pwCheck(params,request);
   }
   
   @RequestMapping(value="/m_update")
   public @ResponseBody HashMap<String,Object> m_update(@RequestParam HashMap<String, String> params,HttpServletRequest requset){
      logger.info("회원 정보 수정 요청");
      return m_service.m_update(params,requset);
   }
   
   @RequestMapping(value="/byemember")
   public @ResponseBody HashMap<String, Object> byemember(@RequestParam HashMap<String, String> params,HttpServletRequest request){
      logger.info("회원 탈퇴 요청");
      return m_service.byemember(params,request);
   }
   
}