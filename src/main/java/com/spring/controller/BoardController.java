package com.spring.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.BoardService;
@Controller
public class BoardController {
   
   
   private static final Logger logger = LoggerFactory.getLogger(BoardController.class);   

@Autowired BoardService b_service;
    
   @RequestMapping(value = "/reviewList")
   public @ResponseBody HashMap<String, Object> reviewList(@RequestParam("shop_idx") String shop_idx)  {
      logger.info("리뷰 리스트 호출");
      logger.info(shop_idx);   
      
      return b_service.reviewList(shop_idx);
   }
   
   @RequestMapping(value = "/reviewWrite")
   public @ResponseBody HashMap<String, Object> reviewWrite(@RequestParam HashMap<String, String>  params)  {
      logger.info("리뷰 작성");
      logger.info(params.get("sreply_star"));
      logger.info(params.get("sreply_content"));
      logger.info(params.get("mem_id"));
      logger.info(params.get("shop_idx"));
      return b_service.reviewWrite(params);
   }
   
   @RequestMapping(value = "/reviewdel")
   public @ResponseBody HashMap<String, Integer>reviewdel(@RequestParam("delreply") String delreply) {
      logger.info("후기 삭제 후 리스트로 이동");
      return b_service.reviewdel(delreply);
   }
   @RequestMapping(value="/starRate")
   public String starRate() {
      logger.info("후기페이지");
      
      return "starRate";
   }
   //후기 업데이트 
   @RequestMapping(value = "/reviewupdate")
   public @ResponseBody HashMap<String, Object> reviewupdate(
         @RequestParam("sreply_idx") String sreply_idx, @RequestParam("reviewcontent")String reviewcontent,
         @RequestParam("sreply_star")String sreply_star)  {
      logger.info("리뷰 리스트 호출");
      logger.info("후기업데이트 폼~");
      logger.info("idx :{}",sreply_idx);
      logger.info("content :{}",reviewcontent);
      logger.info("sreply_star:{}",sreply_star);
      
      return b_service.reviewupdate(sreply_idx,reviewcontent,sreply_star);
   }
   
   //구매자일때만 후기작성 버튼 보임
   @RequestMapping(value = "/writerCheck")
   public @ResponseBody HashMap<String, Object> writerCheck(@RequestParam HashMap<String, String> map)  {
      logger.info("후기작성 가능인지 확인");
      int shop_idx = Integer.parseInt(map.get("shop_idx"));
      String login_id = String.valueOf(map.get("login_id"));
      
      logger.info("상점 번호: " + shop_idx);
      logger.info("아이디: "+login_id);
      
      return b_service.writerCheck(shop_idx,login_id);
   }
   
   
 //댓글 리스트호출
   @RequestMapping(value = "/replylist")
	public @ResponseBody HashMap<String, Object> replylist(String idx) {
		logger.info("댓글 리스트 호출");
		logger.info("댓글호출할 요청게시판 idx : {}",idx);
		return b_service.replylist(idx);
	}
   
 //댓글 삭제
	@RequestMapping(value = "/replyDel")
	public @ResponseBody HashMap<String, Integer>replyDel(@RequestParam("delreply") String delreply) {
		logger.info("댓글 삭제후 리스트로 이동");
		return b_service.replyDel(delreply);
	}
	//댓글 작성
	@RequestMapping(value = "/replyWrite")
	public @ResponseBody HashMap<String, Integer>replyWrite(@RequestParam HashMap<String, String> params) {
		logger.info("댓글 등록 후 리스트로 이동");
		return b_service.replyWrite(params);
	}
	//댓글 수정
	@RequestMapping(value = "/replyup")
	public @ResponseBody HashMap<String, Integer>replyup(@RequestParam("upreply") String upreply,@RequestParam("breply_idx") String breply_idx) {
		logger.info("댓글 수정 후 리스트로 이동");
		logger.info("수정할 내용:{} ",upreply);
		logger.info("수정할 댓글:{}",breply_idx);
		return b_service.replyup(upreply,breply_idx);
	}
   
}