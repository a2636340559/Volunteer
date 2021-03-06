<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,volunteer.modal.ActInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		body{
			padding-top:50px;
		}
	</style>
<title>Insert title here</title>
</head>
<body>
	<div class="col-sm-10 col-sm-offset-1">
	<table class="table table-bordered table-hover">
	  <thead>
	    <tr>
	      <th>活动名称</th>
	      <th>发布人</th>
	      <th>活动时间</th>
	      <th>操作</th>
	    </tr>
	  </thead>
	  <tbody>
	  <% ArrayList<ActInfo> infoList=(ArrayList<ActInfo>)session.getAttribute("infoList"); 
	  	int length=infoList.size();
	  	for(int i=0;i<length;i++){
	  		if(infoList.get(i).getAstate().equals("已结束")&&infoList.get(i).getState()!=0){
	  %>
	    <tr>
	      <input type="hidden" class="Ano" value="<%=infoList.get(i).getAno() %>">
	      <input type="hidden" class="state" value="<%=infoList.get(i).getState() %>">
	      <td class="Aname"><%=infoList.get(i).getAname() %></td>
	      <td class="Pname"><%=infoList.get(i).getPublishName() %></td>
	      <td class="Adate"><%=infoList.get(i).getAdate() %></td>
	      <td>
	      	<button class="btn btn-info alter" id="<%=infoList.get(i).getAno() %>">修改工时</button> 
	      </td>
	    </tr>
	    <%} }%>
	  </tbody>
	</table>
	</div>
	<div class="modal fade" id="vtimeDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body">
            	<h4>添加工时记录</h4>
            	<form class="form-inline" role="form" action="">
					  <div class="form-group col-sm-5" style="margin-bottom:10px;">
					    <input type="text" class="form-control" id="No" placeholder="请输入学号">
					  </div>
					  <div class="form-group col-sm-5"style="margin-bottom:10px;">
					    <input type="text" class="form-control" id="vtime" placeholder="请输入工时">
					  </div>
				</form>
				<button class="btn btn-info col-sm-2" id="addVtime"style="margin-bottom:10px;">添加</button>
				<div id="vtimeList"></div>
            </div>
			<div class="modal-footer">
				<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8 text-center">
                	<button type="button" class="btn btn-primary btn-block" id="confirm" data-dismiss="modal">确认修改</button>
                </div>
				<div class="col-sm-2"></div>
				</div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script src="../js/alterVtime.js"></script>
<%session.removeAttribute("infoList"); %>
</body>
</html>