 
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
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
                             class="rounded-circle img-fluid" style="width: 150px;">
                        <h5 class="my-3">${customerAccount.customer.getContactName()}</h5> 
                        <button id="s5" class="btn btn-primary" onclick="update()">Cập nhật thông tin</button>
                        <a href="./chagePass"> <button id="s5" class="btn btn-primary" >Đổi mật khẩu</button></a> 

                    </div>
                </div>

            </div>
            <c:if test="${check == null}">
                <form id="updateUser" action="./UpdateProfile" method="post"></form>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p id="s1" class="text-muted mb-0">${customerAccount.customer.getContactName()}</p>
                                    <p><input pattern="^[\p{L}\s]+$" title="Tên không được chữa ký tự đặc biệt" name="name" form="updateUser" id="a1" style="display: none" 
                                              type="text" class="form-control" required value="${customerAccount.customer.getContactName()}"/></p>

                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p id="s2" class="text-muted mb-0">${customerAccount.account.getEmail()}</p>
                                    <p><input id="a2" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" form="updateUser" style="display: none"  type="text" class="form-control" 
                                              name="email"    readonly value="${customerAccount.account.getEmail()}"/></p>
                                </div>
                            </div>

                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p id="s3" class="text-muted mb-0">${customerAccount.customer.getAddress()}</p>
                                    <p><input name="address" id="a3" pattern="[a-zA-ZÀ-ỹ0-9\s,'-]{3,}" form="updateUser" style="display: none" type="text" 
                                              class="form-control" required value="${customerAccount.customer.getAddress()}"/></p>

                                </div>
                            </div> <hr>
                            <!--                        <div class="row">
                                                        <div class="col-sm-3">
                                                            <p class="mb-0">Pass</p>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p id="s4" class="text-muted mb-0">${customerAccount.account.getPass()}</p>
                                                            <p><input name="pass" id="a4" pattern="[a-zA-ZÀ-ỹ0-9\s,'-]{3,}" form="updateUser" style="display: none" type="text" 
                                                                      class="form-control" required value="${customerAccount.account.getPass()}"/></p>
                            
                                                        </div>
                                                    </div>-->
                            <div class="row">
                                <div class="col-sm-3">
                                </div>
                                <div class="col-sm-9">
                                    <button id="a5" form="updateUser" style="display: none" class="btn btn-primary" type="submit">Cập nhật</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </c:if>
            <c:if test="${check}">
                <form id="updatePass" action="./chagePass" method="post"></form>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="container text-center">
                                    <h3>Change Password</h3>
                                    <br/>
                                </div> 
                            </div> 
                            <c:if test="${!mess && mess != null}">
                                <span style="color: red">Mat khau ko dung</span>
                            </c:if>
                            <c:if test="${mess}">
                                <span style="color: green">Doi mk thanh cong</span>
                            </c:if>

                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Old Pass</p>
                                </div>
                                <div class="col-sm-9">
                                    <p><input name="pass"  form="updatePass" type="text" 
                                              class="form-control" required value=""/></p> 
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">New Pass</p>
                                </div>
                                <div class="col-sm-9">
                                    <p><input name="newpass"  form="updatePass" type="text" 
                                              class="form-control" required value=""/></p> 
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-sm-3">
                                </div>
                                <div class="col-sm-9">
                                    <button id="a5" form="updatePass" class="btn btn-primary" type="submit">Cập nhật</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </c:if>
        </div>
    </div>
</section>
<!-- Vendor End -->
<%@include file="template/footer.jsp" %>
<script>
    function update() {
        // Lấy các phần tử cần thay đổi thuộc tính bằng ID
        document.getElementById('s1').style.display = 'none';
        document.getElementById('s2').style.display = 'none';
        document.getElementById('s3').style.display = 'none';
//        document.getElementById('s4').style.display = 'none';
        document.getElementById('s5').style.display = 'none';

        document.getElementById('a1').style.display = 'block';
        document.getElementById('a2').style.display = 'block';
        document.getElementById('a3').style.display = 'block';
//        document.getElementById('a4').style.display = 'block';
        document.getElementById('a5').style.display = 'block';
    }
</script>