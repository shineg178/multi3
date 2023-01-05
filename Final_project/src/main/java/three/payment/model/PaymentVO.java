package three.payment.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentVO {
	private String merchant_uid;
	private String imp_uid;
	private String buyer_email;
	private String buyer_id;
	private int paid_amount;
	private Date payTime;
}
