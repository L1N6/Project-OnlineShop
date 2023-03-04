<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">

        <title>Group6 - Online Shop Website</title>

        <%String path = request.getContextPath(); %>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="container-fluid mb-5">
            <div class="row bg-dark py-1 px-xl-5">
                <div class="col-lg-5 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center h-100">
                        <a href="<c:url value="/home"/>" class="text-decoration-none mr-3">
                            <!--                        <span class="h1 text-uppercase text-primary bg-dark px-2">Online</span>
                                                    <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>-->
                            <img src="./img/gradient-mobile-store-logo-design_23-2149697771.jpg" class="rounded" width="70" height="70"" alt="alt"/>
                        </a>
                        <div class="d-none d-lg-block mr-3">
                            <a class="text-body text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 5px;">
                                <c:choose>
                                    <c:when test="${empty BrandFilter}">
                                        <h6 class="text-white font-weight-bold m-0 text-decoration-none"><i class="fa fa-bars mr-2"></i>All Brands</h6>
                                    </c:when>
                                    <c:otherwise>
                                        <h6 class="text-white m-0 text-decoration-none"><i class="fa fa-bars mr-2"></i>${BrandFilter}</h6>
                                        </c:otherwise>
                                    </c:choose>
                                <!--                                <i class="fa fa-angle-down text-dark"></i>-->
                            </a>
                            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light " id="navbar-vertical" style="width: calc(45% - 30px); z-index: 999;">
                                <div class="navbar-nav w-100">
                                    <a href="<c:url value="/filter"><c:param name="txtBrandName" value="AllBrands"/></c:url>" class="nav-item nav-link font-weight-bold">All Brands</a>
                                    <c:forEach items="${NvabarBrands}" var="b">
                                        <a href="<c:url value="/filter">
                                               <c:param name="txtBrandName" value="${b.brandName}"/>
                                           </c:url>" class="nav-item nav-link font-weight-bold text-decoration-none">${b.brandName}</a>
                                    </c:forEach>
                                </div>
                            </nav>
                        </div>
                        <a class="text-white font-weight-bold mr-3 text-decoration-none" href="">About</a>
                        <a class="text-white font-weight-bold mr-3 text-decoration-none" href="/contact">Contact</a>
                        <!--                        <a href="#" class="nav-link dropdown-toggle text-dark font-weight-bold" data-toggle="dropdown">CheckOut</i></a>
                                                <div class="dropdown-menu text-dark">
                                                    <a href="cart.jsp" class="dropdown-item">Shopping Cart</a>
                                                    <a href="checkout.jsp" class="dropdown-item">Checkout</a>
                                                </div>-->
                        <div class="d-none d-lg-block mr-3">
                            <a class="text-body text-white text-decoration-none" data-toggle="collapse" href="#navbar-vertical1" style="height: 5px;">
                                <h6 class="text-white font-weight-bold m-0">CheckOut</h6>
                            </a>
                            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light text-decoration-none" id="navbar-vertical1" style="width: calc(30% - 30px); z-index: 999;">
                                <div class="navbar-nav w-100">
                                    <a href="cart.jsp" class="nav-item nav-link font-weight-bold">Cart</a>
                                    <a href="checkout.jsp" class="nav-item nav-link font-weight-bold">Checkout</a>
                                </div>
                            </nav>
                        </div>
                        <a class="text-white font-weight-bold mr-3 text-decoration-none" href="<c:url value="/shop">
                               <c:param name="choice" value="showList" />
                           </c:url>">Shop</a>
                    </div>
                </div>
                <div class="col-lg-3 col-2 text-left mt-3">
                    <form action="<c:url value="/searching"/>" method="Post">
                        <div class="input-group">
                            <input value="${txtValue}" type="text" class="form-control" placeholder="Search for products" name="txt">
                            <div class="input-group-append">
                                <button class="input-group-text bg-transparent text-primary">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-4 text-center text-lg-right mt-3" >
                    <div class="btn-group mx-2">
                        <a href="" class="btn px-0">
                            <i class="fas fa-heart text-white"></i>
                            <span class="badge text-white border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                        <a href="cart.jsp" class="btn px-0 ml-3">
                            <i class="fas fa-shopping-cart text-white"></i>
                            <span class="badge text-white border border-secondary rounded-circle" style="padding-bottom: 2px;">0</span>
                        </a>
                    </div>
                    <div class="d-inline-flex align-items-center">
                        <c:if test="${not empty adminAccount}">
                            <li><a href="<c:url value="/Admin"><c:param name="req" value="listProduct"/></c:url>">Admin Manager</a></li>
                            <li><a href="<c:url value="/home"><c:param name="req" value="remove"/></c:url>">SignOut</a></li>
                            </c:if>
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggl bg-secondary font-weight-bold" data-toggle="dropdown">My Account</button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <c:if test="${empty AccSession}">
                                    <a  class="dropdown-item" href="<%=path%>/SignIn" type="button">Sign in</a>
                                    <a  class="dropdown-item" href="<%=path%>/SignUp" type="button">Sign up</a>
                                </c:if>

                                <c:if test="${not empty AccSession}">
                                    <a class="dropdown-item" href="<c:url value="/home"><c:param name="req" value="profile"/></c:url>">Profile</a>
                                    <a class="dropdown-item" href="<c:url value="/Logout"><c:param name="req" value="remove"/></c:url>">SignOut</a>
                                </c:if>  
                            </div>

                        </div>
                        <div class="d-inline-flex align-items-center d-block d-lg-none">
                            <a href="" class="btn px-0 ml-2">
                                <i class="fas fa-heart text-dark"></i>
                                <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>
                            <a href="" class="btn px-0 ml-2">
                                <i class="fas fa-shopping-cart text-dark"></i>
                                <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
<!--        <div class="container-fluid bg-white mb-30">
            <div class="row px-xl-5">

                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-white navbar-dark py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2">Multi</span>
                            <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </nav>
                </div>
            </div>
        </div>-->
        <!-- Navbar End -->
