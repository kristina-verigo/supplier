<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.verigo.supplier.model.Good"%>
<%@page import="java.util.List"%>
<%@page import="com.verigo.supplier.service.GoodService"%>
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

        <title>Goods menu page</title>
    </head>
    <body>
        <div class="container">
            <h3>Goods menu</h3>
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
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date</th>
                </tr>
                <%
                    GoodService goodService = (GoodService) SpringFactory.getspringApplicationContext().getBean("goodService");
                    List<Good> goodsList = new ArrayList<>();
                    goodsList = goodService.getAllGoods();
                    List<Good> currentUserGoodsList = new ArrayList<>();

                    for (int i = 0; i < goodsList.size(); i++) {
                        Good good = goodsList.get(i);
                        if (good.getUserId() == user.getId()) {
                            currentUserGoodsList.add(good);
                        }
                    }

                    for (int i = 0; i < currentUserGoodsList.size(); i++) {
                        Good good = currentUserGoodsList.get(i);
                        if (good != null) {
                            out.write("<tr>");
                            out.write("<td>" + good.getId() + "</td>");
                            out.write("<td>" + good.getName() + "</td>");                           
                            Date softwareDate = good.getDate();
                            if (softwareDate != null) {
                                SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
                                String date = sdf.format(softwareDate);
                                out.write("<td>" + date + "</td>");
                            }

                            out.write("</tr>");
                        }

                        out.write("");
                    }
                %>

            </table>
            <br>


            <table> 
                <tr>
                    <td>
                        <form action="goods-operations.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-shopping-cart"></span> Goods operations
                            </button>
                        </form>
                    </td>
                    <td>
                        &nbsp
                    </td>
                    <td>
                        <form action="main-menu.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-home"></span> Back to main menu
                            </button>
                        </form>
                    </td>
                </tr>
            </table>

        </div>
    </body>
</html>