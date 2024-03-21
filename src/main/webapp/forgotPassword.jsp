<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
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
    <title>Forgot Password Form</title>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .nav {
            min-height: 42px;
            display: flex;
            justify-content: space-between;
        }

        .nav-link {
            text-decoration: none;
            color: white;
        }

        .nav-list {
            padding-left: 0;
            margin: auto 16px;
        }

        .nav-item {
            color: #fff;
            list-style: none;
            margin: 0 8px;
            display: inline-block;
        }

        .form-signin {
            max-width: 400px;
            margin: 0 auto;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 50px;
        }

        h1 {
            color: #28a745;
        }

        label {
            font-weight: bold;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id="logreg-forms">
    <form class="form-signin" action="forgotPassword" method="post">
        <h1 class="h3 mb-3 font-weight-normal text-center">Forgot Password</h1>
        <p class="text-success">${mess}</p>
        <p class="text-danger">${error}</p>

        <div class="form-group">
            <label for="username">Username</label>
            <input name="username" type="text" id="username" class="form-control" placeholder="Username" required=""
                   autofocus="">
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input name="email" type="email" id="email" class="form-control" placeholder="Email" required="">
        </div>

        <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> Retrieve</button>
    </form>

</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/your-fontawesome-kit.js"></script>
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