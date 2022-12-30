package three.notice.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import three.notice.mapper.NoticeMapper;
import three.notice.model.NoticeVO;

@Service("NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeMapper noticeMapper;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		return noticeMapper.insertNotice(vo);
	}

	@Override
	public List<NoticeVO> listNotice(Map<String,Integer> map) {
		return noticeMapper.listNotice(map);
	}

	@Override
	public int totalCountNotice() {
		return noticeMapper.totalCountNotice();
	}

	@Override
	public int deleteNotice(int nidx) {
		return noticeMapper.deleteNotice(nidx);
	}

	@Override
	public NoticeVO findNotice(int nidx) {
		return noticeMapper.findNotice(nidx);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return noticeMapper.updateNotice(vo);
	}

}
