 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>
<!-- Carousel Start --> 
<section style="background-color: #eee;">
    <div class="container py-5">

        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <c:choose>
                            <c:when test="${not empty customerAccount}">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                             class="rounded-circle img-fluid" style="width: 150px;">
                            </c:when>
                            <c:otherwise>
                                <img src="${GoogleAccount.getPicture()}" alt="avatar"
                             class="rounded-circle img-fluid" style="width: 150px;">
                            </c:otherwise>
                        </c:choose>
                        <h5 class="my-3">${customerAccount.customer.getContactName()}</h5> 
                        <!--                        <div class="d-flex justify-content-center mb-2">
                                                    <button type="button" class="btn btn-primary">Follow</button>
                                                    <button type="button" class="btn btn-outline-primary ms-1">Message</button>
                                                </div>-->
                    </div>
                </div>

            </div>
            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Full Name</p>
                            </div>
                            <div class="col-sm-9">
                                <c:choose>
                                    <c:when test="${not empty customerAccount}">
                                        <p class="text-muted mb-0">${customerAccount.customer.getContactName()}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-muted mb-0">${GoogleAccount.getName()}</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email</p>
                            </div>
                            <div class="col-sm-9">
                                <c:choose>
                                    <c:when test="${not empty customerAccount}">
                                        <p class="text-muted mb-0">${customerAccount.customer.getEmail()}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-muted mb-0">${GoogleAccount.getEmail()}</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Address</p>
                            </div>
                            <div class="col-sm-9">
                                <c:choose>
                                    <c:when test="${not empty customerAccount}">
                                        <p class="text-muted mb-0">${customerAccount.customer.getAddress()}</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-muted mb-0">Ha noi</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- Vendor End -->
<%@include file="template/footer.jsp" %>
