# KH_Project
KH정보교육원에서 진행한 세미, 파이널 프로젝트 자료
<br/><br/><br/><br/>

## ◎파이널 프로젝트
#### 기존의 여러 쇼핑몰 사이트의 장점들을 결합하여 스프링으로 제작한 웹 쇼핑몰 사이트
- 다양한 종류의 제품
- 사용자 환경에 맞춘 제품 사이즈 추천
- 다양한 이벤트 및 쿠폰 제공
- 사용자가 원하는 중고 제품 구매 및 판매 가능

<br/>

***

## 개발 도구
![final1](https://user-images.githubusercontent.com/73204072/107943942-be35a700-6fd0-11eb-89bb-d4d42d28a6fe.jpg)

## 데이터베이스 모델
![final2](https://user-images.githubusercontent.com/73204072/107944051-ec1aeb80-6fd0-11eb-82b0-f4f0a7ec440c.jpg)

## SWOT 분석
![final3](https://user-images.githubusercontent.com/73204072/107944114-02c14280-6fd1-11eb-8576-8dfc64107e6f.jpg)

***

## 기능구현
- 메인페이지

![final4](https://user-images.githubusercontent.com/73204072/108020966-e7057d00-7060-11eb-8681-6aaf22991263.gif)

---

- 회원가입 / 로그인

![final5](https://user-images.githubusercontent.com/73204072/108029870-964a5000-7071-11eb-9740-a460be59932f.gif)

![final_enroll](https://user-images.githubusercontent.com/73204072/109637989-d1c83c80-7b90-11eb-8fcf-ff3052a73c86.png)

1. 회원가입에서 작성한 정보를 Member 객체에 저장
2. 비밀번호 암호화를 위해 Spring Security에서 제공하는 BCryptPasswordEncoder를 사용
3. 회원가입 후 메인페이지로 이동하기 위해 loc에 메인페이지 주소를 저장
---

- 마이페이지

![final6](https://user-images.githubusercontent.com/73204072/108159446-69a63f00-712a-11eb-8671-a93af455bcc6.gif)

![final_cart](https://user-images.githubusercontent.com/73204072/109638932-eeb13f80-7b91-11eb-9a41-988056aee4ee.png)

1. 장바구니 목록 조회 시 List안에 Map이 있는 형태로 여러 정보를 조회
2. totalContents에 조회하는 장바구니 정보의 총 갯수를 저장 (페이징처리에 필요)
3. 장바구니 삭제는 view에서 Ajax로 실시간으로 삭제하도록 했기 때문에 @ResponseBody 어노테이션을 사용하여 JSON 형태로 반환

---

- 룩북

![final7](https://user-images.githubusercontent.com/73204072/108160631-c73b8b00-712c-11eb-9dd0-73d98699416f.gif)

---

- 관리자페이지 ( 메인, 통계 )

![final8](https://user-images.githubusercontent.com/73204072/108161072-9d369880-712d-11eb-9edc-ec4c6acdcdee.gif)

---

- 상품관리 ( 목록조회, 수정 )

![final9](https://user-images.githubusercontent.com/73204072/108163583-a5450700-7132-11eb-8b7b-bb806d8988b1.gif)

---

- 상품관리 ( 등록 )

![final10](https://user-images.githubusercontent.com/73204072/108164001-564ba180-7133-11eb-81b4-662a1932edd8.gif)

---

- 상품관리 ( 입출고관리)

![final11](https://user-images.githubusercontent.com/73204072/108164319-e25dc900-7133-11eb-8982-cd41136c4642.gif)

---

- 회원관리

![final12](https://user-images.githubusercontent.com/73204072/108164939-11c10580-7135-11eb-8776-0dac8171f539.gif)

---

- 결제/포인트관리

![final13](https://user-images.githubusercontent.com/73204072/108165266-9d3a9680-7135-11eb-87c4-904f83280947.gif)

---

<br/><br/><br/><br/><br/>

## ◎세미 프로젝트
#### 자연 친화적으로 깨끗한 식품을 제공하는 쇼핑몰
- [ **Zero Waste** ] 환경보호를 지향합니다
- [ **Fresh Food** ] 신선한 음식을 제공합니다
- [ **Customer** ] 고객의 만족을 최우선으로 생각합니다

<br/>

***
## 주제를 선정한 이유?
![semi1](https://user-images.githubusercontent.com/73204072/107927817-d7335d80-6fba-11eb-9f9d-f50a072a78b3.jpg)

## 개발 도구
![semi2](https://user-images.githubusercontent.com/73204072/107928328-82dcad80-6fbb-11eb-8d21-1c20989718c3.jpg)

## 데이터베이스 모델
![semi3](https://user-images.githubusercontent.com/73204072/107928694-00a0b900-6fbc-11eb-8c92-3982d94e3e62.jpg)

## SWOT 분석
![semi7](https://user-images.githubusercontent.com/73204072/107942985-5af74500-6fcf-11eb-9f4a-d4f3b4cf572a.jpg)
***

## 기능구현
- 메인페이지

![semi4](https://user-images.githubusercontent.com/73204072/107935312-917b9280-6fc4-11eb-93ac-46648c6c5c7f.gif)

---

- 로그인

![semi5](https://user-images.githubusercontent.com/73204072/107935143-57aa8c00-6fc4-11eb-8b98-23f3f31a8172.gif)

---

- 관리자 페이지 (회원관리)

![semi6](https://user-images.githubusercontent.com/73204072/107942458-9e9d7f00-6fce-11eb-9ba6-1a79dcaec6fe.gif)
