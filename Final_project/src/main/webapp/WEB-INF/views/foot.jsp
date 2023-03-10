<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">

      &copy;<strong><span>기부앤테이크</span></strong><br>
      <span><strong>대표</strong> 홍길동 | <strong>사업자번호</strong> 123-45-67890 <br></span>
    </div>
    <div class="credits">
      
      <strong>전화</strong> 070-1234-5678 | <strong>고객문의</strong> dt@dtservice.com <br><br>
      <a href="${path}/rules">이용약관</a> | <a href="${path}/rules2">위치기반서비스 이용약관</a> | <strong><a href="${path}/privacy">개인정보처리방침</a></strong> 
    </div>
 
 	<div id="google_translate_element" class="hd_lang" style="float: right;position: relative;top: -4px;margin-left: 10px;">
		<script>
			function googleTranslateElementInit() {
				new google.translate.TranslateElement({
					pageLanguage: 'ko',
					includedLanguages: 'ko,zh-CN,zh-TW,ja,vi,th,tl,km,my,mn,ru,en,fr,ar',
					//layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
					autoDisplay: false
				}, 'google_translate_element');
			}
		</script>
		<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
	</div>
 
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${path}/resources/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${path}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path}/resources/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${path}/resources/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${path}/resources/assets/vendor/quill/quill.min.js"></script>
  <script src="${path}/resources/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${path}/resources/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${path}/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${path}/resources/assets/js/main.js"></script>

</body>

</html>