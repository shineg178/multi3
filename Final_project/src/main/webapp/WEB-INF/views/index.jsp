<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/top" />

<style>
#carouselExampleIndicators{
	border:1px solid black;
	
}
</style>
<main id="main" class="main">
	<ul>
		<li><a href="1">1 접속</a> <br> <a href="2">2 접속</a> <br>
			<a href="3">3 접속</a> <br></li>
		<li><a href="room1">1과 채팅방 생성</a><br> <a href="room2">2과
				채팅방 생성</a><br> <a href="room3">3과 채팅방 생성</a><br></li>
		<li>${id}로그인중</li>
		<li>${rs}</li>
	</ul>

<!-- 배너 // 배너 내용과 이미지는 추후 변경 예정 -->
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <table>
      <tr>
      <td>
      <img src="http://dodreamfund.com/images/sub1/img_ci.gif" class="d-block w-100" alt="...">
     </td>
     </tr> 
    	</table>
    </div>
    <div class="carousel-item">
      <table>
      	<tr>	<td>
      	 <a href="${path}/project/donation">
      		현재 기부 순위 1등은? 
      		배너를 선택시 기부현황페이지로 이동합니다.
      		</a></td>
      	</tr>
      </table>
    </div>
    <div class="carousel-item">
      <img src="https://www.goodneighbors.kr/assets/web/images/banner/introduction/intro_Bimg.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
</main>
<c:import url="/foot" />