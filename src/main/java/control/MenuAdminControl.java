/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import models.Product;
import models.ProductResponse;
/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MenuAdminControl", urlPatterns = {"/menu"})
public class MenuAdminControl extends HttpServlet {

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
        processRequest(request, response);
        
        String root = "http://localhost:8080/products/";

         // Các tham số từ request
        String keyword = request.getParameter("search");
        String page = request.getParameter("page");
        String size = request.getParameter("size");
        
        String query = String.format("?keyword=%s&page=%s&size=%s", 
                keyword != null ? keyword : "", 
                page != null ? page : "1", 
                size != null ? size : "1");
        String apiUrl = root + query;
        
        String jsonString = sendPostRequest(apiUrl, request, response);
       
        Gson gson = new Gson();
        ProductResponse model = gson.fromJson(jsonString, models.ProductResponse.class);
        List<Product> listProduct = model.getContents();
        int currentPage = model.getPageNumber();
        int totalPage = model.getTotalPages();
        int pageSize = model.getPageSize();
        
        request.setAttribute("search", keyword);
        
        request.setAttribute("Products", listProduct);
        request.setAttribute("CurrentPage", currentPage);
        request.setAttribute("TotalPage", totalPage);
        request.setAttribute("PageSize", pageSize);
        
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
    
    private String sendPostRequest(String apiUrl,HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder apiResponse = new StringBuilder();
                
                while ((inputLine = in.readLine()) != null) {
                    apiResponse.append(inputLine);
                }
                in.close();
                
                return apiResponse.toString();
               
            } else {
                response.getWriter().write("API call failed with code: " + responseCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
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
        String productID = request.getParameter("productID");
         
        String apiUrl = "http://localhost:8081/products/" + productID;
        
         try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("DELETE");
            
            int responseCode = conn.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder apiResponse = new StringBuilder();
                
                while ((inputLine = in.readLine()) != null) {
                    apiResponse.append(inputLine);
                }
                in.close();
                response.getWriter().write("{\"status\": \"success\", \"message\": \"Đã xóa sản phẩm có ID: " + productID + "\"}");
            } else {
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Xóa sản phẩm " + productID + " thất bại\"}");
                response.getWriter().write("API call failed with code: " + responseCode);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Server error\"}");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
