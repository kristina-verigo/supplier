<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.verigo.supplier.model.Supplier"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.verigo.supplier.service.SupplierService"%>
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
        <title>Suppliers menu Page</title>
    </head>
    <body>
        <div class="container">
            <h3>Система оценки поставщиков. Меню поставщиков</h3>
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
                    <th>Номер</th>
                    <th>Название</th>
                    <th>Дата</th>
                </tr>
                <%
                    SupplierService supplierService = (SupplierService) SpringFactory.getspringApplicationContext().getBean("supplierService");
                    List<Supplier> suppliersList = new ArrayList<>();
                    suppliersList = supplierService.getAllSuppliers();
                    List<Supplier> currentUserSuppliersList = new ArrayList<>();
                    
                    for (int i = 0; i < suppliersList.size(); i++) {
                        Supplier supplier = suppliersList.get(i);
                        if (supplier.getUserId() == user.getId()){
                            currentUserSuppliersList.add(supplier);
                        }
                    }
                    

                    for (int i = 0; i < currentUserSuppliersList.size(); i++) {
                        Supplier supplier = currentUserSuppliersList.get(i);
                        if (supplier != null) {
                            out.write("<tr>");
                            int supplierId = supplier.getId();
                            out.write("<td>" + supplierId + "</td>");

                            String supplierName = supplier.getName();
                            out.write("<td>" + supplierName + "</td>");

                            Date supplierDate = supplier.getDate();
                            if (supplierDate != null) {
                                SimpleDateFormat sdf = new SimpleDateFormat("dd-M-yyyy");
                                String date = sdf.format(supplierDate);
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
                        <form action="suppliers-operations.jsp">
                            <button class="btn btn-info" type="submit">
                                <span class="glyphicon glyphicon-lock"></span> Операции поставщиков
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
