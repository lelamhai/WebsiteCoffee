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
    <title>Danh sách báo cáo</title>
    <link rel="stylesheet" href="css/style_menu.css"/>
  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>
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

      .frame-pick-image {
          border-radius: 12px;
          width: 64px;
          height: 64px;
          overflow: hidden; /* Ẩn phần hình ảnh vượt quá khung */
          position: relative; /* Để định vị tuyệt đối hình ảnh bên trong */
      }

      .preview-image {
          position: absolute;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          object-fit: cover; /* Scale hình ảnh để lấp đầy khung, cắt phần dư */
          object-position: center; /* Đảm bảo tâm của hình ảnh ở giữa */
      }

      .wrap-upload {
          position: fixed;
          display: none;
      }

      .upload-preview {
          position: absolute;
          top: -10px;
          right: 0;
      }
      
      .content-area {
          background-color: #fff;
      }
  </style>
</head>
<body>
  <!-- Sidebar -->
 <div class="sidebar">
    <div class="logo-container">
        <a href="product">
            <img src="imgs/Logo.png" alt="alt"/>
        </a>
    </div>

    <div class="wrap-order-button" style="display: flex; justify-content: center;">
        <div class="order-button">
            <a href="order" style="text-decoration: none;">Đặt hàng</a>
        </div>
    </div>
    <div class="wrap-nav">
        <div class="nav-item">
            <a href="product">
                <i class="bi bi-cup-straw"></i>
                Sản phẩm
            </a>
        </div>

        <div class="nav-item">
            <a href="processing">
                <i class="bi bi-cart"></i>
                Đơn hàng
            </a>

        </div>

        <div class="nav-item active">
            <a href="report">
                <i class="bi bi-bar-chart"></i>
                Tài chính
            </a>
        </div>
        <div class="nav-item">
            <a href="account">
                <i class="bi bi-people"></i>
                Tài Khoản
            </a>
        </div>

        <div class="nav-item">
            <a href="#">
                <i class="bi bi-box"></i>
                Nguyên liệu
            </a>
        </div>
    </div>
</div>
  
  <!-- Main Content -->
  <div class="main-content" style="background-color: #f8f9fa; height: 100vh;">
    <!-- Top Header -->
    <div class="top-header">
      <div class="d-flex align-items-center">
        <button class="btn btn-sm d-none mobile-menu-toggle">
          <i class="bi bi-list"></i>
        </button>
        <span class="fw-medium">Tài chính</span>
      </div>
      
      <div class="d-flex align-items-center">
        <div class="notification-icon">
          <i class="bi bi-bell small"></i>
        </div>
        <div class="user-avatar">
          <img src="imgs/Avatar.png" alt="User" class="w-100 h-100">
        </div>
      </div>
    </div>
    
    <!-- Content Area -->
    <div style="border-bottom: 1px solid var(--border-color); width: 100%;"></div>
    
    <style>
        .content-area {
            display: flex;
            margin: 15px;
        }
        
        .img-report img {
            width: 50px;
            height: auto;
        }
        
        .wrap-report {
            display: flex;
            padding-right: 60px;
            align-items: center;
        }
        
        .number-report {
            font-weight: 700;
            font-size: 22px;
        }
        
        .title-report {
            font-size: 12px;
        }
        
        .img-report {
            padding-right: 10px;
        }
    </style>
    
    <div class="content-area">
        <div class="wrap-report">
            <div class="img-report">
                <img src="imgs/bill.png" alt="alt"/>
            </div>
            
            <div class="text-report">
                <div class="number-report">200.000</div>
                <div class="title-report">Hóa đơn</div>
            </div>
        </div>
        
        <div class="wrap-report">
            <div class="img-report">
                <img src="imgs/revenue.png" alt="alt"/>
            </div>
            
            <div class="text-report">
                <div class="number-report">20.000 triệu</div>
                <div class="title-report">Doanh thu</div>
            </div>
        </div>
        
        <div class="wrap-report">
            <div class="img-report">
                <img src="imgs/salary.png" alt="alt"/>
            </div>
            
            <div class="text-report">
                <div class="number-report">10.000 triệu</div>
                <div class="title-report">Lợi nhuận</div>
            </div>
        </div>
    </div>
    
    <style>
        .wrap-date-report {
            display: flex;
            align-items: center;
        }
        
        #datepicker {
            display: flex;
            align-items: center;
            position: relative;
        }
    </style>
    
    
    <div class="content-area" style="flex-direction: column;">
        <div class="wrap-control-chart" style="display: flex;justify-content: space-between;padding: 10px 0 30px 0;">
            <h5>Biểu đồ</h5>
            <div class="wrap-date-report">
                <div id="datepicker" class="date" data-date-format="mm-dd-yyyy">
                    <input class="form-control" type="text" style="width: 150px;" readonly />
                    <span class="input-group-addon" style="position: absolute; right: 15px;">
                        <i class="bi bi-calendar3"></i>
                    </span>
                </div>
               
                <select class="form-select" style="width: 100px; margin-left: 30px;">
                    <option>Tuần</option>
                    <option>Tháng</option>
                    <option>Năm</option>
                </select>
            </div>
        </div>
          
        
        <div style="width: 100%; height: 400px;">
            <canvas id="myChart"></canvas>
        </div>
    </div>
    
    
    
  </div>
    
    
  <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.vi.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


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
            $('#datepicker').datepicker({
            language: 'vi',
            format: 'dd/mm/yyyy',
            autoclose: true,
            todayHighlight: true
          });

        });
    </script>
  
  
  <script>
        const ctx = document.getElementById('myChart').getContext('2d');

        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ['T.2', 'T.3', 'T.4', 'T.5', 'T.6', 'T.7', 'CN'],
            datasets: [{ 
                label: 'Doanh thu', 
                backgroundColor: ['#D1245E'],
                data: [1, 5, 10, 15, 20, 50,40], 
                borderWidth: 1
               },
               { 
                label: 'Lợi nhuận', 
                backgroundColor: ['#2961F0'],
                data: [1, 2, 10, 15, 20, 40,30], 
                borderWidth: 1
                }
            ]
          },
          options: {
                responsive: true, 
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom' // Đưa legend xuống dưới
                    }
                }
           }
        });
       
  </script>
  
  
</body>
</html>
