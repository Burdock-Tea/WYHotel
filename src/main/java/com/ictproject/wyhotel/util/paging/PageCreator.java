package com.ictproject.wyhotel.util.paging;

import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class PageCreator {

   private PageVO paging;
   private int articleTotalCount;
   private int endPage;
   private int beginPage;
   private boolean prev;
   private boolean next;
   
   private final int buttonNum = 5;
   
   //URI 파라미터를 쉽게 만들어 주는 유틸 메서드
   public String makeURI(int page) {
      UriComponents ucp = UriComponentsBuilder.newInstance().queryParam("pageNum", page)
                                               .queryParam("cpp", paging.getCpp())
                                               .queryParam("keyword", paging.getKeyword())
                                               .queryParam("category", paging.getCategory())
                                               .build();
      return ucp.toUriString();
   }

   
   private void calcDataOfPage() {
      
      endPage = (int) (Math.ceil(paging.getPageNum() / (double) buttonNum) * buttonNum);
      
      beginPage = (endPage - buttonNum) + 1;
      
      prev = (beginPage == 1) ? false : true;
      
      next = articleTotalCount <= (endPage * paging.getCpp()) ? false : true;
      
      if(!next) {
         endPage = (int) Math.ceil(articleTotalCount / (double) paging.getCpp()); 
      }
      
   }
   
   //컨트롤러가 총 게시물의 개수를 PageCreator에게 전달한 직후에 
   //바로 페이징 버튼 알고리즘이 돌아갈 수 있도록 setter를 커스텀.
   public void setArticleTotalCount(int articleTotalCount) {
      this.articleTotalCount = articleTotalCount;
      calcDataOfPage();
   }
   
}