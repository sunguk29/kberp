package com.gdj43.kberp.web.CS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDao implements IEventDao {
	@Autowired
	public SqlSession sqlSession;
	
}
