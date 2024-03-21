package com.example.cnw.controller;



import com.example.cnw.dao.AccountDAO;
import com.example.cnw.entity.Account;
import com.example.cnw.entity.Email;
import com.example.cnw.entity.EmailUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "ForgotPasswordControl", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordControl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
   	 	response.setContentType("text/html;charset=UTF-8");

		try {
			String emailAddress = request.getParameter("email");
			String username = request.getParameter("username");
			

			AccountDAO accountDAO = new AccountDAO();
			Account account = accountDAO.checkAccountExistByUsernameAndEmail(username, emailAddress);
			if(account == null) {
				request.setAttribute("error", "Email hoac username sai!");
			}
			if(account != null) {
				Email email =new Email();
				email.setFrom("meomeo6lee69@gmail.com");
				email.setFromPassword("kkvkyeugrcfbhyqu");
				email.setTo(emailAddress);
				email.setSubject("Retrieve Password");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear ").append(username).append("<br>");
				sb.append("You are used the forgot password. <br> ");
				sb.append("Your password is <b>").append(account.getPass()).append(" </b> <br>");
				sb.append("Regards<br>");
				sb.append("Administrator");
				
				email.setContent(sb.toString());
				EmailUtils.send(email);
				
				request.setAttribute("mess", "Mat khau da duoc gui den email cua ban!");

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
	}

}
