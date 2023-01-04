package three.notice.mapper;

import java.util.List;
import java.util.Map;

import three.notice.model.NoticeVO;

public interface NoticeMapper {
		
	//공지사항 추가 메서드
	int insertNotice(NoticeVO vo);
	
	//공지사항 목록 가져오기
	List<NoticeVO> listNotice(Map<String,Integer> map);
	
	//총 공지사항 수 가져오기
	int totalCountNotice();
	
	//공지사항 번호로 삭제하기
	int deleteNotice(int nidx);
	
	//공지사항 번호로 정보 가져오기
	NoticeVO findNotice(int nidx);
	
	//공지사항 업데이트
	int updateNotice(NoticeVO vo);
}
