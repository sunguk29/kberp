package com.gdj43.kberp.web.sales.dao;

import java.util.HashMap;
import java.util.List;

public interface ISchdlDao {

	public List<HashMap<String, Object>> getDataList(String sql) throws Throwable;

}
