<%@page import="sumdu.edu.ua.webstudent.Student"%>
<%@page import="sumdu.edu.ua.webstudent.StudentAdd"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Students</title>
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
    <h1><%= (new java.util.Date()).toLocaleString()%></h1>
    
    <form action="StudentAdd">
        <table>
            <tbody>
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input id="name" type="text" name="name"></td>
                </tr>
                <tr>
                    <td><label for="surname">Surname</label></td>
                    <td><input id="surname" type="text" name="surname"></td>
                </tr>
                <tr>
                    <td><label for="email">Email</label></td>
                    <td><input id="email" type="text" name="email"></td>
                </tr>
                <tr>
                    <td><label for="group">Group</label></td>
                    <td><input id="group" type="text" name="group"></td>
                </tr>
                <tr>
                    <td><label for="faculty">Faculty</label></td>
                    <td><input id="faculty" type="text" name="faculty"></td>
                </tr>
            </tbody>
        </table>
        <input type="submit" name="send" value="Відправити">
    </form>

    <c:if test="${students.size() > 2}">
        <form action="calculateStats">
            <input type="submit" name="send2" value="Statistics">
        </form>
    </c:if>

    <div id="content">
        <c:if test="${students.size() > 0}">
            <table class="list">
                <tr>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Email</th>
                    <th>Group</th>
                    <th>Faculty</th>
                </tr>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td><c:out value="${student.getName()}"/></td>
                        <td><c:out value="${student.getSurname()}"/></td>
                        <td><c:out value="${student.getEmail()}"/></td>
                        <td><c:out value="${student.getGroup()}"/></td>
                        <td><c:out value="${student.getFaculty()}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
</body>
</html>
