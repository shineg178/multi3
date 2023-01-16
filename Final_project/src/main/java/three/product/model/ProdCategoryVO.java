package three.product.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProdCategoryVO {
	private int categoryNum;
	
	private String categoryName;
	
	private int count;
}
