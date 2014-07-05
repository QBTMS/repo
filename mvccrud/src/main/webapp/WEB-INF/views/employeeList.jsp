<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>All Employees</title>
</head>
<body>
<h1>List Employees</h1>
<h3>1. <a href="add.html">Add More Employee</a></h3>
<h3>2. <a href="addVehicle.html">Add Vehicles</a></h3
<h2>3. <a href="/mvccrud/j_spring_security_logout">Logout</a> </h2>



<c:if test="${!empty employees}">
    <table align="left" border="1">
        <tr>
            <th>Employee ID</th>
            <th>Employee Name</th>
            <th>Employee Age</th>
            <th>Employee Salary</th>
            <th>Employee Address</th>
        </tr>

        <c:forEach items="${employees}" var="employee">
            <tr>
                <td><c:out value="${employee.empId}"/></td>
                <td><c:out value="${employee.empName}"/></td>
                <td><c:out value="${employee.empAge}"/></td>
                <td><c:out value="${employee.salary}"/></td>
                <td><c:out value="${employee.empAddress}"/></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<h1>List Vehicles</h1>
<c:if test="${!empty vehicles}">
    <table align="left" border="1">
        <tr>
            <th>Vehicle Number</th>
            <th>Vehicle Type</th>
            <th>Vehicle Owner</th>
        </tr>

        <c:forEach items="${vehicles}" var="vehicle">
            <tr>
                <td><c:out value="${vehicle.vehicleNumber}"/></td>
                <td><c:out value="${vehicle.vehicleType}"/></td>
                <td><c:out value="${vehicle.employee.empId}"/></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>