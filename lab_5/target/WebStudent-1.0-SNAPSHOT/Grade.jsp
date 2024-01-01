<%-- 
    Document   : Grade
    Created on : 21 груд. 2023 р., 12:28:16
    Author     : Admin
--%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.springinjections.Student"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grade</title>
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
        <c:if test="${not empty sessionScope.marks}">
            <div id="page">
                <h1>Grades</h1>
                <table class="list">
                    <thead>
                        <tr>
                            <th>Discipline</th>
                            <th>ECTS</th>
                            <th>Mark</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.marks}" var="s">
                            <tr>
                                <td><c:out value="${s.title}" /></td>
                                <td><c:out value="${s.mark_let}" /></td>
                                <td><c:out value="${s.mark_num}" /></td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </body>
</html>