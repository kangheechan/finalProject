package com.spring.service;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dao.MemberInter;
import com.spring.dto.MemberDTO;

@Service
public class MemberService {

   private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());

   MemberInter m_inter = null;

   @Autowired
   SqlSession sqlSession;

   @Autowired
   private JavaMailSender javaMailSenderImpl; // xml에 등록한 bean autowired

   public HashMap<String, Object> overlay(String id) {
      logger.info("오버레이 서비스 요청");
      HashMap<String, Object> map = new HashMap<String, Object>();
      m_inter = sqlSession.getMapper(MemberInter.class);

      String result = m_inter.overlay(id);
      boolean overlay = false;
      logger.info("result" + result);

      if (result != null) {
         overlay = true;
      }
      map.put("overlay", overlay);
      return map;
   }

   public int sendMail(HashMap<String, String> params) throws FileNotFoundException, URISyntaxException {

      Random random = new Random();
      int result = random.nextInt(10000) + 1000;
      try {

         if (result > 10000) {
            result = result - 1000;
         }
         logger.info("생성된 난수 : " + Integer.toString(result));
         SimpleMailMessage message = new SimpleMailMessage();

         message.setFrom("audwls7505@naver.com");

         message.setTo(params.get("email"));

         message.setSubject("[슈마니커]이메일 인증 번호");

         message.setText("슈마니커 이메일 인증 번호 : [ " + result + " ]");

         javaMailSenderImpl.send(message);

      } catch (Exception e) {

         e.printStackTrace();

      }

      return result;
   }

   public HashMap<String, Object> join(HashMap<String, String> params) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      MemberDTO dto = new MemberDTO();
      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
      String hash = encoder.encode(params.get("mem_pw"));
      dto.setMem_id(params.get("mem_id"));
      dto.setMem_pw(hash);
      dto.setMem_name(params.get("mem_name"));
      dto.setMem_gender(params.get("mem_gender"));
      dto.setMem_email(params.get("mem_email"));
      dto.setMem_size(params.get("mem_size"));
      dto.setMem_phone(params.get("mem_phone"));
      dto.setMem_addr(params.get("mem_addr1") + "/" + params.get("mem_addr2") + "/" + params.get("mem_addr3"));
      dto.setMem_question(params.get("mem_question"));
      dto.setMem_answer(params.get("mem_answer"));
      m_inter = sqlSession.getMapper(MemberInter.class);
      int success = m_inter.join(dto);
      logger.info("회원가입 성공 여부 : " + success);

      map.put("success", success);

      return map;
   }

   public HashMap<String, Object> searchID(HashMap<String, String> params) {
      HashMap<String, Object> map = new HashMap<>();
      m_inter = sqlSession.getMapper(MemberInter.class);
      String search_name = params.get("search_name");
      String search_email = params.get("search_email");
      String success = "해당 정보가 없습니다.";
      String result = m_inter.searchID(search_name, search_email);

      if (result != null) {
         success = result;
      }
      map.put("success", success);
      return map;
   }

   public HashMap<String, Object> email_searchPW(HashMap<String, String> params) {
      HashMap<String, Object> map = new HashMap<>();
      String mem_id = params.get("mem_id");
      String mem_email = params.get("mem_email");
      m_inter = sqlSession.getMapper(MemberInter.class);
      boolean success = false;
      String result = m_inter.email_check(mem_id, mem_email);
      if (result != null) {
         success = true;
         map.put("mem_id", result);
      }

      map.put("success", success);
      return map;
   }

   public @ResponseBody HashMap<String, Object> question_searchPW(HashMap<String, String> params) {
      HashMap<String, Object> map = new HashMap<>();
      m_inter = sqlSession.getMapper(MemberInter.class);
      String mem_id = params.get("search_id");
      String mem_name = params.get("search_name");
      MemberDTO dto = new MemberDTO();
      dto = m_inter.searchPw_q(mem_id, mem_name);
      if (dto != null) {
         map.put("dto", dto);
         map.put("success", true);
      }
      return map;
   }

   public @ResponseBody HashMap<String, Object> answer_check(HashMap<String, String> params) {
      HashMap<String, Object> map = new HashMap<>();
      m_inter = sqlSession.getMapper(MemberInter.class);
      String mem_id = params.get("mem_id");
      String mem_answer = params.get("mem_answer");
      boolean success = false;
      String result = m_inter.answer_check(mem_id, mem_answer);
      if (result != null) {
         success = true;
         map.put("mem_id", result);
      }

      map.put("success", success);
      return map;
   }

   public HashMap<String, Object> reset_pw(HashMap<String, String> params) {
      HashMap<String, Object> map = new HashMap<>();
      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
      String mem_id = params.get("mem_id");
      String hash = encoder.encode(params.get("mem_pw"));
      m_inter = sqlSession.getMapper(MemberInter.class);
      int success = m_inter.reset_pw(mem_id, hash);

      if (success > 0) {
         map.put("success", success);
      }

      return map;
   }

   public HashMap<String, Object> login(HashMap<String, String> params, RedirectAttributes redirectAttr,
         HttpSession session) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      m_inter = sqlSession.getMapper(MemberInter.class);
      String id = params.get("id");
      String pw = params.get("pw");
      String encode_pw = m_inter.pop_pw(id);
      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
      boolean success = encoder.matches(pw, encode_pw);
      if (success) {
         map.put("success", success);
         session.setAttribute("loginId", id);
      }
      return map;
   }

   public HashMap<String, Object> detailView(HashMap<String, String> params,HttpServletRequest request) {
      
      HashMap<String, Object> map =  new HashMap<>();
      String mem_id = (String) request.getSession().getAttribute("loginId");
      logger.info("현재 로그인 아이디 : "+mem_id);
      m_inter = sqlSession.getMapper(MemberInter.class);
      boolean login = false;
      if(mem_id !=null) {
         login = true;
         map.put("login",login);
         MemberDTO dto = m_inter.detailView(mem_id);
         map.put("dto", dto);
      }
      return map;
   }

   public HashMap<String, Object> pwCheck(HashMap<String, String> params, HttpServletRequest request) {
      HashMap<String, Object> map =  new HashMap<>();
      String mem_id = (String) request.getSession().getAttribute("loginId");
      logger.info("현재 로그인 아이디 : "+mem_id);
      String pw = params.get("updatePwChk");
      m_inter = sqlSession.getMapper(MemberInter.class);
      String encode_pw = m_inter.pop_pw(mem_id);
      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
      boolean result = encoder.matches(pw, encode_pw);
      int success = 0;
      if (result) {
         success = 1;
         map.put("success", success);
      }
      return map;
   }

   public HashMap<String, Object> m_update(HashMap<String, String> params, HttpServletRequest request) {
      HashMap<String,Object> map = new HashMap<>();
      String mem_id = (String) request.getSession().getAttribute("loginId");
      logger.info("현재 로그인 아이디 : "+mem_id);
      
      MemberDTO dto = new MemberDTO();
      BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
      String hash = encoder.encode(params.get("mem_pw"));
      dto.setMem_id(mem_id);
      dto.setMem_pw(hash);
      dto.setMem_name(params.get("mem_name"));
      logger.info("mem_name :: " +params.get("mem_name") );
      dto.setMem_gender(params.get("mem_gender"));
      dto.setMem_email(params.get("mem_email"));
      dto.setMem_size(params.get("mem_size"));
      dto.setMem_phone(params.get("mem_phone"));
      dto.setMem_addr(params.get("mem_addr1") + "/" + params.get("mem_addr2") + "/" + params.get("mem_addr3"));
      m_inter = sqlSession.getMapper(MemberInter.class);
      int success = m_inter.update(dto);
      logger.info("회원가입 성공 여부 : " + success);

      map.put("success", success);

      
      return map;
   }

	public HashMap<String, Object> byemember(HashMap<String, String> params, HttpServletRequest request) {
	      String mem_id = (String) request.getSession().getAttribute("loginId");
	      HashMap<String,Object> map = new HashMap<>();
	      logger.info("현재 로그인 아이디 : "+mem_id);
	      m_inter = sqlSession.getMapper(MemberInter.class);
	      int result = m_inter.byemember(mem_id);
	      
	      map.put("result", result);
	      request.getSession().removeAttribute("loginId");
	      return map;
	   }

}