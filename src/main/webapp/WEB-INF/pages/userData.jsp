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
            font-size: 18px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            background-color: #fff;
        }

        .tg th {
            font-size: 18px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<h2 align="center">User details</h2>

<table class="tg">
    <tr>
        <th>ID</th>
        <th width="220">Name</th>
        <th width="40">Age</th>
        <th width="80">Is admin</th>
        <th width="200">Created data</th>
    </tr>
    <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td align="center">${user.age}</td>
        <td align="center">${user.admin}</td>
        <td align="center">${user.createdDate}</td>
    </tr>
</table>
</body>
</html>