package com.ssipdduck.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ssipdduck.DTO.AniCommentDTO;
import com.ssipdduck.DTO.AniRecomDTO;

import db.DBConnection;

public class AnirecomDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	void close(PreparedStatement pstmt, ResultSet rs) {
	      try {
	         if(pstmt != null) {pstmt.close();}
	         if(rs != null) {rs.close();}
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	
	//게시판불러오기
	public List<AniRecomDTO> Anilist(int pageNo) {
		ArrayList<AniRecomDTO> list = new ArrayList<AniRecomDTO>();
		sql = "select * from ani_view limit ?,9 ";
		
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pageNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AniRecomDTO dto = new AniRecomDTO();
				dto.setA_no(rs.getInt("a_no"));
				dto.setA_title(rs.getString("a_title"));
				dto.setA_file(rs.getString("a_file"));
				dto.setA_orifile(rs.getString("a_orifile"));
				dto.setA_date(rs.getString("a_date"));
				dto.setA_rate(rs.getInt("a_rate"));
				dto.setA_count(rs.getInt("a_count"));
				dto.setA_category(rs.getString("a_category"));
				dto.setA_epi(rs.getInt("a_epi"));
				dto.setA_type(rs.getString("a_type"));
				dto.setU_id(rs.getString("u_email"));;
				dto.setCommentcount(rs.getInt("commentcount"));
				dto.setTotalcount(rs.getInt("totalcount"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			close(pstmt, rs);
		}
		return list;
	}


	//애니리뷰 게시판 상세보기 
	public AniRecomDTO detail(int a_no) {
		AniRecomDTO dto = new AniRecomDTO();
		
		sql="select * from ani_view where a_no=?";
		
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setA_utube(rs.getString("a_utube"));
				dto.setA_no(rs.getInt(1));
				dto.setA_title(rs.getString("a_title"));
				dto.setA_content(rs.getString("a_content"));
				dto.setA_file(rs.getString("a_file"));
				dto.setA_orifile(rs.getString("a_orifile"));
				dto.setA_date(rs.getString("a_date"));
				dto.setA_count(rs.getInt("a_count"));
				dto.setA_epi(rs.getInt("a_epi"));
				dto.setA_type(rs.getString("a_type"));
				dto.setA_aired(rs.getString("a_aired"));
				dto.setA_studio(rs.getString("a_studio"));
				dto.setA_like(rs.getInt("a_like"));
				dto.setA_writer(rs.getString("a_writer"));
				dto.setA_rate(rs.getInt("a_rate"));
				dto.setA_category(rs.getString("a_category"));
				dto.setCommentcount(rs.getInt("commentcount"));
			}
		
		}catch(Exception e) {
			
		}
		return dto;
	}

	//조회수 1++
	public void countUp(int a_no) {
		sql="UPDATE ani SET a_count= a_count+1 WHERE a_no=? ";
		 try {
	         conn = DBConnection.dbConn();
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, a_no);
	         
	         pstmt.execute();
	         
	      }catch(Exception e) {
	    	  e.printStackTrace();
	      }
	}

	//댓글불러오기
	public List<AniCommentDTO> commentList(int a_no) {
		List<AniCommentDTO> list = new ArrayList<AniCommentDTO>();
		
		String sql =  "select * from ani_commentview WHERE a_no=? order by ac_date desc";
	
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			
			rs = pstmt.executeQuery();	
			
			while(rs.next()) {
				AniCommentDTO dto = new AniCommentDTO();
				dto.setA_no(rs.getInt("a_no"));
				dto.setAc_comment(rs.getString("ac_comment"));
				dto.setAc_date(rs.getString("ac_date"));
				dto.setAc_like(rs.getInt("ac_like"));
				dto.setAc_no(rs.getInt("ac_no"));
				dto.setU_nickname(rs.getString("u_nickname"));
				dto.setU_id(rs.getString("u_email"));
				list.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	//글쓰기.
	public void aniwrite(AniRecomDTO dto) {
		String sql = "INSERT INTO ani (a_title, a_content, a_file, a_orifile, a_category, a_epi, a_type, a_studio, a_aired,a_utube, a_writer) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?,? ,?,?,?)";
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getA_title());
			pstmt.setString(2, dto.getA_content());
			pstmt.setString(3, dto.getA_file());
			pstmt.setString(4, dto.getA_orifile());
			pstmt.setString(5, dto.getA_category());
			pstmt.setInt(6, dto.getA_epi());
			pstmt.setString(7, dto.getA_type());
			pstmt.setString(8, dto.getA_studio());
			pstmt.setString(9, dto.getA_aired());
			pstmt.setString(10, dto.getA_utube());
			pstmt.setString(11, dto.getA_writer());
			
			pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	//top 5뽑기.
	public List<AniRecomDTO> topList() {
		ArrayList<AniRecomDTO> top = new ArrayList<AniRecomDTO>();
		sql = "select * from ani order by a_like desc limit 5";
		
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AniRecomDTO dto = new AniRecomDTO();
				dto.setA_no(rs.getInt("a_no"));
				dto.setA_title(rs.getString("a_title"));
				dto.setA_file(rs.getString("a_file"));
				dto.setA_orifile(rs.getString("a_orifile"));
				dto.setA_date(rs.getString("a_date"));
				dto.setA_rate(rs.getInt("a_rate"));
				dto.setA_count(rs.getInt("a_count"));
				dto.setA_category(rs.getString("a_category"));
				dto.setA_epi(rs.getInt("a_epi"));
				dto.setA_type(rs.getString("a_type"));
				top.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return top;
	}

	public void anicommentwrite(AniCommentDTO dto) {
		sql = "insert into ani_comment (a_no, ac_comment, u_no) values(?,?,(select u_no from user where u_email = ?))";
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getA_no());
			pstmt.setString(2,dto.getAc_comment());
			pstmt.setString(3, dto.getU_id());
			pstmt.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
			close(pstmt, null);
		}
	}

	//좋아요 체크
	public int likeCheck(AniRecomDTO dto) {
		sql="insert into ani_like values (?,(select u_no from user where u_email = ?))";
		int result = 0;
	
		try {
			conn=DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getA_no());
			pstmt.setString(2,dto.getU_id());
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			result = 0;
			sql= "delete from ani_like where a_no=? and u_no=(select u_no from user where u_email=?)";
			String sql1 = "update ani set a_like = a_like-1 where a_no=?";
			try {
				conn=DBConnection.dbConn();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getA_no());
				pstmt.setString(2,dto.getU_id());
				pstmt.execute();
				
				pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, dto.getA_no());
				pstmt.execute();

			}catch(Exception e1) {
				e1.printStackTrace();
				close(pstmt,null);
			}
			return result;
		}
		return result;
	}
	
	//좋아요 +1
	public int likeUp(int a_no) {
		sql="update ani set a_like = a_like+1 where a_no=?";
		int result = 0;
		
		try {
			conn=DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, a_no);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			close(pstmt, null);
		}
		return result;
	}
	
	//좋아요 ajax 불러오기
	public int likeCheck1(AniRecomDTO dto) {
		sql="select count(*)as c from ani_like where a_no=? and u_no=(select u_no from user where u_email = ?)";
		int result = 0;
	
		try {
			conn=DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getA_no());
			pstmt.setString(2,dto.getU_id());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			close(pstmt,null);
		}
		return result;
	}
	
	//댓글 상세보기
	public AniCommentDTO anicommentDetail(AniCommentDTO dto) {
		sql="select * from ani_commentview where ac_no=?";
		
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAc_no());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setAc_no(rs.getInt("ac_no"));
				dto.setAc_comment(rs.getString("ac_comment"));
				dto.setA_no(rs.getInt("a_no"));
				dto.setU_id(rs.getString("u_email"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			close(pstmt, rs);
		}
		return dto;	
	}

	public void commentUpdate(AniCommentDTO dto) {
		sql = "update ani_comment set ac_comment = ? where ac_no=?";
		
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAc_comment());
			pstmt.setInt(2, dto.getAc_no());
			
			pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
			close(pstmt, null);
		}
		
	}

	public void anicommentdelete(AniCommentDTO dto) {
		sql="update ani_comment set ac_del=1 where ac_no=?";
		
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getAc_no());
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
			close(pstmt, null);
		}
	}
	
	
	//검색결과불러오기
	public List<AniRecomDTO> searchlist(String a_title) {
		ArrayList<AniRecomDTO> list = new ArrayList<AniRecomDTO>();
		sql = "select * from ani_view where a_title LIKE ? ";
		
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  "%"+ a_title +"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AniRecomDTO dto = new AniRecomDTO();
				dto.setA_no(rs.getInt("a_no"));
				dto.setA_title(rs.getString("a_title"));
				dto.setA_file(rs.getString("a_file"));
				dto.setA_orifile(rs.getString("a_orifile"));
				dto.setA_date(rs.getString("a_date"));
				dto.setA_rate(rs.getInt("a_rate"));
				dto.setA_count(rs.getInt("a_count"));
				dto.setA_category(rs.getString("a_category"));
				dto.setA_epi(rs.getInt("a_epi"));
				dto.setA_type(rs.getString("a_type"));
				dto.setU_id(rs.getString("u_email"));;
				dto.setCommentcount(rs.getInt("commentcount"));
				dto.setTotalcount(rs.getInt("totalcount"));
				list.add(dto);
			}
			
		} catch (Exception e) {	
			e.printStackTrace();
			close(pstmt, rs);
		}	
		return list;
	}

	//별점평가
	public AniRecomDTO rate(AniRecomDTO dto) {
		sql = "update ani set a_rate = a_rate + ? where a_no = ?";

		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getA_rate());
			pstmt.setInt(2, dto.getA_no());
			pstmt.execute();
			
		}catch(Exception e) {
			e.printStackTrace();
			close(pstmt, null);
		}
		return dto;
	}
	//별점 가져오기
	public AniRecomDTO rateview(AniRecomDTO dto) {
		sql = "select a_rate from ani where a_no = ?";
		String sql1 = "select count(*) from user";
		try {
			conn = DBConnection.dbConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getA_no());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setA_rate(rs.getInt(1));
			
			}
			
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setU_temp(rs.getInt(1));	
			}
		}catch(Exception e) {
			e.printStackTrace();
			close(pstmt, rs);
		}
			
			
		return dto;
	}

}