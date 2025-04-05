<%-- 
    Document   : Register
    Created on : Mar 31, 2025, 17:59:07 PM
    Author     : Liem
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/register.css"/>
        <title>Register</title>
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
                        <h1 class="fw-bold fs-2">Tạo tài khoản</h1>
                        <p class="text-muted">
                            Bạn đã có tài khoản? 
                            <a href="./login.jsp" class="register-account">Đăng nhập</a>
                        </p>
                    </div>
                    <div class="mt-5">
                        <form id="registerForm" action="register" method="post" onsubmit=" return validateForm();">
                            <!-- Trường nhập tên đăng nhập -->
                            <div class="my-4">
                                <input type="text" name="username" class="form-control form-control-lg" id="username" placeholder="Tên đăng nhập" required>
                            </div>

                            <!-- Trường nhập mật khẩu -->
                            <div class="mb-4 password-container-liem">
                                <input type="password" name="newPass" class="form-control form-control-lg liem-forgot pe-5" id="newPass" placeholder="Nhập mật khẩu" required>
                                <span class="toggle-visibility-liem" onclick="toggleVisibility('newPass', this)">🚫</span>
                                <div>
                                    <div id="passwordError1" class="error-message">
                                        Tối thiểu 6 ký tự
                                    </div>
                                    <div id="passwordError2" class="error-message">
                                        Ít nhất 1 chữ, 1 số và 1 ký tự đặt biệt
                                    </div>
                                </div>
                            </div>

                            <!-- Trường xác nhận mật khẩu -->
                            <div class="mb-4 password-container-liem">
                                <input type="password" name="confirmPass" class="form-control form-control-lg liem-forgot pe-5" id="confirmPass" placeholder="Xác nhận mật khẩu" required>
                                <span class="toggle-visibility-liem" onclick="toggleVisibility('confirmPass', this)">🚫</span>
                                <div>
                                    <div id="rePasswordError" class="error-message">
                                        Mật khẩu không khớp
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 btn-continue rounded-pill">
                                Xác nhận
                            </button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-1 text-center illustration"></div>
                <div class="col-lg-3 text-center illustration">
                    <img src="imgs/Cover.png" alt="CMS Illustration" class="img-fluid">
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function toggleVisibility(fieldId, icon) {
                let inputField = document.getElementById(fieldId);
                if (inputField.type === "password") {
                    inputField.type = "text";
                    icon.innerHTML = "👁";
                } else {
                    inputField.type = "password";
                    icon.innerHTML = "🚫";
                }
            }

            function validatePasswordStrength(password) {
                let error1 = document.getElementById("passwordError1");
                let error2 = document.getElementById("passwordError2");
                let isValid = true;
                // Kiểm tra tối thiểu 6 ký tự
                if (password.length < 6) {
                    error1.style.display = "block";
                    isValid = false;
                } else {
                    error1.style.display = "none";
                }
                /*
                // Kiểm tra ít nhất 1 chữ, 1 số, 1 ký tự đặc biệt
                let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z0-9]).+$/;
                if (!regex.test(password)) {
                    error2.style.display = "block";
                    isValid = false;
                } else {
                    error2.style.display = "none";
                }*/
                return isValid;
            }

            function validateForm() {
                let newPass = document.getElementById("newPass").value;
                let confirmPass = document.getElementById("confirmPass").value;
                let rePasswordError = document.getElementById("rePasswordError");

                // Kiểm tra độ mạnh của mật khẩu
                let isPasswordStrong = validatePasswordStrength(newPass);
                // Kiểm tra khớp mật khẩu
                if (newPass !== confirmPass) {
                    rePasswordError.style.display = "block";
                    return false;
                } else {
                    rePasswordError.style.display = "none";
                }
                return isPasswordStrong;
            }
        </script>
    </body>
</html>
