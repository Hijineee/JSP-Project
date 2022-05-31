package com.ssipdduck.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssipdduck.DTO.NoticeDTO;
import com.ssipdduck.DTO.ShopDTO;

import db.DBConnection;

public class ShopDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	void close(PreparedStatement pstmt, ResultSet rs) {
		try {
			if (pstmt != null) {pstmt.close();}
			if (rs != null) {rs.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<ShopDTO> shopList() {

		List<ShopDTO> list = new ArrayList<ShopDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ani_shop order by an_no desc;";

		try {
			con = DBConnection.dbConn();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ShopDTO dto = new ShopDTO();
				dto.setAs_no(rs.getInt("an_no"));
				dto.setAs_name(rs.getString("as_name"));
				dto.setAs_site(rs.getString("as_site"));
				dto.setAs_map(rs.getString("as_map"));
				dto.setAs_content(rs.getString("as_content"));
				list.add(dto);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return list;
	}
}