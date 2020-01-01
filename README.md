# PensionSite_JavaWeb
펜션예약사이트 입니다.

교육기간중 진행한 두번째 프로젝트이며, 첫 웹 프로젝트 입니다.

SSANGYOUNG Pension
=

![main](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/20191122134208b3c72489-4418-484b-aed5-39176e2782e9.png)

* 프로젝트명: 펜션 예약 홈페이지
* 기간: 2019.6 ~ 8 (약 6주)
* 참여인원: 총 5명

---
개발 Platform

* ava SE 8 - Dynamic Web Project
* Oracle 11g
* Apache Tomcat 8.0
* Subversive SVN
* eclipse
* eXERD

---
맡은업무

* 메신저
* 사용자용 예약 확인, 취소 페이지
* 통계

---
맡은업무설명

문의용 메신저
=

![messenger](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/2019112213563976e13306-c89f-4f49-8fa9-205753d6b2ba.png)  
메신저는 WebSocket을 사용해 만들었습니다. 메신저를 어떻게 구현해야할지 막막했는데 WebSocket을 알게되면서 생각보다 손쉽게 구현했습니다. 만들면서 자바스크립트나 css를 많이 연습할 수 있던 부분이었습니다.  
메인페이지의 우측하단에 위치한 버튼을 누르면 시작됩니다.

관리지로그인으로 시작하지 않으면 무조선 손님으로 표시되며, 손님은 무조건 우측에 메시지가 표시됩니다.  
자기자신의 메시지는 색으로 구별이 가능합니다.  
자기자신은 '나', 타인은 '손님'으로 표시됩니다.  
![messengerimg1](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/2019112214025712cf1910-c852-4d62-8601-b1c939ae3eae.png)  
![messengerimg2](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/201911221402576febc445-8987-41b2-885c-66d23b6d971d.png)  
하단의 톱니바퀴로 img태그, 색상설정과 접속자 목록을 볼 수 있습니다.  
접속한 사용자를 모두 배열에 넣어 목록을 표시하는 방식입니다. 주기적으로 새로고침이 이루어져 실시간 적용됩니다.  

![messengerimg3](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/20191122140759bca371a1-bf63-420b-9bd5-decf2ed6b8c8.png)  
![messengerimg4](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/20191122140759cc312ba9-ab84-4f18-be35-f6f99ce438e8.png)  
<img>태그로 이미지를 띄우거나 메신저 하단에 위치한 이미지버튼을 사용할 수 있습니다.  


예약확인, 취소페이지
=

예약확인,취소 페이지는 페이지간 이동과 파라미터 주고받기가 주류이며 큰 어려움은 없었지만 웹 프로젝트가 처음이었던 그 당시엔 연습하기 좋았던 부분이었습니다.

![rsimg1](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/2019112214111164d3fe0e-4cfc-4df8-bbfe-cdaaf6a47981.png)  
![rsimg2](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/201911221412257d7dfb0a-4097-42d3-bfc6-740d6e71e935.png)  
![rsimg3](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/201911221414493ccef22f-14ac-4ce1-9cd2-86f04318e3e3.png)  

예약을 취소할 수 있으며 확인을 눌면 취소되었다는 메시지와 함께 팝업이 닫힙니다.  
![rsimg4](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/20191122141624c2d9e1b1-0a94-4692-8f07-ef575a4fdd82.png)  


통계
=

통계는 구글차트를 사용해 간단히 나타냈습니다. 중복되는 최상위데이터는 따로 계산하여 페이지에 표시해주었습니다.  
![cimg1](http://go.lgs.kro.kr/Portfolio/boardFile/php_uploader/upload/20191122141953377df95b-012b-4a8f-beca-026075be3045.png)

관리자만 접근 가능한 페이지입니다.  
구글차트를 사용했고, DB에 등록된 예약자료를 차트로 보여줍니다.  
제일 많이 예약된 방을 따로 표시해줍니다.  
최상위 데이터가 중복되었을땐, 중복데이터를 모두 표시합니다.
