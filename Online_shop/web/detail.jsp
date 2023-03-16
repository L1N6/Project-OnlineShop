<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %><!-- Breadcrumb Start -->
<c:if test="${empty check}">
    <c:redirect url="/detail" />
</c:if>
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="#">Home</a>
                <a class="breadcrumb-item text-dark" href="#">Shop</a>
                <span class="breadcrumb-item active">${brandName}</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Shop Detail Start -->
<div class="container-fluid pb-5">
    <div class="row px-xl-5" id="detailProduct">
        <div class="col-lg-5 mb-30">
            <div id="product-carousel" class="carousel slide" data-ride="carousel">
                <div id="Color"class="carousel-inner bg-light">
                    <c:if test="${empty pdt}">
                        <c:forEach var="pic" items="${listProductDetail}" varStatus="loop">
                            <div class="carousel-item<c:if test="${loop.index == 0}"> active</c:if>">
                                <img class="w-100 h-100" style="width: 120%; height: 120%; object-fit: contain" src="img/${pic.getPicture()}" alt="Image">
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${not empty pdt}">
                        <c:forEach var="pic" items="${pdt}" varStatus="loop">
                            <div class="carousel-item<c:if test="${loop.index == 0}"> active</c:if>">
                                <img class="w-100 h-100" style="width: 120%; height: 120%; object-fit: contain" src="img/${pic.getPicture()}" alt="Image">
                            </div>
                        </c:forEach>
                    </c:if>
                </div>           
                <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                    <i class="fa fa-2x fa-angle-left text-dark"></i>
                </a>
                <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                    <i class="fa fa-2x fa-angle-right text-dark"></i>
                </a>
            </div>
        </div>

        <div class="col-lg-7 h-auto mb-30">
            <div class="h-100 bg-light p-30">
                <div id="unitPrice">
                    <h3>${nameProduct}
                        <c:if test="${storageProduct == 1000}"> 1TB</c:if>
                        <c:if test="${storageProduct != 1000}"> ${storageProduct}GB</c:if>                   
                        </h3>
                        <div class="d-flex mb-3">
                            <div class="rate-star-class">
                            <c:if test="${rateProduct.getTotalComment() ne 0}">
                                <c:set var="AVGRate" value="${Math.ceil(rateProduct.getTotalRate()/rateProduct.getTotalComment())}"/>
                            </c:if>
                            <c:set var="minValue" value="${AVGRate < 5 ? AVGRate : 5}" />
                            <c:forEach begin="1" end="${minValue}">
                                <small class="fa fa-star fasize checked"></small>  
                            </c:forEach>
                            <c:forEach begin="1" end="${5-minValue}">
                                <small class="fa fa-star fasize"></small>     
                            </c:forEach>
                        </div>
                        <small>(${rateProduct.getTotalComment()})</small>

                    </div>
                    <c:set var="formattedNumNew" value="${formattedNumNew}"/>
                    <c:set var="formattedNumDisCountNew" value="${formattedNumDisCountNew}"/>
                    <div  class="d-flex mt-2">
                        <c:if test="${not empty formattedNumNew}">
                            <h3  class="font-weight-semi-bold mb-4" style="align-items: flex-start">$<fmt:formatNumber maxFractionDigits="0" value="${formattedNumDisCountNew}"/></h3>
                            <h5 class="text-muted ml-2"><del>$<fmt:formatNumber maxFractionDigits="0" value="${formattedNumNew}"/></del></h5>
                        </c:if>
                        <c:if test="${empty formattedNumNew}">
                            <h3  class="font-weight-semi-bold mb-4" style="align-items: flex-start">$<fmt:formatNumber maxFractionDigits="0" value="${priceProductDisCount}"/></h3>
                            <h5 class="text-muted ml-2"><del>$<fmt:formatNumber maxFractionDigits="0" value="${priceProduct}"/></del></h5>
                        </c:if>
                    </div>
                </div>
                <div class="d-flex mb-3" style="align-items: center">
                    <strong class="text-dark mr-3">Storage:</strong>
                    <c:set var="paramStorage" value="storage"/>
                    <c:forEach items="${listStorage}" var="value">
                        <div class="custom-control custom-radio custom-control-inline">
                            <button onclick="location.href = 'detail?productID=${product.getProductDetail()}&\n\
productStorage=${value.getProductStorage()}&\n\
paramCheck=${paramStorage}'" style="color: #6C757D;background-color: white;border-color: red;
                                    padding: 10;border: 1px solid #6C757D;border-radius: 10px "; 
                                    type="submit">
                                <c:if test="${value.getProductStorage() == 1000}"> 1TB</c:if>
                                <c:if test="${value.getProductStorage() != 1000}"> ${value.getProductStorage()}GB</c:if>
                                </button>
                            </div>
                    </c:forEach>
                </div>
                <div class="d-flex mb-4">
                    <strong class="text-dark mr-3">Colors:</strong>
                    <c:set var="paramColor" value="color"/>
                    <c:forEach items="${listColor}" var="color">                        
                        <div class="custom-control custom-radio custom-control-inline">
                            <button onclick="location.href = 'detail?productID=${product.getProductDetail()}&\n\
productColor=${color.getColor()}&paramCheck=${paramColor}'" 
                                    style="color: #6C757D;background-color: white;border-color: grey;padding: 10;border: 1px solid #6C757D;border-radius: 10px "; 
                                    type="submit">  
                                ${color.getColor()}                            
                            </button>
                        </div>
                    </c:forEach>
                </div>
                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus">
                                <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input type="text" class="form-control bg-secondary border-0 text-center" value="1">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <button class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Add To
                        Cart</button>
                </div>
                <div class="d-flex pt-2">
                    <strong class="text-dark mr-2">Share on:</strong>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="bg-light p-30">
                <div class="nav nav-tabs mb-4">
                    <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Information</a>
                    <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">Specifications</h4>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Chip: ${spec.getChip()}
                                    </li>
                                    <li class="list-group-item px-0">
                                        Ram: ${spec.getRam()} GB
                                    </li>
                                    <li class="list-group-item px-0">
                                        Pin: ${spec.getPin()}
                                    </li>
                                </ul> 
                            </div>
                            <div class="col-md-6">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item px-0">
                                        Storage: ${spec.getProductStorage()} GB
                                    </li>
                                    <li class="list-group-item px-0">
                                        OperatingSystem: ${spec.getOperatingSystem()}
                                    </li>
                                    <li class="list-group-item px-0">
                                        Mode: ${spec.getUnitsInStock()} 
                                    </li>
                                </ul> 
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="mb-4">1 review for "${nameProduct}"</h4>
                                <div class="media mb-4">
                                    <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                    <div class="media-body">
                                        <h6>John Doe<small> - <i>01 Jan 2045</i></small></h6>
                                        <div class="text-primary mb-2">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star-half-alt"></i>
                                            <i class="far fa-star"></i>
                                        </div>
                                        <p>Diam amet duo labore stet elitr ea clita ipsum, tempor labore accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h4 class="mb-4">Leave a review</h4>
                                <small>Your email address will not be published. Required fields are marked *</small>
                                <form method="get" action="detail" onsubmit="return validateForm()">
                                    <input type="hidden" name="productID" value="${product.getProductDetail()}">
                                    <input type="hidden" name="review" value="review">
                                    <div class="d-flex my-3">
                                        <p class="mb-0 mr-2">Your Rating * :</p>
                                        <div class="text-primary">
                                            <input type="button" name="number" value="1">
                                            <input type="button" name="number" value="2">
                                            <input type="button" name="number" value="3">
                                            <input type="button" name="number" value="4">
                                            <input type="button" name="number" value="5">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="message">Your Review *</label>
                                        <textarea id="message" cols="30" rows="5" class="form-control" name="message" autocomplete="off">${message}</textarea>
                                        <c:if test="${not empty messageError}">
                                            <span id="messageError" style="color:red"><c:out value="${messageError}" /></span>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Your Name *</label>
                                        <input type="text" class="form-control" id="name" name="name" value="${name}" autocomplete="off">
                                        <c:if test="${not empty nameError}">
                                            <span id="nameError" style="color:red"><c:out value="${nameError}" /></span>
                                        </c:if>
                                    </div>                                    
                                    <div class="form-group mb-0">
                                        <input type="submit" value="Leave Your Review" class="btn btn-primary px-3">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Shop Detail End -->


<!-- Products Start -->
<div class="container-fluid py-5">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">You May Also Like</span></h2>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <c:forEach items="${mayAlsoYouLike}" var="itemNearLike">
                    <div class="product-item bg-light">                  
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/${itemNearLike.getPicture()}" alt="">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a>
                                <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                            </div>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="<c:url value="/detail">
                                   <c:param name="productID" value="${itemNearLike.productDetail}" />
                               </c:url>">${itemNearLike.productName}</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5>$<fmt:formatNumber maxFractionDigits="0" value="${itemNearLike.getUnitPrice()*0.85}"/></h5>
                                <h6 class="text-muted ml-2"><del>$<fmt:formatNumber maxFractionDigits="0" value="${itemNearLike.getUnitPrice()}"/></del></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <div class="rate-star-class">
                                    <c:if test="${itemNearLike.getTotalComment() ne 0}">
                                        <c:set var="AVGRate1" value="${Math.ceil(itemNearLike.getTotalRate()/itemNearLike.getTotalComment())}"/>
                                        <c:set var="minValue" value="${AVGRate1 < 5 ? AVGRate1 : 5}" />
                                        <c:forEach begin="1" end="${minValue}">
                                            <small class="fa fa-star fasize checked"></small>  
                                        </c:forEach>
                                        <c:forEach begin="1" end="${5 - minValue}">
                                            <small class="fa fa-star fasize"></small>     
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${itemNearLike.getTotalComment() eq 0}">
                                        <c:forEach begin="1" end="${5}">
                                            <small class="fa fa-star fasize"></small>     
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <small>(${itemNearLike.getTotalComment()})</small>
                            </div>
                        </div>
                    </div>
                </c:forEach>               
            </div>
        </div>
    </div>
</div>
<!-- Products End -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
function validateForm() {
    var accSession = '<%= session.getAttribute("AccSession") %>';
    if (accSession == null) {
      alert("Bạn cần đăng nhập để thực hiện chức năng này!");
      window.location.href = "signIn"; // chuyển hướng đến trang signIn
      return false; // ngăn không cho submit form
    }
    return true; // cho phép submit form
  }
</script>
<%@include file="template/footer.jsp" %>