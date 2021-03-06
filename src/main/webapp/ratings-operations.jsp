<%@page import="com.verigo.supplier.model.User"%>
<%@page import="com.verigo.SpringFactory"%>
<%@page import="com.verigo.SessionBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <script src="resources/js/bootstrap.min.js"></script>
        <link href="resources/css/supplier.css" rel="stylesheet">

        <title>Rating's operations page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки поставщиков. Операции рейтинга</h3>
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

            <form class="form-signin" method="GET" action="/supplier/webresources/links/create">
                <input name = "paramSupplierName" type="text" id="login" class="form-control" placeholder="поставщик">   
                <br>
                <input name = "paramGoodName" type="text" id="name" class="form-control" placeholder="товар">
                <br>
                <input name = "paramPercent" type="text" id="name" class="form-control" placeholder="проценты">
                <br>
                <br>

                <table>
                    <tr>
                        <td>

                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-bullhorn"></span> Создать новый рейтинг
                            </button>
                            </form>
                        </td>
                        <td>
                            &nbsp
                        </td>

                        <td>
                            <form action="ratings-menu.jsp">
                                <button class="btn btn-info">
                                    <span class="glyphicon glyphicon-bullhorn"></span> В меню рейтинга
                                </button>
                            </form>
                        </td>
                    </tr>
                </table>    

            </form>
        </div>
    </body>
</html>
