package com.ictproject.wyhotel.eshop.mapper;

import java.util.List;
import java.util.Map;

import com.ictproject.wyhotel.command.CartListVO;
import com.ictproject.wyhotel.command.EshopOrderCartVO;
import com.ictproject.wyhotel.command.EshopOrderVO;
import com.ictproject.wyhotel.command.EshopProductVO;

public interface IEshopMapper {
	
	List<EshopProductVO> getList(Map<String, String> map);
	
	EshopProductVO getDetail(int prodnum);

	void addCart(CartListVO vo);

	List<CartListVO> getCartList(String memberCode);
	
	void delCartList(int cartnum);
	
	void updateList(CartListVO cartList);
	
	int addCartCheck(CartListVO vo);
	
	void insertOrder(EshopOrderVO vo);
	
	void insertCartOrder(CartListVO cVO);
	
	void delCartPostOrder(String memberCode);
	
	List<EshopOrderCartVO> getOrderList(String memberCode);
	
	List<EshopProductVO> getFoodList(Map<String, String> map);
	
	List<EshopOrderVO> getOrderLists(String memberCode);
	
	List<EshopOrderCartVO> getProdList(int ordernum);

	
}
