package three.product.model;

import java.sql.Date;

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
	
}
