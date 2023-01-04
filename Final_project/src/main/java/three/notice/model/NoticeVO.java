package three.notice.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeVO {
	private int nIdx;
	private int nUserNum_fk;
	private String nTitle;
	private String nMessage;
	private Date nDate;
	private String nImage;
}
