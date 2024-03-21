<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .nav1{
            margin-left: 600px;
        }
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
            transition: color 0.3s ease; /* Smooth transition on color change */
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


        .container {
            margin-top: 50px;
        }

        .table-title h2 {
            margin-bottom: 20px;
        }

        .modal-content {
            padding: 20px;
            border-radius: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: 600;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }
    </style>
<body>

<div id="editEmployeeModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="edit" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Edit Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input value="${detail.id}" name="id" type="hidden" class="form-control" readonly required>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input value="${detail.name}" name="name" type="text" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <input value="${detail.image}" name="image" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Image 2</label>
                        <input value="${detail.image2}" name="image2" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Image 3</label>
                        <input value="${detail.image3}" name="image3" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Image 4</label>
                        <input value="${detail.image4}" name="image4" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input value="${detail.price}" name="price" type="text" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Title</label>
                        <textarea name="title" class="form-control" required>${detail.title}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Model</label>
                        <textarea name="model" class="form-control" required>${detail.model}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Color</label>
                        <textarea name="color" class="form-control" required>${detail.color}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Delivery</label>
                        <textarea name="delivery" class="form-control" required>${detail.delivery}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea name="description" class="form-control">${detail.description}</textarea>
                    </div>
                    <div class="form-group">
                        <label>Category</label>
                        <select name="category" class="form-select" aria-label="Default select example">
                            <c:forEach items="${listCC}" var="o">
                                <option value="${o.cid}">${o.cname}</option>
                            </c:forEach>
                        </select>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-success" value="Edit">
                    <a class="btn btn-info" href="test">Back</a>
                </div>
            </form>
        </div>
    </div>
</div>

</div>


<script src="js/manager.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/manager.js" type="text/javascript"></script>
</body>
</html>