package com.gdj43.kberp.common;

public class CommonProperties {
	/**
	 * 기본 셋
	 */
	//기본 리스트 사이즈
	public static final int VIEWCOUNT = 10;
	//기본 페이지 사이즈
	public static final int PAGECOUNT = 10;
	
	/**
	 * Ajax Result
	 */
	public static final String RESULT_SUCCESS = "SUCCESS";
	
	public static final String RESULT_FAILED = "FAILED";
	
	public static final String RESULT_ERROR = "ERROR";
	
	/**
	 * 파일 업로드
	 */
	//파일 업로드 경로
<<<<<<< HEAD
	public static final String FILE_UPLOAD_PATH = "F:\\MyWork\\workspace\\.metadata\\.plugins"
=======
	public static final String FILE_UPLOAD_PATH = "C:\\MyWork\\workspace\\.metadata\\.plugins"
>>>>>>> branch 'main' of https://github.com/axia911/gdj43.git
												+ "\\org.eclipse.wst.server.core\\tmp0"
												+ "\\wtpwebapps\\KBERP\\resources";
	
	//허용파일 확장자
	public static final String FILE_EXT = "xls|ppt|doc|xlsx|pptx|docx|hwp|csv|jpg|jpeg|png|gif|bmp|tld|txt|pdf|zip|alz|7z";
	public static final String IMG_EXT = "jpg|jpeg|png|gif|bmp";
	
	/**
	 * 암호화키(AES기반 16글자)
	 */
	public static final String SECURE_KEY = "gdj43kakaobank43";
}
