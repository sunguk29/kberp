package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CallCntrDao implements ICallCntrDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void clntSave(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("CC.clntSave", params);
	}

	@Override
	public void noteSave(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("CC.noteSave", params);
	}
}
