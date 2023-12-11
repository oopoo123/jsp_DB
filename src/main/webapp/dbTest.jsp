<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
	<%
		// DB접속에 필요한 문자열 변수 4개 선언->드라이버 이름, DB가 설치된 주소, 계정이름, 계정 비밀번호
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/addr_db";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		try {
			Class.forName(driverName); //드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password); // DB와 커넥션 생성
			out.println(conn);
			
		} catch(Exception e) {
			out.println("DB연결실패 에러발행!");
			e.printStackTrace(); // 에러발생시 에러의 내용을 콘솔창에 출력
			
		} finally {//에러의 발생여부와 무조건 실행되는 문장을 삽입
			try {
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
		}
	%>
</body>
</html>