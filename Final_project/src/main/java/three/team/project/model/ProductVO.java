package three.team.project.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
    private Long prodNum;
    private Long userNum;
    private Long prodCategoryNum;
    private String prodName;
    private String prodSpec;
    private LocalDate pIndate;
    private String pordImage1;
    private String pordImage2;
    private Long aucStartPrice;
    private Long donatePercent;
    private Long auctionTime;

}
