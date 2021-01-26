package thuongnguyen.it78.controllers.account;

import thuongnguyen.it78.daos.AccountDAO;
import thuongnguyen.it78.daos.CheckOutDAO;
import thuongnguyen.it78.daos.ShoesDAO;
import thuongnguyen.it78.models.Account;
import thuongnguyen.it78.models.OrderDetail;
import thuongnguyen.it78.models.Shoes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;


@WebServlet("/me/checkout")
public class CheckOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String note = req.getParameter("note");
        Account accountLegal = (Account) req.getSession().getAttribute("account");
        HashMap<Integer, OrderDetail> mapShoes = (HashMap) req.getSession().getAttribute("cart");



        if(CheckOutDAO.checkOut(note, accountLegal.getId(), mapShoes)) {
            PrintWriter out = res.getWriter();
            out.println("OK");
            out.flush();
            out.close();
            mapShoes.clear();
            req.getSession().setAttribute("cart", mapShoes);
            return;
        }

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        req.getRequestDispatcher("/views/checkout.jsp").forward(req, res);
    }
}