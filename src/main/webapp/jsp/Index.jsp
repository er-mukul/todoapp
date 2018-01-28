<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="errors" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
       <title>To-Do Application</title>
       <link rel="stylesheet" href="/css/bootstrap.css">
       <link rel="stylesheet" href="/css/bootstrap.min.css">
       <link rel="stylesheet" href="/css/bootstrap.responsive.css">
       <script>
         $(function () {
         $('#myTab a:last').tab('show');
                        });
       </script>
   </head>
   <body>
     <div class="well">
         <h1 align="center">To-Do Manager</h1>
     </div>
     <div class="container-fluid">
         <div class="row-fluid">
          <div class="span1"></div>
          <div class="span4"><br><br>
             <div id="accordion2" class="accordion">
               <div class="accordion-group">
                 <div class="accordion-heading">
                    <a class="accordion-toggle" href="#mukul" data-parent="#accordion2" data-toggle="collapse">
                       LOGIN HERE           
                    </a>
                 </div>
                 <div id="mukul" class="accordion-body collapse" style="height: auto;">
                    <div class="accordion-inner">
                        <form:form modelAttribute="user" action="/dologin" method="POST" class="well form-horizontal" id="commentForm">
                    <div class="control-group">
                        UserID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <form:input path="userId" id="input01" placeholder="Enter loginId..." class="required input-small" minlength="3"/>
                       <form:errors path="userId"/>
                    </div>
                    <div class="control-group">
                        Password&nbsp;&nbsp;
                        <form:password id="input02" path="password" placeholder="Enter password..." class=" required input-small" minlength="6"/>
                        <form:errors path="password"/></div>
                        <br><br>
                         <button type="submit" class="btn">Sign in</button>
                         </form:form>
                  </div>
                 <%String msg="";
                   msg=(String)request.getAttribute("msg");
                   if(msg!=null)
                     {
                 %>
                  <div class="alert alert-error fade in span11">
                  <button class="close" data-dismiss="alert" type="button">x</button>
                  <strong><%=msg%></strong>
                  </div>
                <%} %>
             </div>
           </div>
           <div class="accordion-group">
              <div class="accordion-heading">
                <a class="accordion-toggle" href="#MK2" data-parent="#accordion2" data-toggle="collapse">LOGIN CRITERIA </a>
              </div>
              <div id="MK2" class="accordion-body collapse" style="height: 0px;">
                  <div class="accordion-inner"><p class="well">YOU MUST BE AN AUTHORISED USER OF THIS PORTAL.KINDLY GET YOUR LoginID AND PASSWORD FROM THE ADMINISTRATOR.</p>  </div>
              </div>
          </div>
        </div>
        <div class="progress progress-striped active">
           <div class="bar" style="width: 50%;"></div>
        </div>
     </div>
    </div>
     <legend></legend>
     <footer class="footer">
<p>
Designed and built
by&nbsp;
Mukul&nbsp;.
</p>

</footer>


<script src="/js/jquery.js"></script>

<script src="/js/bootstrap.js"></script>
<script src="/js/bootstrap-tab.js"></script>
<script src="/js/bootstrap-collapse.js"></script>
<script src="/js/bootstrap-alert.js"></script>
<script src="/js/application.js"></script>
<script src="/js/file1.js"></script>
<script type="text/javascript" src="/js/widget.js"></script>
<script src="/js/jquery.validate.js"></script>
<!-- <script type="text/javascript">
$(document).ready(function(){
$("#commentForm").validate();
			}); </script> -->
<script src="/js/validations.js"></script>
			


</div>
</body>
</html>