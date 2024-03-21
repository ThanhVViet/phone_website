<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Thong tin dat hang</title>
    </head>
    <body>
    	<jsp:include page="header.jsp"></jsp:include>
        <div id="logreg-forms">
            <form class="form-signin" action="order" method="post">
                <h1 class="h3 mb-3 font-weight-normal text-center">Thông tin đặt hàng</h1>

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

                <div class="form-group">
                    <label for="name">Name</label>
                    <input name="name" type="text" id="name" class="form-control" placeholder="Name" required="" autofocus="">
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone number</label>
                    <input name="phoneNumber" type="text" id="phoneNumber" class="form-control" placeholder="Phone number" required="" autofocus="">
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input name="email" type="text" id="email" class="form-control" placeholder="Email" required="" autofocus="">
                </div>

                <div class="form-group">
                    <label for="deliveryAddress">Delivery Address</label>
                    <input name="deliveryAddress" type="text" id="deliveryAddress" class="form-control" placeholder="Delivery Address" required="" autofocus="">
                </div>

                <button class="btn btn-success btn-block" type="submit">
                    <i class="fas fa-american-sign-language-interpreting"></i> Đặt Hàng
                </button>

                <c:if test="${email!=null }">
                    <div class="alert alert-danger mt-3" role="alert">
                            ${email}
                    </div>
                </c:if>
            </form>



            <br>

        </div>
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
            
            window.addEventListener("load",function loadAmountCart(){
                        	 $.ajax({
                                 url: "/loadAllAmountCart",
                                 type: "get", //send it through get method
                                 data: {
                                     
                                 },
                                 success: function (responseData) {
                                     document.getElementById("amountCart").innerHTML = responseData;
                                 }
                             });
                        },false);         
        </script>
    </body>
</html>