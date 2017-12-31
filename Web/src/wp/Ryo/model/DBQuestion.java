package wp.Ryo.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import wp.Ryo.model.ConnectDatabase;
import wp.Ryo.bean.Question;
import wp.Ryo.bean.QuestionInfo;
import wp.Ryo.bean.User;
import wp.Ryo.bean.UserInfo;

public class DBQuestion {
	
	public DBQuestion() {
		
	}
	
	// Hàm gọi store procedure để xóa câu hỏi
	public Boolean deleteQuestion(Question qs) throws SQLException {
		Connection conn = ConnectDatabase.getConnection();
		try {
			String call = "{call spDeleteQues(?)}";
			CallableStatement stmt = conn.prepareCall(call);
			stmt.setString(1, qs.getQuestionId());
			return ConnectDatabase.MyExcuteUpdateNonQuery(conn, stmt);
		} catch (Exception e) {
			return false;
		}finally {
			conn.close();
		}
	}
	
	// Hàm gọi store procedure để tạo câu hỏi
		public Boolean createQues(Question qs, QuestionInfo qsinfo) throws SQLException {			
			Connection conn = ConnectDatabase.getConnection();
			try {
				String call = "{call spCreateQues(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
				CallableStatement stmt = conn.prepareCall(call);
				stmt.setString(1,  qs.getQuestionId());
				stmt.setString(2,  qsinfo.getSubject());
				stmt.setString(3,  qsinfo.getTopic());
				stmt.setString(3,  qsinfo.getTopic());
				stmt.setString(4,  qsinfo.getLevel());
				stmt.setString(5,  qsinfo.getContentQ());
				stmt.setString(6,  qsinfo.getAnswerA());
				stmt.setString(7,  qsinfo.getAnswerB());
				stmt.setString(8,  qsinfo.getAnswerC());
				stmt.setString(9,  qsinfo.getAnswerD());
				stmt.setString(10, qsinfo.getValueA());
				stmt.setString(11, qsinfo.getValueB());
				stmt.setString(12, qsinfo.getValueC());
				stmt.setString(13, qsinfo.getValueD());
				
				
				
				return ConnectDatabase.MyExcuteUpdateNonQuery(conn, stmt);
			}
			catch (Exception e) {
				return false;
			}
			finally {
				conn.close();	
			}
					
		}
		
		
		// Hàm gọi store procedure để update câu hỏi
		public Boolean updateQs(Question qs, QuestionInfo qsinfo) throws SQLException {
			Connection conn = ConnectDatabase.getConnection();
			try {
				String call = "{call spUpdateQues(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
				CallableStatement stmt = conn.prepareCall(call);
				stmt.setString(1, qs.getQuestionId());
				stmt.setString(2, qsinfo.getSubject());
				stmt.setString(3, qsinfo.getTopic());
				stmt.setString(4, qsinfo.getLevel());
				stmt.setString(5, qsinfo.getContentQ());
				stmt.setString(6, qsinfo.getAnswerA());
				stmt.setString(7, qsinfo.getAnswerB());
				stmt.setString(8, qsinfo.getAnswerC());
				stmt.setString(9, qsinfo.getAnswerD());
				stmt.setString(10, qsinfo.getValueA());
				stmt.setString(11, qsinfo.getValueB());
				stmt.setString(12, qsinfo.getValueC());
				stmt.setString(13, qsinfo.getValueD());
				
				System.out.println(qs.getQuestionId());
				System.out.println(qsinfo.getSubject());
				System.out.println(qsinfo.getTopic());
				System.out.println(qsinfo.getLevel());
				System.out.println(qsinfo.getContentQ());
				System.out.println(qsinfo.getAnswerA());
				System.out.println(qsinfo.getAnswerB());
				System.out.println(qsinfo.getAnswerC());
				System.out.println(qsinfo.getAnswerD());
				System.out.println(qsinfo.getValueA());
				System.out.println(qsinfo.getValueB());
				System.out.println(qsinfo.getValueC());
				System.out.println(qsinfo.getValueD());
						
				return ConnectDatabase.MyExcuteUpdateNonQuery(conn, stmt);
			} catch (Exception e) {
				return false;
			}finally {
				conn.close();
			}
		}	
	
}
