<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<main class="page auth-page">
    <h1>Đăng nhập</h1>
    <form method="post" action="${pageContext.request.contextPath}/login">
        <input name="email" type="email" placeholder="Email" required>
        <input name="password" type="password" placeholder="Mật khẩu" required>
        <button type="submit">Đăng nhập</button>
    </form>
</main>
