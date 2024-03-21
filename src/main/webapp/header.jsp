<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<nav class="nav navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <ul class="nav-list">
        <c:if test="${sessionScope.acc != null}">
            <li class="nav-item">
                <p  class="user" href="#">Hello ${sessionScope.acc.user}</p>
            </li>
        </c:if>
    </ul>

    <div class="nav-list">
        <div class="nav-item navbar-brand">
            <a class="nav-link" href="home">Home</a>
        </div>
        <div class="nav-item">
            <a class="nav-link" href="shop">Shop</a>
        </div>

        <c:if test="${sessionScope.acc != null}">
            <div class="nav-item">
                <a class="nav-link" href="logout">Logout</a>
            </div>
            <div class="nav-item">
                <a class="nav-link" href="editProfile.jsp">Edit Profile</a>
            </div>
        </c:if>

        <c:if test="${sessionScope.acc == null}">
            <div class="nav-item">
                <a class="nav-link" href="login">Login</a>
            </div>
            <div class="nav-item">
                <a class="nav-link" href="forgotPassword">Forgot Password</a>
            </div>
        </c:if>

        <c:if test="${sessionScope.acc != null && sessionScope.acc.isAdmin == 1}">
            <div class="nav-item">
                <a class="nav-link" href="admin">Control Website</a>
            </div>
        </c:if>
    </div>

    <form action="search" method="post" class="form-inline my-2 my-lg-0 nav-item">
        <a class="btn btn-success btn-sm ml-3" href="managerCart">
            <i class="fa fa-shopping-cart"></i>
            <span class="ml-2">Cart</span>
            <span id="amountCart" class="badge badge-light ml-1" style="font-size: 12px;"></span>
        </a>
    </form>


</nav>
