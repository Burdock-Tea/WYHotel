package com.ictproject.wyhotel.eshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictproject.wyhotel.command.CartListVO;
import com.ictproject.wyhotel.command.EshopOrderCartVO;
import com.ictproject.wyhotel.command.EshopOrderVO;
import com.ictproject.wyhotel.command.EshopProductVO;
import com.ictproject.wyhotel.eshop.mapper.IEshopMapper;

@Service
public class EshopServiceImpl implements IEshopService {
	
	@Autowired
	private IEshopMapper mapper; 
	
	@Override
	public List<EshopProductVO> getList(String condition) {
		
		Map<String, String> map = new HashMap<>();
		map.put("condition", condition);
		return mapper.getList(map);
	}
	
	@Override
	public EshopProductVO getDetail(int prodnum) {
		
		return mapper.getDetail(prodnum);
	}
	
	@Override
	public String addCart(CartListVO vo) {
		mapper.addCart(vo);
		return "success";
	}
	
	@Override
	public List<CartListVO> getCartList(String memberCode) {
		
		System.out.println(memberCode+"dwadwadad" );
		
		return mapper.getCartList(memberCode);
	}
	
	@Override
	public void delCartList(List<Integer> delList) {
		
		delList.forEach(cartnum -> {
			mapper.delCartList(cartnum);
		});
	}
	
	@Override
	public void updateList(List<CartListVO> updateList) {
		
		updateList.forEach(cartList -> {
			mapper.updateList(cartList);
		});
	}
	
	@Override
	public boolean addCartCheck(CartListVO vo) {
		
		int addCheck = mapper.addCartCheck(vo);
		return (addCheck == 0 ? true : false);
	}
	@Override
	public void insertOrder(EshopOrderVO vo) {
		
		mapper.insertOrder(vo);
	}
	
	@Override
	public void insertCartOrder(List<CartListVO> orderList) {
		
		orderList.forEach(cVO -> {
			mapper.insertCartOrder(cVO);
		});
		
	}
	@Override
	public void delCartPostOrder(String memberCode) {
	
		mapper.delCartPostOrder(memberCode);
	}
	
	@Override
	public List<EshopOrderCartVO> getOrderList(String memberCode) {
	
		return mapper.getOrderList(memberCode);
	}
	
	@Override
	public List<EshopProductVO> getFoodList(String condition) {
		Map<String, String> map = new HashMap<>();
		map.put("condition", condition);
		return mapper.getFoodList(map);
	}
	
	@Override
	public List<EshopOrderVO> getOrderLists(String memberCode) {
		
		List<EshopOrderVO> list = mapper.getOrderLists(memberCode);
		
		list.forEach(vo -> {
			
			List<EshopOrderCartVO> cVO = mapper.getProdList(vo.getOrdernum());
			vo.setProdList(cVO);
		});
		System.out.println(list + "dawdwadwadawdawd");
		return list;
		
		
	}
}
