	// FORM LOGIN
	//Kiểm tra tất cả các thẻ đã được load
	$(document).ready(function(){
		//nút search trang chủ
		$("#btnsearch").click(function(){
			window.open('https://www.google.com/search?sitesearch=www.hcmute.edu.vn&q='+ $("#search").val());
		});
		//thông báo khi đăng ký khóa học
		$('#muakhoahoc').click(function(event) {
	        event.preventDefault();
	        var currentForm = $(this).closest('form');
	        
	        /** Create div element for delete confirmation dialog */
	        var dynamicDialog = $('<div id="conformBox">Are you sure to enroll this course?</div>');
	        
	        dynamicDialog.dialog({
	                title : "Enroll",
	                closeOnEscape: true,
	                modal : true,
	        
	               buttons : 
	                        [{
	                                text : "Yes",
	                                click : function() {
	                                	$(this).dialog("close");
	                                    currentForm.submit();
	                                }
	                        },
	                        {
	                                text : "No",
	                                click : function() {
	                                        $(this).dialog("close");
	                                }
	                        }]
	        });
	        return false;
	    });
		//thông báo xóa bình luận
		$('[id="deletecomment"]').click(function(event) {
	        event.preventDefault();
	        var currentComment = $(this);
	        
	        /** Create div element for delete confirmation dialog */
	        var dynamicDialog = $('<div id="conformBox">Are you sure to delete this comment?</div>');
	        
	        dynamicDialog.dialog({
	                title : "Delete Comment",
	                closeOnEscape: true,
	                modal : true,
	        
	               buttons : 
	                        [{
	                                text : "Yes",
	                                click : function() {
	                                	$(this).dialog("close");
	                                	window.location.href = currentComment.attr('href');
	                                }
	                        },
	                        {
	                                text : "No",
	                                click : function() {
	                                        $(this).dialog("close");
	                                }
	                        }]
	        });
	        return false;
	    });
		//thông báo xóa item
		$('[id="delete"]').click(function(event) {
	        event.preventDefault();
	        var currentForm = $(this).parent().parent().children('form');
	        
	        /** Create div element for delete confirmation dialog */
	        var dynamicDialog = $('<div id="conformBox">'+
	        '<span class="ui-icon ui-icon-trash" style="float:left; margin:0 7px 20px 0;">'+
	        '</span>Are you sure to delete this item?</div>');
	        
	        dynamicDialog.dialog({
	                title : "Delete",
	                closeOnEscape: true,
	                modal : true,
	        
	               buttons : 
	                        [{
	                                text : "Yes",
	                                click : function() {
	                                	$(this).dialog("close");
	                                    currentForm.submit();
	                                }
	                        },
	                        {
	                                text : "No",
	                                click : function() {
	                                        $(this).dialog("close");
	                                }
	                        }]
	        });
	        return false;
	    });
		// Bắt lỗi không nhập hoặc nhập sai điều kiện cho phép
		// Bắt lỗi cho textbox username(tên đăng nhập)
            $("#username_login").focusout(function(){
            	var username_length= $("#username_login").val().length;
            	if(username_length==0)
            	{
            		$("#announce").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce").html("Tên đăng nhập bị trống, mời nhập lại!");
            		$("#username_login").css("border","solid 1px red");
            	} 
            	else
            	if(username_length <5 || username_length >30) {
            	 	$("#announce").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce").html("Hãy nhập tên đăng nhập từ 5 đến 30 kí tự!");
            		$("#username_login").css("border","solid 1px red");
                }
                else {
            	 	$("#announce").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#username_login").css("border","solid 1px #ccc");
            	}
            });
         // Bắt lỗi cho textbox password(mật khẩu)   	
            $("#password_login").focusout(function(){
            	var password_length= $("#password_login").val().length;
            	if(password_length==0)
            	{
            		$("#announce").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce").html("Hãy nhập mật khẩu!");
            		$("#password_login").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$("#password_login").css("border","solid 1px red");
                }
                else {
            	 	$("#announce").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#password_login").css("border","solid 1px #ccc");
            	}
            });

    });
   //FORM REGISTER
  	$(document).ready(function(){
  		// Bắt lỗi cho textbox username(tên đăng nhập)
            $("#username_reg").focusout(function(){
            	var username_length= $("#username_reg").val().length;
            	if(username_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Tên đăng nhập bị trống, mời nhập lại!");
            		$("#username_reg").css("border","solid 1px red");
            	} 
            	else
            	if(username_length <5 || username_length >30) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập tên đăng nhập từ 5 đến 30 kí tự!");
            		$("#username_reg").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#username_reg").css("border","solid 1px #ccc");
            	}
            });
         // Bắt lỗi cho textbox password(mật khẩu)   	
            $("#password_reg").focusout(function(){
            	var password_length= $("#password_reg").val().length;
            	if(password_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập mật khẩu!");
            		$("#password_reg").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$("#password_reg").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#password_reg").css("border","solid 1px #ccc");
            	}
            });
            // Bắt lỗi cho cofirm password(mật khẩu)   	
            $("#password_cofirm").focusout(function(){
            	var password_reg= $("#password_reg").val();
            	var password_cofirm= $("#password_cofirm").val();
            	if(password_reg != password_cofirm)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu không trùng khớp!");
            		$("#password_cofirm").css("border","solid 1px red");
            	}
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$("#password_cofirm").css("border","solid 1px #ccc");
            	}
            });
    });
    //
     //FORM ĐỔI MẬT KHẨU
  	$(document).ready(function(){
         // Bắt lỗi cho textbox password(mật khẩu)   	
            $(".password_old").focusout(function(){
            	var password_length= $(".password_old").val().length;
            	if(password_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập mật khẩu!");
            		$(".password_old").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$(".password_old").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$(".password_old").css("border","solid 1px #ccc");
            	}
            });
            $(".password_new").focusout(function(){
            	var password_length= $(".password_new").val().length;
            	if(password_length==0)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Hãy nhập mật khẩu!");
            		$(".password_new").css("border","solid 1px red");
            	} 
            	else
            	if(password_length <8 || password_length >20) {
            	 	$("#announce1").css("display","block");
            	 	$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu từ 8 đến 20 kí tự!");
            		$(".password_new").css("border","solid 1px red");
                }
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$(".password_new").css("border","solid 1px #ccc");
            	}
            });
            // Bắt lỗi cho cofirm password(mật khẩu)   	
            $(".password_check").focusout(function(){
            	var password_reg= $(".password_new").val();
            	var password_cofirm= $(".password_check").val();
            	if(password_reg != password_cofirm)
            	{
            		$("#announce1").css("display","block");
            		$("#announce2").css("display","none");
            		$("#announce1").html("Mật khẩu không trùng khớp!");
            		$(".password_check").css("border","solid 1px red");
            	}
                else {
            	 	$("#announce1").css("display","none");
            	 	$("#announce2").css("display","none");
            	 	$(".password_check").css("border","solid 1px #ccc");
            	}
            });

    });
   //FORM TRANG CA NHAN
  	$(document).ready(function(){
  		// Bắt email hợp lệ
  		$(".validation_email").focusout(function(){
  			var pattern = new RegExp(/^([\w\.])+@([a-zA-Z0-9\-])+\.([a-zA-Z]{2,4})(\.[a-zA-Z]{2,4})?$/);
  			if(pattern.test($(".validation_email").val()))
  			{
  				$("#announce1").css("display","none");
  				$("#announce2").css("display","none");
            	$(".validation_email").css("border","solid 1px #ccc");
  			}
  		    else
  		    {
            	$("#announce1").css("display","block");
            	$("#announce2").css("display","none");
            	$("#announce1").html("Email chưa hợp lệ!");
            	$(".validation_email").css("border","solid 1px red");
            }
		  });
  		// Bắt tuổi là số
  		$(".validation_age").focusout(function(){
  			var pattern = new RegExp(/^[0-9]+$/);
  			if(pattern.test($(".validation_age").val()))
  			{
  				$("#announce1").css("display","none");
  				$("#announce2").css("display","none");
            	$(".validation_age").css("border","solid 1px #ccc");
  			}
  		    else 
  		    {
            	$("#announce1").css("display","block");
            	$("#announce2").css("display","none");
            	$("#announce1").html("Hãy nhập tuổi là số!");
            	$(".validation_age").css("border","solid 1px red");
            }
		  });
  		// Bắt số điện thoại là số
  		$(".validation_phone").focusout(function(){
  			var pattern = new RegExp(/^[0-9]+$/);
  			if(pattern.test($(".validation_phone").val()))
  			{
  				$("#announce1").css("display","none");
  				$("#announce2").css("display","none");
            	$(".validation_phone").css("border","solid 1px #ccc");
  			}
  		    else 
  		    {
            	$("#announce1").css("display","block");
            	$("#announce2").css("display","none");
            	$("#announce1").html("Hãy nhập số điện thoại là số!");
            	$(".validation_phone").css("border","solid 1px red");
            }
		  });
		 
    });
   //Đặt sự kiện cho các button trong Form LOGIN, LOGOUT
	$(document).ready(function(){
		
			  $(".btn").click(function(){
				  $(".carousel-indicators").css("display","none");
			 });
			  $(".close").click(function(){
				  $("#myModal").css("display","none");
				  $("#id02").css("display","none");
				  $(".carousel-indicators").css("display","block");
			 });
			
			  $(".formreg").click(function(){
				  $("#id02").css("display","block");
				  $("#id01").css("display","none");
			 });
			  $(".formlogin").click(function(){
				   $("#id02").css("display","none");
				   $("#id01").css("display","block");
			 });
		
		var modal = document.getElementById('myModal');
		var modal2 = document.getElementById('id02');
		
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
				$("#announce").css("display","none");
        	 	$("#announce2").css("display","none");
        	 	$("#username_login").css("border","solid 1px #ccc");
        		$("#password_login").css("border","solid 1px #ccc");
			}
			else
				if(event.target == modal2) {
				modal2.style.display = "none";
				$("#announce1").css("display","none");
        	 	$("#announce2").css("display","none");
        	 	$("#username_reg").css("border","solid 1px #ccc");
        	 	$("#password_reg").css("border","solid 1px #ccc");
			}
		}
		//END 
		 
	});

			
	$(document).ready(function(){
				//Jquey hiệu ứng slideanim khi trượt
			$(window).scroll(function(){
				$(".slideanim").each(function(){
					var pos= $(this).offset().top;
					var winTop= $(window).scrollTop();
					if(pos < winTop + 600) {
						$(this).addClass("slide");
					}
				});
			   });		
			// Bắt tiền trong tài khoản là số
	  		$("#validation_money").focusout(function(){
	  			var pattern = new RegExp(/^[0-9]+$/);
	  			if(pattern.test($("#validation_money").val()))
	  			{
	  				$("#announce1").css("display","none");
	  				$("#announce2").css("display","none");
	            	$("#validation_money").css("border","solid 1px #ccc");
	  			}
	  		    else 
	  		    {
	            	$("#announce1").css("display","block");
	            	$("#announce2").css("display","none");
	            	$("#announce1").html("Hãy nhập tiền trong tài khoản là số!");
	            	$("#validation_money").css("border","solid 1px red");
	            }
			  });
	  	// Bắt học phí trong khóa học là số
	  		$("#validation_fee").focusout(function(){
	  			var pattern = new RegExp(/^[0-9]+$/);
	  			if(pattern.test($("#validation_fee").val()))
	  			{
	  				$("#announce").css("display","none");
	  				$("#announce2").css("display","none");
	            	$("#validation_fee").css("border","solid 1px #ccc");
	  			}
	  		    else 
	  		    {
	            	$("#announce").css("display","block");
	            	$("#announce2").css("display","none");
	            	$("#announce").html("Hãy nhập học phí là số");
	            	$("#validation_fee").css("border","solid 1px red");
	            }
			  });
	  	// Bắt số lượng trong lớp học là số
	  		$("#soluong").focusout(function(){
	  			var pattern = new RegExp(/^[0-9]+$/);
	  			if(pattern.test($("#soluong").val()))
	  			{
	  				$("#announce1").css("display","none");
	  				$("#announce2").css("display","none");
	            	$("#soluong").css("border","solid 1px #ccc");
	  			}
	  		    else 
	  		    {
	            	$("#announce1").css("display","block");
	            	$("#announce2").css("display","none");
	            	$("#announce1").html("Hãy nhập số lượng là số");
	            	$("#soluong").css("border","solid 1px red");
	            }
			  });
	});


