package three.team.project;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import three.notice.model.NoticeVO;
import three.notice.service.NoticeService;

//공지사항 컨트롤러
@Controller
@Log4j
public class NoticeController {
	
	@Autowired
	private NoticeService noticeServiceImpl;
	
	//공지사항 리스트 이동 및 페이지별 공지사항 가져오기
	@GetMapping("/noticeList")
	public String noticeList(Model m,@RequestParam(defaultValue="1") int cpage) {
		//현재 페이지가 0보다 작거나 같을 경우 1로 지정
		if(cpage<=0) {
			cpage=1;
		}
		
		int totalNotice=noticeServiceImpl.totalCountNotice();//전체 공지사항 수
		int pageSize=10;//한 페이지당 보여줄 공지사항 수
		int pageCount=(totalNotice-1)/pageSize+1;//총 페이지 수
		//현재 페이지가 총 페이지 수 보다 클 경우
		if(cpage>pageCount) {
			cpage=pageCount;
		}
		
		//페이지에 가져올 공지사항 시작,끝
		int end=cpage*pageSize;
		int start=end-(pageSize-1);
		
		//Map에 담아서 전달
		Map<String,Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("end",end);
		
		
		//페이지 당 공지사항 가져와 리스트에 넣기
		List<NoticeVO> list=noticeServiceImpl.listNotice(map);
		
		m.addAttribute("nList",list);
		m.addAttribute("cpage",cpage);
		m.addAttribute("pageCount",pageCount);
		return "notice/noticelist";
	}
	
	//공지사항 글 추가 폼 이동 
	@GetMapping("admin/addNoticeForm")
	public String addNoticeForm() {
		return "notice/noticeForm";
	}
	
	//공지사항 수정 폼 이동
	@GetMapping("admin/editNoticeForm")
	public String editNoticeForm(@RequestParam int nIdx,Model m) {
		
		//공지사항 글번호로 글 내용 불러와 객체에 담기
		NoticeVO vo=noticeServiceImpl.findNotice(nIdx);
		
		m.addAttribute("notice",vo);
		return "notice/noticeEditForm";
	}
	
	//공지사항 글 등록 
	@PostMapping("admin/addNotice")
	public String addNotice(@RequestParam(value="filename",required=false) MultipartFile nImage,
			@ModelAttribute NoticeVO vo,HttpSession ses) {
		
		log.info(nImage);
		//이미지 파일 저장 경로 설정
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/Notice_Image");
		
		//파일 경로가 존재하지 않을 경우 만듦
		File dir=new File(upDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		
		//첨부 파일이 존재하는 경우 UUID 추가하여 이름 지정
		if(!nImage.isEmpty()) {
			String originFname=nImage.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			String filename=uuid.toString()+"_"+originFname;
			
			//vo 객체에 파일 이름 넣기
			vo.setNImage(filename);
			
			//파일 업로드
			try {
				nImage.transferTo(new File(upDir,filename));
			}catch(Exception e) {
				log.error(e);
			}
		}
		
		
		
		//데이터베이스에 데이터 넣기
		int n= noticeServiceImpl.insertNotice(vo);
		
		//작성 실패 시 작성페이지로 이동
		if(n<=0) {
			return "javascript:history.back()";
		}
		//성공시 공지사항 리스트로 이동
		return "redirect:../noticeList";
	}
	
	//공지사항 삭제 
	@PostMapping(value="admin/deleteNotice",produces="application/json")
	@ResponseBody
	public int deleteNotice(@RequestParam("nIdx") int nIdx) {
		
		int rs=noticeServiceImpl.deleteNotice(nIdx);
		
		return rs;
	}
	
	//공지사항 세부 정보 보기
	@GetMapping("noticeInfo")
	public String noticeInfo(@RequestParam int nidx,Model m) {
		
		//글 번호로 글 정보 가져와 객체에 담기
		NoticeVO vo=noticeServiceImpl.findNotice(nidx);
		log.info(vo);
		m.addAttribute("notice",vo);
		return "notice/noticeInfo";
	}
	
	@PostMapping("admin/editNotice")
	public String editNotice(@ModelAttribute NoticeVO newVo,
			@RequestParam(value="filename",required=false) MultipartFile file,
			Model m,HttpSession ses) {
		
		ServletContext app=ses.getServletContext();
		String upDir=app.getRealPath("/resources/Notice_Image");
		
		if(file != null) {
			//기존 공지사항 내용 불러오기
			NoticeVO oldVo=noticeServiceImpl.findNotice(newVo.getNIdx());
			String oldFileName=oldVo.getNImage();//기존 파일이름
			
			//기존 파일이 있을경우 기존 파일 삭제
			if(oldFileName!=null) {
				File delf=new File(upDir,oldFileName);
				if(delf.exists()) {
					delf.delete();
				}
			}
			
			String originFname=file.getOriginalFilename();
			UUID uuid=UUID.randomUUID();
			String newfilename=uuid.toString()+"_"+originFname;
			
			//새로운 vo 객체에 파일 이름 넣기
			newVo.setNImage(newfilename);
			
			//새로운 이미지 업로드
			try {
				file.transferTo(new File(upDir,newfilename));
			}catch(Exception e) {
				log.error(e);
			}
			
			int n=noticeServiceImpl.updateNotice(newVo);
			log.info(n);
			
		}
		return "redirect:../noticeList";
	}
	
}
