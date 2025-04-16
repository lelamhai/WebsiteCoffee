//Xử lý object trả về khi login thành công
function responseHandler(data) {
  //Lưu token vào cookie trong 1 ngày
  setCookie("token", data, 1);
  setTimeout(function () {
    // Navigate to index.html
    window.location.href = "index.html";
  }, 1000);
}

//Hàm setCookie đã giới thiệu ở bài trước
function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  var expires = "expires=" + d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

//Hàm get Cookie đã giới thiệu ở bài trước
function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

function getUserRoleFromToken(token) {
  try {
    const payload = JSON.parse(atob(token.split('.')[1]));
    return payload.user.role || "CLIENT"; // fallback là USER nếu không có role
  } catch (e) {
    console.error("Không lấy được role từ token:", e);
    return "CLIENT";
  }
}

function isTokenValid(token) {
  try {
    const payload = JSON.parse(atob(token.split('.')[1]));
    const now = Math.floor(Date.now() / 1000);
    return payload.exp && payload.exp > now;
  } catch (e) {
    console.error("Token không hợp lệ:", e);
    return false;
  }
}

function validatePassword(password) {
  const minLength = /.{8,}/;
  const hasLowerCase = /[a-z]/;
  const hasUpperCase = /[A-Z]/;
  const hasNumber = /[0-9]/;

  if (!minLength.test(password)) {
    return "Mật khẩu phải có ít nhất 8 ký tự.";
  }
  if (!hasLowerCase.test(password)) {
    return "Mật khẩu phải có ít nhất một chữ thường.";
  }
  if (!hasUpperCase.test(password)) {
    return "Mật khẩu phải có ít nhất một chữ in hoa.";
  }
  if (!hasNumber.test(password)) {
    return "Mật khẩu phải có ít nhất một chữ số.";
  }

  return ""; // ✅ Trả về chuỗi rỗng nếu hợp lệ
}

