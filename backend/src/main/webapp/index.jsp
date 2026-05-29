<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MotoSales - Đặt lịch mua xe máy</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<jsp:include page="/common/header.jsp"/>
<main class="page">
    <section class="hero">
        <h1>Quản lý và đặt lịch hẹn mua xe máy</h1>
        <p>Tìm xe, thêm vào giỏ hàng, đăng ký lịch hẹn nhận xe và theo dõi trạng thái đơn đặt.</p>
        <a class="primary-button" href="${pageContext.request.contextPath}/products.jsp">Xem danh sách xe</a>
    </section>

    <section>
        <h2>Xe mới cập nhật</h2>
        <div class="grid">
            <c:forEach var="motorcycle" items="${featuredMotorcycles}">
                <article class="motorcycle-card">
                    <h3>${motorcycle.brandName} ${motorcycle.modelName}</h3>
                    <p>${motorcycle.price} VND</p>
                    <span>Còn ${motorcycle.stockQuantity} xe</span>
                </article>
            </c:forEach>
        </div>
    </section>
</main>
<jsp:include page="/common/footer.jsp"/>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
