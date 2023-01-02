package three.user.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	
	private int userNum;
	private String userId;
	private String userPassword;
	private String userName;
	private String userNick;
	private String userTel;
	private String userEmail;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private int userPoint;
	private String userImage;
	private String userInfo;
	private int userBronzeBadge;
	private int userSilverBadge;
	private int userGoldBadge;
	private String userTwitter;
	private String userFacebook;
	private String userInstagram;
	private String userLinkedin;
	private int userStatus;
	
}
