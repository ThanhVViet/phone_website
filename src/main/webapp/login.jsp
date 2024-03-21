<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link href="css/login.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="css/style.css"/>

    <title>Login Form</title>
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


        .be{
            margin-top: 5px;
        }
        body{
            background-color: #d8c2e6;
            text-decoration: none;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div id="logreg-forms">
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


    <section class="forms-section">
        <h1 class="section-title">V</h1>
        <div class="forms">
            <div class="form-wrapper is-active">
                <button type="button" class="switcher switcher-login">
                    Login
                    <span class="underline"></span>
                </button>
                <form action="login" method="post" class="form form-login form-signin">
                    <fieldset>
                        <legend>Please, enter your username and password for login.</legend>
                        <div class="input-block">
                            <label for="login-email">Username</label>
                            <input name="user" value="${username}" id="login-email" type="text" class="form-control" required autofocus>
                        </div>
                        <div class="input-block">
                            <label for="login-password">Password</label>
                            <input name="pass" value="${password}" id="login-password" type="password" class="form-control" required>
                        </div>
                        <div class="input-block form-group form-check">
                            <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label be" for="exampleCheck1">Remember</label>
                        </div>
                    </fieldset>

                    <button type="submit" class="btn-login">Login</button>
                </form>
            </div>
            <div class="form-wrapper">
                <button type="button" class="switcher switcher-signup">
                    Sign Up
                    <span class="underline"></span>
                </button>
                <form  action="signup" method="post"class="form form-signup">
                    <fieldset>
                        <legend>Please, enter your email, password and password confirmation for sign up.</legend>
                        <div class="input-block">
                            <label for="signup-email">Username</label>
                            <input name="user" id="signup-email" type="text" required autofocus>
                        </div>
                        <div class="input-block">
                            <label for="signup-password">Password</label>
                            <input name="pass" id="signup-password" type="password" required autofocus>
                        </div>
                        <div class="input-block">
                            <label for="signup-password-confirm">Confirm password</label>
                            <input name="repass" id="signup-password-confirm" type="password" required autofocus>
                        </div>
                        <div class="input-block">
                            <label for="email">E-mail</label>
                            <input name="email" id="email" type="email" required autofocus>
                        </div>
                    </fieldset>
                    <button type="submit" class="btn-signup">Continue</button>
                    <a href="login.jsp" id="cancel_signup" class="btn btn-secondary btn-block mt-2"><i class="fas fa-angle-left"></i> Back</a>

                </form>
            </div>
        </div>
    </section>

    <br>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script>
    const switchers = [...document.querySelectorAll('.switcher')]

    switchers.forEach(item => {
        item.addEventListener('click', function() {
            switchers.forEach(item => item.parentElement.classList.remove('is-active'))
            this.parentElement.classList.add('is-active')
        })
    })
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



