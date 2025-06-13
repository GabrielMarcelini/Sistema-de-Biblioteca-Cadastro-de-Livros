package filters;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
        throws IOException, ServletException {

        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpRes = (HttpServletResponse) res;

        String contextPath = httpReq.getContextPath();
        String url = httpReq.getRequestURI();

        boolean userLogged = httpReq.getSession().getAttribute("usuario_logado") != null;

        boolean isPublicPage = url.endsWith("login.jsp") || url.endsWith("/login") || url.endsWith("/logout");
        boolean isStaticResource = url.contains("/css/") || url.contains("/js/") || url.contains("/images/");

        if (userLogged || isPublicPage || isStaticResource) {
            chain.doFilter(req, res);
        } else {
            httpRes.sendRedirect(contextPath + "/login.jsp");
        }
    }
}