package three.product.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	private int prodNum;
	
	private int userNum_fk;
	
	private String prodCategoryNum_fk;
	
	private String prodName;
	
	private String prodSpec;
	
	private Date pIndate;
	
	private String prodImage1;
	
	private String prodImage2;
	
	private int aucStartPrice;
	
	private int donatePercent;
	
	private int auctionTime;
	
	private String sellerAddr1;
	
	private String sellerAddr2;
	
	private String sellerAddr3;
	
	private int status;
	
}
