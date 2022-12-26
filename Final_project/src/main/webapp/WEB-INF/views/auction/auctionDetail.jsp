<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/top"/>
<main id="main" class="main">
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                        <div class="row gx-4 gx-lg-5 align-items-center">
                            <div class="col-md-6">
                              <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                            <img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="..." />
                          </div>
                          <div class="carousel-item">
                            <img src="${path}/resources/assets/img//slides-2.jpg" class="card-img-top mb-5 mb-md-0" alt="...">
                          </div>
                          <div class="carousel-item">
                            <img src="${path}/resources/assets/img//slides-3.jpg" class="card-img-top mb-5 mb-md-0" alt="...">
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

                    </div>
                    <div class="col-md-6">
                        <br><br>
                        <h3 class="fw-bolder">Shop item template</h3>
                        <br>
                        <div class="small mb-1">판매자 닉네임(아이디)</div>
                        <br>
                        <div class="fs-5 mb-5">
                            <table>
                              <tr>
                                <td>시작가</td>
                                <td class="d-flex justify-content-end">XXX,xxx원</td>
                              </tr>
                              <tr>
                                <td >현재 입찰가</td>
                                <td class="d-flex justify-content-end"> XXX,xxx원</td>
                              </tr>
                              <tr>
                                <td >남은 시간</td>
                                <td class="text-decoration-underline d-flex justify-content-end"> XX시XX분XX초</td>
                              </tr>
                              <tr>
                                <td>입찰 참여 인원 현황</td>
                                <td class="d-flex justify-content-end"> XX명</td>
                              </tr>
                            </table>
                            <br>
                            <input class="form-control" id="inputQuantity" type="number" value="" style="max-width: 20rem" />
                            <br>
                            <div class="d-flex">
                            <span class="d-flex justify-content-start">
                              <button class="btn btn-success btn-lg" type="button">
                                입찰하기
                              </button>
                            </span>
                            <span class="d-flex justify-content-end col-3">
                              <button class="btn btn-info" type="button">
                                판매자와 대화
                              </button>
                            </span>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
          <div class="text-center lead"><h2>물품 설명</h2></div>
          <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit.
           Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi 
           alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
        </section>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

  </main><!-- End #main -->
<c:import url="/foot"/>