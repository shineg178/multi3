package three.product.model;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	private int prodNum;
	
	private int userNum_fk;
	
	private int prodCategoryNum_fk;
	
	private String prodName;
	
	private String prodSpec;
	
	private Date pIndate;
	
	private String prodImage1;
	
	private String prodImage2;
	
	private int aucStartPrice;
	
	private int donatePercent;
	
	private int auctionTime;
	
	private Date getCloseTime(Date pIndate, int auctionTime) {
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date closeTime;
		Calendar cal=Calendar.getInstance();
		cal.setTime(pIndate);
		cal.add(Calendar.DATE, auctionTime);
		closeTime=cal.getTime();
		return closeTime;
		
	}
	
}
