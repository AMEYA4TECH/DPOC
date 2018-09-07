<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page session="false"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css" rel="stylesheet">
<style>
#map {
	width: 100%;
	height: 430px;
	margin-left: auto;
	margin-right: auto;
}
/* .ibox-title tbody{
  display:block;
  overflow:auto;
  height:200px;
  width:100%;
}
.ibox-title thead tr{
  display:block;
} */
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Dynatable/0.3.1/jquery.dynatable.js"></script>
<script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script>
	
</head>

<body class="md-skin">
	<div id="wrapper">
		<nav class="navbar-default navbar-static-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav metismenu" id="side-menu">
				<li class="nav-header">
					<div class="dropdown profile-element">
						<span> <img alt="image" class="img-circle"
							src="img/profile_small.jpg" />
						</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
							class="clear"> <span class="block m-t-xs"> <strong
									class="font-bold">Azam Rizvi</strong>
							</span> <span class="text-muted text-xs block">Admin <b
									class="caret"></b></span>
						</span>
						</a>
						<ul class="dropdown-menu animated fadeInRight m-t-xs">
							<li><a href="profile.html">Profile</a></li>
							<li><a href="contacts.html">Contacts</a></li>
							<li><a href="mailbox.html">Mailbox</a></li>
							<li class="divider"></li>
							<li><a href="login.html">Logout</a></li>
						</ul>
					</div>
					<div class="logo-element"></div>
				</li>
				<li><a href="<c:url value='/getDashboard'/>"><i
						class="fa fa-th-large"></i> <span class="nav-label">Dashboards
							Process</span></a></li>
				<%-- <li><a href="<c:url value='/algorithmProcess' />"><i
						class="fa fa-th-large"></i> <span class="nav-label">Algorithm
							Process</span></a></li> --%>
				<!-- <li> <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">Administration</span><span class="fa arrow"></span></a>
          <ul class="nav nav-second-level collapse">
            <li><a href="collages.html">Collage's</a></li>
            <li><a href="graph_morris.html">Roles</a></li>
            <li><a href="user-collage.html">Users</a></li>
            <li><a href="graph_chartjs.html">Audit Logs</a></li>
            <li><a href="graph_chartist.html">Settings</a></li>
            <li><a href="c3.html">Analytics</a></li>
          </ul>
        </li>-->
			</ul>
		</div>
		</nav>
		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top white-bg" role="navigation"
					style="margin-bottom: 0">
				<div class="navbar-header">
					<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
						href="#"><i class="fa fa-bars"></i> </a>
					<form role="search" class="navbar-form-custom"
						action="search_results.html">
						<div class="form-group">
							<input type="text" placeholder="Search for something..."
								class="form-control" name="top-search" id="top-search">
						</div>
					</form>
				</div>
				<ul class="nav navbar-top-links navbar-right">
					<li><span class="m-r-sm text-muted welcome-message"></span></li>
					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
							<span class="label label-warning">16</span>
					</a>
						<ul class="dropdown-menu dropdown-messages">
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image"
										class="img-circle" src="img/a7.jpg">
									</a>
									<div>
										<small class="pull-right">46h ago</small> <strong>Mike
											Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
										<small class="text-muted">3 days ago at 7:58 pm -
											10.06.2014</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image"
										class="img-circle" src="img/a4.jpg">
									</a>
									<div>
										<small class="pull-right text-navy">5h ago</small> <strong>Chris
											Johnatan Overtunk</strong> started following <strong>Monica
											Smith</strong>. <br> <small class="text-muted">Yesterday
											1:21 pm - 11.06.2014</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="dropdown-messages-box">
									<a href="profile.html" class="pull-left"> <img alt="image"
										class="img-circle" src="img/profile.jpg">
									</a>
									<div>
										<small class="pull-right">23h ago</small> <strong>Monica
											Smith</strong> love <strong>Kim Smith</strong>. <br> <small
											class="text-muted">2 days ago at 2:30 am - 11.06.2014</small>
									</div>
								</div>
							</li>
							<li class="divider"></li>
							<li>
								<div class="text-center link-block">
									<a href="mailbox.html"> <i class="fa fa-envelope"></i> <strong>Read
											All Messages</strong>
									</a>
								</div>
							</li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle count-info"
						data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span
							class="label label-primary">8</span>
					</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li><a href="mailbox.html">
									<div>
										<i class="fa fa-envelope fa-fw"></i> You have 16 messages <span
											class="pull-right text-muted small">4 minutes ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="profile.html">
									<div>
										<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
											class="pull-right text-muted small">12 minutes ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="grid_options.html">
									<div>
										<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
											class="pull-right text-muted small">4 minutes ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li>
								<div class="text-center link-block">
									<a href="notifications.html"> <strong>See All
											Alerts</strong> <i class="fa fa-angle-right"></i>
									</a>
								</div>
							</li>
						</ul></li>
					<li><a href="login.html"> <i class="fa fa-sign-out"></i>
							Log out
					</a></li>
					<li><a class="right-sidebar-toggle"> <i
							class="fa fa-tasks"></i>
					</a></li>
				</ul>
				</nav>
			</div>
			<div class="wrapper wrapper-content">
				<div class="row">
					<div class="col-lg-3">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<span class="label label-success pull-right">Monthly</span>
								<h5>Total Invoice</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins" id="TopinvoiceDetails">6,200</h1>
								<!-- <div class="stat-percent font-bold text-success">98% <i class="fa fa-bolt"></i></div> -->
								<small>Invoice</small>
							</div>
						</div>
					</div>
					<!--  <div class="col-lg-3">
          <div class="ibox float-e-margins">
            <div class="ibox-title"> <span class="label label-info pull-right">Monthly</span>
              <h5>New Invoice</h5>
            </div>
            <div class="ibox-content">
              <h1 class="no-margins">800</h1>
              <div class="stat-percent font-bold text-info">20% <i class="fa fa-level-up"></i></div>
              <small>New orders</small> </div>
          </div>
        </div> -->
					<div class="col-lg-3">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<span class="label label-danger pull-right">Monthly</span>
								<h5>Completed Shippment</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins" id="TopcompletedShipment">600</h1>
								<!-- <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div> -->
								<small>Shippment</small>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="ibox float-e-margins">
							<div class="ibox-title	">
								<span class="label label-danger pull-right">Yearly</span>
								<h5>Goods Delievered</h5>
							</div>
							<div class="ibox-content">
								<h1 class="no-margins" id="Topcompletedgoods">600</h1>
								<!-- <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div> -->
								<small>In Tonnes</small>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<span class="label label-danger pull-right">Yearly</span>
								<h5>Total EPOD</h5>
							</div>
							<div class="ibox-content">
								 <h1 class="no-margins" id="Topcompletedepod">600</h1>
								<!-- <div class="stat-percent font-bold text-danger">38% <i class="fa fa-level-down"></i></div> -->
								<small>Created</small>
							</div>
						</div>
					</div>
				</div>

				<div id="example-table"></div>

				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>Orders</h5>
								<div class="pull-right">
									<!--  <div class="btn-group">
                  <button type="button" class="btn btn-xs btn-white active">Today</button>
                  <button type="button" class="btn btn-xs btn-white">Monthly</button>
                  <button type="button" class="btn btn-xs btn-white">Annual</button>
                </div> -->
								</div>
							</div>
							<div class="ibox-content">
								<div class="tabs-container">
									<ul class="nav nav-tabs">
										<li class="active"><a data-toggle="tab" href="#tab-3"
											aria-expanded="true">Days</a></li>
										<li class=""><a data-toggle="tab" href="#tab-4"
											aria-expanded="false">Monthly</a></li>
										<li class=""><a data-toggle="tab" href="#tab-5"
											aria-expanded="false">Yearly</a></li>
									</ul>
									<div class="tab-content">
										<div id="tab-3" class="tab-pane active">
											<div class="panel-body">
												<div class="col-lg-9">
												<button type="button" id="download-pdfToday" >
  														Download PDF
													</button>
													<canvas id="todayCharts" width="400" height="200"></canvas>
												</div>
												<div class="col-lg-3">
													<ul class="stat-list">
														<li>
															<h2 class="no-margins">5</h2> <small>Order
																Delivered in West India</small>
															<div class="stat-percent">
																22% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 22%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">7</h2> <small>Order
																Delivered in East India</small>
															<div class="stat-percent">
																30% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 30%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">0</h2> <small>Order
																Delivered in North India</small>
															<div class="stat-percent">
																0<i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 0%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">11</h2> <small>Order
																Delivered in South India</small>
															<div class="stat-percent">
																48% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 48%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">23</h2> <small>Total
																Orders Delivered in India</small>
															<div class="stat-percent">
																100% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 100%;" class="progress-bar"></div>
															</div>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<div id="tab-4" class="tab-pane">
											<div class="panel-body">
												<div class="col-lg-9">
												<button type="button" id="download-pdfMonths" >
  														Download PDF
													</button>
													<canvas id="monthCharts" width="400" height="200"></canvas>

												</div>
												<div class="col-lg-3">
													<ul class="stat-list">
														<li>
															<h2 class="no-margins">66</h2> <small>Order
																Delivered in West India</small>
															<div class="stat-percent">
																27% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 27%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">53</h2> <small>Order
																Delivered in East India</small>
															<div class="stat-percent">
																22% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 22%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">45</h2> <small>Order
																Delivered in North India</small>
															<div class="stat-percent">
																18% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 18%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">80</h2> <small>Order
																Delivered in South India</small>
															<div class="stat-percent">
																33% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 33%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">244</h2> <small>Total
																Orders Delivered in India</small>
															<div class="stat-percent">
																100% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 100%;" class="progress-bar"></div>
															</div>
														</li>
													</ul>
												</div>
												<!--  <th>Total Distance Travel</th> -->
											</div>
										</div>
										<div id="tab-5" class="tab-pane">
											<div class="panel-body">
												<div class="col-lg-9">
												<button type="button" id="download-pdfYears" >
  														Download PDF
													</button>
													<canvas id="yearCharts" width="400" height="200"></canvas>
												</div>
												<div class="col-lg-3">
													<ul class="stat-list">
														<li>
															<h2 class="no-margins">60</h2> <small>Order
																Delivered in West India</small>
															<div class="stat-percent">
																14% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 14%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">126</h2> <small>Order
																Delivered in East India</small>
															<div class="stat-percent">
																29% <i class="fa fa-level-down text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 29%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">54</h2> <small>Order
																Delivered in North India</small>
															<div class="stat-percent">
																13% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 13%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">190</h2> <small>Order
																Delivered in South India</small>
															<div class="stat-percent">
																44% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 44%;" class="progress-bar"></div>
															</div>
														</li>
														<li>
															<h2 class="no-margins ">430</h2> <small>Total
																Orders Delivered in India</small>
															<div class="stat-percent">
																100% <i class="fa fa-bolt text-navy"></i>
															</div>
															<div class="progress progress-mini">
																<div style="width: 100%;" class="progress-bar"></div>
															</div>
														</li>
													</ul>
												</div>
												<!-- <table class="table table-hover no-margins">
                            <thead>
                              <tr>
                                <th id="Graphyearlyprogress">10</th>
                                <th>Total Distance Travel</th>
                              </tr>
                            </thead>
                            
                          </table> -->
											</div>
										</div>
									</div>
								</div>




							</div>
						</div>
					</div>
					
							<div class="col-lg-6">
	<div class="ibox float-e-margins">
	
								<div class="ibox-title">Material Chart</div>
								
								<div class="ibox-content">
								<button type="button" id="download-pdfMAterial" >
  														Download PDF
													</button>
									<%-- <canvas id="pieMatchart" width="400" height="200"></canvas> --%>
									<canvas id="pie-chart" width="800" height="450"></canvas>
								</div>
								</div>
							</div>
							<div class="col-lg-6">
<div class="ibox float-e-margins">
								<div class="ibox-title">Epod Chart</div>
								<div class="ibox-content">
								<button type="button" id="download-pdfEpod" >
  														Download PDF
													</button>
									<%--  <canvas id="pieMatchart2" width="400" height="200"></canvas> --%> 
									 <canvas id="epodChart" width="800" height="450"></canvas> 
								</div>
								</div>
							</div>
							<div class="col-lg-12">
<div class="ibox float-e-margins">
								<div class="ibox-title">Sales Chart</div>
								<div class="ibox-content">
								<button type="button" id="download-pdfSales" >
  														Download PDF
													</button>
				 <canvas id="salesChart" width="auto" height="auto"></canvas> 
				</div>
				</div>
				</div>
							<div class="col-lg-12">
<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>Truck Info</h5>
									</div>
						<div class="ibox-content" style="height: 300px; overflow-x: auto;">			
					<table class="table table-hover margin bottom table-fixed">
						<thead>
							<tr>
								<th>Vehicle No.</th>
								<th>Vehicle Type.</th>
								<th>Cement Delivered (In Kg)</th>
								<th>Cement Delivered (In tonnes)</th>
								<th>Trader</th>
							</tr>
						</thead>
						<tbody id="TRUCKtabledata"></tbody>
					</table>
					</div>
					</div>
					</div>
					
						</div>
				
				
				
					
					
					
					
					


				<div></div>



				<%-- <div class="row"> <div class="ibox float-e-margins">
        <div class="col-lg-6">
         
            <div class="ibox-title">chart
            </div>
            <div class="ibox-content">
             <canvas id="pieMatchart1" width="400" height="200"></canvas> 
              <canvas id="pie-chart1" width="800" height="450"></canvas>
            </div>
            </div>
            </div>
            </div> --%>

			</div>


			<div class="footer">
				<div class="pull-right">
					10GB of <strong>250GB</strong> Free.
				</div>
				<div>
					<strong>Copyright</strong> A4Technology Solution Pvt. Ltd &copy;
					2017-2018
				</div>
			</div>
		</div>
	</div>








	<!-- Mainly scripts -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- <script>
$(document).ready(function(){
        $.getJSON("getMonthlyOrderCount/", function(result){
            $.each(result, function(i, field){
                $("div").append(field + " ");
            });
        });
    });
</script> -->

	<script src="resources/js/jquery-2.1.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- Flot -->
	<script src="resources/js/plugins/flot/jquery.flot.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.spline.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.resize.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.pie.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.symbol.js"></script>
	<script src="resources/js/plugins/flot/jquery.flot.time.js"></script>

	<!-- Peity -->
	<script src="resources/js/plugins/peity/jquery.peity.min.js"></script>
	<script src="resources/js/demo/peity-demo.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="resources/js/inspinia.js"></script>
	<script src="resources/js/plugins/pace/pace.min.js"></script>

	<!-- jQuery UI -->
	<script src="resources/js/plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- Jvectormap -->
	<script
		src="resources/js/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

	<!-- EayPIE -->
	<script src="resources/js/plugins/easypiechart/jquery.easypiechart.js"></script>

	<!-- Sparkline -->
	<script src="resources/js/plugins/sparkline/jquery.sparkline.min.js"></script>

	<!-- Sparkline demo data  -->
	<script src="resources/js/demo/sparkline-demo.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;libraries=geometry"></script>
	<script>
        $(document).ready(function() {
            $('.chart').easyPieChart({
                barColor: '#f8ac59',
//                scaleColor: false,
                scaleLength: 5,
                lineWidth: 4,
                size: 80
            });

            $('.chart2').easyPieChart({
                barColor: '#1c84c6',
//                scaleColor: false,
                scaleLength: 5,
                lineWidth: 4,
                size: 80
            });

            var data2 = [
                [gd(2012, 1, 1), 7], [gd(2012, 1, 2), 6], [gd(2012, 1, 3), 4], [gd(2012, 1, 4), 8],
                [gd(2012, 1, 5), 9], [gd(2012, 1, 6), 7], [gd(2012, 1, 7), 5], [gd(2012, 1, 8), 4],
                [gd(2012, 1, 9), 7], [gd(2012, 1, 10), 8], [gd(2012, 1, 11), 9], [gd(2012, 1, 12), 6],
                [gd(2012, 1, 13), 4], [gd(2012, 1, 14), 5], [gd(2012, 1, 15), 11], [gd(2012, 1, 16), 8],
                [gd(2012, 1, 17), 8], [gd(2012, 1, 18), 11], [gd(2012, 1, 19), 11], [gd(2012, 1, 20), 6],
                [gd(2012, 1, 21), 6], [gd(2012, 1, 22), 8], [gd(2012, 1, 23), 11], [gd(2012, 1, 24), 13],
                [gd(2012, 1, 25), 7], [gd(2012, 1, 26), 9], [gd(2012, 1, 27), 9], [gd(2012, 1, 28), 8],
                [gd(2012, 1, 29), 5], [gd(2012, 1, 30), 8], [gd(2012, 1, 31), 25]
            ];

            var data3 = [
                [gd(2012, 1, 1), 800], [gd(2012, 1, 2), 500], [gd(2012, 1, 3), 600], [gd(2012, 1, 4), 700],
                [gd(2012, 1, 5), 500], [gd(2012, 1, 6), 456], [gd(2012, 1, 7), 800], [gd(2012, 1, 8), 589],
                [gd(2012, 1, 9), 467], [gd(2012, 1, 10), 876], [gd(2012, 1, 11), 689], [gd(2012, 1, 12), 700],
                [gd(2012, 1, 13), 500], [gd(2012, 1, 14), 600], [gd(2012, 1, 15), 700], [gd(2012, 1, 16), 786],
                [gd(2012, 1, 17), 345], [gd(2012, 1, 18), 888], [gd(2012, 1, 19), 888], [gd(2012, 1, 20), 888],
                [gd(2012, 1, 21), 987], [gd(2012, 1, 22), 444], [gd(2012, 1, 23), 999], [gd(2012, 1, 24), 567],
                [gd(2012, 1, 25), 786], [gd(2012, 1, 26), 666], [gd(2012, 1, 27), 888], [gd(2012, 1, 28), 900],
                [gd(2012, 1, 29), 178], [gd(2012, 1, 30), 555], [gd(2012, 1, 31), 993]
            ];


            var dataset = [
                {
                    label: "Open Orders",
                    data: data3,
                    color: "#1ab394",
                    bars: {
                        show: true,
                        align: "center",
                        barWidth: 24 * 60 * 60 * 600,
                        lineWidth:0
                    }

                }, {
                    label: "Delivered Orders",
                    data: data2,
                    yaxis: 2,
                    color: "#1C84C6",
                    lines: {
                        lineWidth:1,
                            show: true,
                            fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 0.2
                            }, {
                                opacity: 0.4
                            }]
                        }
                    },
                    splines: {
                        show: false,
                        tension: 0.6,
                        lineWidth: 1,
                        fill: 0.1
                    },
                }
            ];


            var options = {
                xaxis: {
                    mode: "time",
                    tickSize: [3, "day"],
                    tickLength: 0,
                    axisLabel: "Date",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: 'Arial',
                    axisLabelPadding: 10,
                    color: "#d5d5d5"
                },
                yaxes: [{
                    position: "left",
                    max: 1070,
                    color: "#d5d5d5",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: 'Arial',
                    axisLabelPadding: 3
                }, {
                    position: "right",
                    clolor: "#d5d5d5",
                    axisLabelUseCanvas: true,
                    axisLabelFontSizePixels: 12,
                    axisLabelFontFamily: ' Arial',
                    axisLabelPadding: 67
                }
                ],
                legend: {
                    noColumns: 1,
                    labelBoxBorderColor: "#000000",
                    position: "nw"
                },
                grid: {
                    hoverable: false,
                    borderWidth: 0
                }
            };

            function gd(year, month, day) {
                return new Date(year, month - 1, day).getTime();
            }

            var previousPoint = null, previousLabel = null;

            $.plot($("#flot-dashboard-chart"), dataset, options);

            var mapData = {
                "US": 298,
                "SA": 200,
                "DE": 220,
                "FR": 540,
                "CN": 120,
                "AU": 760,
                "BR": 550,
                "IN": 200,
                "GB": 120,
            };

            $('#world-map').vectorMap({
                map: 'world_mill_en',
                backgroundColor: "transparent",
                regionStyle: {
                    initial: {
                        fill: '#e4e4e4',
                        "fill-opacity": 0.9,
                        stroke: 'none',
                        "stroke-width": 0,
                        "stroke-opacity": 0
                    }
                },

                series: {
                    regions: [{
                        values: mapData,
                        scale: ["#1ab394", "#22d6b1"],
                        normalizeFunction: 'polynomial'
                    }]
                },
            });
        });
    </script>
	<script>
       function initialize() {
  var mapOptions = {
    zoom: 4,
    center: new google.maps.LatLng(20.5937, 78.9629),
    scrollwheel: false,
    zoomControl: true,
    disableDefaultUI: true,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.DEFAULT
    }
  };

  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  map.mapTypeControl = false;
  var image = {
    // url: 'img/marker.png',
    anchor: new google.maps.Point(0, 58)
  };

  var markers = [{
    lat: 19.0760,
    lng: 72.8777,
    map: map,
    title: 'Mumbai',
    icon: image,
    id: 'hello world',
    content: {
		
           title: 'Mumbai',
      address: 'K.P. Aurum',
			invoice:'456',
      number: 'MH02 EE5012',

     
    }
  }, {
    lat: 21.1702,
    lng: 72.8311,
    map: map,
    title: 'Surat',
    icon: image,
    id: 'hello world',
    content: {
		
           title: 'Surat',
      address: 'A.R.Pvt',
			invoice:'457',
      number: 'MH42 EA9612',
    }
  }, {
    lat: 28.7041,
    lng: 77.1025,
    map: map,
    title: 'Delhi',
    icon: image,
    id: 'hello world',
    content: {
		
           title: 'Delhi',
      address: 'Gandhi Marg',
			invoice:'458',
      number: 'UP78 AB9612',
    }
  }, {
    lat: 26.8467,
    lng: 80.9462,
    map: map,
    title: 'Lucknow',
    icon: image,
    id: 'hello world',
    content: {
		
           title: 'Lucknow',
      address: 'Shalimaar Tower',
			invoice:'459',
      number: 'UP78 AC9612',
    }
   
  }];

  markers.forEach(function(el) {

    var marker = new google.maps.Marker({
      position: new google.maps.LatLng(el.lat, el.lng),
      map: el.map,
      title: el.title,
      icon: el.icon,
      id: el.id

    });

    var template = '';

    
    if (!el.content.mode) {
      template =
        "<div class=\"infowindow\">" +
        "<div class=\"infowindow__header\">" +
      
        "<h3>" + el.content.title + "</h3>" +
        "</div>" +
        "<div class=\"infowindow__body\">" +
        "<div class=\"field\">" +
        "<div class=\"meta\">Address</div>" +
        "<p>" + el.content.address + "</p>" +
        "</div>" +
        "<div class=\"field\">" +
        "<div class=\"meta\">Invoice No.</div>" +
		  "<p>" + el.content.invoice + "</p>" +
		  "<div class=\"field\">" +
        "<div class=\"meta\">Truck No.</div>" +
		  "<p>" + el.content.number + "</p>" +
        "</div>" +
        "</div>" +
        "</div>";
    } else {
      template =
        "<div class=\"infowindow\">" +
        "<div class=\"infowindow__header\">" +
       
        "<h3>" + el.content.title + "</h3>" +
        "</div>" +
        "<div class=\"infowindow__body\">" +
        "<div class=\"field\">" +
        "<div class=\"meta\">Address</div>" +
        "<p>" + el.content.address + "</p>" +
        "</div>" +
        "<div class=\"field field-mode\">" +
        "<div class=\"field-mode__item\">" +
        "<div class=\"meta\">Invoice No.</div>" +
		   "<p>" + el.content.invoice + "</p>" +
      
        "</div>" +
        "<div class=\"field-mode__item\">" +
        "<div class=\"meta\">сб</div>" +
      
        "</div>" +
        "<div class=\"field-mode__item\">" +
        "<div class=\"meta\">нд</div>" +
      
        "</div>"

      +
      "</div>" +
      "<div class=\"field\">" +
      "<div class=\"meta\">Технічна підтримка</div>" +
      "<a href=\"tel:" + el.content.number.replace(/-/g, "").replace(/ /g, "") + "\">" + el.content.number + "</a>" +
        "</div>" +
        "</div>" +
        "</div>";
    }

    var infowindow = new google.maps.InfoWindow({
      content: template
    });
    marker.addListener('click', function() {
      //console.log(this.id)
      infowindow.open(map, marker);
    });

  });

}
// Asynchronous Loading

//donwload pdf from original canvas
function downloadPDF(selectorId, imageName) {
  var canvas = document.getElementById(selectorId);
	var canvasImg = canvas.toDataURL();
	var pdf = new jsPDF();
    pdf.addImage(canvasImg, 'JPEG', 0, 0);
    pdf.save(imageName + ".pdf");
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
    'callback=initialize';
  document.body.appendChild(script);
}
window.onload = loadScript;

fetch("getDailyOrderCount/").then(
		function(data){
			return	data.json()
		//var indetail= document.getElementById('invoiceDetails');
		//indetail.innerText=`${OneDay.name.first}`
		}
		).then(
				function(d){
					var indetail= document.getElementById('TopinvoiceDetails');
					indetail.innerText=d['totalCount'];
					//console.log(d);
					
					/* var monthlyProgressStr= document.getElementById('GraphtodayProgress');
					monthlyProgressStr.innerText=d['totalCount'];
					console.log(d); */
				}
				)
				
				
				
		fetch("getYearlyOrderCount/").then(
		function(data){
			return	data.json()
		//var indetail= document.getElementById('invoiceDetails');
		//indetail.innerText=`${OneDay.name.first}`
		}
		).then(
				function(d){
					var indetail= document.getElementById('TopcompletedShipment');
					indetail.innerText=d['totalNumberOforders'];
					
					/* var monthlyProgressStr= document.getElementById('Graphyearlyprogress');
					monthlyProgressStr.innerText=d['totalNumberOforders'];
					console.log(d); */
				}
				)
				
				
	/* fetch("getMonthlyOrderCount/").then(
		function(data){
			return	data.json()
		//var indetail= document.getElementById('invoiceDetails');
		//indetail.innerText=`${OneDay.name.first}`
		}
		).then(
				function(d){
					var indetail= document.getElementById('GraphmonthyProgress');
					indetail.innerText='d.arrList[1].totalOrder';
					
					
				}
				)		 */
				
		/* 		$.getJSON( "getMonthlyOrderCount/", function( json ) {
					 
					 var indetail= document.getElementById('GraphmonthyProgress');
						
						indetail.innerText=json.arrList[1].totalOrder; 
					 });
		 */			 
$.getJSON( "getMonthlyOrderCount/", function( json ) {
	var data = json.arrList;	
	var months = [];
	var counts = [];
	
	for (var i = 0; i < data.length; i++) {
		months.push(data[i].month);
		counts.push(data[i].totalOrder);
	}
	
	var barCanvas = document.getElementById("monthCharts");
	var barData = {
	  label: 'Total Orders',
	  data: counts
	};

	var barChart = new Chart(barCanvas, {
	  type: 'bar',
	  data: {
	    labels: months,
	    datasets: [barData]
	  }
	});
});
		 
		 
		 $.getJSON( "getYearlyOrderCount/", function( json ) {
				var year1 = 186;
				var year2 = json.totalNumberOforders;
				//console.log(year1) 
				var years = [2017,2018];
				var counts=[year1,year2];
				//console.log(counts);
				var barCanvas = document.getElementById("yearCharts");
				var barData = {
				  label: 'Total Orders',
				  data: counts
				};
				var barChart = new Chart(barCanvas, {
				  type: 'bar',
				  data: {
					  labels: years,
				    datasets: [barData]
				  }
				});
			});
		 
		 $.getJSON( "getDailyOrderCount/", function( json ) {
				var day = json.totalCount;	
				//console.log(day)
				var days = [23];
				//var counts = 31; 
				var barCanvas = document.getElementById("todayCharts");
				var barData = {
				  label: 'Total Orders',
				  data: [day]
				};

				var barChart = new Chart(barCanvas, {
				  type: 'bar',
				  data: {
					  labels: days,
				    datasets: [barData]
				  }
				});
			});
		 
		 $.ajax({
			  url: 'getMonthlyOrderCount/',
			  success: function(data){
				 // var barCanvas1 = document.getElementById("todayCharts");
			    $('#example-table').dynatable({
			      dataset: {
			        records: data.arrList[0].month
			        
			      }
			    });
			  //  console.log(data)
			  }
			});
		 
		 
		 fetch("getTotalEpodCount/").then(
					function(data){
						return	data.json()
					//var indetail= document.getElementById('invoiceDetails');
					//indetail.innerText=`${OneDay.name.first}`
					}
					).then(
							function(d){
								//console.log(d)
								var indetail= document.getElementById("Topcompletedepod");
								indetail.innerText=d['totalNumberOforders'];
								/* var monthlyProgressStr= document.getElementById('Graphyearlyprogress');
								monthlyProgressStr.innerText=d['totalNumberOforders'];
								console.log(d); */
							}
							)
							
							
							
							
							fetch("getTotalWt/").then(
					function(data){
						return	data.json()
					//var indetail= document.getElementById('invoiceDetails');
					//indetail.innerText=`${OneDay.name.first}`
					}
					).then(
							function(d){
								//console.log(d)
								var indetail= document.getElementById("Topcompletedgoods");
								indetail.innerText=d['totalWtTonnes'];
								/* var monthlyProgressStr= document.getElementById('Graphyearlyprogress');
								monthlyProgressStr.innerText=d['totalNumberOforders'];
								console.log(d); */
							}
							)
							
						  $.ajax({
			  url: 'getTrucks/',
			  success: function(data){
			   			    //console.log(data)
			   			       var tr;
        for (var i = 0; i < data.trucksList.length; i++) {
        	//console.log(data.trucksList[i].slno +" "+data.trucksList[i].vehicleno+" "
        	//		+data.trucksList[i].inKg +" "+data.trucksList[i].inTonne+" " +data.trucksList[i].entrytype
        	//);
        	
        	var table = document.getElementById("TRUCKtabledata");
        	
        	var row = table.insertRow(i);

        	// Insert new cells (<td> elements) at the 1st and 2nd position of the "new" <tr> element:
        	var slno = row.insertCell(0);
        	var vehicleno = row.insertCell(1);
        	var inKg = row.insertCell(2);
        	var inTonne = row.insertCell(3);
        	var entrytype = row.insertCell(4);

        	// Add some text to the new cells:
        	slno.innerHTML = data.trucksList[i].slno;
        	vehicleno.innerHTML = data.trucksList[i].vehicleno;
        	inKg.innerHTML = data.trucksList[i].inKg;
        	inTonne.innerHTML = data.trucksList[i].inTonne;
        	entrytype.innerHTML = data.trucksList[i].entrytype;
            
			  }
			  }});	 
		 
	/* 	 new Chart( document.getElementById("pie-chart"), {
			    type: 'pie',
			    data: {
			      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
			      datasets: [{
			        label: "Population (millions)",
			        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
			        data: [2478,5267,734,784,433]
			      }]
			    },
			    options: {
			      title: {
			        display: true,
			        text: 'Predicted world population (millions) in 2050'
			      }
			    }
			}); */
		 $.getJSON("getMaterials/", function(json ) {
			 //alert("Alert");
			  var cementWt = document.getElementById("pie-chart");
				var data = json.matrlList;	
				var materials = [];
				var counts = [];
				
				for (var i = 0; i < data.length; i++) {
					materials.push(data[i].materialName);
					counts.push(data[i].totalTonnes);
					console.log(data[i].materialName);
					console.log(data[i].totalTonnes);
				}
				
				/* new Chart( document.getElementById("pie-chart"), {
				    type: 'pie',
				    data: {
				      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
				      datasets: [{
				        label: "Population (millions)",
				        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
				        data: [2478,5267,734,784,433]
				      }]
				    },
				    options: {
				      title: {
				        display: true,
				        text: 'Predicted world population (millions) in 2050'
				      }
				    }
				}); */
				
				 new Chart(cementWt, {
				    type: 'pie',
				    data: {
				      labels: materials,
				      datasets: [{
				        label: "Population (millions)",
				        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
				        data: counts
				      }]
				    },
				    options: {
				      title: {
				        display: true,
				        text: 'Material Supplied (tonnes) in 2018'
				      }
				    }
				});
			});	
		 
			$.getJSON("getTraderInfo/", function(json ) {
				 //alert("Alert");
				  var cementWt = document.getElementById("salesChart");
					var data = json.matrlList;	
					var materials = [];
					var counts = [];
					
					for (var i = 0; i < data.length; i++) {
						materials.push(data[i].materialName);
						counts.push(data[i].totalTonnes);
						console.log(data[i].materialName);
						console.log(data[i].totalTonnes);
					}
					 new Chart(document.getElementById("salesChart"), {
						    type: 'doughnut',
						    data: {
						      labels: materials,
						      datasets: [
						        {
						          label: "Population (millions)",
						          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
						          data: counts
						        }
						      ]
						    },
						    options: {
						      title: {
						        display: true,
						        text: 'Sales Across Different Traders'
						      }
						    }
						});
				});	
			
			$.getJSON("getEpodInfo/", function(json ) {
				 //alert("Alert");
				  var cementWt = document.getElementById("epodChart");
					var data = json.matrlList;	
					var materials = [];
					var counts = [];
					
					for (var i = 0; i < data.length; i++) {
						materials.push(data[i].materialName);
						counts.push(data[i].totalTonnes);
						//console.log(data[i].materialName);
						//console.log(data[i].totalTonnes);
					}
					 new Chart(document.getElementById("epodChart"), {
						    type: 'polarArea',
						    data: {
						      labels: materials,
						      datasets: [
						        {
						          label: "Sales (per trader)",
						          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
						          data: counts
						        }
						      ]
						    },
						    options: {
						      title: {
						        display: true,
						        text: 'Epod Generated Yearly'
						      }
						    }
						});
				});
			
			document
			.getElementById('download-pdfToday')
			.addEventListener("click", downloadPDF.bind(this, "todayCharts", "days"));
			
			document
			.getElementById('download-pdfMonths')
			.addEventListener("click", downloadPDF.bind(this, "monthCharts", "months"));
			
			
			document
			.getElementById('download-pdfYears')
			.addEventListener("click", downloadPDF.bind(this, "yearCharts", "years"));
			
			
			document
			.getElementById('download-pdfMAterial')
			.addEventListener("click", downloadPDF.bind(this, "pie-chart", "material"));
			
			
			document
			.getElementById('download-pdfEpod')
			.addEventListener("click", downloadPDF.bind(this, "epodChart", "epod"));

			document
			.getElementById('download-pdfSales')
			.addEventListener("click", downloadPDF.bind(this, "salesChart", "Sales"));
			
		 var ctx = document.getElementById("myChart");

		 var randomColorPlugin = {

		     // We affect the `beforeUpdate` event
		     beforeUpdate: function(chart) {
		         var backgroundColor = [];
		         var borderColor = [];
		         
		         // For every data we have ...
		         for (var i = 0; i < chart.config.data.datasets[0].data.length; i++) {
		         
		         	// We generate a random color
		         	var color = "rgba(" + Math.floor(Math.random() * 255) + "," + Math.floor(Math.random() * 255) + "," + Math.floor(Math.random() * 255) + ",";
		             
		             // We push this new color to both background and border color arrays
		             backgroundColor.push(color + "0.6)");
		             borderColor.push(color + "1)");
		         }
		         
		         // We update the chart bars color properties
		         chart.config.data.datasets[0].backgroundColor = backgroundColor;
		         chart.config.data.datasets[0].borderColor = borderColor;
		     }
		 };

		 // We now register the plugin to the chart's plugin service to activate it
		 Chart.pluginService.register(randomColorPlugin);

		 var myChart = new Chart(ctx, {
		     type: 'bar',
		     data: {
		         labels: ["January", "February", "March", "April", "May", "June"],
		         datasets: [{
		             label: '# of Votes',
		             data: [12, 19, 3, 5, 2, 3],
		             backgroundColor: 'rgba(255, 99, 132, 0.2)',
		             borderColor: 'rgba(255,99,132,1)',
		             borderWidth: 1
		         }]
		     },
		     options: {
		         scales: {
		             yAxes: [{
		                 ticks: {
		                     beginAtZero: true
		                 }
		             }]
		         }
		     }
		 });

		 	
		  /* 	var myPieChart = new Chart(ctx1,{
		    type: 'pie',
		    data: {
		        datasets: [{
		            data: materials
		        }],

		        // These labels appear in the legend and in the tooltips when hovering different arcs
		        labels: [
		            'Red',
		            'Yellow',
		            'Blue',
		            'Red',
		            'Yellow',
		            'Blue',
		            'Red',
		            'Yellow',
		            'Blue'
		        ]
		    },
		    options: counts
		}); */
/* fetch("getTrucks/").then(
					function(data){
						return	data.json()
					//var indetail= document.getElementById('invoiceDetails');
					//indetail.innerText=`${OneDay.name.first}`
					}
					).then(
							function(d){
								console.log(d);
						        var tr;
						        for (var i = 0; i < json.length; i++) {
						            tr = $('<tr/>');
						            tr.append("<td>" + d.trucksList[i].slno + "</td>");
						            tr.append("<td>" + d.trucksList[i].vehicleno + "</td>");
						            tr.append("<td>" + d.trucksList[i].inKg + "</td>");
						            tr.append("<td>" + d.trucksList[i].inTonne + "</td>");
						            tr.append("<td>" + d.trucksList[i].entrytype + "</td>");
						            $('TRUCKtabledata').append(tr);
						        }
							}
							)  */
							
				/* 
				$(document).ready(function () {
    $.getJSON('getTrucks/',
    function (json) {
    	console.log(json);
        var tr;
        for (var i = 0; i < json.length; i++) {
            tr = $('<tr/>');
            tr.append("<td>" + json[i].slno + "</td>");
            tr.append("<td>" + json[i].vehicleno + "</td>");
            tr.append("<td>" + json[i].inKg + "</td>");
            tr.append("<td>" + json[i].inTonne + "</td>");
            tr.append("<td>" + json[i].entrytype + "</td>");
            $('TRUCKtabledata').append(tr);
        }
    });
}); */
		// $("#example-table").tabulator("setData", "getMonthlyOrderCount/");
		 
	/* 			(function() {
  var flickerAPI = "getMonthlyOrderCount/";
  $.getJSON( flickerAPI, {
    tags: "mount rainier",
    tagmode: "any",
    format: "json"
  })
    .done(function( data ) {
      $.each( data.items, function( i, item ) {
        $( "<img>" ).attr( "src", item.media.m ).appendTo( "#images" );
       
      });
    });
})(); */
				
    </script>
</body>
</html>