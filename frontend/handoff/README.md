# Frontend Handoff

Frontend owns the JSP views and static assets under `backend/src/main/webapp`.

## Owned Areas

- `common/header.jsp`
- `common/footer.jsp`
- `index.jsp`
- `products.jsp`
- `product-detail.jsp`
- `cart.jsp`
- `checkout.jsp`
- `order-history.jsp`
- `login.jsp`
- `register.jsp`
- `admin/*.jsp`
- `assets/css/style.css`
- `assets/js/main.js`
- `assets/images/*`

## Integration Contract

- Keep JSP filenames stable so backend servlet mappings can forward to them.
- Use JSTL for server-rendered collections.
- Do not put SQL or Java business logic inside JSP pages.
- Coordinate request attribute names with backend issues before merging.
