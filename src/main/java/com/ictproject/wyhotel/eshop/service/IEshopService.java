package com.ictproject.wyhotel.eshop.service;

import java.util.List;import org.springframework.core.OrderComparator;

import com.ictproject.wyhotel.command.CartListVO;
import com.ictproject.wyhotel.command.EshopOrderCartVO;
import com.ictproject.wyhotel.command.EshopOrderVO;
import com.ictproject.wyhotel.command.EshopProductVO;


public interface IEshopService {
	
	// 상품 리스트
	List<EshopProductVO> getList(String condition);
	
	// 상세보기
	EshopProductVO getDetail(int prodnum);
	
	// 장바구니 넣기
	String addCart(CartListVO vo);
	
	// 장바구니 리스트
	List<CartListVO> getCartList(String memberCode);

	
	// 장바구니 삭제
	void delCartList(List<Integer> delList);
	
	// 주문 업데이트
	void updateList(List<CartListVO> updateList);
	
	// 장바구니 체크
	boolean addCartCheck(CartListVO vo);
	
	// .주문 정보
	void insertOrder(EshopOrderVO vo);
	
	// 주문 내역 정보
	void insertCartOrder(List<CartListVO> orderList);
	
	// 주문 완료후 삭제
	void delCartPostOrder(String memberCode);
	
	// 주문 완료 페이지 리스트
	List<EshopOrderCartVO> getOrderList(String memberCode);

	List<EshopProductVO> getFoodList(String condition);

	List<EshopOrderVO> getOrderLists(String memberCode);
	

}
