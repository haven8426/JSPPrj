package com.newlecture.jspprj;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class NewlecRequestListener implements ServletRequestListener{
	
	@Override
	public void requestDestroyed(ServletRequestEvent event) {
		System.out.println("요청종료 remote ip="+event.getServletRequest().getRemoteAddr());
	}
	
	@Override
	public void requestInitialized(ServletRequestEvent event) {
		System.out.println("요청 초기화 remote ip="+event.getServletRequest().getRemoteAddr());
		
	}
}
