<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>User Manager</title>
</head>
<body>
<br/>
<h2 align="center">Update users list</h2>

<div align="center">
    <c:url var="addAction" value="/addUser"/>

    <form:form action="${addAction}" commandName="user">
        <table>
            <c:if test="${!empty user.name}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="age">
                        <spring:message text="Age"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="age"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="admin">
                        <spring:message text="Is admin"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="admin"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty user.name}">
                        <input type="submit" value="<spring:message text="Edit user"/>"/>
                    </c:if>
                    <c:if test="${empty user.name}">
                        <input type="submit" value="<spring:message text="Add user"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
