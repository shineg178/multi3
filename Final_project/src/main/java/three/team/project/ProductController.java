package three.team.project;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import three.auction.model.AuctionVO;
import three.auction.service.AuctionService;
import three.product.model.ProductVO;
import three.product.service.ProductService;
import three.user.model.UserVO;

@Controller
@Log4j
public class ProductController {
	
	@Inject
	private ProductService productServiceImpl;
	
	@Inject
	private AuctionService auctionServiceImpl;
	
	//물품 목록 페이지 이동 
	@GetMapping("/productList")
	public String prodList(Model m,@RequestParam(required=false) String searchName) {
		
		//검색어가 있을경우 검색 물품 리스트
		if(searchName !=null) {
			List<ProductVO> pList=productServiceImpl.prodSearch(searchName);
			m.addAttribute("pList",pList);
		}
		//전체 목록 리스트
		List<ProductVO> allList=productServiceImpl.allProduct();
		//디지털/가전 제품 목록 리스트
		List<ProductVO> digiList=productServiceImpl.cateProduct(10);
		//가구인테리어 목록 리스트
		List<ProductVO> funiList=productServiceImpl.cateProduct(20);
		//생활/가공식품 제품 목록 리스트
		List<ProductVO> foodList=productServiceImpl.cateProduct(30);
		//의류 제품 목록 리스트
		List<ProductVO> clothList=productServiceImpl.cateProduct(40);
		//게임/취미 제품 목록 리스트
		List<ProductVO> gameList=productServiceImpl.cateProduct(50);
		//도서 제품 목록 리스트
		List<ProductVO> bookList=productServiceImpl.cateProduct(60);
			
		m.addAttribute("allList",allList);
		m.addAttribute("digiList",digiList);
		m.addAttribute("funiList",funiList);
		m.addAttribute("bookList",bookList);
		m.addAttribute("foodList",foodList);
		m.addAttribute("gameList",gameList);
		m.addAttribute("clothList",clothList);
		
		return "product/productList";
	}
	
	//물품 등록 페이지 이동
	@GetMapping("/addProductForm")
	public String addProdForm() {
		return "product/addProduct";
	}
	
	//물품 등록
	@PostMapping("/addProd")
	public String addProd(@ModelAttribute ProductVO vo,HttpSession ses,
			@RequestParam(value="image1",required=false) MultipartFile image1,
			@RequestParam(value="image2",required=false) MultipartFile image2) {
		
		UserVO uvo=(UserVO) ses.getAttribute("user");
		String userId=uvo.getUserId();
		
		vo.setUserId(userId);
		//이미지 파일 저장 경로 설정
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/Product_Image");
		
		//파일 경로가 존재하지 않을 경우 만듦
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
	
		//image1가 첨부 되었을 경우
		if(!image1.isEmpty()) {
			String originFname=image1.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			String filename=uuid.toString()+"_"+originFname;
			
			//vo 객체에 파일 이름 넣기
			vo.setProdImage1(filename);
			
			//파일 업로드
			try {
				image1.transferTo(new File(upDir,filename));
			}catch(Exception e) {
				log.error(e);
			}
		}
		
		//image2가 첨부 되었을 경우
		if(!image2.isEmpty()) {
			String originFname=image2.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			String filename=uuid.toString()+"_"+originFname;
			
			//vo 객체에 파일 이름 넣기
			vo.setProdImage2(filename);
			
			//파일 업로드
			try {
				image2.transferTo(new File(upDir,filename));
			}catch(Exception e) {
				log.error(e);
			}
		}
		
		//DB에 물품 정보 저장
		productServiceImpl.addProduct(vo);
		
		//DB에 옥션 정보 저장
		AuctionVO avo=new AuctionVO(0,vo.getProdNum(),vo.getUserId(),vo.getAucStartPrice(),null);
		this.auctionServiceImpl.insertAuction(avo);
		
		return "redirect:productList";
	}
	
	//모든 물품 정보 가져오기
	@GetMapping("/allProduct")
	@ResponseBody
	public List<ProductVO> allProduct(){
		
		return productServiceImpl.allProduct();
	}
	

	
	

}
