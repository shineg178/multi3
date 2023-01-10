
package three.donation.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DonationOrgVO {
	private int donOrgNum;
	private String donName;
	private String donOrgInfo;
	private int donBankAccount;
	private String donBankName;
	private int status;
}

 