package com.sp.yogi.owner;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;
import com.sp.yogi.mail.Mail;
import com.sp.yogi.mail.MailSender;

@Service("owner.ownerService")
public class OwnerServiceImpl implements OwnerService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private MailSender mailSender;
	
	@Override
	public Owner loginOwner(String userId) {
		Owner dto = null;

		try {
			dto = dao.selectOne("owner.loginOwner", userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void insertOwner(Owner dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			long ownerSeq = dao.selectOne("owner.ownerSeq");
			dto.setRestaurantNum(ownerSeq);

			// 회원정보 저장
			dao.insertData("owner.insertOwner", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Owner readOwner(String userId) {
		Owner dto = null;

		try {
			dto = dao.selectOne("owner.readOwner", userId);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Owner readOwner(long restaurantNum) {
		Owner dto = null;

		try {
			dto = dao.selectOne("owner.readOwner2", restaurantNum);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	@Override
	public Owner readOwnerEmail(String email) {
		Owner dto = null;

		try {
			dto = dao.selectOne("owner.readOwnerEmail", email);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateOwnership(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("owner.updateOwnership", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		try {
			dao.updateData("owner.updateLastLogin", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateOwner(Owner dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			dao.updateData("owner.updateOwner", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteOwner(Map<String, Object> map) throws Exception {
		try {
			map.put("ownership", 0);
			updateOwnership(map);

			dao.deleteData("owner.deleteOwner2", map);
			dao.deleteData("owner.deleteOwner1", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void generatePwd(Owner dto) throws Exception {
		// 10 자리 임시 패스워드 생성
		StringBuilder sb = new StringBuilder();
		Random rd = new Random();
		String s = "!@#$%^&*~-+ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		for (int i = 0; i < 10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n + 1));
		}

		String result;
		result = dto.getUserId() + "님의 새로 발급된 임시 패스워드는 <b>"
				+ sb.toString()
				+ "</b> 입니다.<br>"
				+ "로그인 후 반드시 패스워드를 변경 하시기 바랍니다.";

		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getEmail());

		mail.setSenderEmail("yoriad0514@gmail.com");
		mail.setSenderName("관리자");
		mail.setSubject("임시 패스워드 발급");
		mail.setContent(result);

		boolean b = mailSender.mailSend(mail);

		if (b) {
			dto.setUserPwd(sb.toString());
			updateOwner(dto);
		} else {
			throw new Exception("이메일 전송중 오류가 발생했습니다.");
		}
	}

	@Override
	public Owner readRestaurant(String userId) {
		Owner dto = null;

		try {
			
			dto = dao.selectOne("owner.readRestaurant", userId);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
				
				if (dto.getRestaurantTel() != null) {
					String[] s = dto.getRestaurantTel().split("-");
					dto.setRestaurantTel1(s[0]);
					dto.setRestaurantTel2(s[1]);
					dto.setRestaurantTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
	
	
	
	
	
	@Override
	public void sendIdInfo(Owner dto) throws Exception {

		String result;
		result = dto.getUserName() + "님의 아이디는 <b>"
				+ dto.getUserId()
				+ "</b> 입니다.<br>";

		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getEmail());

		mail.setSenderEmail("yoriad0514@gmail.com");
		mail.setSenderName("관리자");
		mail.setSubject("등록한 아이디 안내");
		mail.setContent(result);

		boolean b = mailSender.mailSend(mail);

		if (b) {
		} else {
			throw new Exception("이메일 전송중 오류가 발생했습니다.");
		}
		
	}

	@Override
	public int readStatus(String userId) {
		
		int status = 0;
		
		try {
			status = dao.selectOne("owner.readStatus", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	@Override
	public int openState(Long restaurantNum) {
		
		int status = 0;
		
		try {
			status = dao.selectOne("owner.openState", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	
	@Override
	public int todayOrderCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = dao.selectOne("owner.todayOrderCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public int todayOrderSum(Map<String, Object> map) {
		int result = 0;

		try {
			if(dao.selectOne("owner.todayOrderSum", map) == null) {
				result = 0;
			} else {
				result = dao.selectOne("owner.todayOrderSum", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public int reviewRating(Long restaurantNum) {
		int result = 0;

		try {
			result = dao.selectOne("owner.reviewRating", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public int reviewRatingCount(Long restaurantNum) {
		int result = 0;

		try {
			result = dao.selectOne("owner.reviewRatingCount", restaurantNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	@Override
	public void openControl(Map<String, Object> map) {

		try {
			dao.updateData("owner.openControl", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void failCount(String userId) throws Exception {
		try {
			dao.updateData("owner.updateFailCount", userId);
			
			int failCount = dao.selectOne("owner.failCount", userId);
			
			if(failCount == 5) {
				dao.updateData("owner.disableMember", userId);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void loginComplete(String userId) throws Exception {
		try {
			dao.updateData("owner.updateLastLogin", userId);
			dao.updateData("owner.resetFail", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
}
