<%-- 
    Document   : MenuAdmin
    Created on : Mar 28, 2025, 11:07:42 AM
    Author     : ADMIN
--%>

<%@page import="models.Category"%>
<%@page import="models.CategoryModel"%>
<%@page import="models.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <title>Danh sách Menu</title>
    <link rel="stylesheet" href="css/style_menu.css"/>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <style>
        .modal.right .modal-dialog {
            position: fixed;
            margin: auto;
            width: 30%;
            height: 100%;
            right: 0;
            transform: translateX(100%);
            transition: transform 0.3s ease-in-out;
            height: 100%;
        }
        
        .modal.right.show .modal-dialog {
            transform: translateX(0);
        }
  </style>
</head>
<body>
  <!-- Sidebar -->
  <div class="sidebar">
    <div class="logo-container">
        <img src="imgs/Logo.png" alt="alt"/>
    </div>
    
    <div class="wrap-order-button">
      <button class="order-button">
        Đặt hàng
      </button>
    </div>
      <div class="wrap-nav">
          <div class="nav-item active">
              <a href="#">
                   <i class="bi bi-list"></i>
                    Menu
              </a>
          </div>

          <div class="nav-item">
              <a href="#">
                <i class="bi bi-box"></i>
                Kho
              </a>
          </div>

          <div class="nav-item">
              <a href="#">
                <i class="bi bi-cart"></i>
                Đơn hàng
              </a>
           
          </div>

          <div class="nav-item">
              <a href="#">
                 <i class="bi bi-bar-chart"></i>
                Báo cáo
              </a>
          </div>
      </div>
  </div>
  
  
  
  
  <!-- Main Content -->
  <div class="main-content">
    <!-- Top Header -->
    <div class="top-header">
      <div class="d-flex align-items-center">
        <button class="btn btn-sm d-none mobile-menu-toggle">
          <i class="bi bi-list"></i>
        </button>
        <span class="fw-medium">Menu</span>
      </div>
      
      <div class="d-flex align-items-center">
        <div class="notification-icon">
          <i class="bi bi-bell-fill small"></i>
        </div>
        <div class="user-avatar">
          <img src="imgs/Avatar.png" alt="User" class="w-100 h-100">
        </div>
      </div>
    </div>
    
    <!-- Content Area -->
    <div class="content-area">
      <h1 class="h4 fw-bold mb-4">Danh sách</h1>
        <div>LLH ${ShowMessage}</div>
        
      <div class="d-flex justify-content-between mb-4 flex-wrap">
        <div class="mb-2">
          <button class="btn btn-outline-secondary sort-button">
            Sắp xếp: Danh mục
            <span class="sort-icon"><img src="imgs/arrows-down.png" alt="alt"/>️</span>
          </button>
        </div>
        
        <div class="d-flex gap-2 flex-wrap">
            <form action="menu"  method="GET">
                <div class="search-container mb-2">
                  <i class="bi bi-search"></i>
                      <input type="text" value="${search}" name="search" class="form-control search-input" placeholder="Tìm kiếm">
                </div>
            </form>

          <button class="btn btn-outline-secondary mb-2">
            Xuất dữ liệu
          </button>
          
          <button class="btn btn-primary add-button mb-2" data-bs-toggle="modal" data-bs-target="#create-modal">
            <i class="bi bi-plus"></i> Thêm
          </button>
        </div>
      </div>
      
      <div class="d-flex justify-content-between text-muted small mb-2">
        <div> ${CurrentPage} - ${TotalPage} trong số ${PageSize} </div>
        <div class="d-flex gap-2 align-items-center">
            <form action="menu"  method="GET">
                <input value="0" name="page" hidden/>
                <button class="btn btn-sm btn-light">
                  <i class="bi bi-chevron-left"></i>
                </button>
            </form>
            <form action="menu" method="GET">
                <input value="1" name="page" hidden/>
                <button class="btn btn-sm btn-light">
                  <i class="bi bi-chevron-right"></i>
                </button>
            </form>
          <button class="btn btn-sm btn-light">
            <i class="bi bi-funnel"></i>
          </button>
        </div>
      </div>
       
      <!-- Table -->
      <div class="table-responsive">
        <table class="warp-table">
          <thead class="table-header">
            <tr>
              <th>Hình ảnh</th>
              <th>Tên</th>
              <th>Danh mục</th>
              <th>Kích cỡ</th>
              <th>Giá</th>
              <th>Trạng thái</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody>
                <% 
                   List<Product> listProducts = (List<Product>) request.getAttribute("Products");
                %>
           
                <%
                if (listProducts != null) {
                    for (Product product : listProducts) {
                        %>
                    <tr  data-bs-toggle="modal" data-bs-target="#slideModal">
                        <td>
                            <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
                        </td>
                        <td class="id-product" hidden="none"><%= product.getProductId()%></td>
                        <td class="name-product"><%= product.getProductName()%></td>
                        <td><%= product.getCategoryName() %></td>
                        <td><%= product.getSizes() %></td>
                        <td><%= product.getListPrice() %></td>
                        <td><%= product.isAvailable() ? "Còn" : "Hết" %></td>
                        <td>
                            <button class="action-button edit-btn" data-bs-toggle="modal" data-bs-target="#edit-modal" data-id="<%= product.getProductId()%>" >
                                <i class="bi bi-pencil" style="color: black;"></i>
                            </button>
                            <button class="action-button delete-btn" data-bs-toggle="modal" data-bs-target="#confirmationModal" data-id="<%= product.getProductId()%>">
                                <i class="bi bi-trash"></i>
                            </button>
                        </td>
                    </tr>
                        <%
                    }
                }%>
          </tbody>
        </table>
      </div>
    </div>
  </div>
            
            
  <!--Modals delete-->
   <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-confirm">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="confirmationModalLabel">Xóa món nước?</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <p>Bạn có chắc chắn muốn xóa món <b id="ProductNameJquery"></b> không?</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-cancel me-2" data-bs-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-confirm">Confirm</button>
          </div>
        </div>
      </div>
    </div>

  
    <!--Modals detail-->
<div class="modal fade right" id="slideModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 100%;">
            <div class="modal-header">
                <div class="wrap-header-modal">
                    <div style="font-size: 18px; font-weight: 600;">Cà phê sữa</div>
                    <div style="font-size: 12px;">Còn</div>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            
            <div class="modal-body" >
                <div class="row" style="padding: 15px">
                    <div class="col-md-6">
                        <div class="titile-modal-llh">Danh muc</div>
                        <div class="content-modal-llh">Cà phê</div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="titile-modal-llh">Giá</div>
                        <div class="content-modal-llh">10.000đ</div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="titile-modal-llh">Loại</div>
                        <div class="content-modal-llh">Lạnh</div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="titile-modal-llh">Kích cỡ</div>
                        <div class="content-modal-llh">S</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    

   <!--Modals create-->    
<div class="modal fade right" id="create-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
       
        <div class="modal-content" style="height: 100%;">
            <div class="modal-header">
                <div class="wrap-header-modal">
                    <h5>Thêm nước</h5>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            <form action="menu" method="post" enctype="multipart/form-data">
                <div class="modal-body" >
                    <div class="mb-3">
                      <label for="productName" class="form-label required">Tên</label>
                      <input type="text" name="productName" class="form-control" id="productName" value="">
                    </div>

                    <div class="mb-3">
                      <label for="category" class="form-label">Danh mục</label>
                      <select class="form-select" id="category" name="category">
                        <% 
                            List<Category> categries = (List<Category>) request.getAttribute("categries");
                        %>
                        <%
                            if (categries != null) {
                                for (Category c : categries) {
                                %>
                                    <option value="<%= c.getId()%>" selected><%= c.getCategoryName()%></option>
                                <%
                            }
                        }%>
                      </select>
                    </div>
                   
                    <div class="mb-3">
                      <label for="price" class="form-label">Giá</label>
                      <div class="input-group">
                        <input type="text" name="productPrice" class="form-control" id="price" value="" style="width: 100%">
                        <span class="" style="position: fixed; right: 7%; padding-top: 5px; z-index: 99;">đ</span>
                      </div>
                    </div>
                   
                   <div class="mb-3">
                      <label for="size" class="form-label">Kích cỡ</label>
                      <div class="row" style="padding: 0 15px;">
                          <select name="productSize" class="form-select col-md-6" id="size" style="width: 48%; margin-right: 2%;">
                            <option selected>S</option>
                            <option>M</option>
                            <option>L</option>
                          </select>
                      
                       <input type="text" name="productPriceOfSize" class="form-control col-md-6" id="price" value="" style="width: 48%; margin-left: 2%">
                       <span style="position: fixed; right: -88%; padding-top: 5px;">đ</span>
                      </div>
                      
                    </div>
                   
                    <div class="mb-3">
                      <label for="type" class="form-label">Loại</label>
                      <div style="display: flex;">
                          <div class="form-check form-check-inline" style="width: 50%;">
                          <input class="form-check-input" type="checkbox" name="haveType" id="c-available" value="true" checked>
                            <label class="form-check-label" for="c-available">Nóng</label>
                          </div>
                          <div class="form-check form-check-inline" style="width: 50%;">
                            <input class="form-check-input" type="checkbox" name="haveType" id="c-outOfStock" value="false">
                            <label class="form-check-label" for="c-outOfStock">Lạnh</label>
                          </div>
                      </div>
                    </div>

                    <div class="mb-3">
                        <label for="type" class="form-label">Trạng thái</label>
                        <div style="display: flex;">
                            <div class="form-check form-check-inline" style="width: 50%;">
                              <input class="form-check-input" type="radio" name="availability" id="r-available" value="true" checked>
                              <label class="form-check-label" for="r-available">Còn</label>
                            </div>
                            <div class="form-check form-check-inline" style="width: 50%;">
                              <input class="form-check-input" type="radio" name="availability" id="r-outOfStock" value="false">
                              <label class="form-check-label" for="r-outOfStock">Hết</label>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="type" class="form-label">Mô tả hình ảnh</label>
                        <div class="image-upload-container row">
                            <input type="file" name="productImage" />
                            <div class="col-md-2 update-load-imgs">
                                <img src="imgs/Button.png" alt="alt"/>
                            </div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <input class="form-check-input" type="checkbox" name="directSale" id="buy" value="isDirectSale">
                        <label class="form-check-label" for="buy">Bán trực tiếp</label>
                    </div>
                   
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: #1F75FF">Tạo</button>
                </div>
             </form>
        </div>

    </div>
</div>
   
   <!--modal edit-->
   <div class="modal fade right" id="edit-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 100%;">
            <div class="modal-header">
                <div class="wrap-header-modal">
                    <h5>Thêm nước</h5>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            
            <div class="modal-body" >
               <form>
                    <div class="mb-3">
                      <label for="productName" class="form-label required">Tên</label>
                      <input type="text" class="form-control" id="productName" value="">
                    </div>

                    <div class="mb-3">
                      <label for="category" class="form-label">Danh mục</label>
                      <select class="form-select" id="category">
                        <option selected>Cà phê</option>
                        <option>Trà sữa</option>
                        <option>Nước ép</option>
                        <option>Sinh tố</option>
                      </select>
                    </div>
                   
                    <div class="mb-3">
                      <label for="price" class="form-label">Giá</label>
                      <div class="input-group">
                        <input type="text" class="form-control" id="price" value="" style="width: 100%">
                        <span class="" style="position: fixed; right: 7%; padding-top: 5px; z-index: 99;">đ</span>
                      </div>
                    </div>
                   
                   <div class="mb-3">
                      <label for="size" class="form-label">Kích cỡ</label>
                      <div class="row" style="padding: 0 15px;">
                          <select class="form-select col-md-6" id="size" style="width: 48%; margin-right: 2%;">
                            <option selected>S</option>
                            <option>M</option>
                            <option>L</option>
                          </select>
                      
                       <input type="text" class="form-control  col-md-6" id="price" value="" style="width: 48%; margin-left: 2%">
                       <span style="position: fixed; right: -88%; padding-top: 5px;">đ</span>
                      </div>
                      
                    </div>
                   
                    <div class="mb-3">
                      <label for="type" class="form-label">Loại</label>
                      <div style="display: flex;">
                          <div class="form-check form-check-inline" style="width: 50%;">
                          <input class="form-check-input" type="checkbox" name="availability" id="c-available" value="available" checked>
                            <label class="form-check-label" for="c-available">Nóng</label>
                          </div>
                          <div class="form-check form-check-inline" style="width: 50%;">
                            <input class="form-check-input" type="checkbox" name="availability" id="c-outOfStock" value="outOfStock">
                            <label class="form-check-label" for="c-outOfStock">Lạnh</label>
                          </div>
                      </div>
                    </div>

                    <div class="mb-3">
                        <label for="type" class="form-label">Trạng thái</label>
                        <div style="display: flex;">
                            <div class="form-check form-check-inline" style="width: 50%;">
                              <input class="form-check-input" type="radio" name="availability" id="r-available" value="available" checked>
                              <label class="form-check-label" for="r-available">Còn</label>
                            </div>
                            <div class="form-check form-check-inline" style="width: 50%;">
                              <input class="form-check-input" type="radio" name="availability" id="r-outOfStock" value="outOfStock">
                              <label class="form-check-label" for="r-outOfStock">Hết</label>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="type" class="form-label">Mô tả hình ảnh</label>
                        <div class="image-upload-container row">
                            <div class="col-md-2 update-load-imgs">
                                <img src="imgs/Button.png" alt="alt"/>
                            </div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                            <div class="col-md-2 update-load-imgs"><img src="imgs/Button.png" alt="alt"/></div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <input class="form-check-input" type="checkbox" name="availability" id="buy" value="available">
                        <label class="form-check-label" for="buy">Bán trực tiếp</label>
                    </div>
                  </form>
                </div>
            
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: #1F75FF">Tạo</button>
            </div>
        </div>
    </div>
</div>
   
    
  <!-- Bootstrap 5 JS Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
  
  <!-- Custom JavaScript -->
  <script>
    // Mobile menu toggle
    document.querySelector('.mobile-menu-toggle')?.addEventListener('click', function() {
      const sidebar = document.querySelector('.sidebar');
      if (sidebar.style.width === '200px') {
        sidebar.style.width = '0';
      } else {
        sidebar.style.width = '200px';
      }
    });
  </script>
  
  <script>
        $(document).ready(function() {
            $('.action-button').click(function(e) {
                e.preventDefault(); // Ngăn hành vi mặc định nếu cần
                const productName = $(this).closest('tr').find('.name-product').html();
                const productId = $(this).closest('tr').find('.id-product').html();
                $('#ProductNameJquery').html(productName);
            });
        });
        
        $(document).ready(function() {
            let currentDeleteId = null;
            $(document).on('click', '.delete-btn', function(e) {
              e.preventDefault();
              const itemId = $(this).data('id');
              currentDeleteId = itemId;
            });

            $('.btn-confirm').click(function() {

                if (currentDeleteId) {
                  $.ajax({
                    url: 'menu',
                    type: 'POST',
                    data: {
                      action: "delete",
                      deleteID: currentDeleteId
                    },
                    dataType: 'json',
                    success: function(response) {
                      if (response.status === 'success') {
                        console.log(response.message);
                        location.reload();
                      } else {
                          console.log(response.status);
                      }
                    },
                    error: function() {
                        console.log(response.status);
                    }
                  });
                }

                currentDeleteId = null;
             });

            // Xử lý khi click Cancel
            $('.cancel-btn').click(function() {
              currentDeleteId = null;
              $('#confirmDeleteModal').modal('close');
            });
      });
      
        $(document).ready(function() {
            $(document).on('click', '.edit-btn', function(e) {
              e.preventDefault();
              const itemId = $(this).data('id');
             console.log(itemId);
              if (itemId) {
                $.ajax({
                     url: 'menu',
                     type: 'POST',
                     data: { 
                        action: "detail",
                        detailID: itemId
                     },
                     dataType: 'json',
                     success: function(response) {
                         console.log(response);
                     },
                     error: function() {
                         console.log(response.status);
                     }
                   });
                }
            });
      });
      
        
  </script>
  
</body>
</html>
