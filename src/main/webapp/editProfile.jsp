
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
          crossorigin="anonymous">

    <link rel="stylesheet" href="css/style.css"/>

    <style>
        body {
            background-color: #f8f9fa;
        }

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

        #logreg-forms {
            max-width: 400px;
            margin: auto;
            margin-top: 50px;
        }

        .form-signin {
            background-color: #fff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #000000;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-success:hover {
            background-color: #218838;
        }
    </style>
    <title>Edit Profile</title>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<br/>

<div id="logreg-forms" class="container">
    <form class="form-signin" action="editProfile" method="post">
        <h1 class="h3 mb-3 font-weight-normal text-center">Edit Profile</h1>

        <div class="form-group">
            <label for="username">Username</label>
            <input name="username" type="text" id="username" class="form-control" value="${sessionScope.acc.user}" required autofocus>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input name="password" type="password" id="password" class="form-control" value="${sessionScope.acc.pass}" required>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input name="email" type="email" id="email" class="form-control" value="${sessionScope.acc.email}" required>
        </div>

        <button class="btn btn-success btn-block" type="submit">
            <i class="bi bi-pencil-square"></i> Edit
        </button>
    </form>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script>
    function toggleResetPswd(e) {
        e.preventDefault();
        $('#logreg-forms .form-signin').toggle() // display:block or none
        $('#logreg-forms .form-reset').toggle() // display:block or none
    }

    function toggleSignUp(e) {
        e.preventDefault();
        $('#logreg-forms .form-signin').toggle(); // display:block or none
        $('#logreg-forms .form-signup').toggle(); // display:block or none
    }

    $(() => {
        // Login Register Form
        $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
        $('#logreg-forms #cancel_reset').click(toggleResetPswd);
        $('#logreg-forms #btn-signup').click(toggleSignUp);
        $('#logreg-forms #cancel_signup').click(toggleSignUp);
    })

    window.addEventListener("load", function loadAmountCart() {
        $.ajax({
            url: "/loadAllAmountCart",
            type: "get", //send it through get method
            data: {},
            success: function (responseData) {
                document.getElementById("amountCart").innerHTML = responseData;
            }
        });
    }, false);

</script>
</body>
</html>