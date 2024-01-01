<%-- 
    Document   : mark
    Created on : 15 дек. 2023 г., 01:19:51
    Author     : artem
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sumdu.edu.ua.mavenproject2.Student"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mark</title>
             <style>
            h1{
                text-align: center;
            }
            #page {
                width: 800px;
                margin: auto;
            }
            form {
                width: 400px;
                margin: 20px auto;
            }
            input[type=submit] {
                margin: auto;
            }
            .list, .list td, .list th {
                margin: auto;
                border: 1px solid black;
                border-collapse: collapse;
            }
            .list td, .list th {
                padding:10px;
            }
            body { 
              
                background-repeat: no-repeat;
                background-image: url(https://kalix.club/uploads/posts/2022-12/1671529589_kalix-club-p-saga-o-vinlande-oboi-vkontakte-5.jpg);
                background-attachment: fixed;
                background-size: 100% 100%;
            }
            #content{
                background-color: lightblue;
                width: 400px;
                margin: 20px auto;
            }
        </style>
    </head>
    <body>
        <h1>Marks of <c:out value="${user.getId()}"/> <c:out value="${user.getName()}"/> <c:out value="${user.getSurname()}"/></h1>       
        <div id="content">
            <table class="list">
                <tr>
                    <th>Discipline</th>
                    <th>Mark</th>
                    <th>ECTS</th>
                </tr>
                <c:forEach var="disc" items="${marks}">
                    <tr>
                        <td><c:out value="${disc.getTitle()}"/></td>
                        <td><c:out value="${disc.getMark_num()}"/></td>
                        <td><c:out value="${disc.getMark_let()}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>       
    </body>
</html>
