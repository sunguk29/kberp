package com.gdj43.kberp.web.sales.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClntMngDao implements IClntMngDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void insertClntMng(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("clntCmpnyMng.getClntCmpnyAdd", params);
	}
	
	
	

}
