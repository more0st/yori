package com.sp.yogi.event;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("event.eventController")
@RequestMapping("/event/*")
public class EventController {
	
	@GetMapping("eventList")
	public String eventList() {
		return ".event.eventList";
	}

	@GetMapping("eventDetail")
	public String eventDetail() {
		return ".event.eventDetail";
	}
}
