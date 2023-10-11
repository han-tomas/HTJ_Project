<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid bg-white position-relative">
    <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
        <a href="../main/main.do" class="navbar-brand text-secondary">
            <img src="../img/jeju_logo.png" style="width: 200px; height: 50px">
        </a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ml-auto py-0 pr-3 border-right">
                <a href="index.html" class="nav-item nav-link active">Home</a>
                <a href="about.html" class="nav-item nav-link">About</a>
                <a href="service.html" class="nav-item nav-link">Services</a>
                <a href="price.html" class="nav-item nav-link">Prices</a>
                <a href="project.html" class="nav-item nav-link">Projects</a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                    <div class="dropdown-menu rounded-0 m-0">
                        <a href="team.html" class="dropdown-item">Meat The Team</a>
                        <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                    </div>
                </div>
                <a href="contact.html" class="nav-item nav-link">Contact</a>
            </div>
            <div class="d-none d-lg-flex align-items-center pl-4">
                <div>
                    <c:if test="${sessionScope.id==null }">
                    	<a href="../member/login.do" class="btn btn-warning" style="width: 100px; height: 40px">로그인</a>
                    </c:if>
                </div>
            </div>
        </div>
    </nav>
</div>
</body>
</html>