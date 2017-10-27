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
	                              <h4 class="title">최근 7주일 매출</h4>
	                              <p class="category">BJ등급별 매출</p>
	                          </div>
	                          <div class="content">
	                              <div id='curve_chart' style="height: 300px;"></div>
	                              <div class="footer">
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
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	 var myArray = new Array( new Array(7), new Array(7) );

    	 var bar = new Array(8);
    	 
	    	//for문을 돌면서 배열을 선언합니다.
	    for(var i=0; i<bar.length; i++) {
	    	 bar[i] = new Array(4);
	    }
         var data1 = [
             ['날짜', '일반 BJ', '베스트 BJ','파트너 BJ'],
             ['2004',  1000,      400,1],
             ['2005',  1170,      460,1],
             ['2006',  660,       1120,1],
             ['2007',  1030,      540,1]
           ];
         var i,j;
         
     	 var cnt=1;
     	bar[0][0] = '날짜';
     	bar[0][1] = '일반 BJ';
     	bar[0][2] = '베스트 BJ';
     	bar[0][3] = '파트너 BJ';
   	 	<c:forEach var="mvo" items="${glist }" varStatus="status">
   	 	if((${status.index} != 0)){
   	 		var d1 = '${glist[status.index-1].p_date}';
   		 	var d2 = '${glist[status.index].p_date}';
   	 		if(d1 != d2){
   	 			cnt++;
   	 		}
   	 	}
   	 	bar[cnt][0] = '${mvo.p_date}';
       	var grade = ${mvo.grade_num}	
      	bar[cnt][grade] = ${mvo.total};	
       	</c:forEach>
       	
       	for(i=0;i<5;i++){
       		for(j=0;j<4;j++){
       			if(bar[i][j] == undefined){
       				bar[i][j]=0;
       			}
       			//console.log('['+ i +']'+'['+ j +']'+bar[i][j]);
       		}
       	}
           	
         
        var data = google.visualization.arrayToDataTable(bar);

        var options = {
          title: 'Company Performance',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>