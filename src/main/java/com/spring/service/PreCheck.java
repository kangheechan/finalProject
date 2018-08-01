package com.spring.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class PreCheck extends HandlerInterceptorAdapter {

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      System.out.println("controller 요청 전에 실행 -- preHandle");
      HttpSession session = request.getSession();
      boolean pass = false;
      if(session.getAttribute("loginId") == null) {
         response.setContentType("text/html; charset=UTF-8");
           PrintWriter out = response.getWriter();
           out.println("<script>alert('로그인 후 이용가능한 서비스 입니다.'); location.href = '/controller/index'; </script>");
           out.flush();
      }else {
         System.out.println("로그인이 되었음");
         pass = true;
      }
      System.out.println("세션 검사");
      System.out.println("해당 요청으로 보낼지 true | false 로 반환");
      return pass;
   }
 
}