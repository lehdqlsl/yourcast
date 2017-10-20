<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="content">
	<div class="container-fluid">
		<div class="row">
			<div class="content">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">매출 현황</h4>
							<p class="category">Revenue Table</p>
						</div>
						<div class="content table-responsive table-full-width">
							<table class="table table-hover table-striped">
								<thead>
									<th>매출 번호</th>
									<th>매출 금액</th>
									<th>매출 날짜</th>
									<th>BJ 아이디</th>
								</thead>
								<tbody>
									<c:forEach var="mvo" items="${plist }">
										<tr>
											<td>${mvo.profit_num }</td>
											<td>${mvo.money }</td>
											<td>${mvo.profit_regdate }</td>
											<td>${mvo.id }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 페이징 -->
							<div style="text-align: center;">
								<c:choose>
									<c:when test="${keyword==null }">
										<c:choose>
											<c:when test="${pu.pageNum>1 }">
												<a href="<c:url value='/admin/profit/list?pageNum=${1 }'/>">[처음으로]</a>
											</c:when>
											<c:otherwise>
										[처음으로]
									</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${pu.startPageNum>5 }">
												<a
													href="<c:url value='/admin/profit/list?pageNum=${pu.startPageNum-1 }'/>">[이전]</a>
											</c:when>
											<c:otherwise>
										[이전]
									</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${pu.startPageNum }"
											end="${pu.endPageNum }">
											<c:choose>
												<c:when test="${i==pu.pageNum }">
													<span style="color: blue">[${i }]</span>
												</c:when>
												<c:otherwise>
													<a href="<c:url value='/admin/profit/list?pageNum=${i }'/>"><span
														style="color: #555">[${i }]</span></a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${pu.endPageNum<pu.totalPageCount }">
												<a
													href="<c:url value='/admin/profit/list?pageNum=${pu.endPageNum+1 }'/>">[다음]</a>
											</c:when>
											<c:otherwise>
										[다음]
									</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${pu.startPageNum<pu.totalPageCount }">
												<a
													href="<c:url value='/admin/profit/list?pageNum=${pu.totalPageCount }'/>">[끝으로]</a>
											</c:when>
											<c:otherwise>
										[끝으로]
									</c:otherwise>
										</c:choose>
									</c:when>

									<c:otherwise>
										<c:choose>
											<c:when test="${pu.pageNum>1 }">
												<a
													href="<c:url value='/admin/profit/listFind?pageNum=${1 }&keyword=${keyword }'/>">[처음으로]</a>
											</c:when>
											<c:otherwise>
										[처음으로]
									</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${pu.startPageNum>5 }">
												<a
													href="<c:url value='/admin/profit/listFind?pageNum=${pu.startPageNum-1 }&keyword=${keyword }'/>">[이전]</a>
											</c:when>
											<c:otherwise>
										[이전]
									</c:otherwise>
										</c:choose>
										<c:forEach var="i" begin="${pu.startPageNum }"
											end="${pu.endPageNum }">
											<c:choose>
												<c:when test="${i==pu.pageNum }">
													<span style="color: blue">[${i }]</span>
												</c:when>
												<c:otherwise>
													<a
														href="<c:url value='/admin/profit/listFind?pageNum=${i }&keyword=${keyword }'/>"><span
														style="color: #555">[${i }]</span></a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:choose>
											<c:when test="${pu.endPageNum<pu.totalPageCount }">
												<a
													href="<c:url value='/admin/profit/listFind?pageNum=${pu.endPageNum+1 }&keyword=${keyword }'/>">[다음]</a>
											</c:when>
											<c:otherwise>
										[다음]
									</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${pu.startPageNum<pu.totalPageCount }">
												<a
													href="<c:url value='/admin/profit/listFind?pageNum=${pu.totalPageCount }&keyword=${keyword }'/>">[끝으로]</a>
											</c:when>
											<c:otherwise>
										[끝으로]
									</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					<div class="header">
						<h4 class="title">매출 총 순위</h4>
						<p class="category">Top 5</p>
					</div>
					<div class="content table-responsive">
						<table class="table table-hover table-striped table-bordered">
							<thead>
								<th>매출 순위</th>
								<th>매출 총 금액</th>
								<th>BJ 아이디</th>
								<th>회원 등급</th>
							</thead>
							<tbody>
								<c:forEach var="mvo" items="${rlist }">
									<tr>
										<td>${mvo.rnum }</td>
										<td>${mvo.totalmoney }</td>
										<td>${mvo.id }</td>
										<td>
											<div class="dropdown" data-m="${mvo.m_num }">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">${mvo.grade_name }</a>
												<ul class="dropdown-menu">
						
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			 <div class="col-md-8">
	                      <div class="card">
	                          <div class="header">
	                              <h4 class="title">Users Behavior!</h4>
	                              <p class="category">24 Hours performance</p>
	                          </div>
	                          <div class="content">
	                              <div id='chart_div'></div>
	                              <div class="footer">
	                                  <div class="legend">
	                                      <i class="fa fa-circle text-info"></i> Open
	                                      <i class="fa fa-circle text-danger"></i> Click
	                                      <i class="fa fa-circle text-warning"></i> Click Second Time
	                                  </div>
	                                  <hr>
	                              </div>
	                          </div>
	                      </div>
	            </div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		$(".dropdown").on("click",function(){
			$(".dropdown-menu").empty();
			var m_num = $(this).attr("data-m");
			$.ajax({
				url:"<c:url value='/admin/member/gradeList'/>",
				success:function(data){
					$(data).find("gradelist").each(function(){
						var grade_name = $(this).find("grade_name").text();
						var grade_num = $(this).find("grade_num").text();
						$("<li><a href='#'>" + grade_name + "</a></li>").appendTo(".dropdown-menu").on('click',function(){
							location.href="<c:url value='/admin/member/gradeUpdate?m_num=" + m_num + "&grade_num=" + grade_num + "'/>";
						});
					});
				}
			});
		});
	});
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type='text/javascript'>
  google.charts.load('current', {'packages':['annotationchart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('date', 'Date');
    data.addColumn('number', 'Kepler-22b mission');
    data.addColumn('string', 'Kepler title');
    data.addColumn('string', 'Kepler text');
    data.addColumn('number', 'Gliese 163 mission');
    data.addColumn('string', 'Gliese title');
    data.addColumn('string', 'Gliese text');
    data.addRows([
      [new Date(2314, 2, 15), 12400, undefined, undefined,
                              10645, undefined, undefined],
      [new Date(2314, 2, 16), 24045, 'Lalibertines', 'First encounter',
                              12374, undefined, undefined],
      [new Date(2314, 2, 17), 35022, 'Lalibertines', 'They are very tall',
                              15766, 'Gallantors', 'First Encounter'],
      [new Date(2314, 2, 18), 12284, 'Lalibertines', 'Attack on our crew!',
                              34334, 'Gallantors', 'Statement of shared principles'],
      [new Date(2314, 2, 19), 8476, 'Lalibertines', 'Heavy casualties',
                              66467, 'Gallantors', 'Mysteries revealed'],
      [new Date(2314, 2, 20), 0, 'Lalibertines', 'All crew lost',
                              79463, 'Gallantors', 'Omniscience achieved']
    ]);

    var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

    var options = {
      displayAnnotations: true
    };

    chart.draw(data, options);
  }
</script>