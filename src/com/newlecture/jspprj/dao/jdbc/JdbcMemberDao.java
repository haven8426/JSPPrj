package com.newlecture.jspprj.dao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.newlecture.jspprj.dao.MemberDao;
import com.newlecture.jspprj.model.Member;
import com.newlecture.jspprj.model.Notice;

public class JdbcMemberDao implements MemberDao {

	@Override
	public Member getMember(String uid) {

		String url = "jdbc:sqlserver://win.newlecture.com:1433;databaseName=newlecdb";
		String sql = "SELECT * FROM MEMBERS WHERE Mid = '" + uid + "' ";

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection con = DriverManager.getConnection(url, "sist", "newlec");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			// st.setString(1, uid);

			rs.next();

			Member member = new Member();

			member.setUid(rs.getString("Mid"));
			member.setName(rs.getString("name"));
			member.setPwd(rs.getString("Pwd"));

			rs.close();
			st.close();
			con.close();

			return member;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
