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
        <link rel="stylesheet" href="css/style.css"/>
        <title>Đăng nhập</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            .password-container-liem {
                position: relative;
            }
            .toggle-visibility-liem {
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container py-5">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-1">
                    
                </div>
                <div class="col-lg-6">
                    <div class="mb-4">
                        <h1 class="fw-bold fs-2">👋 Mừng bạn đến với Hệ Thống Quản trị viên!</h1>
                    </div>

                    <div class="mt-5"  style="width: 400px;">
                        <form action="login" method="post">
                            <div class="mb-4">
                                <input type="text" name ="username" class="form-control form-control-lg" placeholder="Tên đăng nhập">
                            </div>

                            <div class="mb-4 password-container-liem">
                                <input type="text" name ="password" class="form-control form-control-lg" id="password" placeholder="Mật Khẩu">
                                <span class="toggle-visibility-liem" onclick="toggleVisibilitylogin('password', this)">🚫</span>
                            </div>

                            <button class="btn btn-primary w-100 btn-continue rounded-pill">
                                Tiếp tục
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-1 text-center illustration">

                </div>
                <div class="col-lg-3 text-center illustration">
                    <img src="imgs/Cover.png" alt="CMS Illustration" class="img-fluid">
                </div>
                <div class="col-lg-1">
                    
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function toggleVisibilitylogin(fieldId, icon) {
                let inputField = document.getElementById(fieldId);
                if (inputField.type === "password") {
                    inputField.type = "text";
                    icon.innerHTML = "👁"; // Đổi sang trạng thái hiển thị
                } else {
                    inputField.type = "password";
                icon.innerHTML = "🚫"; // Đổi sang trạng thái ẩn
                }
            }
        </script>
        
    </body>
</html>
