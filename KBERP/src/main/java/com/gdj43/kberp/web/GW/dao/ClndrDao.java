package com.gdj43.kberp.web.GW.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClndrDao implements IClndrDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void clndrAdd(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("clndr.clndrAdd", params);
	}

	@Override
	public void clndrUpdate(HashMap<String, String> params) throws Throwable {
		sqlSession.update("clndr.clndrUpdate", params);
	}

	@Override
	public void clndrDelete(HashMap<String, String> params) throws Throwable {
		sqlSession.update("clndr.clndrDelete", params);
	}

}
