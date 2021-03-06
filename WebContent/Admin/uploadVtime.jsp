<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,volunteer.modal.ActInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge">
	 <link rel="stylesheet" href="../bootstrap-fileinput/bootstrap-fileinput.css">
	 <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.8&key=cc17678642f59e975f39bb06fcb83665&plugin=AMap.Autocomplete,AMap.PlaceSearch,AMap.Geolocation"></script>
    
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
 
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="../bootstrap-fileinput/bootstrap-fileinput.js"></script>
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
	      <th>状态</th>
	      <th>操作</th>
	    </tr>
	  </thead>
	  <tbody>
	  <% ArrayList<ActInfo> infoList=(ArrayList<ActInfo>)session.getAttribute("infoList"); 
	  	int length=infoList.size();
	  	for(int i=0;i<length;i++){
	  		if(infoList.get(i).getAstate().equals("已结束")&&infoList.get(i).getState()==0){
	  %>
	    <tr>
	      <input type="hidden" class="Ano" value="<%=infoList.get(i).getAno() %>">
	      <input type="hidden" class="state" value="<%=infoList.get(i).getState() %>">
	      <td class="Aname"><%=infoList.get(i).getAname() %></td>
	      <td class="Pname"><%=infoList.get(i).getPublishName() %></td>
	      <td class="Adate"><%=infoList.get(i).getAdate() %></td>
	      <td class="Astate"><%=infoList.get(i).getAstate() %></td>
	      <td>
	      	<button class="btn btn-success sub" id="<%=infoList.get(i).getAno() %>">提交工时表</button> 
	      </td>
	    </tr>
	    <%} }%>
	  </tbody>
	</table>
	</div>
	<div class="modal fade" id="vtimeSubmit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body text-center">
            	<div class="fileinput fileinput-new" data-provides="fileinput" id="uploadImageDiv">
                	<div class="text-center">
                    	<div class="fileinput-preview fileinput-exists thumbnail text-center" style="max-width: 200px; max-height: 150px;"></div>
                    </div>
                    <div>
                        <span class="btn default btn-file">
                        <button class="btn btn-success fileinput-new">选择文件</button>
                        <button class="btn btn-info fileinput-exists">更改</button>
                        <input type="file" name="upload" id="upload" /></span>
                        <button class="btn btn-default fileinput-exists" data-dismiss="fileinput">移除</button>
                    </div>
                </div>
			</div>
			<div class="modal-footer">
				<div class="row">
				<div class="col-sm-2"></div>
				<div class="col-sm-4 text-center">
                	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
				<div class="col-sm-4 text-center">
                	<button type="button" class="btn btn-primary" id="submit">提交</button>
                </div>
				<div class="col-sm-2"></div>
				</div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script src="../js/uploadVtime.js"></script>
<%session.removeAttribute("infoList"); %>
</body>
</html>