<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Control</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">


    <link href="css/style.css" rel="stylesheet" type="text/css"/>

    <style>


    @media (min-width: 991.98px) {
        main {
            padding-left: 240px;
        }
    }

    #introCarousel,
    .carousel-inner,
    .carousel-item,

    .carousel-item:nth-child(1) {
        background-image: url('images/welcome.svg');
        background-repeat: no-repeat;
        background-size: 100% 100%;
        background-position: top center;
    }

    @media (min-width: 992px) {
        #introCarousel {
            margin-top: -58.59px;
        }
    }

    .sidebar {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
        width: 240px;
        z-index: 600;

    }

    .sidebar .active {
        border-radius: 5px;
        box-shadow: 0 2px 5px 0 rgba(190, 169, 169), 0 2px 10px 0 rgba(169, 169, 169, 0.08);
    }

    .sidebar-sticky {
        position: relative;
        top: 0;
        height: calc(100vh - 48px);
        padding-top: 0.5rem;
        overflow-x: hidden;
        overflow-y: auto;
    }
    .sidebar {
        font-family: Arial, sans-serif;
    }

    .sidebar a {
        display: block;
        padding: 10px;
        color: #333;
        text-decoration: none;
        transition: background-color 0.3s;
    }

    </style>
</head>
<body>

<header>
    <jsp:include page="sidebar.jsp"></jsp:include>
</header>


<!--Main layout-->
<main>
    <div class="container pt-4">

        <!-- Section: Statistics with subtitles -->
<%--        <section>--%>
<%--            <div class="row" id="total">--%>

<%--                <!-- Total Products Card -->--%>
<%--                <div class="col-xl-6 col-md-12 mb-4">--%>
<%--                    <div class="card">--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="d-flex justify-content-between p-md-1">--%>
<%--                                <div class="d-flex flex-row">--%>
<%--                                    <div class="align-self-center">--%>
<%--                                        <i class="fas fa-pencil-alt text-info fa-3x me-4"></i>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                        <h4 class="">Total Products</h4>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="align-self-center">--%>
<%--                                    <h2 style="color: #57c9f0" class="h1">${allProduct}</h2>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <!-- Total Comments Card -->--%>
<%--                <div class="col-xl-6 col-md-12 mb-4">--%>
<%--                    <div class="card">--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="d-flex justify-content-between p-md-1">--%>
<%--                                <div class="d-flex flex-row">--%>
<%--                                    <div class="align-self-center">--%>
<%--                                        <i class="far fa-comment-alt text-warning fa-3x me-4"></i>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                        <h4 >Total Comments</h4>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="align-self-center">--%>
<%--                                    <h2 style="color: #ff9f1a" class="h1">${allReview}</h2>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <!-- Total Sales Card -->--%>
<%--                <div class="col-xl-6 col-md-12 mb-4">--%>
<%--                    <div class="card">--%>
<%--                        <div class="card-body">--%>
<%--                            <div class="d-flex justify-content-between p-md-1">--%>
<%--                                <div class="d-flex flex-row">--%>
<%--                                    <div class="align-self-center">--%>
<%--                                        <h2 style="color: red" class="h1 mb-0 me-4">$${sumAllInvoice}</h2>--%>
<%--                                    </div>--%>
<%--                                    <div>--%>
<%--                                        <h4 class="mb-0">Total Sales</h4>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="align-self-center">--%>
<%--                                    <i class="far fa-heart text-danger fa-3x"></i>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </section>--%>
        <div class="carousel-inner">
            <!-- Single item -->
            <div class="carousel-item active">

            </div>

        </div>

    </div>
</main>


<script type="text/javascript"
        src="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/js/plugins/mdb-plugins-gathered.min.js"></script>
<!-- MDB -->
<script type="text/javascript" src="js/mdb.min.js"></script>

</body>
</html>