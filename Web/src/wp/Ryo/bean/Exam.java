package wp.Ryo.bean;

import java.math.BigInteger;

public class Exam {
	String examId;
	String examName;
	String subject;
	int num;
	String testDay;
	int examTime;
	
	public Exam(){
		
	}

	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTestDay() {
		return testDay;
	}

	public void setTestDay(String testDay) {
		this.testDay = testDay;
	}

	public int getExamTime() {
		return examTime;
	}

	public void setExamTime(int examTime) {
		this.examTime = examTime;
	}
	
	
}
