package com.ictproject.wyhotel.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ictproject.wyhotel.command.CartListVO;
import com.ictproject.wyhotel.command.EshopOrderCartVO;
import com.ictproject.wyhotel.command.EshopOrderVO;
import com.ictproject.wyhotel.command.EshopProductVO;
import com.ictproject.wyhotel.eshop.service.IEshopService;
import com.ictproject.wyhotel.member.service.IMemberService;

@Controller
@RequestMapping("/eshop")
public class EshopController {
	
	@Autowired
	private IEshopService service;
	
	@Autowired
	private IMemberService member;
	
	@GetMapping("/productList")
	public void productList() {}
		
	@ResponseBody
	@PostMapping("/productList")
	public List<EshopProductVO> listStatus(@RequestBody String condition){
		
		return service.getList(condition);
	}
	
	@GetMapping("/foodList")
	public void foodList() {}
	
	@ResponseBody
	@PostMapping("/foodList")
	public List<EshopProductVO> foodList(@RequestBody String condition){
		
		return service.getFoodList(condition);
	}
		
	@GetMapping("/productDetail/{prodnum}")
	public String productDetail(@PathVariable int prodnum, Model model) {
		
		model.addAttribute("list", service.getDetail(prodnum));
		return "eshop/productDetail";
	}
		
	@GetMapping("/cartList")
	public String cartList(Model model, HttpSession session) {
		
		String memberCode = (String)session.getAttribute("member");
		model.addAttribute("list" , service.getCartList(memberCode));
		
		return "eshop/cartList";
	}
	
	@ResponseBody
	@PostMapping("/addCart")
	public String addCart(@RequestBody CartListVO vo) {
		
		return service.addCart(vo);
	}
	
	@ResponseBody
	@PostMapping("/addCartChk")
	public boolean addCartChk(@RequestBody CartListVO vo) {
		
		return service.addCartCheck(vo);
	}
			
	@ResponseBody
	@PostMapping("/delCart")
	public String delCart(@RequestParam(value="list[]") List<Integer> delList ) {
		
		service.delCartList(delList);
		
		return "success";
	}
	
	@ResponseBody
	@PostMapping("/updateOrder")
	public void updateOrder(@RequestParam(value="cartnum[]") List<Integer> cartnum,
								@RequestParam(value="quantity[]") List<Integer> quantity,
								@RequestParam(value="unChecked[]", required = false) List<Integer> unChecked) {
		List<CartListVO> updateList = new ArrayList<CartListVO>();
		CartListVO cartList;
		for (int i = 0; i < cartnum.size(); i++) {
			cartList = new CartListVO();
			cartList.setCartnum(cartnum.get(i));
			cartList.setQuantity(quantity.get(i));
			updateList.add(i, cartList);
		}
		if(unChecked != null)
			service.delCartList(unChecked);
		service.updateList(updateList);
	}
				
	@GetMapping("/orderList")
	public String orderList(Model model, HttpSession session) {
		String memberCode = (String)session.getAttribute("member");
		model.addAttribute("list" , service.getCartList(memberCode));
		model.addAttribute("member" , member.getInfo(memberCode));
		return "eshop/orderList";
	}
	
	@PostMapping("/orderList")
	public String orderList(Model model , EshopOrderCartVO vo , HttpSession session) {
		String memberCode = (String)session.getAttribute("member");
		List<EshopOrderCartVO> list = new ArrayList<EshopOrderCartVO>();
		list.add(vo);
		model.addAttribute("list" , list);
		model.addAttribute("member" , member.getInfo(memberCode));
		return "eshop/orderList";
	}
	
	@PostMapping("/endOrder")
	public void insertOrderInfo(EshopOrderVO vo , @RequestParam(value="quantity") List<Integer> quantity ,
								@RequestParam(value="prodnum") List<Integer> prodnum ,Model model) {
		
		    
		service.insertOrder(vo);
		
		CartListVO cVO = null;
		List<CartListVO> orderList = new ArrayList<CartListVO>();
		for(int i=0; i < prodnum.size(); i++) {
			cVO = new CartListVO();
			cVO.setMemberCode(vo.getMemberCode());
			cVO.setProdnum(prodnum.get(i));
			cVO.setQuantity(quantity.get(i));
			orderList.add(i, cVO);
		}
			
		service.insertCartOrder(orderList);
		service.delCartPostOrder(vo.getMemberCode());
		System.out.println("ordered List : " + service.getOrderList(vo.getMemberCode()));
		model.addAttribute("list" , service.getOrderList(vo.getMemberCode()));
	}
	
	@GetMapping("/endOrder")
	public void endOrder() {}
	
	@GetMapping("/myOrderList")
	public void myOrderList(Model model , HttpSession session) {
		
		
		String memberCode = (String)session.getAttribute("member");
		model.addAttribute("list" , service.getOrderLists(memberCode));
		
	}
}
