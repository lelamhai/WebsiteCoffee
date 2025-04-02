<%-- 
    Document   : Login
    Created on : Mar 23, 2025, 11:19:07 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/forgot.css"/>
        <title>forgot</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            
        </style>
    </head>
    <body>
        <div class="container py-5 liem-forgot">
            <div class="row justify-content-center align-items-center liem-forgot">
                <div class="col-lg-8 liem-forgot">
                    <div class="mb-4 liem-forgot">
                        <h1 class="fw-bold fs-2 liem-forgot">Quên Tài Khoản/Mật Khẩu?</h1>
                        <p class="text-muted liem-forgot">
                            Vui lòng nhập vào bên dưới để thực hiện khôi phục mật khẩu của bạn
                        </p>
                    </div>

                    <div class="mt-5">
                        <form action="forgot" method="post">
                            <!-- Trường nhập user -->
                            <div class="mb-4">
                                <!--<input type="text" name ="username" class="form-control form-control-lg" placeholder="Tên đăng nhập">-->
                                <input type="text" name="username" class="form-control form-control-lg" id="username"  placeholder="Tên đăng nhập">
                            </div>
                            
                            <!-- Trường nhập email -->
                            <div class="mb-4">
                                <!--input type="text" name ="password" class="form-control form-control-lg" placeholder="Mặt Khẩu"-->
                                <input type="email" name="email" class="form-control form-control-lg" id="email" placeholder="Email đăng ký tài khoản">
                            </div>

                            <button class="btn btn-primary w-100 btn-continue rounded-pill">
                                Tiếp tục
                            </button>
                        </form>
                    </div>
                </div>
                
                <div class="col-lg-1 text-center illustration liem-forgot"></div>
                <div class="col-lg-3 text-center illustration liem-forgot">
                    <img src="imgs/Cover.png" alt="CMS Illustration" class="img-fluid">
                </div>
            </div>
        </div>
        
        <!-- Bootstrap 5 JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
