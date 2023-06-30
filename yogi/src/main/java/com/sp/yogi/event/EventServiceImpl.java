package com.sp.yogi.event;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.yogi.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertEvent(Event dto) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateEvent(Event dto) throws Exception {
		try {
		
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteEvent(long num) throws Exception {
		try {
			dao.deleteData("event.deleteEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("event.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list = null;
		
		try {
			list = dao.selectList("event.listEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			dao.updateData("event.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Event readEvent(long num) {
		Event dto = null;
		
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Event preReadEvent(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("event.preReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = dao.selectOne("event.nextReadEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void insertEventTakers(Event dto) throws Exception {
		try {
			// 이벤트 응모자 등록
			dao.insertData("event.insertEventTakers", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Event> listEventTakers(long num) {
		List<Event> list = null;
		
		try {
			// 이벤트 응모자 목록
			list = dao.selectList("event.listEventTakers", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean userEventTakers(Map<String, Object> map) {
		boolean result = false;
		try {
			// 이벤트 응모 여부
			Event dto = dao.selectOne("event.readEventTakers", map);
			if(dto != null) {
				result = true; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	

	@Override
	public List<Event> listEventWinner(long num) {
		List<Event> list = null;
		
		try {
			// 이벤트 당첨자 리스트
			list = dao.selectList("event.listEventWinner", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Event readEventWinner(Map<String, Object> map) {
		Event dto = null;
		// 이벤트 당첨 여부
		try {
			dto = dao.selectOne("event.readEventWinner", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertEventWinner(Event dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
