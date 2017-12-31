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
    <title>Trang Admin</title>
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
                        <li><a href="thongtincanhan">Trang cá nhân</a></li>
                    </ul>
                    
                    <%@ page import = "java.io.*,java.util.*" %>
                   	<%
                   		String username = (String) session.getAttribute("username");
                   		String role = (String) session.getAttribute("role");
                   		if(username != null) {
                   		}
                   		else {
                   			request.getRequestDispatcher("/WEB-INF/HomePage.jsp").forward(request, response);
                   		}
                   	%>
                    
                    
                    <ul class="nav navbar-nav navbar-right">
                    	<c:if test="${role==1}">
                    		<li><a href="trangAdmin"><span class="glyphicon glyphicon-user"></span> Admin. ${name}</a></li>
                    	</c:if>
                    	<c:if test="${role==2}">
                    		<li><a href="trangquantricauhoi"><span class="glyphicon glyphicon-user"></span> QM. ${name}</a></li>
                    	</c:if>
                    	<c:if test="${role==3}">
                    		<li><a href="trangquanlydethi"><span class="glyphicon glyphicon-user"></span> EM. ${name}</a></li>
                    	</c:if>
                    	<c:if test="${role==4}">
                    		<li><a href="#"><span class="glyphicon glyphicon-user"></span> Student. ${name}</a></li>
                    	</c:if>
                        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
						
						 <!-- Thông báo của update thông tin cá nhân -->
                <c:if test="${thongbao eq 0}">
                	<script type="text/javascript">
			  			alert("Cập nhật thành công! ^^");
					</script>
				</c:if>
				<c:if test="${thongbao eq 1}">
                	<script type="text/javascript">
			  			alert("Lỗi ùi. Cập nhật thất bại!");
					</script>
				</c:if>
							
							
	<sql:setDataSource var="data"
				driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/web-tracnghiem" user = "root"  password = "chuan"/>
	<sql:query dataSource="${data}" var="result">
	         	select * from vinfoperson where MSND =?;
	         	<sql:param value="${username}"/>
	         	</sql:query>						
    
    <c:forEach var="row" items="${result.rows}">
    <div class="my-container" style="margin-top: 7%">
        <div class="info-avatar">
            <h2>Thông tin cá nhân</h2>
            <div class="avatar inline-block" style="float: left">
            	<c:if test="${role==1}">
            		<img src="images/Chuan.jpg" style="width: 100%; height: 100%">
                </c:if>
                <c:if test="${role==2}">
            		<img src="images/meo.jpg" style="width: 100%; height: 100%">
                </c:if>
                <c:if test="${role==3}">
            		<img src="images/aaa.jpg" style="width: 100%; height: 100%">
                </c:if>
                <c:if test="${role==4}">
            		<img src="images/no-image.jpg" style="width: 100%; height: 100%">
                </c:if>
            </div>
            
            <div class="personal-info inline-block">
                <div class="form-group">
                    <label style="color: blue"><span class="glyphicon glyphicon-user"></span> Tên đăng nhập:</label> ${row.MSND}
                </div>
                <div class="form-group">
                    <label style="color: blue"></span> Họ tên:</label> ${row.HoTen}
                </div>
                <div class="form-group">
                    <label style="color: blue"></span> Khoa:</label> ${row.TenKhoa}
                </div>
                <div class="form-group">
                    <label style="color: blue"></span> Ngày sinh:</label> ${row.NgaySinh}
                </div>
                <div class="form-group">
                    <label style="color: blue"></span> Giới tính:</label> ${row.GioiTinh}
                </div>
                <div class="form-group">
                    <label style="color: blue"></span> Quê quán:</label> ${row.QueQuan}
                </div>
                <div class="form-group">
                    <label style="color: blue"></span> Số điện thoại:</label> ${row.Sdt}
                </div>
                <div class="form-group">
                    <label style="color: blue"></span> Email:</label> ${row.Email}
                </div>
            </div>
            
            <div class="form-group" style="margin-left: 45%; margin-top: 3%">
                <button type="button" class="btn btn-success btn-default pull-left" data-toggle="modal" data-target="#myModal" style="margin-right:3%">
                    <span class="glyphicon glyphicon-refresh"></span> Cập nhật
                </button>

            </div>
        </div>  
    </div>
    </c:forEach>

    <!-- Modal Edit Info-->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h3 class="modal-title">Cập nhật thông tin</h3>
                </div>
                <form role="form" action="capnhapthongtincanhan" method="post">
                	<c:forEach var="row" items="${result.rows}">
                    <div class="modal-body">
                     	<div class="form-group">
                            <label for="usrname"> Tên đăng nhập</label>
                            <input type="text" name = "u_username" class="form-control" value="${row.MSND}" readonly required>
                        </div>
                        <div class="form-group">
                            <label for="usrname"> Họ tên</label>
                            <input type="text" name = "u_fullname" class="form-control" id="usrname" value="${row.HoTen}" required>
                        </div>
                        <div class="form-group">
                            <label for="usrname"> Mật khẩu</label>
                            <input type="password" name = "u_pw" class="form-control" id="pw myText" value="${row.MatKhau}" disabled required>
                        </div>
                        <div class="form-group">
                            <label> Ngày sinh</label>
                            <input type="text" name="u_bir" class="form-control" id="psw" value="${row.NgaySinh}" required maxlength="20">
                        </div>
                        <div class="form-group">
                            <label for="psw">Giới tính</label>
                            <input type="text" name="u_sex" class="form-control" id="psw" value="${row.GioiTinh}" required>
                        </div>
                        <div class="form-group">
                            <label for="psw">Quê quán</label>
                            <input type="text" name="u_hometown" class="form-control" id="psw" value="${row.QueQuan}" required>
                        </div>
                        <div class="form-group">
                            <label for="psw">Số điện thoại</label>
                            <input type="text" name="u_phone" class="form-control" id="psw" value="${row.Sdt}" required>
                        </div>
                        <div class="form-group">
                            <label for="psw">Email</label>
                            <input type="text" name="u_email" class="form-control" id="psw" value="${row.Email}" required>
                        </div>
                    </div>
                    </c:forEach>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-info btn-default pull-left">
                            <span class="glyphicon glyphicon-plus-sign"></span> Cập nhật
                        </button>
                         <button type="button" onclick="en_modal_text()" class="btn btn-warning btn-default pull-left" ><span class="glyphicon glyphicon-remove"></span> Đổi mật khẩu</button>
                        <button type="submit" class="btn btn-warning btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Thoát</button>
                    </div>
                </form>
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