<%-- 
    Document   : Student
    Created on : 21 груд. 2023 р., 12:25:38
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
    <title>Student</title>
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
    <div id="page">
        <h1>Student Form</h1>
        <form method="post" action="NewServlet">
            <table>
    <tbody>
        <tr>
            <td><label for="name">Name</td>
            <td><input id="name" type="text" name="name"></td>
        </tr>
        <tr>
            <td><label for="surname">Surname</td>
            <td><input id="surname" type="text" name="surname"></td>
        </tr>
        <tr>
            <td><label for="email">Email</td>
            <td><input id="email" type="email" name="email"></td>
        </tr>
        <tr>
            <td><label for="group_name">Group</td>
            <td><input id="group_name" type="text" name="group_name"></td>
        </tr>
        <tr>
            <td><label for="faculty">Faculty</td>
            <td><input id="faculty" type="text" name="faculty"></td>
        </tr>
    </tbody>
    </table>
            <input type="submit" name="send" value="Send">
        </form>
    <c:if test="${students.size() > 2}">
    <form action="calculateStats">
        <input type="submit" name="send2" value="Statistics">
    </form>
    </c:if>

    <div id="content">
        <c:if test="${not empty students}">
            
                <table class="list">
                    <tr>
                        <th>Name</th>
                        <th>Surname</th>
                        <th>Email</th>
                        <th>Group</th>
                        <th>Faculty</th>
                    </tr>
                    <c:forEach items="${students}" var="s">
                        <tr>
                            <td><c:out value="${s.name}" /></td>
                            <td><c:out value="${s.surname}" /></td>
                            <td><c:out value="${s.email}" /></td>
                            <td><c:out value="${s.group_name}" /></td>
                            <td><c:out value="${s.faculty}" /></td>
                            <td><a href="ScoresServlet?id=${s.id}">View Grades</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>
</body>
</html>