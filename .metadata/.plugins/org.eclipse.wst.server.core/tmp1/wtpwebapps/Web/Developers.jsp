<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type"; content="text/html"; charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="CSS/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="CSS/Editer.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="CSS/W3.css">
    
    <link rel="shortcut icon" href="Images/brainstorming.png"/>

    <title>Editer</title>
</head>
<body>
     <!--BEGIN: Logo Trang SPKT-->
    <header>
        <div id="Logo">
          <figure>
              <img src="Images/SPKT.jpg" alt="logo">
          </figure>
        </div>
    </header>
    <!--END: Logo Trang SPKT-->
    <section class="container">
        <h1 class="text">Trắc Nghiệm Online - Editer</h1>
        <div class="menu">
            <a href="TrangChu.html" class="btn">Trang Chủ</a>
            <a href="DangNhap.html" class="btn">Đăng Nhập</a>
            <a href="#" class="btn">Đăng Ký</a>
            <a href="#" class="btn">Hỗ Trợ</a>
        </div>
    </section>
    <section class="sidebar">
        <div class="w3-sidebar w3-bar-block w3-animate-left" style="display:none;z-index:5" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large w3-blue w3-hover-orange" onclick="w3_close()">Đóng &times;</button>
            <a href="#" class="w3-bar-item w3-button w3-text-blue w3-hover-orange">Trang Chủ</a>
            <a href="#" class="w3-bar-item w3-button w3-text-blue w3-hover-orange">Đăng Nhập</a>
            <a href="#" class="w3-bar-item w3-button w3-text-blue w3-hover-orange">Đăng Ký</a>
            <a href="#" class="w3-bar-item w3-button w3-text-blue w3-hover-orange">Hổ Trợ</a>
        </div>
        <div class="w3-overlay w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>
        <div><button class="w3-button w3-xxlarge " onclick="w3_open()">&#9776;</button></div>
        <div class="tieude"><p>Trắc Nghiệm Online</p></div>
        <script>
            function w3_open() {
                document.getElementById("mySidebar").style.display = "block";
                document.getElementById("myOverlay").style.display = "block";
            }
            function w3_close() {
                document.getElementById("mySidebar").style.display = "none";
                document.getElementById("myOverlay").style.display = "none";
            }
        </script>
    </section>
    <section class="gioithieu">
        <!--BEGIN: Tiêu đề editer-->
        <div class="w3-container w3-teal GioiThieu">
            <img src="Images/student.png" alt="editer">
            <p>Huỳnh Minh Chiến</p>
        </div>
        <!--END: Tiêu đề editer-->
        <div class="w3-container w3-center MinhChien">
            <h2 class="profile-text" style="text-align:center">Editer Profile Card</h2>
            <div class="card">
                <img src="Images/Chien.jpg" alt="Chien" style="width:100%">
                <h2 class="pro-ten">Huỳnh Minh Chiến</h2>
                <p class="title">Quản trị viên</p>
                <p>Đại học Sư phạm kỹ thuật TP.Hồ Chí Minh</p>
                <div style="margin: 24px 0;"></div>
                <p><button class="btnCont">Contact</button></p>
            </div>
        </div>
        <div class="w3-container resume chien">
            <p class="profile"><img src="Images/proflie.png" alt="lylich" style="margin-right: 5px;">Giới Thiệu</p>
            <div class="lylich">
                <p><b>Họ và tên:</b> Huỳnh Minh Chiến</p>
                <p><b>Giới tính:</b> Nam</p>
                <p><b>Mã số sinh viên:</b> 15110166</p>
                <p><b>Lớp:</b> 151101A</p>
                <p><b>Khoa:</b> Công Nghệ Thông Tin</p>
                <p><b>Công việc:</b> Quản trị viên</p>
                <p  class="play"><b>Mail sinh viên:</b> 15110166@student.hcmute.edu.vn</p>
                <p  class="play"><b>Số điện thoại:</b> 01692564970</p>
                <p  class="play"><b>Quê quán:</b> Tiền Giang</p>
                <p  class="play"><b>Dân tộc:</b> Kinh</p>
                <p  class="play"><b>Tôn giáo:</b> Không</p>
            </div>
            <marquee onmouseover="this.stop()" onmouseout="this.start()"  id="ten">Phá bỏ mọi giới hạn - Ta bất tử</marquee>
        </div>
    </section>
    <section class="gioithieu Kha">
        <!--BEGIN: Tiêu đề editer-->
        <div class="w3-container w3-teal GioiThieu">
            <img src="Images/student.png" alt="editer">
            <p>Lê Hoàng Kha</p>
        </div>
        <!--END: Tiêu đề editer-->
        <div class="w3-container w3-center MinhChien">
            <h2  class="profile-text" style="text-align:center">Editer Profile Card</h2>
            <div class="card">
                <img src="Images/Kha.jpg" alt="Kha" style="width:100%">
                <h2 class="pro-ten">Lê Hoàng Kha</h2>
                <p class="title">Quản trị viên</p>
                <p>Đại học Sư phạm kỹ thuật TP.Hồ Chí Minh</p>
                <div style="margin: 24px 0;"></div>
                <p><button class="btnCont">Contact</button></p>
            </div>
        </div>
        <div class="w3-container resume chien">
            <p class="profile"><img src="Images/proflie.png" alt="lylich" style="margin-right: 5px;">Giới Thiệu</p>
            <div class="lylich">
                <p><b>Họ và tên:</b> Lê Hoàng Kha</p>
                <p><b>Giới tính:</b> Nam</p>
                <p><b>Mã số sinh viên:</b> 15110227</p>
                <p><b>Lớp:</b> 151101A</p>
                <p><b>Khoa:</b> Công Nghệ Thông Tin</p>
                <p><b>Công việc:</b> Quản trị viên</p>
                <p class="play"><b>Mail sinh viên:</b> 15110227@student.hcmute.edu.vn</p>
                <p class="play"><b>Số điện thoại:</b> 0932687444</p>
                <p class="play"><b>Quê quán:</b> Long An</p>
                <p class="play"><b>Dân tộc:</b> Kinh</p>
                <p class="play"><b>Tôn giáo:</b> Không</p>
            </div>
            <marquee onmouseover="this.stop()" onmouseout="this.start()"  id="ten">Sống đơn giản - Ăn thật nhiều</marquee>
        </div>
    </section>
    <section class="gioithieu Chuan">
        <!--BEGIN: Tiêu đề editer-->
        <div class="w3-container w3-teal GioiThieu">
            <img src="Images/student.png" alt="editer">
            <p class="nameChuan">Nguyễn Tô Doanh Chuẩn</p>
        </div>
        <!--END: Tiêu đề editer-->
        <div class="w3-container w3-center MinhChien">
            <h2  class="profile-text" style="text-align:center">Editer Profile Card</h2>
            <div class="card">
                <img src="Images/Chien.jpg" alt="Chuan" style="width:100%">
                <h3 class="pro-ten">Nguyễn Tô Doanh Chuẩn</h3>
                <p class="title">Quản trị viên</p>
                <p>Đại học Sư phạm kỹ thuật TP.Hồ Chí Minh</p>
                <div style="margin: 24px 0;"></div>
                <p><button class="btnCont">Contact</button></p>
            </div>
        </div>
        <div class="w3-container resume chien">
            <p class="profile"><img src="Images/proflie.png" alt="lylich" style="margin-right: 5px;">Giới Thiệu</p>
            <div class="lylich">
                <p><b>Họ và tên:</b> Nguyễn Tô Doanh Chuẩn</p>
                <p><b>Giới tính:</b> Nam</p>
                <p><b>Mã số sinh viên:</b> 15110168</p>
                <p><b>Lớp:</b> 151101D</p>
                <p><b>Khoa:</b> Công Nghệ Thông Tin</p>
                <p><b>Công việc:</b> Quản trị viên</p>
                <p class="play"><b>Mail sinh viên:</b> 15110168@student.hcmute.edu.vn</p>
                <p class="play"><b>Số điện thoại:</b> 01659409220</p>
                <p class="play"><b>Quê quán:</b> TP.Hồ Chí Minh</p>
                <p class="play"><b>Dân tộc:</b> Kinh</p>
                <p class="play"><b>Tôn giáo:</b> Không</p>
            </div>
            <marquee onmouseover="this.stop()" onmouseout="this.start()"  id="ten"></marquee>
        </div>
    </section>
     <!--BEGIN: Chân trang-->
    <footer class="foot">
        <section id="page_owner_info">
            <div class="wrapper">
                <!-- Begin: Copyright -->
                <div class="copyright">© Copyright 2017 by <a
                    href="#">Example</a>. Chiến-Kha-Chuấn
                </div>
                <!-- End: Copyright -->
                <!-- Begin: Social network items <--></-->
                <div class="social">
                    <a href="javascript:void(0)">
                        <img src="Images/icon6.png" alt="Some alt text" width="25"/>
                    </a>
                    <a href="javascript:void(0)">
                        <img src="Images/icon7.png" alt="Some alt text" width="25"/>
                    </a>
                    <a href="javascript:void(0)">
                        <img src="Images/icon8.png" alt="Some alt text" width="25"/>
                    </a>
                    <a href="javascript:void(0)">
                        <img src="Images/icon9.png" alt="Some alt text" width="25"/>
                    </a>
                    <a href="javascript:void(0)">
                        <img src="Images/icon10.png" alt="Some alt text" width="25"/>
                    </a>
                </div>
                <!-- End: Social network items -->            
            </div>
        </section>
    </footer>
    <!--END: Chân trang-->
</body>
</html>