<%-- 
    Document   : OrderPick
    Created on : Apr 8, 2025, 12:15:32 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
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
    <style>
        /*Phần style cho popup=======================================*/
        /*style cho form popup*/
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

        .form-label {
            font-size: 14px;
            color: #10182899;
        }

        /*style cho form popup*/

        .product-name {
            margin-bottom: 0.5rem;
            /* Khoảng cách nhỏ dưới tên */
            font-weight: bold;
            /* Làm nổi bật tên */
        }

        .product-price-popup {
            margin-bottom: 0.5rem;
            /* Khoảng cách nhỏ dưới giá */
            font-weight: bold;
            /* Làm nổi bật giá */
            color: blue;
        }

        .product-status {
            margin-bottom: 0.5rem;
            /* In nghiêng trạng thái */
            font-weight: bold;
            /* Làm nổi bật tính trạng */
        }

        /*Style cho tiêu đề Kích cỡ///////////////////////////////////*/
        .size-container {
            gap: 5px;
            /* Khoảng cách giữa các size-option */
        }

        .size-option {
            display: flex;
            /* Để căn chỉnh input, label và span trên cùng dòng */
            align-items: center;
            /* Căn chỉnh dọc các phần tử */
        }

        .size-price {
            display: block;
            /* Hiển thị giá trên dòng riêng */
            margin-left: auto;
            /* Đẩy giá về bên phải (nếu muốn) */
        }

        /* Tùy chỉnh khoảng cách giữa các radio button nếu cần thiết */
        .me-2 {
            margin-right: 1rem !important;
            /* Tăng khoảng cách bên phải */
        }

        .size-title {
            background-color: #e0f2f7;
            /* Màu xanh nhạt (tùy chỉnh) */
            padding: 5px 10px;
            /* Khoảng trắng bên trong khung */
            border-radius: 5px;
            /* Bo tròn góc (tùy chọn) */
            margin-bottom: 1rem;
            /* Tạo khoảng cách với các tùy chọn bên dưới */
            /*display: inline-block; /* Chỉ chiếm vừa đủ không gian của nội dung */
        }

        /* Style cho tiêu đề "Đường" /////////////////////////*/
        .sugar-title {
            background-color: #e0f2f7;
            /* Màu xanh nhạt (tùy chỉnh) */
            padding: 5px 10px;
            /* Khoảng trắng bên trong khung */
            border-radius: 5px;
            /* Bo tròn góc (tùy chọn) */
            margin-bottom: 1rem;
            /* Tạo khoảng cách với các tùy chọn bên dưới */
            /*display: inline-block; /* Chỉ chiếm vừa đủ không gian của nội dung */
        }

        /* Tăng khoảng cách giữa các radio button và label */
        .sugar-option {
            /*margin-bottom: 0.5rem; /* Khoảng cách giữa các tùy chọn đường */
            display: block;
            /* Mỗi tùy chọn trên một dòng */
        }

        .me-2 {
            margin-right: 0.5rem !important;
            /* Khoảng cách bên phải input radio */
        }

        /* Style cho tiêu đề "Đá" /////////////////////////*/
        .ice-title {
            background-color: #e0f2f7;
            /* Màu xanh nhạt (tùy chỉnh) */
            padding: 5px 10px;
            /* Khoảng trắng bên trong khung */
            border-radius: 5px;
            /* Bo tròn góc (tùy chọn) */
            margin-bottom: 1rem;
            /* Tạo khoảng cách với các tùy chọn bên dưới */
            /*display: inline-block; /* Chỉ chiếm vừa đủ không gian của nội dung */
        }

        /* Tăng khoảng cách giữa các radio button và label */
        .ice-option {
            /*margin-bottom: 0.5rem; /* Khoảng cách giữa các tùy chọn đá */
            display: block;
            /* Mỗi tùy chọn trên một dòng */
        }

        /*Phần style cho popup - END ====================================*/
    </style>
</head>

<body>
    <!-- Header -->
    <div class="header">
        <div class="container">
            <a href="order.jsp" class="back-button">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-arrow-left" viewBox="0 0 16 16">
                    <path fill-rule="evenodd"
                        d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z" />
                </svg>
                <span class="ms-2">Đặt hàng</span>
            </a>
            <span class="mx-2">/</span>
            <span>Đơn hàng</span>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container mt-3">
        <button class="action-button delete-btn" data-bs-toggle="modal" data-bs-target="#confirmationModal">
            XÓA
        </button>
        <h4 class="mb-4">#DH01</h4>

        <div class="row">
            <!-- Product List -->
            <div id="cart-region" class="col-md-8">
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
                        <span class="total-quantity">2</span>
                    </div>

                    <div class="summary-row">
                        <span>Tiền</span>
                        <span class="total-price">10.000đ</span>
                    </div>

                    <hr>

                    <div class="total-row">
                        <span>Tổng tiền</span>
                        <span class="total-price">10.000đ</span>
                    </div>

                    <div class="d-grid gap-2">
                        <button id="btn-pay" class="btn btn-pay">Thanh toán</button>
                        <button class="btn btn-cancel">Huỷ</button>
                    </div>
                </div>
            </div>
        </div>


        <!--html cho phần popup - modal create///////////////////////////////-->
        <!--Modals create-->
        <div class="modal fade right" id="modal-update" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="height: 100%;">
                    <!--Modal - header - OK-->
                    <div class="modal-header">
                        <div class="wrap-header-modal">
                            <h5>Chi tiết món</h5>
                        </div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                    </div>

                    <!--Modal - body-->
                    <div class="modal-body">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <img id="img-product-selected" src="imgs/product-image.png" alt="[Tên sản phẩm]"
                                    class="img-fluid product-image"
                                    style="max-width: 100%; height: auto; object-fit: contain;" />
                            </div>
                            <div class="col-md-8 product-info">
                                <h6 class="product-name">[Tên sản phẩm]</h6>
                                <p class="product-price-popup">[Giá sản phẩm]</p>
                                <p class="product-status">[Tình trạng]</p>
                            </div>
                        </div>

                        <!-- kích cỡ -->
                        <div class="row align-items-center full-width-heading">
                            <h6 class="size-title">Kích cỡ</h6>
                        </div>
                        <div class="mb-3 mt-3">
                            <!--<h6 class="size-title">Kích cỡ</h6>-->
                            <div class="size-container d-flex flex-column">
                                <!-- S -->
                                <div class="size-option">
                                    <input type="radio" name="size" value="S" id="sizeS" class="me-2" />
                                    <label for="sizeS" class="me-2">S</label>
                                    <span class="size-price" data-size="S">0đ</span>
                                </div>
                                <!-- M -->
                                <div class="size-option">
                                    <input type="radio" name="size" value="M" id="sizeM" class="me-2" />
                                    <label for="sizeM" class="me-2">M</label>
                                    <span class="size-price" data-size="M">5.000đ</span>
                                </div>
                                <!-- L -->
                                <div class="size-option">
                                    <input type="radio" name="size" value="L" id="sizeL" class="me-2" />
                                    <label for="sizeL" class="me-2">L</label>
                                    <span class="size-price" data-size="L">10.000đ</span>
                                </div>
                            </div>
                        </div>

                        <!-- Kiểu đồ uống -->
                        <div class="drink-type row align-items-center full-width-heading">
                            <h6 class="sugar-title">Kiểu đồ uống</h6>
                            <div class="mb-3">
                                <!--<h6 class="ice-title">Đá</h6>-->
                                <div class="type-options">
                                    <label id="label-hot" class="sugar-option">
                                        <input type="radio" name="type" value="1" class="me-2">
                                        Nóng
                                    </label>
                                    <label id="label-cool" class="sugar-option">
                                        <input type="radio" name="type" value="2" class="me-2">
                                        Lạnh
                                    </label>
                                </div>
                            </div>
                        </div>


                        <!-- Đá -->
                        <div class="ice-percent row align-items-center full-width-heading">
                            <h6 class="ice-title">Đá</h6>
                            <div class="mb-3">
                                <!--<h6 class="ice-title">Đá</h6>-->
                                <div class="ice-options">
                                    <label class="ice-option">
                                        <input type="radio" name="ice" value="100" class="me-2">
                                        100%
                                    </label>
                                    <label class="ice-option">
                                        <input type="radio" name="ice" value="50" class="me-2">
                                        50%
                                    </label>
                                    <label class="ice-option form-check-label">
                                        <input type="radio" name="ice" value="0" class="me-2">
                                        0%
                                    </label>
                                </div>
                            </div>
                        </div>


                        <!-- Đường -->
                        <div class="row align-items-center full-width-heading">
                            <h6 class="sugar-title">Đường</h6>
                        </div>
                        <div class="mb-3">
                            <!--<h6 class="sugar-title">Đường</h6>-->
                            <div class="sugar-options">
                                <label class="sugar-option">
                                    <input type="radio" name="sugar" value="100" class="me-2">
                                    100%
                                </label>
                                <label class="sugar-option">
                                    <input type="radio" name="sugar" value="50" class="me-2">
                                    50%
                                </label>
                                <label class="sugar-option form-check-label">
                                    <input type="radio" name="sugar" value="0" class="me-2">
                                    0%
                                </label>
                            </div>
                        </div>



                    </div>

                    <!--Modal - footer - OK-->
                    <div class="modal-footer">
                        <button id="btn-update-product-cart" type="button"
                            class="btn btn-update btn-primary w-100 btn-continue rounded-pill">Cập nhật</button>
                        <!--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: #1F75FF">Thêm vào giỏ hàng - 30.000đ</button>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <!--popup delete-->
   <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-confirm">
        <div class="modal-content">
          <div class="modal-header" style="border: 0">
            <h5 class="modal-title" id="confirmationModalLabel">Xóa món nước?</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <p>Bạn có chắc chắn muốn xóa món <b id="ProductNameJquery"></b> không?</p>
          </div>
          <div class="modal-footer" style="border: 0">
            <button type="button" class="btn btn-cancel me-2" data-bs-dismiss="modal">Hủy</button>
            <button type="button" class="btn btn-confirm" style="background-color: #1F75FF; color: #fff;">Xác nhận</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Custom JavaScript -->
    <script>
        $(document).ready(function () {
            // VÙNG 1: VÙNG KHAI BÁO BIẾN TOÀN CỤC
            const BASE_URL = "http://localhost:8080";
            let gVariantId = null;
            let gType = null;
            let gCurrentQuantity = null;
            // VÙNG 2: VÙNG GÁN VÀ THỰC THI SỰ KIỆN CHO CÁC ELEMENT
            onPageLoading();

            $('#cart-region').on('click', '.quantity-btn', function () {
                let vProductCard = $(this).closest(".product-card");
                let vVariantId = vProductCard.attr("id");
                let vType = $(this).closest(".product-card").find("h5").attr("type");

                const $input = $(this).siblings('.quantity-input');
                let value = parseInt($input.val());

                if ($(this).text().trim() === '+') {
                    value++;
                } else if ($(this).text().trim() === '-' && value > 0) {
                    value--;
                    if (value == 0) {
                        removeFromCart(vVariantId, vType);
                        vProductCard.remove();
                    }
                }
                $input.val(value);
                updateQuantity(vVariantId, vType, value);
                updateTotalPricePayment();
            });

            // Change price when checkbox size
            $('.size-container').on('change', 'input[type=radio][name=size]', function () {
                const selectedSize = $(this).val();
                const price = $(this).closest('.size-option').find('.size-price').text();
                $(".product-price-popup").html(price);
            });

            $("#cart-region").on('click', ".edit-link", function (e) {
                e.preventDefault();
                onBtnEditProductCartClick(this);
            });

            // Change display ice percent when change selection
            $('input[name="type"]').on('change', function () {
                const selectedValue = $('input[name="type"]:checked').val();
                onChangeHaveType(selectedValue);
            });

            // Update product in cart
            $(document).on('click', '#btn-update-product-cart', function () {
                onBtnUpdateProductCartClick();
            });

            // Implement event click btn pay
            $("#btn-pay").on('click', function () {
                onBtnPayClick();
            });

            // VÙNG 3: VÙNG VIẾT CÁC HÀM XỬ LÝ SỰ KIỆN
            function onPageLoading() {
                loadProductsToCart();
                updateTotalPricePayment();
            }

            // Function handle event click button pay
            function onBtnPayClick() {
                let vOrderList = getOrderData();
                let vOrderData = {
                    orderProducts: vOrderList
                }

                $.ajax({
                    url: BASE_URL + "/orders/",
                    method: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(vOrderData),
                    success: function(response) {
                        alert("Tạo đơn hàng thành công!");
                        localStorage.clear();
                        window.location.href = "order.jsp";
                    },
                    error: function (error) {
                        console.error("Error loading products:", error);
                    }
                })
            }

            // VÙNG 4: VÙNG VIẾT CÁC HÀM DÙNG CHUNG

            function loadProductsToCart() {
                let cart = JSON.parse(localStorage.getItem('cart')) || [];

                let vCartRegion = $("#cart-region");
                vCartRegion.empty();
                $.each(cart, function (index, item) {
                    let typeVi = item.type == 1 ? "Nóng" : "Lạnh";
                    let iceHtml = item.type == 1 ? '' : `<p class="ice-percent text-muted mb-1">` + item.ice + `% đá</p>`;
                    let productCard = `<div id="` + item.variantId + `" class="product-card">
                    <div class="row">
                        <div class="col-3">
                            <div class="product-image">
                                <img src="`+ item.imgUrl + `" alt="` + item.productName + `">
                            </div>
                        </div>
                        <div class="col-9">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h5 type= "`+ item.type + `">` + item.productName + `(` + typeVi + `)</h5>
                                    <p class="text-muted mb-1">Size(<span class="size-info">`+ item.size + `</span>)</p>
                                    <p class="text-muted mb-1">`+ item.sugar + `% đường</p>
                                    `+ iceHtml + `
                                    <a href="#" class="edit-link">Chỉnh sửa</a>
                                </div>
                                <div class="text-end">
                                    <div class="fw-bold mb-3">` + item.priceEach + `</div>
                                    <div class="quantity-control">
                                        <button class="quantity-btn">-</button>
                                        <input type="text" class="quantity-input" value="` + item.quantity + `" readonly>
                                        <button class="quantity-btn">+</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>`

                    vCartRegion.append(productCard);
                });


            }

            function updateQuantity(variantId, type, newQuantity) {
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                const productIndex = cart.findIndex(item => item.variantId === variantId && String(item.type) === type);

                if (productIndex > -1) {
                    if (newQuantity <= 0) {
                        // Nếu số lượng <= 0, xóa sản phẩm
                        cart.splice(productIndex, 1);
                    } else {
                        // Cập nhật số lượng mới
                        cart[productIndex].quantity = newQuantity;
                    }
                    localStorage.setItem('cart', JSON.stringify(cart));
                }
                return cart;
            }

            function removeFromCart(variantId, type) {
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                cart = cart.filter(item => !(item.variantId === variantId && String(item.type) === type));
                localStorage.setItem('cart', JSON.stringify(cart));
                return cart;
            }

            function updateTotalPricePayment() {
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                let totalQuantity = 0;
                let totalPrice = 0;
                cart.forEach(element => {
                    let rawPrice = parseInt(element.priceEach.replace(/[^\d]/g, ''));
                    totalQuantity += parseInt(element.quantity);
                    totalPrice += element.quantity * rawPrice;
                });

                let formattedTotalPrice = totalPrice.toLocaleString('vi-VN') + ' đ';

                $(".total-price").html(formattedTotalPrice);
                $(".total-quantity").html(totalQuantity);
            }


            function onBtnEditProductCartClick(element) {
                let vProductCard = $(element).closest(".product-card");
                gCurrentQuantity = vProductCard.find('.quantity-input').val();
                let vVariantId = vProductCard.attr('id');
                gVariantId = vVariantId;
                callApiToGetDetailsProduct(vVariantId);
                let vType = vProductCard.find("h5").attr("type");
                gType = vType;

                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                let product = cart.find(item => item.variantId === vVariantId && String(item.type) === vType);
                setTimeout(() => {
                    $('#modal-update input[name="type"][value="' + vType + '"]').prop('checked', true);
                    if (vType == 2) {
                        $(".ice-percent").show();
                    }
                    $('#modal-update input[name="ice"][value="' + product.ice + '"]').prop('checked', true);
                    $('#modal-update input[name="sugar"][value="' + product.sugar + '"]').prop('checked', true);
                    $('#modal-update input[name="size"][value="' + product.size + '"]').prop('checked', true);

                }, 20);

                $("#modal-update").modal("show");
            }

            // Call Api to get product data by variantID
            function callApiToGetDetailsProduct(variantId) {
                $.ajax({
                    url: BASE_URL + "/products/findby?variantId=" + variantId,
                    method: "GET",
                    success: function (response) {
                        loadDetailProductToPopupUpdate(response);
                    },
                    error: function (error) {
                        console.error("Error loading products:", error);
                    }
                });
            }

            function loadDetailProductToPopupUpdate(responseProductData) {
                $(".product-name").text(responseProductData.productName);
                var productStatus = responseProductData.isAvailable == true ? "còn" : "hết";
                $(".product-status").text(productStatus);
                var imgUrl = BASE_URL + responseProductData.urlImage;
                $(".product-image").attr('src', imgUrl);

                var vSizeContainer = $(".size-container");
                vSizeContainer.empty();
                $.each(responseProductData.variants, function (index, size) {
                    let price = size.price.toLocaleString('vi-VN') + ' đ';
                    let checked = index === 0 ? 'checked' : '';
                    let vSize = `<div class="size-option">
                                <input variant-id="`+ size.variantId + `" type="radio" name="size" value="` + size.sizeName + `" class="size me-2" ` + checked + `/>
                                <label for="size`+ size.sizeName + `" class="me-2">` + size.sizeName + `</label>
                                <span class="size-price" data-size="`+ size.sizeName + `">` + price + `</span>
                            </div>`
                    vSizeContainer.append(vSize);
                });

                // Display type and ice percent
                resetTypeSelect()

                if (responseProductData.haveType == 1) {
                    $("#label-cool").hide();
                    $("#label-hot input").prop("checked", true).prop('disabled', true);
                } else if (responseProductData.haveType == 2) {
                    $("#label-hot").hide();
                    $(".ice-percent").show();
                    $("#label-cool input").prop("checked", true).prop('disabled', true);
                } else if (responseProductData.haveType == 3) {
                    $("#label-hot input").prop("checked", true);
                }

                let selected = $('input[type=radio][name=size]:checked');
                let selectedPrice = selected.closest('.size-option').find('.size-price').text();
                $('.btn-add').html("Thêm vào giỏ hàng - " + selectedPrice);
                $(".product-price-popup").html(selectedPrice);
            }

            // reset type select
            function resetTypeSelect() {
                const $labelHot = $("#label-hot");
                const $labelCool = $("#label-cool");
                const $inputHot = $("#label-hot input");
                const $inputCool = $("#label-cool input");
                const $icePercent = $(".ice-percent");

                // Reset tất cả về trạng thái mặc định
                $labelHot.show();
                $labelCool.show();
                $inputHot.prop("checked", false).prop("disabled", false);
                $inputCool.prop("checked", false).prop("disabled", false);
                $icePercent.hide();
                $('.ice-options input[name="ice"][value="100"]').prop('checked', true);
                $('.sugar-options input[name="sugar"][value="100"]').prop('checked', true);
            }

            // Function change type ice display ice percent hot is hide it
            function onChangeHaveType(haveType) {
                resetTypeSelect();
                if (haveType == 1) {
                    $("#label-hot input").prop("checked", true);
                } else if (haveType == 2) {
                    $(".ice-percent").show();
                    $("#label-cool input").prop("checked", true);
                }

            }

            // Function update product in cart
            function onBtnUpdateProductCartClick() {
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                // Tìm vị trí sản phẩm cũ (trước khi chỉnh sửa)
                const oldIndex = cart.findIndex(item => item.variantId === gVariantId && String(item.type) === gType);



                //Second: Add new
                let product = getProductDataToUpdateCart();


                const newIndex = cart.findIndex((item, idx) =>
                    item.variantId === product.variantId &&
                    String(item.type) === product.type &&
                    idx !== oldIndex // Không so sánh với chính nó nếu không thay đổi
                );

                if (newIndex > -1) {
                    // TH1: sản phẩm sau chỉnh sửa đã tồn tại → cộng dồn quantity
                    cart[newIndex].quantity += product.quantity;
                    if (oldIndex > -1) {
                        cart.splice(oldIndex, 1); // Xóa sản phẩm cũ
                    }
                } else {
                    // TH2: sản phẩm sau chỉnh sửa là mới hoặc chỉ thay đổi nhưng không trùng ai → cập nhật tại vị trí cũ
                    if (oldIndex > -1) {
                        cart.splice(oldIndex, 1, product); // thay thế tại vị trí cũ
                    } else {
                        cart.push(product); // nếu không có sản phẩm cũ thì thêm mới
                    }
                }

                localStorage.setItem('cart', JSON.stringify(cart));
                $("#modal-update").modal("hide");
                window.location.href = "orderPick.jsp";
            }

            // Hàm lấy thông tin sản phẩm để thêm vào giỏ hàng
            function getProductDataToUpdateCart() {
                var product = {
                    variantId: 0,
                    quantity: 0,
                    productName: "",
                    priceEach: 0,
                    imgUrl: "",
                    type: "",
                    size: "",
                    sugar: "",
                    ice: ""
                }

                product.productName = $(".product-name").html();
                product.quantity = gCurrentQuantity;
                let selectedRadio = $('input[name="size"]:checked');
                product.size = selectedRadio.val(); // "S" hoặc "M"
                product.variantId = selectedRadio.attr('variant-id');
                product.priceEach = $(".product-price-popup").html();
                product.imgUrl = $("#img-product-selected").attr("src");
                product.type = $('input[name = "type"]:checked').val();
                let icePercent = $('input[name = "ice"]:checked').val();
                product.ice = product.type == 2 ? icePercent : "-1";
                product.sugar = $('input[name = "sugar"]:checked').val();

                return product;
            }

            // Function get order data
            function getOrderData() {
                let cart = JSON.parse(localStorage.getItem('cart')) || [];
                console.log(cart);
                if (cart.length == 0) {
                    return null;
                }
                let vOrderList = [];
                $.each(cart, function (index, item) {
                    let vItem = {
                        productVariantId: item.variantId,
                        quantity: item.quantity,
                        type: item.type == 1 ? "HOT" : "ICE",
                        percentIce: item.ice,
                        percentSugar: item.sugar
                    };
                    vOrderList.push(vItem);

                });
                return vOrderList;
            }
        });
    </script>
</body>

</html>