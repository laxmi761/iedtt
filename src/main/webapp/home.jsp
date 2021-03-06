<%@page import="in.iedtt.util.UserRoles"%>
<%@page import="in.iedtt.entity.Response"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<head>
<title>Online Defect Tracking System</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script src="js/jquery.1.9.1.min.js"></script>
<%
	Response resp = (Response)request.getSession().getAttribute("response");
	String status = null;
	String statusMessage = null;
	if(resp != null){
		status = resp.getStatus();
		statusMessage = resp.getStatusMessage();
	}
	String userType = (String) request.getSession().getAttribute("userType");
	Boolean isLocalRequest = (Boolean) request.getSession().getAttribute("isLocalRequest");
%>
<script type="text/javascript">
$(document).ready(function() {
    <%
    	if(resp != null){
    %>
    	console.log('<%=statusMessage%>');
    	alert('<%=statusMessage%>');
    <%
    	}
    %>
    $( "#defectsListDiv").load("./DefectsListServlet", function() {
    		console.log("defects list loaded");
    });
});
</script>
</head>
<body id="top">
<div class="wrapper col1">
  <div id="topbar">
  </div>
</div>
<div class="wrapper col2">
  <div id="header">
    <div class="fl_left">
      <h1><a href="#">Online Defect Tracking System</a></h1>
      <p>ODTS</p>
    </div>
    <ul id="topnav">
    <% if(isLocalRequest.booleanValue() == true) {%>
     <li><a href="./newDefect">Defect</a></li>
     <%} %>
     <% if(UserRoles.MANAGER.equalsIgnoreCase(userType) || UserRoles.SCRUM_MASTER.equalsIgnoreCase(userType)) {%>
      	<li><a href="./adminPanel.jsp">Admin Page</a></li>
      <%} %>
    </ul>
    <br class="clear"/>
  </div>
</div>

<div class="wrapper col3">
  <div id="intro">
			<div>
				<section>
					<div>
						<div>
							<h2>Defects</h2>
							<div id="defectsListDiv">
							</div>
						</div>
					</div>
				</section>
			</div>
    
    
    <br class="clear" />
  </div>
</div>
<div class="wrapper col5">
  <div id="footer">
   
    <div class="footbox last">
      <h2>Developer Details !</h2>
      <address>
      Company Name<br />
      Street Name &amp; Number<br />
      Town<br />
      Postcode/Zip<br />
      </address>
      Tel: xxxxx xxxxxxxxxx 
      <!-- --> 
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved - <a href="#">Laxmi</a></p>
    <p class="fl_right">. <a target="_blank" href="#" title="More info">.</a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>