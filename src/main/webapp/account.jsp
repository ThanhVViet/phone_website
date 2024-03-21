<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quản Lý Tài Khoản</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ------>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style>

        #addAccount {
            background: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }

        .modal-header {
            background-color: #28a745;
            color: #fff;
            border-bottom: 2px solid #218838;
        }

        .modal-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px; /* Add some spacing between form groups */
        }

        .form-check-label {
            color: #28a745; /* Green color for checkbox labels */
        }

        .modal-footer {
            border-top: 2px solid #218838;
        }

       body {
             background-color: #c0cfe9;
         }

        @media (min-width: 991.98px) {
            main {
                padding-left: 240px;
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
            background-color: #fff; /* Add a background color */
            color: #333; /* Set the text color */
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

        /* Additional styles for a more beautiful sidebar */
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

        .sidebar a:hover {
            background-color: #f5f5f5;
        }

        .sidebar .active {
            background-color: #ebebeb;
            color: #000;
        }
    </style>

</head>
<body>

<!--Main Navigation-->
<header>
    <jsp:include page="sidebar.jsp"></jsp:include>


</header>
<!--Main Navigation-->

<!--Main layout-->
<main>
    <div class="container pt-4">


        <!--Section: Quan Ly tai Khoan-->
        <section class="mb-4">
            <div class="card">
                <div class="card-header py-3 row">
                    <div class="col-sm-3">
                        <h5 class="mb-0 text-left" id="">
                            <strong>Quản lý tài khoản</strong>
                        </h5>
                    </div>

                    <div class="col-sm-9 text-right">
                        <a href="#addAccount" class="btn btn-success" data-toggle="modal"> <i
                                class="material-icons">&#xE147;</i></a>

                        <form action="xuatExcelAccountControl" method="get">
                            <button type="submit" class="mb-0 text-center btn btn-primary">Xuất file Excel</button>
                        </form>
                    </div>
                </div>

                <c:if test="${error!=null }">
                    <div class="alert alert-danger" role="alert">
                            ${error}
                    </div>
                </c:if>
                <c:if test="${mess!=null }">
                    <div class="alert alert-success" role="alert">
                            ${mess}
                    </div>
                </c:if>

                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover text-nowrap">
                            <thead>
                            <tr>

                                <th scope="col">Username</th>
                                <th scope="col">Là người bán hàng</th>
                                <th scope="col">Là Admin</th>
                                <th scope="col">Email</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listA}" var="o">
                                <tr>


                                    <td>${o.user}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${o.isSell == 1}">
                                                <span>Seller</span>
                                            </c:when>
                                            <c:when test="${o.isSell == 0}">
                                                <span>Nope</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${o.isAdmin == 1}">
                                                <span>Admin</span>
                                            </c:when>
                                            <c:when test="${o.isAdmin == 0}">
                                                <span>Nope</span>
                                            </c:when>
                                        </c:choose>
                                    </td>

                                    <td>${o.email}</td>
                                    <td>
                                        <a href="deleteAccount?id=${o.id}">
                                            <button type="button" class="btn btn-danger"><i class="material-icons"
                                                                                            data-toggle="tooltip"
                                                                                            title="Delete">&#xE872;</i>
                                            </button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
        <!--Section: Quan Ly tai Khoan-->
    </div>


</main>


<div id="addAccount" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="addAccount" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Thêm tài khoản</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Username</label>
                        <input name="user" type="text" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <input name="pass" type="password" class="form-control" required>
                    </div>
                    <div class="form-group form-check">
                        <input name="isSell" value="1" type="checkbox" class="form-check-input" id="isSell">
                        <label class="form-check-label" for="isSell">Là người bán</label>
                    </div>

                    <div class="form-group form-check">
                        <input name="isAdmin" value="1" type="checkbox" class="form-check-input" id="isAdmin">
                        <label class="form-check-label" for="isAdmin">Là Admin</label>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="email" type="text" class="form-control" required>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-success" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>

<script src="js/manager.js" type="text/javascript"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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