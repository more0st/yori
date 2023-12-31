package com.sp.yogi.admin.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.yogi.admin.domain.Notice;
import com.sp.yogi.admin.service.NoticeService;
import com.sp.yogi.common.FileManager;
import com.sp.yogi.common.dao.CommonDAO;

@Service("admin.noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertNotice(Notice dto, String pathname) throws Exception {
		try {
			long seq = dao.selectOne("noticeManage.seq");
			dto.setNoticeNum(seq);
			System.out.println("service");
			dao.insertData("noticeManage.insertNotice", dto);

			// 파일 업로드
			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) {
						continue;
					}
	
					dto.setImgFileName(saveFilename);
					
					insertFile(dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertFile(Notice dto) throws Exception {
		try {
			dao.insertData("noticeManage.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		
		try {
			list = dao.selectList("noticeManage.listNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	@Override
	public List<Notice> listFile(long num) {
		List<Notice> listFile = null;
		
		try {
			listFile = dao.selectList("noticeManage.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return listFile;
	}

	@Override
	public Notice readNotice(long num) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("noticeManage.readNotice", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Notice readFile(long imgNum) {
		Notice dto = null;
		
		try {
			dto = dao.selectOne("noticeManage.readFile", imgNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("noticeManage.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateNotice(Notice dto, String pathname) throws Exception {
		try {
			dao.updateData("noticeManage.updateNotice", dto);

			if (! dto.getSelectFile().isEmpty()) {
				for (MultipartFile mf : dto.getSelectFile()) {
					String imgFileName = fileManager.doFileUpload(mf, pathname);
					if (imgFileName == null) {
						continue;
					}

//					long fileSize = mf.getSize();

					dto.setImgFileName(imgFileName);
//					dto.setFileSize(fileSize);

					// insertFile(dto);
					dao.insertData("noticeManage.insertFile", dto);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteNotice(long noticeNum, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<Notice> listFile = listFile(noticeNum);
			if (listFile != null) {
				for (Notice dto : listFile) {
					fileManager.doFileDelete(dto.getImgFileName(), pathname);
				}
			}

			dao.deleteData("noticeManage.deleteNotice", noticeNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("noticeManage.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	

}
