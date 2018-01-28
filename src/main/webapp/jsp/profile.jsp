<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.igt.apps.todo.model.User"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="errors" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>To-Do Application</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/docs.css">
<link rel="stylesheet" href="/css/bootstrap.responsive.css">
   <script>
   $(function () {
   $('#myTab a:last').tab('show');
});
   </script>
</head>
<body>
<div>
  <%User user=(User)request.getAttribute("user"); %>
  <div class="navbar navbar-fixed-top" style="background-color: #E5EECC;">
    <div class="navbar-inner">
     <div class="container-fluid">
       <a class="btn btn-navbar" data-target=".nav-collapse" data-toggle="collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
       </a>
       <a class="brand">Welcome <%=user.getName()%> </a>
       <div class="btn-group pull-right">
         <a class="btn dropdown-toggle" href="#" data-toggle="dropdown">
          <i class="icon-user"></i>
          <%=user.getUserId()%>
          <span class="caret"></span>
         </a>
         <ul class="dropdown-menu">
          <li>
           <a href="#">Profile</a>
          </li>
          <li class="divider"></li>
         </ul>
       </div>
     </div>
   </div>
  </div>
</div>
<div class="container-fluid">
   <div class="row-fluid">
     <div class="span3">
        <div class="tabbable">
           <ul class="nav nav-list bs-docs-sidenav affix" id="myTab">
              <li class="active">
                 <a data-toggle="tab" href="#add">
                       ADD TASK
                 </a>
              </li>
              <li class="">
                 <a data-toggle="tab" href="#view">
                      VIEW TASK
                 </a>
              </li>
           </ul>
        </div>
     </div>
     <div class="span8">
       <div class="tab-content">
          <div class="tab-pane active" id="add">
             <form:form modelAttribute="task" action="/add" method="POST" class="form-horizontal bordered">
             <div>
              <legend>Task Details</legend>
              <form:hidden path="userDetails" id="hiddenField" />
             </div>
             <div class="container-fluid">
                <div class="row-fluid">
                  <div class="span6">
                     <div class="control-group">
                        <label class="control-label" for="taskName">Task Name</label>
                        <div class="controls">
                           <form:input path="taskName" class="required" minlength="3" maxlength="100" id="taskName" placeholder="Enter...."/>
                           <form:errors path="taskName" />
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="taskDesc">Task Description</label>
                        <div class="controls">
                           <form:input path="taskDesc" class="required" lettersonly="true" minlength="3" maxlength="100"  id="taskDesc" placeholder="Enter..."/>
                           <form:errors path="taskDesc" />
                        </div>
                     </div>
                  </div>
                  <button type="submit" class="btn">Submit</button>

                </div>
             </div>
             </form:form>
          </div>
          <div class="tab-pane" id="view">
             <table class="table table-striped">
             			<thread>
             				<tr>
             					<th>Task ID</th>
             					<th>Task Name</th>
             					<th>Task Description</th>
             					<th>Task Status</th>
             					<th>Action</th>
             				</tr>
             			</thread>

             			<c:forEach var="task2" items="${tasks}">
             			    <tr>
             				<td>
             					${task2.taskId}
             				</td>
             				<td>${task2.taskName}</td>
             				<td>${task2.taskDesc}</td>
             				<td>${task2.taskStatus}</td>
             				<td>

             				  <spring:url value="/tasks/delete/${task2.taskId}/${user.id}" var="deleteUrl" />
             				  <spring:url value="/tasks/complete/${task2.taskId}/${user.id}" var="completeUrl" />
             				  <button class="btn btn-primary"
                                                       onclick="location.href='${completeUrl}'">Mark Complete</button>
             				  <button class="btn btn-danger"
                                                       onclick="location.href='${deleteUrl}'">Delete</button>
                                             </td>
             			    </tr>
             			</c:forEach>
             		</table>
          </div>

       </div>
     </div>
   </div>
</div>
<script src="/js/jquery.js"></script>

<script src="/js/bootstrap.js"></script>
<script src="/js/bootstrap-tab.js"></script>

<script src="/js/bootstrap-collapse.js"></script>
<script src="/js/bootstrap-alert.js"></script>
<script src="/js/bootstrap-inputmask.js"></script>
<script src="/js/application.js"></script>
<script src="/js/file1.js"></script>
<script type="text/javascript" src="/js/widget.js"></script>
<script src="/js/jquery.validate.js"></script>
<script src="/js/validations.js"></script>
</body>
</html>