package com.gdj43.kberp.web.CS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class CallCntrDao implements ICallCntrDao {
	@Autowired
	public SqlSession sqlSession;
	

}
