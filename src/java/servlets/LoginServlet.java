package servlets;

import dataaccess.UserDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Users;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("username");
    
        if (request.getParameter("logout") != null){
            session.invalidate();
            user = null;
            request.setAttribute("message", "You have successfully logged out");
        }
        if (user != null){
            switch (user){
                case "admin":
                    response.sendRedirect("admin");
                    break;
                default:
                    response.sendRedirect("inventory");
                    break;
            }
          return;
        }
        getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        return;
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String user = (String) request.getParameter("username").toLowerCase();
        String pass = (String) request.getParameter("password").toLowerCase();
        UserDB userdb = new UserDB();
   
        try{
            if (user.length() > 0 && pass.length() > 0){
                Users newUser = userdb.get(user);
                
                if (newUser.getPassword().equals(pass) && newUser.getActive() == true){
                    session.setAttribute("username", newUser.getUsername());
                    if (newUser.getIsAdmin() == true){
                        response.sendRedirect("admin");
                        return;
                    }else{
                        response.sendRedirect("inventory");
                        return;
                    }
                }
            }
        }catch (Exception ex){
            request.setAttribute("message","Invalid login.");
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            return;
        }
        request.setAttribute("message","Invalid login.");
        getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        return;
    }


}

