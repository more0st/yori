package com.sp.yogi.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	// 이벤트 등록 / 수정 / 삭제
	public void insertEvent(Event dto) throws Exception;
	public void updateEvent(Event dto) throws Exception;
	public void deleteEvent(long num) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public Event readEvent(long num);
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	
	// 이벤트 응모자 등록 / 리스트 / 이벤트 참여 여부
	public void insertEventTakers(Event dto) throws Exception;
	public List<Event> listEventTakers(long num);
	public boolean userEventTakers(Map<String, Object> map);	
	
	
	// 모두가 당첨이므로 사용하지 않음
	// 이벤트 당첨자 등록 / 리스트
	public void insertEventWinner(Event dto) throws Exception;
	public List<Event> listEventWinner(long num);
	public Event readEventWinner(Map<String, Object> map);
}
