<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang=vi>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=uft-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/Trang_chu.css" type="text/css" rel="stylesheet">
    <link href="css/Trang_Admin.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="shortcut icon" href="images/logo.png"/>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/search_table.js"></script>
    <script src="js/disable_text.js"></script>
    <title>Trang quản lý kỳ thi</title>
</head>

<body data-spy="scroll" data-target=".navbar" data-offset="50">
    <header class="header">
        <img src="images/SPKT.jpg" alt="Trường ĐH SPKT">
    </header>

    <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="197">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="trangchu">Trang chủ</a>
            </div>
            <div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                    	<li><a href="quanlykithi">Quản lý kì thi</a></li>
                        <li><a href="thongtincanhan">Trang cá nhân</a></li>
                    </ul>
                    
                    <%@ page import = "java.io.*,java.util.*" %>
                   	<%
                   		String username = (String) session.getAttribute("username");
                   		String role = (String) session.getAttribute("role");
                   		int rl = Integer.parseInt(role);
                   		if(username != null && rl == 3) {
                   		}
                   		else {
                   			request.getRequestDispatcher("/WEB-INF/HomePageAll.jsp").forward(request, response);
                   		}
                   	%>
                    
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="trangquanlydethi"><span class="glyphicon glyphicon-user"></span> EM. ${name}</a></li>
                        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="my-container">
        <div class="menu">
            <table class="table">
                <tbody>
                    <tr>
                        <td>
                            <a class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="background: #c9fafc;">
                                <span class="glyphicon glyphicon-plus-sign"></span> Tạo đề thi
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal2" style="background: #c9fafc;">
                                <span class="glyphicon glyphicon-plus-sign"></span> Thêm khoa thi
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table> 
        </div>
        <div class="list">
            <div class="form-group">
                <label style="color: red;font-weight: bold;"><span class="glyphicon glyphicon-search"></span> Tìm nhanh</label>
                <input type="text" id="searchTable" class="form-control" placeholder="Tìm..." style="width: 95%;height:100% ;background: #fff">
            </div>
            <table class="table" style="width: 100%">
                <thead>
                    <tr>
                        <th>Mã đề thi</th>
                        <th>Tên kỳ thi</th>
                        <th>Môn học</th>
                        <th>Số câu hỏi</th>
                        <th>Ngày thi</th>
                        <th>Thời gian làm</th>
                        <th>Xóa</th>
                        <th>Thêm</th>
                    </tr>
                </thead>
                
                <!-- Thông báo của xóa -->
                <c:if test="${thongbao eq 0}">
                	<script type="text/javascript">
			  			alert("Tạo đề thi thành công!");
					</script>
				</c:if>
				<c:if test="${thongbao eq 1}">
                	<script type="text/javascript">
			  			alert("Tạo đề thi thất bại!");
					</script>
				</c:if>
				<c:if test="${thongbao eq 3}">
                	<script type="text/javascript">
			  			alert("Có lỗi trong hệ thống!");
					</script>
				</c:if>
				
				<!-- Thông báo của cập nhật -->
				<c:if test="${thongbao eq 10}">
                	<script type="text/javascript">
			  			alert("Thêm thành công!");
					</script>
				</c:if>
				<c:if test="${thongbao eq 11}">
                	<script type="text/javascript">
			  			alert("Thêm thất bại!");
					</script>
				</c:if>
				<c:if test="${thongbao eq 12}">
                	<script type="text/javascript">
			  			alert("Lỗi ùi!!!");
					</script>
				</c:if>
				
				
                <!-- connect databse -->
			<sql:setDataSource var="data"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/web-tracnghiem" user = "root"  password = "chuan"/>
			
			<sql:query dataSource="${data}" var="result">
				select * from dethi;
         	</sql:query>
                
                <tbody id="myTable">
                	<c:forEach var="row" items="${result.rows}">
                		<c:if test="${row.MaDeThi !='noname'}">
                			<tr>
                				<td>${row.MaDeThi}</td>
                				<td>${row.TenDeThi}</td>
                				<td>${row.MonHoc}</td>
                				<td>${row.SoCauHoi}</td>
                				<td>${row.NgayThi}</td>
                				<td>${row.ThoiGianLamBai}</td>
                				<td>
                					<form action="xoaExam?MaDeThi=${row.MaDeThi}" id="button" method="post"><button type="submit"><img src="icons/del.png"></button></form>
                				</td>
                				<td><a href="taokythi?MaDeThi=${row.MaDeThi}"><img src="icons/edit.png"></a></td>
                			</tr>
                		</c:if>
                	</c:forEach>
                </tbody>
             </table>
          </div>
      </div>

    <!-- Modal Add Exam-->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">Tạo đề thi</h3>
                </div>
                
                <form role="form" action="taodethi" method="post">
                    <div class="modal-body">
                    
            
                    
                        <div class="form-group">
                            <label for="usrname"><span class="glyphicon glyphicon-user"></span> Mã đề thi</label>
                            <input type="text" name = "c_exId" class="form-control" id="usrname" placeholder="Nhập mã đề" required>
                        </div>
                        <div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-close"></span> Tên kỳ thi</label>
                            <input type="text" name="c_exName" class="form-control" id="psw" placeholder="Nhập tên kỳ thi" required maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-close"></span> Môn học</label>
                            <input type="text" name="c_sub" class="form-control" id="psw" placeholder="Nhập tên môn thi" required maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-close"></span> Số câu hỏi</label>
                            <input type="text" name="c_num" class="form-control" id="psw" required maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-close"></span> Ngày Thi</label>
                            <input type="text" name="c_testDay" class="form-control" id="psw" placeholder="vd: 2-2-2018" required maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="psw"><span class="glyphicon glyphicon-eye-close"></span> Thời gian làm bài (số phút)</label>
                            <input type="text" name="c_exTime" class="form-control" id="psw" placeholder="vd: 30" required maxlength="20">
                        </div>
                     
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info btn-default pull-left">
                            <span class="glyphicon glyphicon-plus-sign"></span> Thêm mới
                        </button>
                        <button type="submit" class="btn btn-warning btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Thoát</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    
    <!-- Modal Add Exam For Department-->
    <div class="modal fade" id="myModal2" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">Thêm khoa thi</h3>
                </div>
                
                <form role="form" action="themkhoathi" method="post">
                    <div class="modal-body">
                    
                    <sql:setDataSource var="data"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/web-tracnghiem" user = "root"  password = "chuan"/>
				
					<sql:query dataSource="${data}" var="result">
						select * from dethi;
         			</sql:query>
                    
                        <div class="form-group">
                            <label for="usrname"><span class="glyphicon glyphicon-user"></span> Mã đề thi: </label>
                            <select name="exId">
                            	<c:forEach var="row" items="${result.rows}">
                				<c:if test="${row.MaDeThi !='noname'}">
                            		<option>${row.MaDeThi}</option>
                            	</c:if>
                            	</c:forEach>
                            </select>
                        </div>
                        
                        
                        <sql:setDataSource var="data1"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/web-tracnghiem" user = "root"  password = "chuan"/>
                        
                        <sql:query dataSource="${data1}" var="result1">
							select * from khoa;
         				</sql:query>
                        
                        <div class="form-group">
                            <label for="psw">Mã khoa thi</label>
                            <select name="deId">
	                            <c:forEach var="row" items="${result1.rows}">
	                				<c:if test="${row.MaKhoa !='noname'}">
	                					<option>${row.MaKhoa}</option>
	                            	</c:if>
	                            </c:forEach>
                            </select>
                        </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info btn-default pull-left">
                            <span class="glyphicon glyphicon-plus-sign"></span> Thêm mới
                        </button>
                        <button type="submit" class="btn btn-warning btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Thoát</button>
                    </div>
                </form>
            </div>
        </div>
        </div>
    </div>
    

    <footer>
        <div class="copyright">© Copyright 2017 by
            <a href="#">Example</a>. Chiến-Kha-Chuấn
            <div class="icon">
                <img src="icons/icon6.png" alt="Some alt text" width="25">
                <img src="icons/icon7.png" alt="Some alt text" width="25">
                <img src="icons/icon8.png" alt="Some alt text" width="25">
                <img src="icons/icon9.png" alt="Some alt text" width="25">
                <img src="icons/icon10.png" alt="Some alt text" width="25">
            </div>
        </div>
    </footer>




</body>
</html>