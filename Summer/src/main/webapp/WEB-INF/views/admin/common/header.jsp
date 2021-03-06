<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>header</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/admin/css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
        rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/admin/css/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/admin/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/admin/css/pages/dashboard.css" rel="stylesheet">
<!-- Le javascript
================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="${pageContext.request.contextPath}/resources/admin/js/jquery-1.7.2.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/admin/js/excanvas.min.js"></script> 
<script src="${pageContext.request.contextPath}/resources/admin/js/chart.min.js" type="text/javascript"></script> 
<script src="${pageContext.request.contextPath}/resources/admin/js/bootstrap.js"></script>
<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/js/full-calendar/fullcalendar.min.js"></script>
 
<script src="${pageContext.request.contextPath}/resources/admin/js/base.js"></script> 
<script>
    var lineChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
    {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        data: [65, 59, 90, 81, 56, 55, 40]
    },
    {
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        data: [28, 48, 40, 19, 96, 27, 100]
    }
  ]

    }
/*
    var myLine = new Chart(document.getElementById("area-chart").getContext("2d")).Line(lineChartData);
    */
/* 에러 */

    var barChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
    {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        data: [65, 59, 90, 81, 56, 55, 40]
    },
    {
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,1)",
        data: [28, 48, 40, 19, 96, 27, 100]
    }
  ]

    }    

    $(document).ready(function() {
    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var calendar = $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      select: function(start, end, allDay) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.fullCalendar('renderEvent',
            {
              title: title,
              start: start,
              end: end,
              allDay: allDay
            },
            true // make the event "stick"
          );
        }
        calendar.fullCalendar('unselect');
      },
      editable: true,
      events: [
        {
          title: 'All Day Event',
          start: new Date(y, m, 1)
        },
        {
          title: 'Long Event',
          start: new Date(y, m, d+5),
          end: new Date(y, m, d+7)
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: new Date(y, m, d-3, 16, 0),
          allDay: false
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: new Date(y, m, d+4, 16, 0),
          allDay: false
        },
        {
          title: 'Meeting',
          start: new Date(y, m, d, 10, 30),
          allDay: false
        },
        {
          title: 'Lunch',
          start: new Date(y, m, d, 12, 0),
          end: new Date(y, m, d, 14, 0),
          allDay: false
        },
        {
          title: 'Birthday Party',
          start: new Date(y, m, d+1, 19, 0),
          end: new Date(y, m, d+1, 22, 30),
          allDay: false
        },
        {
          title: 'EGrappler.com',
          start: new Date(y, m, 28),
          end: new Date(y, m, 29),
          url: 'http://EGrappler.com/'
        }
      ]
    });
  });
</script><!-- /Calendar -->
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span> </a><a class="brand" href="${pageContext.request.contextPath}">Summer</a><span class="brand" style="font-size: smaller; margin-top: 10px; margin-left: -10px;">관리자 페이지</span>
      <div class="nav-collapse">
        <ul class="nav pull-right">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                            class="icon-cog"></i> Settings <b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="${pageContext.request.contextPath}/member/memberLogout.do">Logout</a></li>
            </ul>
          </li>
        </ul>
        <form class="navbar-search pull-right">
          <input type="text" class="search-query" placeholder="Search">
        </form>
      </div>
      <!--/.nav-collapse --> 
    </div>
    <!-- /container --> 
  </div>
  <!-- /navbar-inner --> 
</div>
<!-- /navbar -->
<div class="subnavbar">
  <div class="subnavbar-inner">
    <div class="container">
      <ul class="mainnav">
        <li id="admin_main" class="active"><a href="${pageContext.request.contextPath}/admin/selectAdminMain.do"><i class="icon-home"></i><span>메인</span> </a> </li>
        <li id="admin_stats"><a href="${pageContext.request.contextPath}/admin/selectAdminStats.do"><i class="icon-align-left"></i><span>통계</span> </a> </li>
        <li id="admin_store"><a href="${pageContext.request.contextPath}/admin/selectProductList.do"><i class="icon-shopping-cart"></i><span>상품관리</span> </a></li>
        <li id="admin_member"><a href="${pageContext.request.contextPath}/admin/selectMemberList.do"><i class="icon-user"></i><span>회원관리</span> </a> </li>
        <li id="admin_pay"><a href="${pageContext.request.contextPath}/admin/selectOrderList.do"><i class="icon-credit-card"></i><span>결제/포인트</span> </a> </li>
       
        <li id="admin_community"><a href="${pageContext.request.contextPath}/admin/community/adminNoticeList.do"><i class="icon-comments"></i><span>커뮤니티 관리</span> </a> </li>
        
        <li id="admin_cs"><a href="${pageContext.request.contextPath}/admin/customerService/customerService.do"><i class="icon-question-sign"></i><span>고객센터</span> </a> </li>
        
      </ul>
    </div>
    <!-- /container --> 
  </div>
  <!-- /subnavbar-inner --> 
</div>
<!-- /subnavbar -->



</body>
</html>
