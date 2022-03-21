package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CallCntrDao implements ICallCntrDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getCallCenter(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("CC.getCallCenter", params);
	}

	@Override
	public void callCenter(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("CC.callCenter", params);
	}
}
