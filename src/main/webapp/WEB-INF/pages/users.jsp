<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Manager</title>
    <style type="text/css">
        table {
            margin: auto;
        }

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-size: 17px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            background-color: #fff;
        }

        .tg th {
            font-size: 17px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            background-color: #f0f0f0;
        }

        #sidebar {
            height: 490px;;
            float: left;
            width: 12%;
            font-size: 18px;
        }

        #content {
            height: 460px;
            float: right;
            width: 85%;
        }

        #pagination {
            font-size: 18px;
            float: right;
            width: 85%;
        }
    </style>
</head>
<body>
<br/>
<h2 align="center">User Manager</h2>

<div id="sidebar">
    <div ><a href="<c:url value='/'/>">Home</a></div>
    <div ><a href="<c:url value='/update/0'/>">Add new user</a></div>
    <div><a href="<c:url value='/admins'/>">Show all admins</a></div>
    <form action="searchUser">
        <div class="row">
            <div class="col-md-2">Search users by name:</div>
            <div class="col-md-2"><input type="text" name="searchName" id="searchName"></div>
            <div class="col-md-2"><input class="btn btn-xs" type='submit' value='Search'/></div>
        </div>
    </form>
</div>

<div id="content">
    <c:if test="${empty users}">
        List of users is empty. You can add someone.
    </c:if>
    <c:if test="${!empty users}">
        <table class="tg">
            <tr>
                <th>ID</th>
                <th width="220">Name</th>
                <th width="40">Age</th>
                <th width="80">Is admin</th>
                <th width="200">Created data</th>
                <th width="50">Edit</th>
                <th width="80">Delete</th>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td><a href="/userData/${user.id}" target="_blank">${user.name}</a></td>
                    <td align="center">${user.age}</td>
                    <td align="center">${user.admin}</td>
                    <td align="center">${user.createdDate}</td>
                    <td align="center"><a href="<c:url value='/update/${user.id}'/>">Edit</a></td>
                    <td align="center"><a href="<c:url value='/remove/${user.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
<div id="pagination" align="center">
    <c:url value="/" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>

    <c:if test="${page > 1}">
        <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>

    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
        <c:choose>
            <c:when test="${page == i.index}">
                <span>${i.index}</span>
            </c:when>
            <c:otherwise>
                <c:url value="/" var="url">
                    <c:param name="page" value="${i.index}"/>
                </c:url>
                <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:url value="/" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>
</body>
</html>
