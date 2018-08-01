package com.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.dto.CartDTO;
import com.spring.dto.NoticeBoardDTO;
import com.spring.dto.ProductDTO;
import com.spring.dto.ShopDTO;
import com.spring.dto.WalletDTO;

public interface MainInter {

   ArrayList<ProductDTO> getMainList(); //메인리스트 출력

   String getMemShopState(String id); // 상점 개설 여부 상태값 얻기 및 세션추가

   int setShopName(String shopName, String id); //상점명 입력값 넣기
   
   String shopOverlay(String shopName); //상점명 중복값 확인

   int upShopState(String id); //상점개설 여부 상태값 수정

   ShopDTO getShopInfo(String id); //개인 상점 정보 출력

   String getShopIdx(String id); // 상점 인덱스 얻기 및 세션추가
   
   int testInsert(String id, String shopIdx); // 테스트 값 삽입

   int proInsert(ProductDTO dto); // 상품 등록 (이미지 제외)

   void mainImgInsert(String img_main, int pro_idx); //메인 이미지 넣기

   int subImgUpdate(String key, String proIdx); //서브 이미지 넣기

   ProductDTO detail(String idx); //상세정보

   ArrayList<ProductDTO> myproduct(String shopIdx); //idx 얻기 및 id 얻기-> 상품

   ArrayList<ProductDTO> mybuy(String shopIdx); // idx 얻기 및 id 얻기 -> 구매내역

   ArrayList<ProductDTO> mycart(String shopIdx);  // idx 얻기 및 id 얻기 -> 찜목록
   
   ArrayList<ProductDTO> myreview(String shopIdx); // idx 얻기 및 id 얻기 -> 후기
   
   ArrayList<ProductDTO> myinfo(String shopIdx); // idx 얻기 및 id 얻기 -> 내정보
   
   //검색
   ArrayList<ProductDTO> list(HashMap<String, String> map);

   ArrayList<CartDTO> getCartList();

   ArrayList<ProductDTO> SpellertList(String loginId);

   String buyerCheck(String buyer); // 구매자 존재 여부 확인

   int setBuyer(String buyer, String proIdx); // 구매자 업데이트

   int upProState(String proIdx); // 판매상태 변경

   String cartcount(String idx);

   ArrayList<ProductDTO> categorylist(int brand_idx, int gender_idx, int shoes_idx);

   int setWallet(String proIdx, String id);

   ArrayList<WalletDTO> myWallet(String id);

   NoticeBoardDTO noticeDetail(String notice_idx); //공지사항 상세보기

   void upHit(String notice_idx); // 조회수 올리기

   int upSellCount(String shopIdx); // 상품 판매갯수 올리기
   
   int star_sum(int shop_idx);//별점 총합
   
   int count(int shop_idx);//리뷰카운트
   
}