<%-- 
    Document   : MenuAdmin
    Created on : Mar 28, 2025, 11:07:42 AM
    Author     : ADMIN
--%>

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
  
<!--  <style>
    .modal-content {
      border-radius: 16px;
      border: none;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    }
    
    .modal-header {
      border-bottom: none;
      padding: 20px 24px 10px;
    }
    
    .modal-title {
      font-weight: 600;
      font-size: 20px;
    }
    
    .modal-body {
      padding: 10px 24px 20px;
    }
    
    .form-control, .form-select {
      padding: 12px 16px;
      border-radius: 12px;
      border: 1px solid #e0e0e0;
      margin-bottom: 16px;
    }
    
    .form-label {
      margin-bottom: 6px;
      font-size: 14px;
      color: #6c757d;
    }
    
    .required::after {
      content: "*";
      color: #0d6efd;
      margin-left: 2px;
    }
    
    .form-check-input {
      width: 20px;
      height: 20px;
      margin-top: 0.25rem;
    }
    
    .form-check-label {
      margin-left: 8px;
    }
    
    .image-upload-container {
      display: flex;
      gap: 10px;
      margin-top: 16px;
    }
    
    .image-upload-box {
      width: 80px;
      height: 80px;
      border: 1px dashed #ced4da;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      position: relative;
    }
    
    .image-preview {
      width: 80px;
      height: 80px;
      border-radius: 12px;
      object-fit: cover;
      border: 1px solid #e0e0e0;
    }
    
    .remove-image {
      position: absolute;
      top: -8px;
      right: -8px;
      background: white;
      border-radius: 50%;
      width: 24px;
      height: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      border: 1px solid #e0e0e0;
      cursor: pointer;
      z-index: 1;
    }
    
    .modal-footer {
      border-top: none;
      padding: 16px 24px 24px;
      justify-content: flex-end;
      gap: 10px;
    }
    
    .btn-cancel {
      background-color: #f8f9fa;
      color: #212529;
      border: 1px solid #e0e0e0;
      border-radius: 12px;
      padding: 10px 20px;
    }
    
    .btn-confirm {
      background-color: #0d6efd;
      border: none;
      border-radius: 12px;
      padding: 10px 20px;
    }
  </style>-->
  
  
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
      
      
      <div class="d-flex justify-content-between mb-4 flex-wrap">
        <div class="mb-2">
          <button class="btn btn-outline-secondary sort-button">
            Sắp xếp: Danh mục
            <span class="sort-icon"><img src="imgs/arrows-down.png" alt="alt"/>️</span>
          </button>
        </div>
        
        <div class="d-flex gap-2 flex-wrap">
          <div class="search-container mb-2">
            <i class="bi bi-search"></i>
            <input type="text" class="form-control search-input" placeholder="Tìm kiếm">
          </div>
          
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
          <button class="btn btn-sm btn-light">
            <i class="bi bi-chevron-left"></i>
          </button>
          <button class="btn btn-sm btn-light">
            <i class="bi bi-chevron-right"></i>
          </button>
          <button class="btn btn-sm btn-light">
            <i class="bi bi-funnel"></i>
          </button>
        </div>
      </div>
      
      
<!--    <div class="container mt-5">
    <button type="button" data-bs-toggle="modal" data-bs-target="#editProductModal">
      Open Edit Form
    </button>
  </div>-->
      
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
                        <td><%= product.isAvailable() %></td>
                        <td>
                             <button class="action-button" data-bs-toggle="modal" data-bs-target="#aa" >
                                <i class="bi bi-pencil" style="color: black;"></i>
                             </button>
                            <button class="action-button" data-bs-toggle="modal" data-bs-target="#confirmationModal" >
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
            
            <style>
                .titile-modal-llh {
                    font-size: 12px;
                    font-weight: 400;
                    color: #4E5A73;
                }
                
                .content-modal-llh {
                    font-size: 16px;
                    font-weight: 400;
                    color: #021337;
                    padding-bottom: 30px;
                }
            </style>
            
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
    

    
<div class="modal fade right" id="create-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 100%;">
            <div class="modal-header">
                <div class="wrap-header-modal">
                    <h5>Thêm nước</h5>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
            </div>
            
            
            <style>
                .form-label {
                    font-size: 14px;
                    color: #10182899;
                }
            </style>
            
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
    
    
    <!--Modals Input-->
<!--     <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editProductModalLabel">Chỉnh sửa nước</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form>
            <div class="mb-3">
              <label for="productName" class="form-label required">Tên</label>
              <input type="text" class="form-control" id="productName" value="Cà phê pha phin">
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
              <label for="type" class="form-label">Loại</label>
              <select class="form-select" id="type">
                <option selected>Lạnh</option>
                <option>Nóng</option>
                <option>Đá xay</option>
              </select>
            </div>
            
            <div class="mb-3">
              <label for="size" class="form-label">Kích cỡ</label>
              <select class="form-select" id="size">
                <option selected>S</option>
                <option>M</option>
                <option>L</option>
              </select>
            </div>
            
            <div class="mb-3">
              <label for="price" class="form-label">Giá</label>
              <div class="input-group">
                <input type="text" class="form-control" id="price" value="10.000.000">
                <span class="input-group-text">đ</span>
              </div>
            </div>
            
            <div class="mb-3">
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="availability" id="available" value="available" checked>
                <label class="form-check-label" for="available">Còn</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="availability" id="outOfStock" value="outOfStock">
                <label class="form-check-label" for="outOfStock">Hết</label>
              </div>
            </div>
            
            <div class="mb-3">
              <div class="image-upload-container">
                <div class="image-upload-box">
                  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-plus" viewBox="0 0 16 16">
                    <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                  </svg>
                </div>
                
                <div class="image-upload-box" style="position: relative;">
                  <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-K96O4gNqk8BdZzNmLWTufsIyyLT66j.png" class="image-preview" alt="Coffee image">
                  <div class="remove-image">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                      <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                  </div>
                </div>
                
                <div class="image-upload-box" style="position: relative;">
                  <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-K96O4gNqk8BdZzNmLWTufsIyyLT66j.png" class="image-preview" alt="Coffee image">
                  <div class="remove-image">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                      <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
          <button type="button" class="btn btn-confirm">Xác nhận</button>
        </div>
      </div>
    </div>
  </div>-->
            

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
            var productId;
            $('.action-button').click(function(e) {
                e.preventDefault(); // Ngăn hành vi mặc định nếu cần
                const productName = $(this).closest('tr').find('.name-product').html();
                productId = $(this).closest('tr').find('.id-product').html();
                $('#ProductNameJquery').html(productName);
            });
            // Khi nhấn Confirm
            $('.btn-confirm').click(function() {
                userChoice = 'confirm';
                console.log(productId);
            });

            // Khi nhấn Cancel hoặc đóng modal
            $('.btn-cancel, .btn-close').click(function() {
                userChoice = 'cancel';
            });

            $('#confirmationModal').on('hidden.bs.modal', function() {
                if(userChoice === 'confirm') {
                    // Gọi AJAX xóa sản phẩm
                    deleteProduct();
                } else {
                    console.log('Hành động đã bị hủy');
                }
            });
            
            function deleteProduct() {
                $.ajax({
                    url: '/products',
                    method: 'DELETE',
                    success: function(response) {
                        location.reload(); // Tải lại trang
                    },
                    error: function(error) {
                        alert('Có lỗi khi xóa!');
                    }
                });
            }
            
        });
  </script>
  
</body>
</html>
