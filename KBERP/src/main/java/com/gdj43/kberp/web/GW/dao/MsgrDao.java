package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MsgrDao implements IMsgrDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void insertCont(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("msgr.insertCont", params);
	}
	
	
}
