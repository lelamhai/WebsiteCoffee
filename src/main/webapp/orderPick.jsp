<%-- 
    Document   : OrderPick
    Created on : Apr 8, 2025, 12:15:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            padding: 15px;
            background-color: white;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .back-button {
            color: #6c757d;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        .product-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .product-image {
            width: 100%;
            height: 150px;
            background-color: #ffe8c9;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .product-image img {
            max-width: 80%;
            max-height: 80%;
        }
        .quantity-control {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }
        .quantity-btn {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 1px solid #dee2e6;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            cursor: pointer;
        }
        .quantity-input {
            width: 40px;
            text-align: center;
            border: none;
            font-weight: bold;
        }
        .edit-link {
            color: #0d6efd;
            text-decoration: none;
            font-size: 14px;
        }
        .summary-card {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
        }
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .total-row {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
            font-weight: bold;
        }
        .btn-cancel {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            color: #212529;
        }
        .btn-pay {
            background-color: #0d6efd;
            color: white;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="container">
            <a href="#" class="back-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
                </svg>
                <span class="ms-2">Đặt hàng</span>
            </a>
            <span class="mx-2">/</span>
            <span>Đơn hàng</span>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container mt-3">
        <h4 class="mb-4">#DH01</h4>

        <div class="row">
            <!-- Product List -->
            <div class="col-md-8">
                <!-- Product 1 -->
                <div class="product-card">
                    <div class="row">
                        <div class="col-3">
                            <div class="product-image">
                                <img src="/placeholder.svg?height=100&width=80" alt="Cà phê muối lạnh">
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h5>Cà phê muối(Lạnh)</h5>
                                    <p class="text-muted mb-1">Size(S)</p>
                                    <p class="text-muted mb-1">50% đường, 50% đá</p>
                                    <a href="#" class="edit-link">Chỉnh sửa</a>
                                </div>
                                <div class="text-end">
                                    <div class="fw-bold mb-3">10.000</div>
                                    <div class="quantity-control">
                                        <button class="quantity-btn">-</button>
                                        <input type="text" class="quantity-input" value="1" readonly>
                                        <button class="quantity-btn">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 2 -->
                <div class="product-card">
                    <div class="row">
                        <div class="col-3">
                            <div class="product-image">
                                <img src="/placeholder.svg?height=100&width=80" alt="Cà phê muối nóng">
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h5>Cà phê muối(Nóng)</h5>
                                    <p class="text-muted mb-1">Size(S)</p>
                                    <p class="text-muted mb-1">50% đường</p>
                                    <a href="#" class="edit-link">Chỉnh sửa</a>
                                </div>
                                <div class="text-end">
                                    <div class="fw-bold mb-3">10.000</div>
                                    <div class="quantity-control">
                                        <button class="quantity-btn">-</button>
                                        <input type="text" class="quantity-input" value="1" readonly>
                                        <button class="quantity-btn">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="col-md-4">
                <div class="summary-card">
                    <h5 class="mb-4">Chi tiết thanh toán</h5>
                    
                    <div class="summary-row">
                        <span>Số lượng</span>
                        <span>2</span>
                    </div>
                    
                    <div class="summary-row">
                        <span>Tiền</span>
                        <span>10.000đ</span>
                    </div>
                    
                    <hr>
                    
                    <div class="total-row">
                        <span>Tổng tiền</span>
                        <span>10.000đ</span>
                    </div>
                    
                    <div class="d-grid gap-2">
                        <button class="btn btn-cancel">Huỷ</button>
                        <button class="btn btn-pay">Thanh toán</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Handle quantity buttons
        document.querySelectorAll('.quantity-btn').forEach(button => {
            button.addEventListener('click', function() {
                const input = this.parentNode.querySelector('.quantity-input');
                let value = parseInt(input.value);
                
                if (this.textContent === '+') {
                    value++;
                } else if (this.textContent === '-' && value > 1) {
                    value--;
                }
                
                input.value = value;
            });
        });
    </script>
    </body>
</html>
