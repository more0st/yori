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
			
			if(dto != null) {
				dao.updateData("owner.updateLastLogin", userId);
			}
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

			// dao.insertData("owner.insertOwner1", dto);
			// dao.insertData("owner.insertOwner2", dto);
			// dao.updateData("owner.insertOwner12", dto); // owner1, owner2 테이블 동시에
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
	public Owner readOwner(long ownerNum) {
		Owner dto = null;

		try {
			dto = dao.selectOne("owner.readOwner2", ownerNum);

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

			dao.updateData("owner.updateOwner1", dto);
			dao.updateData("owner.updateOwner2", dto);
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
			dto = dao.selectOne("owner.readRestaurnat", userId);

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
}
