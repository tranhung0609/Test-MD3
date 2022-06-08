<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/8/2022
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form method="post">
    <input type="text" name="name" placeholder="tên cần tìm">
    <input type="hidden" name="action" value="search">
    <input type="submit" value="tìm kiếm">
  </form>
  <h1>Danh sách sản phẩm</h1>
  <c:forEach items="${products}" var="product">
    <h2>${product.id} , ${product.name} , giá ${product.price} , số lượng ${product.quantity}</h2>
    <c:if test="${product.price > 200}">Sale 10%</c:if>
    <c:if test="${product.price < 200}">Sale 20%</c:if>
  </c:forEach>

  </body>
</html>
