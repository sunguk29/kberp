package com.gdj43.kberp.web.sales.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class clntRprtDao implements IClntRprtDao {
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public double clntAvgCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("clntRprt.clntAvgCnt", params);
	}

	@Override
	public double ccAvgCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("clntRprt.ccAvgCnt", params);
	}

}
