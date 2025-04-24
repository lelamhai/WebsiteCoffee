<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Báo cáo</title>
    <link rel="stylesheet" href="css/style_menu.css" />
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />
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
            overflow: hidden;
            /* Ẩn phần hình ảnh vượt quá khung */
            position: relative;
            /* Để định vị tuyệt đối hình ảnh bên trong */
        }

        .preview-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            /* Scale hình ảnh để lấp đầy khung, cắt phần dư */
            object-position: center;
            /* Đảm bảo tâm của hình ảnh ở giữa */
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
                <img src="imgs/Logo.png" alt="alt" />
            </a>
        </div>

        <div class="wrap-order-button" style="display: flex; justify-content: center;">
            <div class="order-button">
                <a href="order" style="text-decoration: none;">Đặt hàng</a>
            </div>
        </div>
        <div class="wrap-nav">
            <div class="nav-item nav-category" hidden>
                <a href="category">
                    <i class="bi bi-grid"></i>
                    Danh mục
                </a>
            </div>
            <div class="nav-item nav-product">
                <a href="product">
                    <i class="bi bi-cup-straw"></i>
                    Sản phẩm
                </a>
            </div>

            <div class="nav-item nav-order">
                <a href="processing">
                    <i class="bi bi-cart"></i>
                    Đơn hàng
                </a>

            </div>

            <div class="nav-item active nav-report">
                <a href="report">
                    <i class="bi bi-bar-chart"></i>
                    Báo cáo
                </a>
            </div>
            <div class="nav-item nav-account" hidden>
                <a href="account">
                    <i class="bi bi-people"></i>
                    Tài Khoản
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
                <span class="fw-medium">Báo cáo</span>
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
                    <img src="imgs/bill.png" alt="alt" />
                </div>

                <div class="text-report">
                    <div id="total-order-quantity" class="number-report">200.000</div>
                    <div class="title-report">Số lượng đơn hàng</div>
                </div>
            </div>

            <div class="wrap-report">
                <div class="img-report">
                    <img src="imgs/revenue.png" alt="alt" />
                </div>

                <div class="text-report">
                    <div id="revenue" class="number-report">20.000 triệu</div>
                    <div class="title-report">Doanh thu</div>
                </div>
            </div>

            <div class="wrap-report">
                <div class="img-report">
                    <img src="imgs/salary.png" alt="alt" />
                </div>

                <div class="text-report">
                    <div id="profit" class="number-report">10.000 triệu</div>
                    <div class="title-report">Lợi nhuận</div>
                </div>
            </div>

            <div class="wrap-report">
                <div class="img-report">
                    <img src="imgs/salary.png" alt="alt" />
                </div>

                <div class="text-report">
                    <div id="avg-price" class="number-report">10.000 triệu</div>
                    <div class="title-report">Giá trị trung bình một đơn</div>
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
            <div class="wrap-control-chart"
                style="display: flex;justify-content: space-between;padding: 10px 0 30px 0;">
                <h5>Biểu đồ</h5>
                <div class="wrap-date-report">
                    <div id="datepicker" class="date" data-date-format="mm-dd-yyyy">
                        <input class="form-control" type="text" style="width: 150px;" readonly />
                        <span class="input-group-addon" style="position: absolute; right: 15px;">
                            <i class="bi bi-calendar3"></i>
                        </span>
                    </div>

                    <select id="select-type-report" class="form-select" style="width: 100px; margin-left: 30px;">
                        <option value="daily">Ngày</option>
                        <option value="weekly">Tuần</option>
                        <option value="monthly">Tháng</option>
                        <option value="yearly">Năm</option>
                    </select>
                </div>
            </div>


            <div style="width: 100%; height: 400px;">
                <canvas id="myChart"></canvas>
            </div>
        </div>
        
        <div class="content-area">
            <div style="width: 100%;">
                <h5>Top sản phẩm bán chạy</h5>
                <table id="table-top-selling-product" class="warp-table">
                    <thead class="table-header">
                        <tr>
                            <th>Xếp hạng</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng đã bán</th>
                            <th>Doanh thu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Nội dung 1</td>
                            <td>Nội dung 2</td>
                            <td>Nội dung 3</td>
                            <td>Nội dung 4</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.vi.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="js/action.js?v=" + new Date().getTime()></script>

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
        // VÙNG 1: KHAI BÁO BIẾN & CẤU HÌNH
        const REPORT_TYPE = {
            DAILY: 'daily',
            WEEKLY: 'weekly',
            MONTHLY: 'monthly',
            YEARLY: 'yearly'
        };

        // VÙNG 2: KHỞI TẠO & THIẾT LẬP SỰ KIỆN
        $(document).ready(function () {
            navigateToCorrectPage();
            // Khởi tạo datepicker
            $('#datepicker').datepicker({
                language: 'vi',
                format: 'dd/mm/yyyy',
                autoclose: true,
                todayHighlight: true
            }).datepicker('setDate', new Date())
                .on('changeDate', handleDateChange);

            // Thiết lập sự kiện chọn loại báo cáo
            $("#select-type-report").on("change", loadReport);
            
            // Khởi tạo biểu đồ
            initializeChart();

            // Tải báo cáo ban đầu
            loadReport();
        });

        // VÙNG 3: CÁC HÀM XỬ LÝ SỰ KIỆN
        function handleDateChange() {
            loadReport();
        }

        // VÙNG 4: CÁC HÀM XỬ LÝ CHÍNH
        function loadReport() {
            const selectedDate = $('#datepicker input').val();
            const reportType = $("#select-type-report").val();

            Promise.all([
                fetchReportStatistics(selectedDate, reportType),
                fetchChartData(selectedDate, reportType),
                fetchTopSellingProduct(selectedDate, reportType)
            ]).catch(error => {
                console.error('Đã xảy ra lỗi khi tải báo cáo:', error);
            });
        }

        function fetchReportStatistics(dateview, type) {
            let vHeaders = {
                Authorization: "Token " + getCookie("token")
            };
            return $.ajax({
                url: gBASE_URL + `/statistics/report/overview`,
                method: "GET",
                headers: vHeaders,
                data: { dateview, type },
                dataType: 'json'
            })
                .then(updateStatistics)
                .catch(error => {
                    console.error('Lỗi khi tải thống kê báo cáo:', error);
                    if (error.status === 403) {
                        deleteCookie("token");
                        window.location.href = "login";
                    }
                });
        }

        function fetchChartData(dateview, type) {
            let vHeaders = {
                Authorization: "Token " + getCookie("token")
            };
            return $.ajax({
                url: gBASE_URL + `/statistics/report/chart`,
                method: 'GET',
                headers: vHeaders,
                data: { dateview, type },
                dataType: 'json'
            })
                .then(updateChart)
                .catch(error => {
                    if (error.status === 403) {
                        deleteToken("token");
                        window.location.href = "login";
                    }
                });
        }
        
        function fetchTopSellingProduct(dataview, type) {
            let vHeaders = {
                Authorization: "Token " + getCookie("token")
            };
             const [day, month, year] = dataview.split("/").map(Number);
            const date = new Date(year, month - 1, day);

            let startDate, endDate;

            switch (type) {
                case 'daily':
                    startDate = dataview;
                    endDate = dataview;
                    break;

                case 'weekly':
                    const dayOfWeek = date.getDay(); // 0 (CN) đến 6 (T7)
                    const diffToMonday = dayOfWeek === 0 ? -6 : 1 - dayOfWeek;
                    const monday = new Date(date);
                    monday.setDate(date.getDate() + diffToMonday);

                    const sunday = new Date(monday);
                    sunday.setDate(monday.getDate() + 6);

                    startDate = formatDateToDDMMYYYY(monday);
                    endDate = formatDateToDDMMYYYY(sunday);
                    break;

                case 'monthly':
                    const firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
                    const lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

                    startDate = formatDateToDDMMYYYY(firstDay);
                    endDate = formatDateToDDMMYYYY(lastDay);
                    break;

                case 'yearly':
                    const startOfYear = new Date(date.getFullYear(), 0, 1);
                    const endOfYear = new Date(date.getFullYear(), 11, 31);

                    startDate = formatDateToDDMMYYYY(startOfYear);
                    endDate = formatDateToDDMMYYYY(endOfYear);
                    break;

                default:
                    console.error("Invalid typeDate");
                    return;
            }
            console.log(startDate);
            console.log(endDate);
            $.ajax({
                url: gBASE_URL + `/statistics/top-selling-products?startDate=` + startDate + `&endDate=` + endDate + `&sortType=QUANTITY`,
                method: 'GET',
                success: function(response) {
                    loadTopSellingProductToTable(response);
                },
                error: function(error) {
                    console.log(error.responseText);
                } 
            })
        }

        // VÙNG 5: CÁC HÀM TIỆN ÍCH & CẬP NHẬT GIAO DIỆN
        function updateStatistics(reportData) {
            const formatCurrency = value => value.toLocaleString('vi-VN');

            $("#total-order-quantity").text(formatCurrency(reportData.totalOrderQuantity));
            $("#revenue").text(formatCurrency(Math.round(reportData.revenue)) + `đ`);
            $("#profit").text(formatCurrency(Math.round(reportData.profit)) + `đ`);
            $("#avg-price").text(formatCurrency(Math.round(reportData.avgOrderValue)) + `đ`);
        }
        
        function initializeChart() {
            const ctx = document.getElementById('myChart').getContext('2d');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['T.2', 'T.3', 'T.4', 'T.5', 'T.6', 'T.7', 'CN'],
                    datasets: [
                        {
                            label: 'Doanh thu',
                            backgroundColor: '#D1245E',
                            data: [1, 5, 10, 15, 20, 50, 40],
                            borderWidth: 1
                        },
                        {
                            label: 'Lợi nhuận',
                            backgroundColor: '#2961F0',
                            data: [1, 2, 10, 15, 20, 40, 30],
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        }

        function updateChart(data) {
            const chartInstance = Chart.getChart('myChart');
            if (!chartInstance) {
                console.error('Không tìm thấy biểu đồ với ID myChart');
                return;
            }

            // Cập nhật dữ liệu biểu đồ
            chartInstance.data.labels = data.map(item => item.period);
            chartInstance.data.datasets[0].data = data.map(item => item.revenue);
            chartInstance.data.datasets[1].data = data.map(item => item.profit);

            // Vẽ lại biểu đồ
            chartInstance.update();
        }
        
            function navigateToCorrectPage() {
                const token = getCookie("token");
                if (token && isTokenValid(token)) {
                    const role = getUserRoleFromToken(token);
                    
                    switch (role) {
                        case "ADMIN":
                            $(".nav-account").attr("hidden", false);
                            $(".nav-category").attr("hidden", false);

                            break;
                        case "STAFF":
                            window.location.href = "order";
                            break;
                        case "MANAGER":
                            break;
                        default:
                            alert("Không xác định được quyền người dùng!");
                            window.location.href = "login";
                    }
                }
                else {
                    window.location.href = "login";
                }
            }
            
            function deleteCookie(name) {
                document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
            }
            
            function loadTopSellingProductToTable(topProductData) {
                let vTableBody = $("#table-top-selling-product tbody");
                vTableBody.empty();
                if (topProductData.length == 0) {
                    vTableBody.empty().append('<tr><td colspan="5">Chưa có sản phẩm nào được bán ra</td></tr>');
                    return;
                }
                
                $.each(topProductData, function(index, product) {
                    let formattedTotalRevenue = Number(product.productRevenue).toLocaleString('vi-VN');
                    let vRow = `
                    <tr>
                        <td>`+ (index + 1) + `</td>
                        <td>`+ product.productName + `</td>
                        <td>`+ product.quantitySold + ` sản phẩm</td>
                        <td>`+ formattedTotalRevenue + `đ</td>
                    </tr>`;
                    vTableBody.append(vRow);
                });
            }
    </script>


</body>

</html>