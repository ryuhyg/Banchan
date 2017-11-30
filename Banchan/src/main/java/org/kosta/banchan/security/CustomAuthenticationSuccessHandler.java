package org.kosta.banchan.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler extends
SavedRequestAwareAuthenticationSuccessHandler implements
AuthenticationSuccessHandler{
         public void onAuthenticationSuccess(HttpServletRequest
request, HttpServletResponse response, Authentication authentication)
throws IOException, ServletException {
                // 로그인 완료후 처리할 내용
                super.onAuthenticationSuccess(request, response, authentication);
        }

}
