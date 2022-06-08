<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/8/2022
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
        integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="view.css">
</head>
<body>
<div class="card">
  <h5 class="card-header font-weight-light">
    <a href="" style="text-decoration: none">
      <span class="fas fa-tasks fa-fw mr-3"></span>
      <span><b>Product List</b></span>
    </a>
  </h5>
  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <tr>
          <th style="background-color: pink">#</th>
          <th style="background-color: #1f84d3">Product Name</th>
          <th style="background-color: aqua">Price</th>
          <th style="background-color: #f30909">Sale</th>
          <th style="background-color: #05f66e">Quantity</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">
          <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>
              <c:if test="${product.price > 200}">Sale 10% </c:if>
              <c:if test="${product.price < 200}">Sale 20% </c:if>
            </td>
            <td>${product.quantity}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
<form method="post">
  <input type="text" name="name" placeholder="Tên cần tìm">
  <input type="hidden" name="action" value="search">
  <input type="submit" value="tìm kiếm">
</form>
<form method="post">
  <input type="number" name="start" placeholder="giá bắt đầu">
  <input type="number" name="end" placeholder="giá kết thúc">
  <input type="hidden" name="action" value="search-by-price">
  <input type="submit" value="tìm kiếm">
</form>
</body>
</html>
