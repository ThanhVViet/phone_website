<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>V</title>
    <!-- Roboto Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>


    <!-- Custom styles -->
    <link rel="stylesheet" href="css/style.css"/>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">

    <style>

        .nav {
            min-height: 60px;
            display: flex;
            justify-content: flex-end;
            background-color: #343a40;
            padding: 10px;
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


    </style>

</head>

<body class="skin-light" onload="loadAmountCart()">

<!--Main Navigation-->
<header>

    <jsp:include page="header.jsp"></jsp:include>

</header>
<!--Main Navigation-->

<!--Main layout-->
<main>
    <div class="container" style="margin-top:100px">

        <!--Grid row-->
        <div class="row mt-5">

            <!--Grid column-->
            <div class="col-md-4 mb-4">

                <!-- Section: Sidebar -->
                <section>

                    <!-- Section: Categories -->
                    <section>

                        <h5>Categories</h5>

                        <div class="text-muted small text-uppercase mb-5">
                            <c:forEach items="${listCC}" var="o">
                                <p class="mb-3"><a onclick="load(${o.cid})" class="card-link-secondary">${o.cname}</a>
                                </p>
                            </c:forEach>
                        </div>

                    </section>
                    <!-- Section: Categories -->

                    <!-- Section: Filters -->
                    <section>

                        <h5 class="pt-2 mb-4">Filters</h5>

                        <section class="mb-4">
                            <div class="md-form md-outline mt-0 d-flex justify-content-between align-items-center">
                                <input onkeyup="searchByName(this)" value="${txtS}" name="txt" type="text"
                                       class="form-control mb-0" placeholder="Search...">
                                <a href="#!" class="btn btn-flat btn-md px-3 waves-effect"><i
                                        class="fas fa-search fa-lg"></i></a>
                            </div>
                        </section>


                        <!-- Section: Price -->
                        <section class="mb-4">

                            <h6 class="font-weight-bold mb-3">Price</h6>

                            <div class="form-check pl-0 mb-3">
                                <input onchange="searchByPriceUnder100()" type="radio" class="form-check-input"
                                       id="under100" name="materialExampleRadios">
                                <label class="form-check-label small text-uppercase card-link-secondary" for="under100">Under
                                    $100</label>
                            </div>
                            <div class="form-check pl-0 mb-3">
                                <input onchange="searchByPrice100To200()" type="radio" class="form-check-input"
                                       id="100200" name="materialExampleRadios">
                                <label class="form-check-label small text-uppercase card-link-secondary" for="100200">$100
                                    to
                                    $200</label>
                            </div>
                            <div class="form-check pl-0 mb-3">
                                <input onchange="searchByPriceAbove200()" type="radio" class="form-check-input"
                                       id="200above" name="materialExampleRadios">
                                <label class="form-check-label small text-uppercase card-link-secondary" for="200above">$200
                                    &
                                    Above</label>
                            </div>
                            <form>
                                <div class="d-flex align-items-center mt-4 pb-1">
                                    <div class="md-form md-outline my-0">
                                        <input oninput="searchByPriceMinToMax()" id="priceMin" type="text"
                                               class="form-control mb-0">
                                        <label for="priceMin">$ Min</label>
                                    </div>
                                    <p class="px-2 mb-0 text-muted"> - </p>
                                    <div class="md-form md-outline my-0">
                                        <input oninput="searchByPriceMinToMax()" id="priceMax" type="text"
                                               class="form-control mb-0">
                                        <label for="priceMax">$ Max</label>
                                    </div>
                                </div>
                            </form>

                        </section>
                        <!-- Section: Price -->


                        <!-- Section: Color -->
                        <section class="mb-4">

                            <h6 class="font-weight-bold mb-3">Color</h6>

                            <div class="btn-group btn-group-toggle btn-color-group d-block mt-n2 ml-n2"
                                 data-toggle="buttons">
                                <label class="btn rounded-circle white border-inset-grey p-3 m-2">
                                    <input onchange="searchByColorWhite()" type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle grey p-3 m-2">
                                    <input onchange="searchByColorGray()" type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle black p-3 m-2">
                                    <input onchange="searchByColorBlack()" type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle green p-3 m-2">
                                    <input type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle blue p-3 m-2">
                                    <input type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle purple p-3 m-2">
                                    <input type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle yellow p-3 m-2">
                                    <input onchange="searchByColorYellow()" type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle indigo p-3 m-2">
                                    <input type="checkbox" checked autocomplete="off">
                                </label>
                                <label class="btn rounded-circle red p-3 m-2">
                                    <input type="checkbox" autocomplete="off">
                                </label>
                                <label class="btn rounded-circle orange p-3 m-2">
                                    <input type="checkbox" autocomplete="off">
                                </label>
                            </div>

                        </section>
                        <!-- Section: Color -->

                    </section>
                    <!-- Section: Filters -->

                </section>
                <!-- Section: Sidebar -->

            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-8 mb-4">

                <!-- Section: Block Content -->
                <section class="mb-3">

                    <div class="row d-flex justify-content-around align-items-center">
                        <div class="col-12 col-md-3 text-center text-md-left">
                            <a href="#!" class="text-reset"><i class="fas fa-th-list fa-lg mr-1"></i></a>
                            <a href="#!" class="text-reset"><i class="fas fa-th-large fa-lg"></i></a>

                        </div>
                        <div class="col-12 col-md-5">
                            <div class="d-flex flex-wrap">
                                <div class="select-outline position-relative w-100">
                                    <select class="mdb-select md-outline md-form" searchable="Search here..">
                                        <option value="" disabled selected>Choose category</option>
                                        <option value="1">Category 1</option>
                                        <option value="2">Category 2</option>
                                        <option value="3">Category 3</option>
                                        <option value="4">Category 4</option>
                                        <option value="5">Category 5</option>
                                    </select>
                                    <label>Tất cả sản phẩm</label>
                                    <button class="btn-save btn btn-primary btn-sm mt-2">Save</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 text-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination pagination-circle justify-content-center float-md-right mb-0">
                                    <c:if test="${tag != 1}">
                                        <li class="page-item"><a href="shop?index=${tag-1 }" class="page-link"><i
                                                class="fas fa-chevron-left"></i></a></li>
                                    </c:if>
                                    <c:forEach begin="1" end="${endPage }" var="i">
                                        <li class="${tag==i?"page-item active":"page-item" }"><a href="shop?index=${i }"
                                                                                                 class="page-link">${i }</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${tag != endPage}">
                                        <li class="page-item"><a href="shop?index=${tag+1 }" class="page-link"><i
                                                class="fas fa-chevron-right"></i></a></li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </section>
                <!-- Section: Block Content -->

                <!--Section: Block Content-->
                <section>

                    <!-- Grid row -->
                    <div class="row" id="content">


                        <c:forEach items="${listP}" var="o">
                            <!-- Grid column -->
                            <div class="col-md-4 mb-5">

                                <!-- Card -->
                                <div class="">

                                    <div class="view zoom overlay rounded z-depth-2">
                                        <img class="img-fluid w-100"
                                             src="${o.image }" alt="Sample">
                                        <a href="detail?pid=${o.id}">
                                            <div class="mask">
                                                <img class="img-fluid w-100"
                                                     src="${o.image }">
                                                <div class="mask rgba-black-slight"></div>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="text-center pt-4">

                                        <h5>${o.name }</h5>
                                        <p><span class="mr-1"><strong>${o.price }$</strong></span></p>

                                    </div>

                                </div>
                                <!-- Card -->

                            </div>
                            <!-- Grid column -->
                        </c:forEach>

                    </div>
                    <!-- Grid row -->
                </section>
                <!--Section: Block Content-->

            </div>
        </div>
    </div>
</main>

<!--Main layout-->

<!-- Footer -->


<jsp:include page="footer.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- SCRIPTS -->
<!-- JQuery -->
<script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>

<script>
    $('#multi').mdbRange({
        single: {
            active: true,
            multi: {
                active: true,
                rangeLength: 1
            },
        }
    });

    $(document).ready(function () {
        $('.mdb-select').materialSelect();
        $('.select-wrapper.md-form.md-outline input.select-dropdown').bind('focus blur', function () {
            $(this).closest('.select-outline').find('label').toggleClass('active');
            $(this).closest('.select-outline').find('.caret').toggleClass('active');
        });
    });

    function load(cateid) {
        $.ajax({
            url: "/categoryShop",
            type: "get", //send it through get method
            data: {
                cid: cateid
            },
            success: function (responseData) {
                document.getElementById("content").innerHTML = responseData;
            }
        });
    }

    function searchByName(param) {
        var txtSearch = param.value;
        $.ajax({
            url: "/searchAjaxShop",
            type: "get",
            data: {
                txt: txtSearch
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr, status, error) {
                console.error("AJAX Error:", status, error);
            }
        });
    }


    function searchByPriceMinToMax() {
        var numMin = document.getElementById("priceMin").value;
        var numMax = document.getElementById("priceMax").value;
        $.ajax({
            url: "/searchAjaxPriceMinToMax",
            type: "get", //send it through get method
            data: {
                priceMin: numMin,
                priceMax: numMax
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

    function searchByPriceUnder100() {
        $.ajax({
            url: "/searchAjaxPriceUnder100Shop",
            type: "get", //send it through get method
            data: {},
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchByPrice100To200() {
        $.ajax({
            url: "/searchAjaxPrice100To200Shop",
            type: "get", //send it through get method
            data: {},
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchByPriceAbove200() {
        $.ajax({
            url: "/searchAjaxPriceAbove200Shop",
            type: "get", //send it through get method
            data: {},
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchByColorWhite() {
        $.ajax({
            url: "/searchAjaxColorWhite",
            type: "get", //send it through get method
            data: {},
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchByColorGray() {
        $.ajax({
            url: "/searchAjaxColorGray",
            type: "get", //send it through get method
            data: {},
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchByColorBlack() {
        $.ajax({
            url: "/searchAjaxColorBlack",
            type: "get", //send it through get method
            data: {},
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function searchByColorYellow() {
        $.ajax({
            url: "/searchAjaxColorYellow",
            type: "get", //send it through get method
            data: {},
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
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


</body>

</html>