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
        <title>POPUP</title>
        <title>Danh sách Menu</title>
        <link rel="stylesheet" href="css/style_menu.css"/>
        <!-- Bootstrap 5 CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>
        <!-- Sidebar -->


        <!-- Main Content -->
        <div class="main-content">
            <!-- Top Header -->

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
                        <!--///////////////////////////////////////-->
                        <button class="btn btn-primary add-button mb-2" data-bs-toggle="modal" data-bs-target="#create-modal">
                            <i class="bi bi-plus"></i> Thêm
                        </button>
                    </div>
                </div>

                <!-- Table -->

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


        <!--////////////////////////////////////////////////////////////////-->
        <style>
            .product-info {
                /* Loại bỏ flexbox để các dòng tự do chiếm không gian */
            }
            .product-name {
                margin-bottom: 0.5rem; /* Khoảng cách nhỏ dưới tên */
                font-weight: bold; /* Làm nổi bật tên */
            }
            .product-price {
                margin-bottom: 0.5rem; /* Khoảng cách nhỏ dưới giá */
                font-weight: bold; /* Làm nổi bật giá */
            }
            .product-status {
                margin-bottom: 0.5rem; /* In nghiêng trạng thái */
                font-weight: bold; /* Làm nổi bật tính trạng */
            }

            /*Style cho tiêu đề Kích cỡ///////////////////////////////////*/
            .size-container {
                gap: 15px; /* Khoảng cách giữa các size-option */
            }

            .size-option {
                display: flex; /* Để căn chỉnh input, label và span trên cùng dòng */
                align-items: center; /* Căn chỉnh dọc các phần tử */
            }

            .size-price {
                display: block; /* Hiển thị giá trên dòng riêng */
                margin-left: auto; /* Đẩy giá về bên phải (nếu muốn) */
            }

            /* Tùy chỉnh khoảng cách giữa các radio button nếu cần thiết */
            .me-2 {
                margin-right: 1rem !important; /* Tăng khoảng cách bên phải */
            }

            .size-title {
                background-color: #e0f2f7; /* Màu xanh nhạt (tùy chỉnh) */
                padding: 5px 10px; /* Khoảng trắng bên trong khung */
                border-radius: 5px; /* Bo tròn góc (tùy chọn) */
                margin-bottom: 1rem; /* Tạo khoảng cách với các tùy chọn bên dưới */
                /*display: inline-block; /* Chỉ chiếm vừa đủ không gian của nội dung */
            }

            /* Style cho tiêu đề "Đường" /////////////////////////*/
            .sugar-title {
                background-color: #e0f2f7; /* Màu xanh nhạt (tùy chỉnh) */
                padding: 5px 10px; /* Khoảng trắng bên trong khung */
                border-radius: 5px; /* Bo tròn góc (tùy chọn) */
                margin-bottom: 1rem; /* Tạo khoảng cách với các tùy chọn bên dưới */
                /*display: inline-block; /* Chỉ chiếm vừa đủ không gian của nội dung */
            }

            /* Tăng khoảng cách giữa các radio button và label */
            .sugar-option {
                margin-bottom: 0.5rem; /* Khoảng cách giữa các tùy chọn đường */
                display: block; /* Mỗi tùy chọn trên một dòng */
            }

            .me-2 {
                margin-right: 0.5rem !important; /* Khoảng cách bên phải input radio */
            }

        </style>

        <!--////////////////////////////////////////////////////////////////-->
        <!--Modals create-->    
        <div class="modal fade right" id="create-modal" tabindex="-1" aria-hidden="true">
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
                    <div class="modal-body" >
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <img
                                    src="imgs/product-image.png"
                                    alt="[Tên sản phẩm]"
                                    class="img-fluid"
                                    style="max-width: 100%; height: auto; object-fit: contain; transform: scale(1.2);"
                                    />
                            </div>
                            <div class="col-md-8 product-info">
                                <h6 class="product-name">[Tên sản phẩm]</h6>
                                <p class="product-price">[Giá sản phẩm]</p>
                                <p class="product-status">[Tình trạng]</p>
                            </div>
                        </div>

                        <!-- comment khi có sai xót
                        <div class="row align-items-stretch">
                            <div class="col-auto">
                                <img
                                    src="imgs/product-image.png"
                                    alt="Cà phê đen"
                                    class="img-fluid"
                                    style="max-width: 150px; height: auto"
                                    />
                            </div>
                            <div class="col product-info d-flex flex-column justify-content-between">
                                <h6>Cà phê đen (Nóng)</h6>
                                <p>30.000đ</p>
                                <p>Còn</p>
                            </div>
                        </div>
                        -->

                        <!-- kích cỡ -->
                        <div class="mb-3 mt-3">
                            <h6 class="size-title">Kích cỡ</h6>
                            <div class="size-container d-flex flex-column">
                                <!-- S -->
                                <div class="size-option mb-2">
                                    <input type="radio" name="size" value="S" id="sizeS" class="me-2"/>
                                    <label for="sizeS" class="me-2">S</label>
                                    <span class="size-price" data-size="S">0đ</span>
                                </div>
                                <!-- M -->
                                <div class="size-option">
                                    <input type="radio" name="size" value="M" id="sizeM" class="me-2"/>
                                    <label for="sizeM" class="me-2">M</label>
                                    <span class="size-price" data-size="M">5.000đ</span>
                                </div>
                                <!-- L -->
                                <div class="size-option">
                                    <input type="radio" name="size" value="L" id="sizeL" class="me-2"/>
                                    <label for="sizeL" class="me-2">L</label>
                                    <span class="size-price" data-size="L">10.000đ</span>
                                </div>
                            </div>
                        </div>

                        <!-- Đường -->
                        <div class="mb-3">
                            <h6 class="sugar-title">Đường</h6>
                            <div class="sugar-options">
                                <label class="sugar-option">
                                    <input type="radio" name="sugar" value="100" class="me-2">
                                    100%
                                </label><br>
                                <label class="sugar-option">
                                    <input type="radio" name="sugar" value="50" class="me-2">
                                    50%
                                </label><br>
                                <label class="sugar-option form-check-label">
                                    <input type="radio" name="sugar" value="0" class="me-2">
                                    0%
                                </label>
                            </div>



                        </div>
                    </div>

                    <!--Modal - footer - OK--> 
                    <div class="modal-footer">
                        <button type="button" class="btn btn-add btn-primary w-100 btn-continue rounded-pill" onclick="addToCart()">Thêm vào giỏ hàng - 30.000đ</button>
                        <!--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: #1F75FF">Thêm vào giỏ hàng - 30.000đ</button>-->
                    </div>
                </div>
            </div>
        </div>
        <!--////////////////////////////////////////////////////////////////-->


        <!--modal edit-->

        <div class="modal fade right" id="edit-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="height: 100%;">

                    <div class="modal-header">
                        <div class="wrap-header-modal">
                            <h5>Chi tiết món</h5>
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
                            document.querySelector('.mobile-menu-toggle')?.addEventListener('click', function () {
                                const sidebar = document.querySelector('.sidebar');
                                if (sidebar.style.width === '200px') {
                                    sidebar.style.width = '0';
                                } else {
                                    sidebar.style.width = '200px';
                                }
                            });
        </script>

        <script>
            $(document).ready(function () {
                $('.action-button').click(function (e) {
                    e.preventDefault(); // Ngăn hành vi mặc định nếu cần
                    const productName = $(this).closest('tr').find('.name-product').html();
                    const productId = $(this).closest('tr').find('.id-product').html();
                    $('#ProductNameJquery').html(productName);
                });
            });

            $(document).ready(function () {
                let currentDeleteId = null;

                $(document).on('click', '.delete-btn', function (e) {
                    e.preventDefault();
                    const itemId = $(this).data('id');
                    currentDeleteId = itemId;
                });


                $('.btn-confirm').click(function () {
                    if (currentDeleteId) {
                        $.ajax({
                            url: 'menu',
                            type: 'POST',
                            data: {
                                productID: currentDeleteId
                            },
                            dataType: 'json',
                            success: function (response) {
                                if (response.status === 'success') {
                                    console.log(response.message);
                                    location.reload();
                                } else {
                                    console.log(response.status);
                                }
                            },
                            error: function () {
                                console.log(response.status);
                            }
                        });
                    }

                    currentDeleteId = null;
                });

                // Xử lý khi click Cancel
                $('.cancel-btn').click(function () {
                    currentDeleteId = null;
                    $('#confirmDeleteModal').modal('close');
                });
            });
        </script>

    </body>
</html>
