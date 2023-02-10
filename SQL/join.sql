# '경제' 카테고리에 속하는 도서들의 도서 ID(BOOK_ID), 저자명(AUTHOR_NAME), 출판일(PUBLISHED_DATE) 리스트를 출력하는 SQL문을 작성해주세요.
# 결과는 출판일을 기준으로 오름차순 정렬해주세요.

SELECT BOOK_ID, b.AUTHOR_NAME, TO_CHAR(PUBLISHED_DATE, 'YYYY-MM-DD') # Oracle Join
FROM BOOK a , AUTHOR b 
WHERE CATEGORY = '경제' AND a.AUTHOR_ID = b.AUTHOR_ID 
ORDER BY PUBLISHED_DATE ASC

# PRODUCT 테이블과 OFFLINE_SALE 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 출력하는 SQL문을 작성해주세요. 
# 결과는 매출액을 기준으로 내림차순 정렬해주시고 매출액이 같다면 상품코드를 기준으로 오름차순 정렬해주세요.

SELECT PRODUCT_CODE, SUM(PRICE*SALES_AMOUNT) AS SALES 
FROM PRODUCT a, OFFLINE_SALE b
WHERE a.PRODUCT_ID = b.PRODUCT_ID
GROUP BY PRODUCT_CODE
ORDER BY SALES desc, PRODUCT_CODE

# MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요. 
# 회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 
# 결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요.

# 집계함수(COUNT) 안에 또다른 집계함수(MAX)를 중첩해서 사용할 수 없다.
