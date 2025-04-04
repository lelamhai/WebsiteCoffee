<%-- 
    Document   : order
    Created on : Apr 4, 2025, 12:07:54 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coffee Shop - Đặt hàng</title>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .nav-tabs .nav-link {
                color: #6c757d;
                border: none;
                padding: 15px 0;
                margin-right: 20px;
                font-weight: 500;
            }
            .nav-tabs .nav-link.active {
                color: #0d6efd;
                border-bottom: 2px solid #0d6efd;
                background-color: transparent;
            }
            .product-card {
                border-radius: 12px;
                overflow: hidden;
                transition: transform 0.3s;
                height: 100%;
            }
            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            }
            .product-img-container {
                background-color: #ffe8c8;
                height: 300px;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .product-img {
                max-height: 160px;
                max-width: 100%;
            }
            .product-info {
                padding: 15px;
                background-color: white;
            }
            .product-title {
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 5px;
            }
            .product-price {
                font-weight: bold;
                color: #212529;
                text-align: right;
            }
            .quantity-control {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-top: 10px;
                /*border: 1px solid #dee2e6;*/
                border-radius: 8px;
                padding: 5px 10px;
            }
            .quantity-btn {
                background: none;
                border: none;
                font-size: 18px;
                color: #6c757d;
                cursor: pointer;
            }
            .quantity-display {
                font-size: 18px;
                font-weight: 500;
            }
            .badge-container {
                font-size: 12px;
                color: #6c757d;
                margin-bottom: 5px;
            }
            .back-button {
                color: #212529;
                text-decoration: none;
                display: flex;
                align-items: center;
            }
            .pagination-info {
                color: #6c757d;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid py-3">
            <!-- Header -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <a href="#" class="back-button">
                    <i class="bi bi-arrow-left me-2"></i>
                    <span class="fw-medium">Đặt hàng</span>
                </a>
                <div class="d-flex align-items-center">
                    <i class="bi bi-bell me-3"></i>
                    <div class="rounded-circle bg-secondary" style="width: 32px; height: 32px;"></div>
                </div>
            </div>

            <!-- Navigation Tabs -->
            
            <div class="wrap-control" style="display: flex; flex-wrap: nowrap; justify-content: space-between;">
                <div class="wrap-tabs">
                    <ul class="nav nav-tabs border-0 mb-4">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Cà phê</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Trà sữa & Trà trái cây</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sinh tố & nước ép</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Đồ uống đá xay</a>
                        </li>
                    </ul>
                </div>

                <!-- Search Bar -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div class="position-relative w-100 me-3">
                        <i class="bi bi-search position-absolute" style="left: 15px; top: 10px;"></i>
                        <input type="text" class="form-control ps-5 py-2" placeholder="Tìm kiếm" style="border-radius: 20px;">
                    </div>
                    <button class="btn btn-outline-secondary" style="border-radius: 50%; width: 40px; height: 40px;">
                        <i class="bi bi-cart"></i>
                    </button>
                </div>
            </div>

            <!-- Pagination Info -->
<!--            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="pagination-info">1 - 20 trong số 10</div>
                <div>
                    <button class="btn btn-sm btn-outline-secondary me-2">
                        <i class="bi bi-chevron-left"></i>
                    </button>
                    <button class="btn btn-sm btn-outline-secondary">
                        <i class="bi bi-chevron-right"></i>
                    </button>
                </div>
            </div>-->

            <!-- Product Grid -->
            <div class="row g-4">
                <!-- Product 1 -->
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="product-card">
                        <div class="product-img-container">
                            <img src="imgs/Head.png" alt="Cà phê đen(Nóng)" class="product-img"">
                        </div>
                        <div class="product-info">
                            <div class="badge-container">Còn</div>
                            <h5 class="product-title">Cà phê đen(Nóng)</h5>
                            <div class="d-flex justify-content-end">
                                <div class="product-price">10.000đ</div>
                            </div>
                            <div class="quantity-control">
                                <button class="quantity-btn">−</button>
                                <div class="quantity-display">0</div>
                                <button class="quantity-btn">+</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 2 -->
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="product-card">
                        <div class="product-img-container">
                            <img src="imgs/Head.png" alt="Cà phê đen(Lạnh)" class="product-img">
                        </div>
                        <div class="product-info">
                            <div class="badge-container">Còn</div>
                            <h5 class="product-title">Cà phê đen(Lạnh)</h5>
                            <div class="d-flex justify-content-end">
                                <div class="product-price">15.000đ</div>
                            </div>
                            <div class="quantity-control">
                                <button class="quantity-btn">−</button>
                                <div class="quantity-display">0</div>
                                <button class="quantity-btn">+</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 3 -->
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="product-card">
                        <div class="product-img-container">
                            <img src="imgs/Head.png" alt="Cà phê sữa(Lạnh)" class="product-img">
                        </div>
                        <div class="product-info">
                            <div class="badge-container">Còn</div>
                            <h5 class="product-title">Cà phê sữa(Lạnh)</h5>
                            <div class="d-flex justify-content-end">
                                <div class="product-price">15.000đ</div>
                            </div>
                            <div class="quantity-control">
                                <button class="quantity-btn">−</button>
                                <div class="quantity-display">0</div>
                                <button class="quantity-btn">+</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 4 -->
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="product-card">
                        <div class="product-img-container">
                            <img src="imgs/Head.png" alt="Cà phê sữa(Nóng)" class="product-img">
                        </div>
                        <div class="product-info">
                            <div class="badge-container">Còn</div>
                            <h5 class="product-title">Cà phê sữa(Nóng)</h5>
                            <div class="d-flex justify-content-end">
                                <div class="product-price">30.000đ</div>
                            </div>
                            <div class="quantity-control">
                                <button class="quantity-btn">−</button>
                                <div class="quantity-display">0</div>
                                <button class="quantity-btn">+</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Product 5 -->
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="product-card">
                        <div class="product-img-container">
                            <img src="imgs/Head.png" alt="Cà phê dừa" class="product-img">
                        </div>
                        <div class="product-info">
                            <div class="badge-container">Còn</div>
                            <h5 class="product-title">Cà phê dừa</h5>
                            <div class="d-flex justify-content-end">
                                <div class="product-price">30.000đ</div>
                            </div>
                            <div class="quantity-control">
                                <button class="quantity-btn">−</button>
                                <div class="quantity-display">0</div>
                                <button class="quantity-btn">+</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Simple quantity control functionality
            document.addEventListener('DOMContentLoaded', function() {
                const quantityBtns = document.querySelectorAll('.quantity-btn');

                quantityBtns.forEach(btn => {
                    btn.addEventListener('click', function() {
                        const display = this.parentElement.querySelector('.quantity-display');
                        let quantity = parseInt(display.textContent);

                        if (this.textContent === '+') {
                            quantity++;
                        } else if (this.textContent === '−' && quantity > 0) {
                            quantity--;
                        }

                        display.textContent = quantity;
                    });
                });
            });
        </script>
    </body>
</html>
