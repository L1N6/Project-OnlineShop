
<%-- 
    Document   : checkout
    Created on : Jan 28, 2023, 8:10:19 AM
    Author     : LEGION
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>
<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="<c:url value="/home"/>">Home</a>
                <a class="breadcrumb-item text-dark" href="<c:url value="/shop"/>">Shop</a>
                <span class="breadcrumb-item active">Checkout</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Checkout Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <c:if test="${empty AccSession}">
            <div class="col-lg-8 table-responsive mb-5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart</span></h5>    
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead>
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ProductCart}" var="gProduct">
                        <tbody class="align-middle">
                            <tr>
                                <td style="text-align: left; padding-left: 7%"><img src="img/${gProduct.picture}" alt="" style="width: 50px;">${gProduct.productName} - ${gProduct.color}</td>
                                <td class="align-middle">$<fmt:formatNumber maxFractionDigits="0" value="${gProduct.price}"/></td>
                                <td class="align-middle">
                                    <div class="quantity mx-auto" style="width: 100px;">
                                        <input type="text" readonly class="form-control form-control-sm bg-secondary1 border-0 text-center"  value="${gProduct.quantity}">
                                    </div>
                                </td>
                                <td class="align-middle">$<fmt:formatNumber maxFractionDigits="0" value="${gProduct.quantity * gProduct.price}"/></td>
                            </tr>

                        </tbody>
                    </c:forEach>
                </table>
                <c:if test="${empty ProductCart}">
                    <p>Your cart have no Products. Please choose the product for order <a href="<c:url value="/shop"/>">Here!</a></p>
                </c:if>
            </div>
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <input class="form-control" type="text" placeholder="John">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <input class="form-control" type="text" placeholder="Doe">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <input class="form-control" type="text" placeholder="example@email.com">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <input class="form-control" type="text" placeholder="+123 456 789">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address</label>
                            <input class="form-control" type="text" placeholder="123 Street">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <input class="form-control" type="text" placeholder="New York">
                        </div>
                        <div class="col-md-12 form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="newaccount">
                                <label class="custom-control-label" for="newaccount">Create an account</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="shipto">
                                <label class="custom-control-label" for="shipto"  data-toggle="collapse" data-target="#shipping-address">Ship to different address</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="collapse mb-5" id="shipping-address">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Shipping Address</span></h5>
                    <div class="bg-light p-30">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>First Name</label>
                                <input class="form-control" type="text" placeholder="John">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Last Name</label>
                                <input class="form-control" type="text" placeholder="Doe">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>E-mail</label>
                                <input class="form-control" type="text" placeholder="example@email.com">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Mobile No</label>
                                <input class="form-control" type="text" placeholder="+123 456 789">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Address</label>
                                <input class="form-control" type="text" placeholder="123 Street">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>City</label>
                                <input class="form-control" type="text" placeholder="New York">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${not empty AccSession}">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead>
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <c:forEach items="${ProductCart}" var="gProduct">
                        <tbody class="align-middle">
                            <tr>
                                <td style="text-align: left; padding-left: 7%"><img src="img/${gProduct.picture}" alt="" style="width: 50px;">${gProduct.productName} - ${gProduct.color}</td>
                                <td class="align-middle">$<fmt:formatNumber maxFractionDigits="0" value="${gProduct.price}"/></td>
                                <td class="align-middle">
                                    <div class="quantity mx-auto" style="width: 100px;">
                                        <input type="text" readonly class="form-control form-control-sm bg-secondary1 border-0 text-center"  value="${gProduct.quantity}">
                                    </div>
                                </td>
                                <td class="align-middle">$<fmt:formatNumber maxFractionDigits="0" value="${gProduct.quantity * gProduct.price}"/></td>
                            </tr>

                        </tbody>
                    </c:forEach>
                </table>
                <c:if test="${empty ProductCart}">
                    <p>Your cart have no Products. Please choose the product for order <a href="<c:url value="/shop"/>">Here!</a></p>
                </c:if>
            </div>
        </c:if>
        <div class="col-lg-4">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
            <div class="bg-light p-30 mb-5">
                <div class="border-bottom">
                    <h6 class="mb-3">Products</h6>
                    <c:forEach items="${ProductCart}" var="gProduct">
                        <div class="d-flex justify-content-between">
                            <p>${gProduct.productName} - ${gProduct.color} x${gProduct.quantity}</p>
                            <p>$<fmt:formatNumber maxFractionDigits="0" value="${gProduct.price}"/></p>
                        </div>
                    </c:forEach>
                </div>
                <div class="border-bottom pt-3 pb-2">
                    <div class="d-flex justify-content-between mb-3">
                        <h6>Subtotal</h6>
                        <h6>    $<fmt:formatNumber maxFractionDigits="0" value="${Subtotal}"/></h6>
                    </div>
                    <div class="d-flex justify-content-between mb-3">
                        <h6>Coupon Code</h6>
                        <c:choose>
                            <c:when test="${not empty Code}">
                                <h6>${Code}</h6>
                            </c:when>
                            <c:otherwise>
                                <h6>None</h6>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="d-flex justify-content-between">
                        <h6 class="font-weight-medium">Shipping</h6>
                        <h6 class="font-weight-medium">Free</h6>
                    </div>
                </div>
                <div class="pt-2">
                    <div class="d-flex justify-content-between mt-2">
                        <h5>Total</h5>
                        <h5>$<fmt:formatNumber maxFractionDigits="0" value="${Subtotal -(Subtotal * Discount)}"/></h5>
                    </div>
                </div>
            </div>
            <div class="mb-5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                <div class="bg-light p-30">
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="paypal">
                            <label class="custom-control-label" for="paypal">Paypal</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="directcheck">
                            <label class="custom-control-label" for="directcheck">Direct Check</label>
                        </div>
                    </div>
                    <div class="form-group mb-4">
                        <div class="custom-control custom-radio">
                            <input type="radio" class="custom-control-input" name="payment" id="banktransfer">
                            <label class="custom-control-label" for="banktransfer">Bank Transfer</label>
                        </div>
                    </div>
                    <button class="btn btn-block btn-primary font-weight-bold py-3">Place Order</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Checkout End -->
<%@include file="template/footer.jsp" %>