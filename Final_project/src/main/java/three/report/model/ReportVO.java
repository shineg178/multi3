package three.report.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportVO {
	
	private int reportNum;
	
	private int aucEndNum;
	
	private String userId;
	
	private String reportedUserId;
	
	private String reportContent;
	
	private int reportStatus;
	
}
