/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.ProcessBuilder.Redirect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Paths;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;
import models.CategoryModel;
import models.CreateProductModel;
import models.Product;
import models.ProductDetailModel;
import models.ProductResponse;
import models.VariantDetailModel;
/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MenuAdminControl", urlPatterns = {"/menu"})
@MultipartConfig
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
        loadProducts(request, response);
        loadCategory(request, response);
        
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
    
    private void loadProducts(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String root = "http://localhost:8080/products/";

         // Các tham số từ request
        String keyword = request.getParameter("search");
        String page = request.getParameter("page");
        String size = request.getParameter("size");
        
        String query = String.format("?keyword=%s&page=%s&size=%s", 
                keyword != null ? keyword : "", 
                page != null ? page : "", 
                size != null ? size : "");
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
    }
    
    private void loadCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String apiUrl = "http://localhost:8080/categories/";
        String jsonString = sendPostRequest(apiUrl, request, response);
        Gson gson = new Gson();
        CategoryModel model = gson.fromJson(jsonString, models.CategoryModel.class);
        request.setAttribute("categries", model.getData());
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
        handleCreate(request, response);
        
//        String action = request.getParameter("action");
//        if ("delete".equals(action)) {
//            handleDelete(request, response);
//        } else if ("detail".equals(action)) {
//            handleDetail(request, response);
//        } else {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
//        }
    }
    private void handleCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productName = request.getParameter("productName");
        String category = request.getParameter("category");
        String productPrice = request.getParameter("productPrice");
        String productSize = request.getParameter("productSize");
        String productPriceOfSize = request.getParameter("productPriceOfSize");
        String haveType = "true";
        String availability = request.getParameter("availability");
        boolean isDirectSale = request.getParameter("directSale") != null;
        
        VariantDetailModel v = new VariantDetailModel();
        v.setSizeName(productSize);
        v.setBasePrice(Integer.valueOf(productPriceOfSize));
            
        ArrayList<VariantDetailModel> listVariant= new ArrayList<>();
        listVariant.add(v);
        
        
        CreateProductModel model = new CreateProductModel();
        model.setProductName(productName);
        model.setCategoryId(Integer.valueOf(category));
        model.setBasePrice(Integer.valueOf(productPrice));
        model.setProductVariants(listVariant);
        model.setHaveType(false);
        model.setDirectSale(isDirectSale);
        
        Gson gsonString = new GsonBuilder().setPrettyPrinting().create();
        String jsonData = gsonString.toJson(model);

        
        
        String API_ENDPOINT = "http://localhost:8080/products/";
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        JsonObject jsonResponse = new JsonObject();

        try {
            String productDataString = jsonData;
            Part filePart = request.getPart("productImage");

            String boundary = "===" + System.currentTimeMillis() + "===";
            URL url = new URL(API_ENDPOINT);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);

            try (OutputStream outputStream = connection.getOutputStream()) {
                // Gửi phần dữ liệu JSON
                addFormField(outputStream, boundary, "data", productDataString);

                // Gửi phần file ảnh
                if (filePart != null) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    InputStream fileContent = filePart.getInputStream();
                    addFilePart(outputStream, boundary, "image", fileName, fileContent);
                }

                // Kết thúc body
                outputStream.write(("--" + boundary + "--\r\n").getBytes());
            }

            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                String apiResponse = getApiResponse(connection);
                jsonResponse.addProperty("success", true);
                try {
                    JsonObject apiResponseJson = gson.fromJson(apiResponse, JsonObject.class);
                    jsonResponse.add("data", apiResponseJson);
                } catch (Exception e) {
                    jsonResponse.addProperty("responseData", apiResponse); // Trả về nguyên văn nếu không phải JSON
                }
            } else {
                jsonResponse.addProperty("success", false);
                jsonResponse.addProperty("error", "Lỗi khi gọi API. Mã phản hồi: " + responseCode);
                String errorResponse = getApiResponse(connection);
                if (errorResponse != null && !errorResponse.isEmpty()) {
                    jsonResponse.addProperty("errorMessage", errorResponse);
                }
                response.setStatus(responseCode);
            }

            connection.disconnect();

        } catch (ServletException e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("error", "Lỗi khi xử lý request: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } catch (IOException e) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("error", "Lỗi I/O: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        } finally {
            out.print(gson.toJson(jsonResponse));
            out.flush();
        }
    }
    

    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productID = request.getParameter("deleteID");
        String apiUrl = "http://localhost:8080/products/" + productID;
        
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
                   response.getWriter().write("{\"status\": \"success\", \"message\": \"delete có ID: " + productID + "\"}");
               } else {
                   response.getWriter().write("{\"status\": \"error\", \"message\": \"Xóa sản phẩm " + productID + " thất bại\"}");
                   response.getWriter().write("API call failed with code: " + responseCode);
               }
           } catch (Exception e) {
               e.printStackTrace();
               response.getWriter().write("{\"status\": \"error\", \"message\": \"Server error\"}");
           }
    }

    private void handleDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String detailID = request.getParameter("detailID");
        response.getWriter().write("{\"status\": \"success\", \"message\": \"delete có ID: " + detailID + "\"}");
        
        String apiUrl = "http://localhost:8080/products/{productId}/detail?productId=3";
        
        String jsonString = sendPostRequest(apiUrl, request, response);
        
        response.getWriter().write("{\"status\": \"success\", \"message\": \"delete có ID: " + jsonString + "\"}");
    }

    
    private String sendPostRequest(String apiUrl, String jsonInputString) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Accept", "application/json");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int responseCode = conn.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                return response.toString();
            }catch(IOException exception)
            {
                return exception.getMessage();
            }
        } else {
            return "Lỗi";
        }
    }
    
     private void addFormField(OutputStream outputStream, String boundary, String name, String value) throws IOException {
        outputStream.write(("--" + boundary + "\r\n").getBytes());
        outputStream.write(("Content-Disposition: form-data; name=\"" + name + "\"\r\n").getBytes());
        outputStream.write(("Content-Type: text/plain; charset=utf-8\r\n").getBytes());
        outputStream.write(("\r\n" + value + "\r\n").getBytes());
    }

    private void addFilePart(OutputStream outputStream, String boundary, String fieldName, String fileName, InputStream inputStream) throws IOException {
        outputStream.write(("--" + boundary + "\r\n").getBytes());
        outputStream.write(("Content-Disposition: form-data; name=\"" + fieldName + "\"; filename=\"" + fileName + "\"\r\n").getBytes());
        outputStream.write(("Content-Type: application/octet-stream\r\n").getBytes());
        outputStream.write(("\r\n").getBytes());

        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        outputStream.write(("\r\n").getBytes());
    }

    private String getApiResponse(HttpURLConnection connection) throws IOException {
        StringBuilder response = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line.trim());
            }
        } catch (IOException e) {
            // Có thể không có InputStream nếu lỗi
            InputStream errorStream = connection.getErrorStream();
            if (errorStream != null) {
                try (BufferedReader errorReader = new BufferedReader(new InputStreamReader(errorStream, "utf-8"))) {
                    String line;
                    StringBuilder errorResponse = new StringBuilder();
                    while ((line = errorReader.readLine()) != null) {
                        errorResponse.append(line.trim());
                    }
                    return errorResponse.toString();
                }
            }
            return null;
        }
        return response.toString();
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
