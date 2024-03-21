<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Home Page</title>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">


    <!-- Custom styles -->
    <link rel="stylesheet" href="css/style.css"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    Font Awesome
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    Bootstrap core CSS
    <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">


    <style>
        .nav1{
            margin-left: 600px;
        }
        .nav {
            min-height: 60px;
            display: flex;
            justify-content: flex-end;
            background-color: #343a40;
        }


        .nav-list {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .nav-item {
            display: inline-block;
            margin: 0 15px;
        }

        .nav-link {
            text-decoration: none;
            font-size: 18px;
            color: #fff;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #ffcc00;
            background-color: #00b74a;
        }

        .nav-item:last-child {
            margin-right: 0;
        }


        .navbar-brand {
            font-size: 24px;
            color: #fff;
            text-decoration: none;
        }

        .navbar-brand:hover {
            color: #ffcc00;
        }


        /* Carousel styling */
        #introCarousel,
        .carousel-inner,
        .carousel-item,
        .carousel-item.active {
            height: 100vh;
        }

        .carousel-item:nth-child(1) {
            background-image: url('images/1.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-position: center center;
        }

        .carousel-item:nth-child(2) {
            background-image: url('images/2.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-position: center center;
        }

        .carousel-item:nth-child(3) {
            background-image: url('images/4.png');
            background-repeat: no-repeat;
            background-size: 100% 100%;
            background-position: center center;
        }

        @media (min-width: 992px) {
            #introCarousel {
                margin-top: -58.59px;
            }
        }

        .navbar .nav-link {
            color: #fff !important;
        }
    </style>

</head>
<body class="skin-light" onload="loadAmountCart()">
<jsp:include page="header.jsp"></jsp:include>


<!-- Carousel wrapper -->
<div id="introCarousel" class="carousel slide carousel-fade shadow-2-strong" data-mdb-ride="carousel"
     style="margin-top:35px;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-mdb-target="#introCarousel" data-mdb-slide-to="0" class="active"></li>
        <li data-mdb-target="#introCarousel" data-mdb-slide-to="1"></li>
        <li data-mdb-target="#introCarousel" data-mdb-slide-to="2"></li>
    </ol>

    <!-- Inner -->
    <div class="carousel-inner">
        <!-- Single item -->
        <div class="carousel-item active">

        </div>

        <!-- Single item -->
        <div class="carousel-item">

        </div>

        <!-- Single item -->
        <div class="carousel-item">

        </div>
    </div>
    <!-- Inner -->

    <!-- Controls -->
    <a class="carousel-control-prev" href="#introCarousel" role="button" data-mdb-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#introCarousel" role="button" data-mdb-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- Carousel wrapper -->


<div class="card-group" style="margin-top:50px;">
    <div class="card" style="border-style: none;">
        <img style="height:200px; width:250px; margin: auto;" src="images/f11.gif">
        <div class="card-body">
            <h5 class="card-title" style="text-align:center">GIAO HÀNG TOÀN QUỐC</h5>
        </div>
    </div>
    <div class="card" style="border-style: none;">
        <img class="card-img-top" style="height:200px; width:250px; margin: auto;" src="images/f21.gif"
             alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title" style="text-align:center">THANH TOÁN KHI NHẬN HÀNG</h5>
        </div>
    </div>
    <div class="card" style="border-style: none;">
        <img class="card-img-top" style="height:200px; width:250px; margin: auto;" src="images/f3.gif"
             alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title" style="text-align:center">BẢO HÀNH DÀI HẠN</h5>
        </div>
    </div>
    <div class="card" style="border-style: none;">
        <img class="card-img-top" style="height:200px; width:250px; margin: auto;" src="images/f41.gif"
             alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title" style="text-align:center">ĐỔI HÀNG DỄ DÀNG</h5>
        </div>
    </div>
</div>


<div class="container">


    <div class="row" style="margin-top:25px">
        <h1 style="text-align:center; width:100%" id="moiNhat">SẢN PHẨM MỚI NHẤT</h1>
        <div class="col-sm-12">
            <div id="contentMoiNhat" class="row">
                <c:forEach items="${list8Last}" var="o">
                    <div class=" col-12 col-md-6 col-lg-3">
                        <div class="card">
                            <div class="view zoom z-depth-2 rounded">
                                <img class="img-fluid w-100" src="${o.image}" alt="Card image cap">

                            </div>
                            <div class="card-body">
                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}"
                                                                   title="View Product">${o.name}</a></h4>
                                <p class="card-text show_txt">${o.title}</p>
                                <div class="row">
                                    <div class="col">
                                        <p class="btn btn-success btn-block">${o.price} $</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>

    </div>


    <div class="row" style="margin-top:25px">
        <h1 style="text-align:center; width:100%" id="nike">MẪU IPHONE MỚI NHẤT</h1>
        <div class="col-sm-12">
            <div id="contentSamsung" class="row">
                <c:forEach items="${list4SamsungLast}" var="o">
                    <div class="productSamsung col-12 col-md-6 col-lg-3">
                        <div class="card">
                            <div class="view zoom z-depth-2 rounded">
                                <img class="img-fluid w-100" src="${o.image}" alt="Card image cap">
                            </div>
                            <div class="card-body">
                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}"
                                                                   title="View Product">${o.name}</a></h4>
                                <p class="card-text show_txt">${o.title}</p>
                                <div class="row">
                                    <div class="col">
                                        <p class="btn btn-success btn-block">${o.price} $</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button onclick="loadMoreNike()" class="btn btn-primary">Load more</button>
        </div>
    </div>


    <div class="row" style="margin-top:25px">
        <h1 style="text-align:center; width:100%" id="adidas">MẪU SAMSUNG MỚI NHẤT</h1>
        <div class="col-sm-12">
            <div id="contentIPhone" class="row">
                <c:forEach items="${list4IPhoneLast}" var="o">
                    <div class="productIPhone col-12 col-md-6 col-lg-3">
                        <div class="card">
                            <div class="view zoom z-depth-2 rounded">
                                <img class="img-fluid w-100" src="${o.image}" alt="Card image cap">
                            </div>
                            <div class="card-body">
                                <h4 class="card-title show_txt"><a href="detail?pid=${o.id}"
                                                                   title="View Product">${o.name}</a></h4>
                                <p class="card-text show_txt">${o.title}</p>
                                <div class="row">
                                    <div class="col">
                                        <p class="btn btn-success btn-block">${o.price} $</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <button onclick="loadMoreIPhone()" class="btn btn-primary">Load more</button>
        </div>
    </div>


    <div class="row" style="margin-top:50px">
        <div class="col-sm-12">
            <div id="content" class="row">
                <div class=" col-12 col-md-12 col-lg-6">
                    <div class="card-body">
                        <h4 class="card-title show_txt" style="text-align:center; font-size:18pt; color:#b57b00;">About
                            Me</h4>
                        <h2 class="card-title show_txt" style="text-align:center; font-size:24pt;">I'm Le Thanh Viet</h2>
                        <p style="text-align:center;">I'm currently studying at Bach Khoa Da Nang University</p>

                    </div>
                </div>
                <div class=" col-12 col-md-12 col-lg-6">
                    <img class="card-img-top" src="images/v.gif" alt="Card image cap">
                </div>
            </div>
        </div>
    </div>


</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

    function loadMore() {
        var amount = document.getElementsByClassName("product").length;
        $.ajax({
            url: "/load",
            type: "get", //send it through get method
            data: {
                exits: amount
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML += data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function loadMoreNike() {
        var amountNike = document.getElementsByClassName("productSamsung").length;
        $.ajax({
            url: "/loadSamsung",
            type: "get",
            data: {
                exitsNike: amountNike
            },
            success: function (dataNike) {
                document.getElementById("contentSamsung").innerHTML += dataNike;

            },
            error: function (xhr) {

            }
        });
    }

    function loadMoreIPhone() {
        var amountAdidas = document.getElementsByClassName("productIPhone").length;
        $.ajax({
            url: "/loadIPhone",
            type: "get", //send it through get method
            data: {
                exitsAdidas: amountAdidas
            },
            success: function (dataAdidas) {
                document.getElementById("contentIPhone").innerHTML += dataAdidas;

            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchByName(param) {
        var txtSearch = param.value;
        $.ajax({
            url: "/searchAjax",
            type: "get", //send it through get method
            data: {
                txt: txtSearch
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function load(cateid) {
        $.ajax({
            url: "/category",
            type: "get", //send it through get method
            data: {
                cid: cateid
            },
            success: function (responseData) {
                document.getElementById("content").innerHTML = responseData;
            }
        });
    }

    function loadAmountCart() {
        $.ajax({
            url: "/loadAllAmountCart",
            type: "get", //send it through get method
            data: {},
            success: function (responseData) {
                document.getElementById("amountCart").innerHTML = responseData;
            }
        });
    }
</script>


<!-- MDB -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<!-- Custom scripts -->
<script type="text/javascript" src="js/script.js"></script>

<!-- JQuery -->
<script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
<!-- MDB Ecommerce JavaScript -->
<script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
</body>
</html>

