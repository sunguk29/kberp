package com.gdj43.kberp.web.CS.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmbnDao implements ICmbnDao{
	@Autowired 
	public SqlSession sqlsession;

	@Override
	public List<HashMap<String, String>> getGuide(HashMap<String, String> params) throws Throwable {
		
		return sqlsession.selectList("cm.getGuide",params);
	}
}
