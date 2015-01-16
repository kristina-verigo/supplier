<%@page import="com.verigo.supplier.model.User"%>
<%@page import="com.verigo.SessionBean"%>
<%@page import="com.verigo.SessionBean"%>
<%@page import="com.verigo.SpringFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <script src="resources/js/bootstrap.min.js"></script>
        <link href="resources/css/supplier.css" rel="stylesheet">

        <title>Main menu Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки поставщиков. Главное меню</h3>
            <br>
            <h4>
                <span class="glyphicon glyphicon-user"></span>
                <%
                    SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
                    User user = sessionBean.getCurrentUser();
                    String login = "";
                    if (user != null) {
                        login = user.getName();

                        String admin = user.getAdmin();
                        login += " (" + admin + ")";

                    }

                %>
                <%=login%>
            </h4>
            <br>
            <table class="table table-striped">
                <tr>
                    <th>Описание</th>
                    <th>Меню</th>
                <tr>
                    <td>Поставщики текущего пользователя</td>
                    <td>
                        <form action="suppliers-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-lock" aria-hidden="true"></span> Меню поставщиков
                            </button> 
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Товары текущего пользователя</td>
                    <td>
                        <form action="goods-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span> Меню товаров
                            </button> 
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Рейтинги поставщиков по товарам</td>
                    <td>
                        <form action="ratings-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-bullhorn" aria-hidden="true"></span> Меню рейтингов
                            </button> 
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>Общая статистика</td>
                    <td>
                        <form action="stats-menu.jsp">
                            <button class="btn btn-info btn-block" type="submit">
                                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Меню статистики
                            </button> 
                        </form>
                    </td>
                </tr>                

                <%
                    if (user != null) {
                        if (user.getAdmin().equals("admin")) {
                            out.write("<tr>");
                            out.write("<td>Пользователи</td>");
                            out.write("<td>");
                            out.write("<form action=\"user-menu.jsp\">");
                            out.write("<button class=\"btn btn-warning btn-block\">");
                            out.write("<span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\"></span> Меню пользователей");
                            out.write("</button>");
                            out.write("</form>");
                            out.write("</td>");
                            out.write("</tr>");
                        }
                    }
                %>

            </table>

            <form class="form-signin" method="GET" action="/supplier/webresources/logout">
                <button class="btn btn-info" type="submit">
                    <span class="glyphicon glyphicon-off"></span> Выход
                </button>
            </form>
        </div>

    </body>
</html>
