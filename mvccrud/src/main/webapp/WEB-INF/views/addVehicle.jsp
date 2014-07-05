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
<<h2>4. <a href="/mvccrud/j_spring_security_logout">Logout</a> </h2>
<h2>Add Vehicle Data</h2>
<form:form method="POST" action="/mvccrud/saveVehicle.html" commandName="commandVehicle">
    <table>
        <tr>
            <td><form:label path="employee">Owner:</form:label></td>
            <td>
            <select name="employee">
                <c:forEach items="${employees}" var="employee" varStatus="status">
                    <option value="${employee}" >
                        ${employee.empName}
                    </option>
                </c:forEach>
            </select>
        </td>
        </tr>
        <tr>
            <td><form:label path="vehicleNumber">Vehicle Number:</form:label></td>
            <td><form:input path="vehicleNumber" value="${vehicle.vehicleNumber}" /><span style="color: #ff0404; "><form:errors path='vehicleNumber' /></span></td>
        </tr>
        <tr>
            <td><form:label path="vehicleType">Vehicle Type:</form:label></td>
            <td><form:input path="vehicleType" value="${vehicle.vehicleType}"/><span style="color: #ff0404; "></span></td>
            <td><form:errors path='vehicleType' /></td>
        </tr>

        
        <tr>
        <td colspan="2"><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form:form>
</body>
</html>
