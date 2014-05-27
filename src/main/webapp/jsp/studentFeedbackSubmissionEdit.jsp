<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="teammates.common.util.Const"%>
<%@ page import="teammates.ui.controller.FeedbackSubmissionEditPageData"%>
<%
    FeedbackSubmissionEditPageData data = (FeedbackSubmissionEditPageData)request.getAttribute("data");
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="/favicon.png">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TEAMMATES - Submit Feedback</title>
    <!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/stylesheets/teammatesCommon.css" type="text/css">
    <script type="text/javascript" src="/js/googleAnalytics.js"></script>
    <script type="text/javascript" src="/js/jquery-minified.js"></script>
    <script type="text/javascript" src="/js/AnchorPosition.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/feedbackSubmissionsEdit.js"></script>
    <script type="text/javascript" src="/js/student.js"></script>
    <jsp:include page="../enableJS.jsp"></jsp:include>
    <!-- Bootstrap core JavaScript ================================================== -->
    <script src="/bootstrap/js/bootstrap.min.js"></script>    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <%
        if (!data.isPreview) {
    %>
            <jsp:include page="<%=Const.ViewURIs.STUDENT_HEADER%>" />
    <%    
        } else { 
    %>
            <div id="frameTopWrapper">
                <h1 class="color_white centeralign">Previewing Session as Student <%=data.previewStudent.name %> (<%=data.previewStudent.email%>)</h1>
            </div>
    <% 
        }
    %>

    <div id="frameBody" class="container">
        <div id="frameBodyWrapper">
            <div id="topOfPage"></div>
            <h1>Submit Feedback</h1>
            <br />
            
            <form method="post" action="<%=Const.ActionURIs.STUDENT_FEEDBACK_SUBMISSION_EDIT_SAVE%>" name="form_student_submit_response">
                
                <jsp:include page="<%=Const.ViewURIs.FEEDBACK_SUBMISSION_EDIT%>" />
                
                <div class="bold centeralign">
                <%
                    if (data.bundle.questionResponseBundle.isEmpty()) {
                %>
                        There are no questions for you to answer here!
                <%
                    } else if (data.isPreview || !data.isSessionOpenForSubmission) {
                %>
                        <input disabled="disabled" type="submit" class="btn btn-primary" id="response_submit_button" data-toggle="tooltip" data-placement="top" title="<%=Const.Tooltips.FEEDBACK_SESSION_EDIT_SAVE%>" value="Save Feedback" style="background: #66727A;"/>
                <%
                    } else {
                %>
                        <input type="submit" class="btn btn-primary" id="response_submit_button" data-toggle="tooltip" data-placement="top" title="<%=Const.Tooltips.FEEDBACK_SESSION_EDIT_SAVE%>" value="Save Feedback"/>
                <%
                    }
                %>
                </div>
                <br><br>    
            </form>
        </div>
    </div>

    <jsp:include page="<%=Const.ViewURIs.FOOTER%>" />
</body>
</html>
