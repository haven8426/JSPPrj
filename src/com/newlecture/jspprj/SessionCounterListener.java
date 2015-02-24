package com.newlecture.jspprj;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionCounterListener implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent event)
	{
		System.out.println("技记 积己");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event)
	{
		System.out.println("技记 辆丰");
	}
}
