package com.spring.dao;

import com.spring.dto.MemberDTO;

public interface MemberInter {

   String overlay(String id);

   int join(MemberDTO dto);

   String pop_pw(String id);
   
   String searchID(String search_name, String search_email);

   MemberDTO searchPw_q(String mem_id, String mem_name);

   String answer_check(String mem_id, String mem_answer);

   int reset_pw(String mem_id, String mem_pw);

   String email_check(String mem_id, String mem_email);

   MemberDTO detailView(String mem_id);

   int update(MemberDTO dto);

   int byemember(String mem_id);

}