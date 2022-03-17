package com.gdj43.kberp.web.CS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj43.kberp.web.CS.dao.IEventDao;

@Service
public class EventService implements IEventService {
	@Autowired
	public IEventDao iEventDao;
}
