<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Spring MVC Form Handling</title>
</head>
<body>
<h2>1. <a href="employees.html">List of Employees</a></h2>
<h2>2. <a href="add.html">Add Employee</a></h2>
<h2>3. <a href="addVehicle.html">Add Vehicle</a> </h2>
<h2>4. <a href="/mvccrud/j_spring_security_logout">Logout</a> </h2>
<h2>Add Employee Data</h2>
<%--
<form:form method="POST" action="/mvccrud/save.html" commandName="command">
    <table>
        <tr>
            <td><form:label path="empId">Employee ID:</form:label></td>
            <td><form:input path="empId" value="${employee.empId}" readonly="true"/></td>
        </tr>
        <tr>
            <td><form:label path="empName">Employee Name</form:label></td>
            <td><form:input path="empName" value="${employee.empName}"/><span style="color: #ff0404; "><form:errors path='empName' /></span></td>
        </tr>
        <tr>
            <td><form:label path="empAge">Employee Age:</form:label></td>
            <td><form:input path="empAge" value="${employee.empAge}"/><span style="color: #ff0404; "><form:errors path='empAge' /></span></td>
        </tr>
        <tr>
            <td><form:label path="salary">Employee Salary:</form:label></td>
            <td><form:input path="salary" value="${employee.salary}"/><span style="color: #ff0404; "><form:errors path='salary' /></span></td>
        </tr>

        <tr>
            <td><form:label path="empAddress">Employee Address:</form:label></td>
            <td><form:input path="empAddress" value="${employee.empAddress}"/><span style="color: #ff0404; "><form:errors path='empAddress' /></span></td>
        </tr>

            <td colspan="2"><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form:form>
--%>



<h1>List Employees</h1>
<c:if test="${!empty employees}">
    <h2>List Employees</h2>
    <table align="left" border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Employee Age</th>
            <th>Employee Salary</th>
            <th>Employee Address</th>
            <th>Actions on Row</th>
        </tr>

        <c:forEach items="${employees}" var="employee">
            <tr>
                <td><c:out value="${employee.empId}"/></td>
                <td><c:out value="${employee.empName}"/></td>
                <td><c:out value="${employee.empAge}"/></td>
                <td><c:out value="${employee.salary}"/></td>
                <td><c:out value="${employee.empAddress}"/></td>
                <td align="center"><a href="edit.html?empId=${employee.empId}">Edit</a> | <a href="delete.html?empId=${employee.empId}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br />
<br /><br />
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<h1>List Vehicles</h1>
<c:if test="${!empty vehicles}">
    <table align="left" border="1">
        <tr>
            <th>Vehicle Number</th>
            <th>Vehicle Type</th>
            <th>Vehicle Owner ID</th>
            <th>Vehicle Owner Name</th>
        </tr>

        <c:forEach items="${vehicles}" var="vehicle">
            <tr>
                <td><c:out value="${vehicle.vehicleNumber}"/></td>
                <td><c:out value="${vehicle.vehicleType}"/></td>
                <td><c:out value="${vehicle.employee.empId}"/></td>
                <td><c:out value="${vehicle.employee.empName}"/></td>
                <td align="center"><a href="editV.html?vehicleNumber=${vehicle.vehicleNumber}">Edit</a> | <a href="deleteV.html?vehicleNumber=${vehicle.vehicleNumber}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


</body>
</html>