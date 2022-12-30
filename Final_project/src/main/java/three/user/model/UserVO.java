package three.user.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	
	private int userNum;
	private String userName;
	private String userId;
	private String userNick;
	private String userPassword;
	private String userTel;
	private String userAddr;
	private String userDetailAddr;
	private String userInfo;
	private String userEmail;
	private String userImage;
	private int userPoint;
	private int userGoldBadge;
	private int userSilverBadge;
	private int userBronzeBadge;
	private String userTwitter;
	private String userFacebook;
	private String userInstagram;
	private String userLinkedin;
	private String userStatus;
	
}
