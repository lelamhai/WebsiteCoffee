<%-- 
    Document   : MenuAdmin
    Created on : Mar 28, 2025, 11:07:42 AM
    Author     : ADMIN
--%>

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
      <h1>${message}</h1>
      
      
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
          
          <button class="btn btn-primary add-button mb-2">
            <i class="bi bi-plus"></i> Thêm
          </button>
        </div>
      </div>
      
      <div class="d-flex justify-content-between text-muted small mb-2">
        <div>1 - 20 trong số 10</div>
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
      
      <!-- Table -->
      <div class="table-responsive">
        <table class="warp-table">
          <thead class="table-header">
            <tr>
              <th>Hình ảnh</th>
              <th>Tên</th>
              <th>Danh mục</th>
              <th>Kích cỡ</th>
              <th>Loại</th>
              <th>Giá</th>
              <th>Trạng thái</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Cà phê sữa</td>
              <td>Cà phê</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-out">Hết</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Cà phê sữa</td>
              <td>Cà phê</td>
              <td>M</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Cà phê đen</td>
              <td>Cà phê</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Cà phê đen</td>
              <td>Cà phê</td>
              <td>M</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Bạc xỉu</td>
              <td>Cà phê</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Trà sữa truyền thống</td>
              <td>Trà sữa & Trà trái cây</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Trà sữa Oolong</td>
              <td>Trà sữa & Trà trái cây</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Trà sữa Ô long rang chảy</td>
              <td>Trà sữa & Trà trái cây</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Trà sữa đen (Hồng trà sữa)</td>
              <td>Trà sữa & Trà trái cây</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
            <tr>
              <td>
                  <img src="imgs/product-image.png" alt="Cà phê sữa" class="product-image">
              </td>
              <td>Trà sữa xanh (Lục trà sữa)</td>
              <td>Trà sữa & Trà trái cây</td>
              <td>S</td>
              <td>Lạnh</td>
              <td>10.000đ</td>
              <td><span class="status-badge status-in">Còn</span></td>
              <td>
                <button class="action-button">
                  <i class="bi bi-trash"></i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Bootstrap 5 JS Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  
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
</body>
</html>
