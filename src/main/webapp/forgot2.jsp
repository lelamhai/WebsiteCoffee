<%-- 
    Document   : Login
    Created on : Mar 23, 2025, 11:19:07 PM
    Author     : LDL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/forgot2.css"/>
        <title>forgot2</title>
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
        <div class="container py-5 liem-forgot">
            <div class="row justify-content-center align-items-center liem-forgot">
                <div class="col-lg-8 liem-forgot">
                    <div class="mb-4 liem-forgot">
                        <h1 class="fw-bold fs-2">Nhập Mật Khẩu</h1>
                        <p class="text-muted">
                            Vui lòng nhập mã xác thực được gửi qua email cùng với mật khẩu mới của bạn.
                            <!--<a href="#" class="create-new-account">Tạo tài khoản mới</a>-->
                        </p>
                    </div>

                    <div class="mt-5">
                        <form action="login" method="post">
                            <!-- Trường nhập OTP -->
                            <div class="mb-4 password-container-liem">
                                <input type="text" name="otp" class="form-control form-control-lg liem-forgot pe-5" id="otp" placeholder="Nhập mã OTP" required>
                                <span class="toggle-visibility-liem" onclick="toggleVisibilityforgot2('otp', this)">🚫</span>
                            </div>

                            <!-- Trường nhập mật khẩu mới -->
                            <div class="mb-4 password-container-liem">
                                <input type="password" name="newPass" class="form-control form-control-lg liem-forgot pe-5" id="newPass" placeholder="Nhập mật khẩu mới" required>
                                <span class="toggle-visibility-liem" onclick="toggleVisibilityforgot2('newPass', this)">🚫</span>
                            </div>

                            <!-- Trường xác nhận mật khẩu -->
                            <div class="mb-4 password-container-liem">
                                <input type="password" name="confirmPass" class="form-control form-control-lg liem-forgot pe-5" id="confirmPass" placeholder="Xác nhận mật khẩu mới" required>
                                <span class="toggle-visibility-liem" onclick="toggleVisibilityforgot2('confirmPass', this)">🚫</span>
                            </div>

                            <button class="btn btn-primary w-100 btn-continue rounded-pill">
                                Xát nhận
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-1 text-center illustration liem-forgot">

                </div>
                <div class="col-lg-3 text-center illustration liem-forgot">
                    <img src="imgs/Cover.png" alt="CMS Illustration" class="img-fluid">
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function toggleVisibilityforgot2(fieldId, icon) {
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
