<%@page import="com.verigo.supplier.model.Good"%>
<%@page import="com.verigo.supplier.service.GoodService"%>
<%@page import="com.verigo.supplier.model.Supplier"%>
<%@page import="com.verigo.supplier.service.SupplierService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.verigo.supplier.model.Link"%>
<%@page import="java.util.List"%>
<%@page import="com.verigo.supplier.service.LinkService"%>
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
        <title>Suppliers rating menu Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки поставщиков. Меню рейтингов</h3>
            <br>
            <h4>
                <span class="glyphicon glyphicon-user"></span>
                <%
                    SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
                    User user = sessionBean.getCurrentUser();
                    Integer userId = 0;
                    String login = "";
                    if (user != null) {
                        userId = user.getId();
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
                    <th>Номер</th>
                    <th>Поставщик</th>
                    <th>Товар</th>
                    <th>Проценты</th>
                </tr>
                <%
                    SupplierService supplierService = (SupplierService) SpringFactory.getspringApplicationContext().getBean("supplierService");
                    List<Supplier> suppliersList = new ArrayList<>();
                    suppliersList = supplierService.getAllSuppliersByUserId(userId);
                    out.write("<br>");
                    out.write("<br>");

                    for (int i = 0; i < suppliersList.size(); i++) {
                        Supplier supplier = suppliersList.get(i);
                        if (supplier != null) {
                            LinkService linkService = (LinkService) SpringFactory.getspringApplicationContext().getBean("linkService");
                            List<Link> linksList = new ArrayList<>();
                            linksList = linkService.getAllLinksByCustomerId(supplier.getId());
                            //Sortlist by Software ID
                            for (int b = 0; b < linksList.size() - 1; b++) {
                                for (int a = 1; a < linksList.size() - b; a++) {
                                    Link tempLink = linksList.get(a);
                                    if (tempLink.getGoodId()< linksList.get(a - 1).getGoodId()) {
                                        linksList.set(a, linksList.get(a - 1));
                                        linksList.set(a - 1, tempLink);
                                    }
                                }
                            }

                            out.write("<tr>");
                            out.write("<td>" + "Поставщик в списке №: " + i + "</td>");
                            out.write("</tr>");

                            // Out a cell with current project id
                            Integer totalBalance = 0;
                            for (int j = 0; j < linksList.size(); j++) {
                                Link link = linksList.get(j);
                                if (link != null){
                                out.write("<tr>");

                                out.write("<td>" + link.getId() + "</td>");
                                Supplier tempClient = supplierService.readSupplier(link.getCustomerId());
                                out.write("<td>" + tempClient.getName() + "</td>");

                                GoodService goodService = (GoodService) SpringFactory.getspringApplicationContext().getBean("goodService");
                                Integer goodId = link.getGoodId();
                                Good tempGood = goodService.readGood(goodId);
                                out.write("<td>" + tempGood.getName() + "</td>");
                                out.write("<td>" + link.getPercent() + "</td>");                                

                                totalBalance = totalBalance + link.getPercent();
                                if (j > 0){
                                    totalBalance = totalBalance / (j + 1);
                                }
                                }
                            }

                            out.write("<tr>");
                            out.write("<td>" + "Итого процентов: " + totalBalance + "</td>");
                            out.write("</tr>");

                        }
                        out.write("");
                    }
                %>

            </table>


            <table> 
                <tr>
                    <td>
                        <form action="ratings-operations.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-bullhorn"></span> Операции рейтинга
                            </button>
                        </form>
                    </td>
                    <td>
                        &nbsp
                    </td>
                    <td>
                        <form action="main-menu.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-home"></span> В главное меню
                            </button>
                        </form>
                    </td>
                </tr>
            </table>

        </div>
    </body>
</html>
