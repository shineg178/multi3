<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cd88de1b8477ef4c5df424305ccb757f&libraries=services"></script>
<link href="resources/assets/css/productList.css" rel="stylesheet">

<c:import url="/top" />
<main id="main" class="main">
	<section class="prod-main-section-top">
		<div class="prod-main-top">
			<div class="prod-main-desc" style="margin-left:5%">
				<h1 class="prod-main-title">상품 목록</h1>

				<p class="text-m">
					내 주변의 상품을 찾을 수 있습니다. <br> 지도를 움직이며 관심있는 상품을 둘러보세요!
				</p>
			</div>
			<div class="home-main-image-top">
				<span> <img class="home-main-image-top"
					src="resources/assets/img/products.png">
			</div>
		</div>
	</section>

	<!-- 카카오맵 지도 위치 -->
	<div class="map-box" style="background-color: rgba(246,249,255)">
		<div id="map"></div>
		<a class="mapIcon" > <img class="myLocImg"
			src="resources/assets/img/myLoc.png"> 내 위치 &nbsp;&nbsp; <img
			class="LocImg"
			src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png">
			상품 위치
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<!-- Default Tabs -->
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation">
					<button class="nav-link active" id="user home-tab"
						data-bs-toggle="tab" data-bs-target="#all" type="button"
						role="tab" aria-controls="all" aria-selected="true">
						<img style="height:49px;" src="resources/assets/img/logo.png"><br><strong>전체</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="donation profile-tab"
						data-bs-toggle="tab" data-bs-target="#digital" type="button"
						role="tab" aria-controls="digital" aria-selected="false">
						<img style="height:49px;" src="resources/assets/img/com.JPG"><br><strong>디지털/가전</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="auction contact-tab"
						data-bs-toggle="tab" data-bs-target="#furniture" type="button"
						role="tab" aria-controls="furniture" aria-selected="false">
						<img style="height:49px;" src="resources/assets/img/funi.JPG"><br><strong>가구/인테리어</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<button class="nav-link" id="exchange contact-tab"
						data-bs-toggle="tab" data-bs-target="#food" type="button"
						role="tab" aria-controls="food" aria-selected="false">
						<img style="height:49px;" src="resources/assets/img/life.JPG"><br><strong>생활/가공식품</strong></button>
				</li>
				<li class="nav-item" role="presentation">
					<div id="paybtn">
						<button class="nav-link" id="payment contact-tab"
							data-bs-toggle="tab" data-bs-target="#cloth" type="button"
							role="tab" aria-controls="cloth" aria-selected="false">
							<img style="height:49px;" src="resources/assets/img/cloth.JPG"><br><strong>의류</strong></button>
					</div>
				</li>
				<li class="nav-item" role="presentation">
					<div id="paybtn">
						<button class="nav-link" id="payment contact-tab"
							data-bs-toggle="tab" data-bs-target="#game" type="button"
							role="tab" aria-controls="game" aria-selected="false">
							<img style="height:49px;" src="resources/assets/img/hobby.JPG"><br><strong>게임/취미</strong></button>
					</div>
				</li>
				<li class="nav-item" role="presentation">
					<div id="paybtn">
						<button class="nav-link" id="payment contact-tab"
							data-bs-toggle="tab" data-bs-target="#book" type="button"
							role="tab" aria-controls="book" aria-selected="false">
							<img style="height:49px;" src="resources/assets/img/book.JPG"><br><strong>도서</strong></button>
					</div>
				</li>
			</ul>
			<div class="tab-content pt-2" id="myTabContent">
				<!-- 전체 목록 -->
				<div class="tab-pane fade show active" id="all" role="tabpanel"
					aria-labelledby="all-tab">
					<c:if test="${pList ne null}">
						<c:forEach items="${pList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
										<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img src="resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img src="resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}"/>
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
					</c:if>
					<c:if test="${pList eq null}">
					<c:forEach items="${allList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
										<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img src="resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img src="resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}" />
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
					</c:if>
				</div>

				<!-- 디지털/가전 목록 -->
				<div class="tab-pane fade" id="digital" role="tabpanel"
					aria-labelledby="digital-tab">
					<c:forEach items="${digiList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
									<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}" />
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
				</div>

				<!-- 가구/인테리어 목록 -->
				<div class="tab-pane fade" id="furniture" role="tabpanel"
					aria-labelledby="furniture-tab">
					<c:forEach items="${funiList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
									<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}" />
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
				</div>

				<!-- 생활/가공식품 목록 -->
				<div class="tab-pane fade" id="food" role="tabpanel"
					aria-labelledby="food-tab">
					<c:forEach items="${foodList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
									<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}" />
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
				</div>

				<!-- 의류 목록 -->
				<div class="tab-pane fade" id="cloth" role="tabpanel"
					aria-labelledby="cloth-tab">
					<c:forEach items="${clothList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
									<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}" />
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
				</div>

				<!-- 게임/취미 목록 -->
				<div class="tab-pane fade" id="game" role="tabpanel"
					aria-labelledby="game-tab">
					<c:forEach items="${gameList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
									<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}" />
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
				</div>

				<!-- 도서 목록 -->
				<div class="tab-pane fade" id="book" role="tabpanel"
					aria-labelledby="book-tab">
					<c:forEach items="${bookList}" var="list">
						<section class="cards-wrap">
							<article class="card-top">
								<a class="card-link" data-event-label=""
									href="auction/auctionDetail?prodNum=${list.prodNum}">
									<div class="card-photo">
									<fmt:formatDate value="${list.getPIndate()}" pattern="MM-dd" var="dbDate"/>
										<c:set var="aucTime" value="${list.auctionTime}"/>
										<%int aucTime=(int)pageContext.getAttribute("aucTime"); %>
										<c:set var="now" value="<%=new java.util.Date(new java.util.Date().getTime()-60*60*24*1000*aucTime)%>" />
										<fmt:formatDate value="${now}" pattern="MM-dd" var="today"/>
										<c:if test="${list.prodImage1 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage1}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 ne null}">
											<img
												src="${pageContext.request.contextPath}/resources/Product_Image/${list.prodImage2}">
										</c:if>
										<c:if
											test="${list.prodImage1 eq null and list.prodImage2 eq null}">
											<img src="resources/assets/img/noImage.jpg">
										</c:if>
									</div>
									<div class="card-desc">
										<h2 class="card-title">
											<c:out value="${list.prodName}" />
										</h2>
										<div class="card-price" style="font-weight:bold">
											<c:if test="${dbDate eq today}">
												<div class="badge bg-danger">마감임박</div>
											</c:if>
											<br>
											경매 시작가 :
											<c:out value="${list.aucStartPrice}" />
											원
										</div>
										<div class="card-region-name">
											<c:out value="${list.sellerAddr2}" /><br>
											<c:if test="${list.avgPoint ge 4.0}">
												<div class="badge bg-success">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 4.0 and list.avgPoint ge 2.5}">
												<div class="badge bg-warning text-dark">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
											<c:if test="${list.avgPoint lt 2.5}">
												<div class="badge bg-danger">
													평점 : <c:out value="${list.avgPoint}"/>
												</div>
											</c:if>
										</div>
									</div>
								</a>
							</article>
						</section>
					</c:forEach>
				</div>


			</div>
			<!-- End Default Tabs -->
		</div>
	</div>

	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.5666805, 126.9784147),
			level : 8
		};

		var map = new kakao.maps.Map(container, options);
		
		if(${user eq null} || ${user.userAddr2 eq null}){
			// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
			if (navigator.geolocation) {
			    
			    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			    navigator.geolocation.getCurrentPosition(function(position) {
			        
			        var lat = position.coords.latitude, // 위도
			            lon = position.coords.longitude; // 경도
			        
			        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			        
			     // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);
			            
			      });
			    
			} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			    
			    var locPosition = new kakao.maps.LatLng(37.5666805, 126.9784147);   
			        
			       // 지도 중심좌표를 접속위치로 변경합니다
					map.setCenter(locPosition);
			}
		}

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		//회원정보중 주소가 있다면
		if(${user ne null} && ${user.userAddr2 ne null}){
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${user.getUserAddr2()}', function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {
					
					var imageSrc = 'resources/assets/img/myLoc.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(20,40)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
				    
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					
					
					
					// 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords,
			            image:markerImage
			        });
			        
			        //지도 중심 이동
					map.setCenter(coords);
				}
			});		
		}
		
		$(function(){
			$.ajax({
				url:'allProduct',
				type:'get',
				dataType:'json',
				async:false,
				cache:false,
				success:function(res){
					$.each(res,function(i,data){
						//주소 -> 좌표 변환
						geocoder.addressSearch(data.sellerAddr2, function(result, status) {
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								// 마커 이미지의 이미지 주소입니다
								var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
									    
								// 마커 이미지의 이미지 크기 입니다
								var imageSize = new kakao.maps.Size(24, 35); 
									    
								// 마커 이미지를 생성합니다    
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									    
								// 마커를 생성합니다
								var marker = new kakao.maps.Marker({
								        map: map, // 마커를 표시할 지도
								        position:new kakao.maps.LatLng(result[0].y, result[0].x),// 마커를 표시할 위치
								        title : data.prodName, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								        image : markerImage // 마커 이미지 
								});
								
								// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
								var iwContent = '<div style="width:150px;padding:5px; height:200px; text-align:center; font-size:0.5em; overflow: scroll;">';
									if(data.prodImage1==null && data.prodImage2==null){
										iwContent += '<img width="80" height="80" src="resources/assets/img/noImage.jpg">';
									}else if(data.prodImage1 != null){
										iwContent += '<img width="80" height="80" src="${pageContext.request.contextPath}/resources/Product_Image/'+data.prodImage1+'">';
									}else if(data.prodImage1==null && data.prodImage2 !=null ){
										iwContent += '<img width="80" height="80" src="${pageContext.request.contextPath}/resources/Product_Image/'+data.prodImage2+'">';
									}
									iwContent += '<br>'+data.prodName+'<br>';
									iwContent += "<div class='";
									if(data.avgPoint >=4.0){
										iwContent+="badge bg-success";
									}else if(data.avgPoint <4.0 && data.avgPoint >=2.5){
										iwContent+="badge bg-warning text-black";
									}else if(data.avgPoing<2.5){
										iwContent+="badge bg-danger";
									}
									iwContent += "'>평점 : "+data.avgPoint+"</div><br>";
									iwContent += "경매 시작가 : "+data.aucStartPrice+"<br> 상품 설명 : "+data.prodSpec+"<br>";
									if(${user ne null}){
										iwContent += "<a href='auction/auctionDetail?prodNum="+data.prodNum+"'>상세페이지</a>";
									}
									iwContent += "</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

								// 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});

								// 마커에 클릭이벤트를 등록합니다
								kakao.maps.event.addListener(marker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다
								      infowindow.open(map, marker);  
								});

							}

						});			
					});
					
					
				
				},
				error:function(err){
					alert('error : '+err.status);
				}
			})
		})
		
		
		
		
	</script>

</main>


<c:import url="/foot" />