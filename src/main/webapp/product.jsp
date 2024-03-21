<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quản lý sản phẩm</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ------>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">


    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
    <!-- Material Design Bootstrap Ecommerce -->
    <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
    <!-- Your custom styles (optional) -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ------>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        img {
            width: 200px;
            height: 120px;
        }
    </style>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
    <link rel="stylesheet" type="text/css"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap">
    <link rel="stylesheet" type="text/css"
          href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css">
    <style>body {
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
        <section class="mb-4">
            <div class="card">
                <div class="card-header py-3 row">
                    <div class="col-sm-3">
                        <h5 class="mb-0 text-left" id="">
                            <strong>Quản lý sản phẩm</strong>
                        </h5>
                    </div>
                    <div class="col-sm-9 text-right">
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i
                                class="material-icons">&#xE147;</i></a>

                        <form action="xuatExcelProductControl" method="get">
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
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Image</th>
                                <th scope="col">Price</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <jsp:useBean id="listP" scope="request" type="java.util.List"/>
                            <c:forEach items="${listP}" var="o" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${o.name}</td>
                                    <td>
                                        <img src="${o.image}" class="img-thumbnail"
                                             style="max-width: 50px; max-height: 50px;" alt="Product Image">
                                    </td>
                                    <td>${o.price} $</td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="loadProduct?pid=${o.id}" class="btn btn-warning"
                                               data-toggle="tooltip" title="Edit">
                                                <i class="material-icons">edit</i>
                                            </a>
                                            <a href="delete?pid=${o.id}" class="btn btn-danger" data-toggle="tooltip"
                                               title="Delete">
                                                <i class="material-icons">delete</i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


                        <div class="clearfix">
                            <ul class="pagination">
                                <c:if test="${tag != 1}">
                                    <li class="page-item"><a href="test?index=${tag-1 }">Previous</a></li>
                                </c:if>
                                <c:forEach begin="1" end="${endPage }" var="i">
                                    <li class="${tag==i?"page-item active":"" }"><a href="test?index=${i }"
                                                                                    class="page-link">${i }</a></li>
                                </c:forEach>
                                <c:if test="${tag != endPage}">
                                    <li class="page-item"><a href="test?index=${tag+1 }" class="page-link">Next</a></li>
                                </c:if>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </div>


</main>


<div id="addEmployeeModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="add" method="post">
                <div class="modal-header bg-success text-white">
                    <h4 class="modal-title">Add Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Name</label>
                        <input name="name" type="text" class="form-control" id="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productImage" class="form-label">Image</label>
                        <input name="image" type="text" class="form-control" id="productImage">
                    </div>
                    <div class="mb-3">
                        <label for="productImage2" class="form-label">Image 2</label>
                        <input name="image2" type="text" class="form-control" id="productImage2">
                    </div>
                    <div class="mb-3">
                        <label for="productImage3" class="form-label">Image 3</label>
                        <input name="image3" type="text" class="form-control" id="productImage3">
                    </div>
                    <div class="mb-3">
                        <label for="productImage4" class="form-label">Image 4</label>
                        <input name="image4" type="text" class="form-control" id="productImage4">
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price</label>
                        <input name="price" type="text" class="form-control" id="productPrice">
                    </div>
                    <div class="mb-3">
                        <label for="model" class="form-label">Model</label>
                        <input name="model" type="text" class="form-control" id="model">
                    </div>
                    <div class="mb-3">
                        <label for="productTitle" class="form-label">Title</label>
                        <textarea name="title" class="form-control" id="productTitle" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="color" class="form-label">Color</label>
                        <input name="color" class="form-control" id="color" required></input>
                    </div>
                    <div class="mb-3">
                        <label for="del" class="form-label">Delivery</label>
                        <textarea name="delivery" class="form-control" id="del" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="dep" class="form-label">Description</label>
                        <textarea name="description" class="form-control" id="dep" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="productCategory" class="form-label">Category</label>
                        <select name="category" class="form-select" id="productCategory"
                                aria-label="Default select example">
                            <c:forEach items="${listCC}" var="o">
                                <option value="${o.cid}">${o.cname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-success">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script src="js/manager.js" type="text/javascript"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>

</body>
</html>