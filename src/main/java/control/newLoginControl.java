/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.awt.SystemColor;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

// Cải tiến: Sử dụng thư viện JSON (ví dụ org.json) để parse phản hồi từ API
import org.json.JSONObject;

@WebServlet(name = "newLoginControl", urlPatterns = {"/newlogin"})
public class newLoginControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Thiết lập kiểu nội dung cho response
        response.setContentType("text/html; charset=UTF-8");

        // Lấy dữ liệu từ form: username và password
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Địa chỉ API phục vụ chức năng đăng nhập (có thể thay đổi sau)
        String apiUrl = "http://localhost:8081/api/v1/users/login";

        // Tạo dữ liệu JSON từ username và password
        String jsonInputString = String.format("{ \"username\": \"%s\", \"password\": \"%s\" }", username, password);

        // Gửi yêu cầu POST đến API
        String result = sendPostRequest(apiUrl, jsonInputString);

        // Kiểm tra kết quả trả về (theo cấu trúc cũ, nếu result không rỗng thì đăng nhập thành công)
        if (result != null && !result.trim().isEmpty()) {
            // Nếu đăng nhập thành công, lưu token vào session
            HttpSession session = request.getSession();
            session.setAttribute("Token", result);
            // Chuyển hướng đến trang menu
            response.sendRedirect(request.getContextPath() + "/menu");
        } else {
            // Nếu đăng nhập thất bại, trả về kết quả cho client (ở dạng JSON)
            response.setContentType("application/json");
            response.getWriter().write(result);
        }
    }

    private String sendPostRequest(String apiUrl, String jsonInputString) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setDoOutput(true);

        // Gửi dữ liệu JSON tới API
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Đọc dữ liệu phản hồi nếu status OK
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                return response.toString();
            }
        } else {
            // Nếu API trả về lỗi, trả về chuỗi rỗng
            return "";
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("newLogin.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet xử lý đăng nhập người dùng";
    }// </editor-fold>

}
