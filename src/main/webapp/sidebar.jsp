<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <title>v</title>
    <link rel="stylesheet" href="css/side_bar.css">
</head>
<body>
<%--<div id="wrapper">--%>
<%--    <div id="sidebar-wrapper">--%>
<%--        <div class="sidebar-nav nav-pills nav-stacked" id="menu">--%>


<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<nav id="wrapper" class="collapse d-lg-block sidebar bg-light">
    <div id="sidebar-wrapper">
        <div class="position-sticky">

            <div class=" sidebar-nav nav-pills nav-stacked" id="menu list-group list-group-flush mx-3 mt-4">

                <a href="admin" class="list-group-item list-group-item-action py-2 ripple">
                    <span>
                         <i class="fa fa-dashboard fa-stack-1x"></i>
                    </span>
                    Dashboard
                </a>

                <a href="doanhThuTheoThu" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="bi bi-pie-chart"></i>
                    <span>Danh thu các ngày</span>
                </a>
                <a href="doanhThuTheoThang" class="list-group-item list-group-item-action py-2 ripple">

                    <span><i class="bi bi-bar-chart-line"></i></span>
                    Doanh thu tháng
                </a>
                <a href="hoaDon" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-file-invoice-dollar fa-fw me-2"></i>
                    <span>Hóa Đơn</span>
                </a>
                <a href="managerAccount" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-user-circle fa-fw me-2"></i>
                    <span>Quản lý tài khoản</span>
                </a>
                <a href="test" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-shoe-prints fa-fw me-2"></i>
                    <span>Quản lý sản phẩm</span>
                </a>
                <a href="category" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-shoe-prints fa-fw me-2"></i>
                    <span>Quản lý loại sản phẩm</span>
                </a>
                <a href="top10" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-shoe-prints fa-fw me-2"></i>
                    <span>Top 10 sản phẩm</span>
                </a>
                <a href="top5khachhang" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-user-circle fa-fw me-2"></i>
                    <span>Top 5 khách hàng</span>
                </a>
                <a href="top5nhanvien" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-user-circle fa-fw me-2"></i>
                    <span>Top 5 nhân viên</span>
                </a>
                <a href="managerSupplier" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="fas fa-parachute-box fa-fw me-2"></i>
                    <span>Quản lý nhà cung cấp</span>
                </a>
                <a href="home" class="list-group-item list-group-item-action py-2 ripple">
                    <i class="bi bi-reply-fill"></i>
                    <span>Quay về trang chủ</span>
                </a>
                <img style="height: 400px; width: 400px; margin-left: -90px" src="images/v.svg"/>
            </div>
        </div>
    </div>
</nav>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-q1rSRCX67Z9tJvEbsFiV2UujZshLMTI9gFyUy3u/ETfbwxSmQFJd6Fuy0VeaXutN"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy/okC5c9cHcWJCm8uqqU5o9RFl6zAeY9M"
        crossorigin="anonymous"></script>
</body>
</html>


