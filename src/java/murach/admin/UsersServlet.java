package murach.admin;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;

public class UsersServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String url = "/index.jsp";

        // Lấy action hiện tại
        String action = request.getParameter("action");
        if (action == null) {
            action = "display_users";  // mặc định
        }

        // ======= 1️⃣ Hiển thị danh sách người dùng =======
        if (action.equals("display_users")) {
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);
            url = "/index.jsp";
        }

        // ======= 2️⃣ Hiển thị thông tin user cần update =======
        else if (action.equals("display_user")) {
            String email = request.getParameter("email");
            User user = UserDB.selectUser(email);

            // Lưu vào request để hiển thị lên user.jsp
            request.setAttribute("user", user);
            url = "/user.jsp";
        }

        // ======= 3️⃣ Cập nhật thông tin người dùng =======
        else if (action.equals("update_user")) {
            // Lấy thông tin từ form user.jsp
            String email = request.getParameter("email");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");

            // Lấy user hiện tại từ database
            User user = UserDB.selectUser(email);
            if (user != null) {
                user.setFirstName(firstName);
                user.setLastName(lastName);
                UserDB.update(user);
            }

            // Lấy lại danh sách user
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);

            url = "/index.jsp";
        }

        // ======= 4️⃣ Xóa người dùng =======
        else if (action.equals("delete_user")) {
            String email = request.getParameter("email");
            User user = UserDB.selectUser(email);

            if (user != null) {
                UserDB.delete(user);
            }

            // Lấy lại danh sách user
            List<User> users = UserDB.selectUsers();
            request.setAttribute("users", users);

            url = "/index.jsp";
        }

        // Chuyển đến trang JSP tương ứng
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
