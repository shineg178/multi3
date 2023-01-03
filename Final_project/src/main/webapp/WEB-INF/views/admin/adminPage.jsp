<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<style>
	#wrap{
		width:100%;
	}
	#mainOrg{
		width:30%;
		text-align:center; 
		margin:auto;
	}
	#donTable tr th,td{
		text-align:center;
		vertical-align:middle; 
	}
	#donTable tr td:nth-child(4n+1){
		width:10%;
		
	}
	#donTable tr td:nth-child(4n+2){
		width:20%;
	}
	#donTable tr td:nth-child(4n+3){
		width:50%;
	}
	#donTable tr td:nth-child(4n+4){
		width:20%;
		text-align:center;
	}
	
	
</style>
<script>
	function dondelete(data){
		$.ajax({
			type:"post",
			url:"dondelete",
			data:"donOrgNum="+data,
			dataType:"json",
			cache:false,
			success:function(res){
				if(res>0){
					location.reload();
				}
			},
			error:function(err){
				alert('error : '+err.status);
			}
		})
	}

</script>
<c:import url="/top" />
<main id="main" class="main">
	<div class="card">
            <div class="card-body">
              <h3 style="margin:15px 0px;">관리자 페이지</h3>

              <!-- Default Tabs -->
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="user home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">회원관리</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="donation profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">기부단체관리</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="auction contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">경매관리</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="myTabContent">
              
              	<!-- 유저관리 -->
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                	<input class="form-control" type="text" placeholder="검색할 아이디를 입력해주세요">
                </div>
                
                <!-- 기부관리 -->
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
					<table id="mainOrg" class="table table-bordered">
						<tr>
							<th>현재 기부단체</th>
						</tr>
						<tr>
							<td><c:out value="${main.donName}"/></td>
						</tr>
					</table>
					<table id="donTable" class="table">
						<tr>
							<th>번호</th>
							<th>단체 이름</th>
							<th>단체 설명</th>
							<th><a class="btn btn-primary" href="addOrgForm">단체 추가하기</a></th>
						</tr>
						<c:forEach items="${Org}" var="don">
						<tr>
							<td><c:out value="${don.donOrgNum}"/></td>
							<td><c:out value="${don.donName}"/></td>
							<td>
								<c:out value="${don.donOrgInfo}"/><br>
								<div class="badge bg-warning text-dark"><c:out value="${don.donBankName}"/> : <c:out value="${don.donBankAccount}"/> </div> 
							</td>
							<td>
								<a class="btn btn-warning" href="changeDon?donOrgNum=${don.donOrgNum}">변경</a> <a class="btn btn-danger" onclick="dondelete(${don.donOrgNum})">삭제</a>
							</td>
						</tr>
						</c:forEach>
					</table>
                </div>
                
                <!-- 경매 관리 -->
                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                	<input class="form-control" type="text" placeholder="검색할 물품 이름을 입력하세요">
                </div>
              </div><!-- End Default Tabs -->

            </div>
          </div>
</main>
<c:import url="/foot" />

