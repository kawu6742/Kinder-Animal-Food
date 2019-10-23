<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">

<link
	href="${pageContext.request.contextPath}/resources/system/css/system.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/system/css/bootstrap.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/system/fontawesome/css/all.css"
	rel="stylesheet">
	
<link
	href="${pageContext.request.contextPath}/resources/system/css/checkReport.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/system/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/system/js/jquery-3.4.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/system/js/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/system/js/SelectAll.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/system/js/SelectAll.js"></script>

<style>
#bolangxian a:hover{
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg id='squiggle-link' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:ev='http://www.w3.org/2001/xml-events' viewBox='0 0 20 4'%3E%3Cstyle type='text/css'%3E.squiggle{animation:shift .3s linear infinite;}@keyframes shift {from {transform:translateX(0);}to {transform:translateX(-20px);}}%3C/style%3E%3Cpath fill='none' stroke='%23453886' stroke-width='2' class='squiggle' d='M0,3.5 c 5,0,5,-3,10,-3 s 5,3,10,3 c 5,0,5,-3,10,-3 s 5,3,10,3'/%3E%3C/svg%3E");
	background-position: bottom;
	background-repeat: repeat-x;
	background-size: 40%;
	border-bottom: 0;
	padding-bottom: .1em;
	text-decoration: none;
}
</style>
<title>Update/Delete Accreditation</title>
</head>
<body>
	<jsp:include page="Navigator.jsp" flush="true" />

	<table width=100% height=100% bgcolor=white>
		<tr>

			<!--Update/ Delete Accreditation -->
			<td valign="top"><font face="Arial" color="Black" size="8px">Update/
					Delete Accreditation</font>
				<form method="get" action="UpdateDeleteAccreditation">
					<table width=100% height=100% bgcolor=white>
						<tr>
							<td width=30%>
								<div class="form-group">
									<input type="text" class="form-control"
										name="accreditationName" placeholder="Accreditation Search">
								</div> 
							</td>
							<td valign="top" width=30%>
								<input type="submit" class="btn btn-default" value="Search">
							</td>
						</tr>
					</table>
				</form>
				<form method="get" action="UpdateDeleteAccreditationProcess">
					<table width=100% height=100% bgcolor=white>
						<tr>
							<td height="50">
							<table>
							<tr>
							<td>
							<!--select all--> <input name="" type="button"
								class="btn btn-default" onClick="AllCheck (this.form);return false;"
								value="select all"> 
							</td>
							<td>
							<!--submit--> <input type="submit" class="btn btn-default"
								value="Delete">
							</td>
							<td width=100% align="right">
							<div id="Blue">
									<a
										href="javascript:void(window.open('AccreditationAdd','','height=529, width=700, top=265,left=645, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no'))"
										target="_self">Add New Accreditation</a>
								</div>
							</td>
							</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td>
								<table  height=100% width=100% cellspacing="0" class="table table-striped table-border">
									<tr height="30">
										<th width="400"><strong><font face="Arial"
												color="Black" size="4px">&nbsp;&nbsp;Accreditation
													Name</font></strong></th>
										<th width="500"><strong><font face="Arial"
												color="Black" size="4px">&nbsp;&nbsp;Rating</font></strong></th>
										<th>&nbsp;</th>
										<th><strong><font face="Arial" color="Black"
												size="4px">&nbsp;&nbsp;Delete</font></strong></th>

									</tr>
									<tbody id="Acctable">
									<c:forEach items="${accreditations}" var="Acc">
										<tr height="40">
											<td>
												<div id="Black">${Acc.getAccreditation_name()}</div>
											</td>
											<td>${Acc.getRating()}</td>
											<td><div id="bolangxian">
													<a
														href="javascript:void(window.open('AccreditationEdit/${Acc.getAccreditation_id()}','','height=529, width=700, top=265,left=645, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no'))"
														target="_self">Edit</a>
												</div></td>
											<td><input type="checkbox" name="delete"
												value="${Acc.getAccreditation_id()}"></td>
										</tr>
									</c:forEach>

								</table>
							</td>
						</tr>
										<tr>
				<td align="right">
					<span id="spanFirst">|&lt;&nbsp;&nbsp;&nbsp;</span> <span id="spanPre">&lt;&lt;&nbsp;&nbsp;&nbsp;</span> <span id="spanNext">&gt;&gt;&nbsp;&nbsp;&nbsp;</span> <span id="spanLast">&gt;|&nbsp;&nbsp;&nbsp;</span> &nbsp;<span id="spanPageNum"></span>&nbsp;&nbsp;/&nbsp;&nbsp;<span id="spanTotalPage"></span>&nbsp;
					</td>
				</tr>
					</table>
				</form></td>
		</tr>
	</table>
		<script type="text/javascript">
     var theTable = document.getElementById("Acctable");
     var totalPage = document.getElementById("spanTotalPage");
     var pageNum = document.getElementById("spanPageNum");

     var spanPre = document.getElementById("spanPre");
     var spanNext = document.getElementById("spanNext");
     var spanFirst = document.getElementById("spanFirst");
     var spanLast = document.getElementById("spanLast");

     var numberRowsInTable = theTable.rows.length;
     var pageSize = 5;
     var page = 1;
	//next
     function next() {


         hideTable();


         currentRow = pageSize * page;
         maxRow = currentRow + pageSize;
         if (maxRow > numberRowsInTable) maxRow = numberRowsInTable;
         for (var i = currentRow; i < maxRow; i++) {
             theTable.rows[i].style.display = '';
         }
         page++;


         if (maxRow == numberRowsInTable) { nextText(); lastText(); }
         showPage();
         preLink();
         firstLink();
     }


     //pre
     function pre() {


         hideTable();


         page--;


         currentRow = pageSize * page;
         maxRow = currentRow - pageSize;
         if (currentRow > numberRowsInTable) currentRow = numberRowsInTable;
         for (var i = maxRow; i < currentRow; i++) {
             theTable.rows[i].style.display = '';
         }




         if (maxRow == 0) { preText(); firstText(); }
         showPage();
         nextLink();
         lastLink();
     }


     //first
     function first() {
         hideTable();
         page = 1;
         for (var i = 0; i < pageSize; i++) {
             theTable.rows[i].style.display = '';
         }
         showPage();


         preText();
         nextLink();
         lastLink();
     }


     //last
     function last() {
         hideTable();
         page = pageCount();
         currentRow = pageSize * (page - 1);
         for (var i = currentRow; i < numberRowsInTable; i++) {
             theTable.rows[i].style.display = '';
         }
         showPage();


         preLink();
         nextText();
         firstLink();
     }


     function hideTable() {
         for (var i = 0; i < numberRowsInTable; i++) {
             theTable.rows[i].style.display = 'none';
         }
     }


     function showPage() {
         pageNum.innerHTML = page;
     }


     //page count
     function pageCount() {
         var count = 0;
         if (numberRowsInTable % pageSize != 0) count = 1;
         return parseInt(numberRowsInTable / pageSize) + count;
     }


     
     function preLink() { spanPre.innerHTML = "<a href=' '><<</a >&nbsp;&nbsp;&nbsp;"; }
     function preText() { spanPre.innerHTML = "<< &nbsp;&nbsp;&nbsp;"; }


     function nextLink() { spanNext.innerHTML = "<a href='javascript:next();'>>></a >&nbsp;&nbsp;&nbsp;"; }
     function nextText() { spanNext.innerHTML = ">> &nbsp;&nbsp;&nbsp;"; }


     function firstLink() { spanFirst.innerHTML = "<a href='javascript:first();'>|<</a >&nbsp;&nbsp;&nbsp;"; }
     function firstText() { spanFirst.innerHTML = "|< &nbsp;&nbsp;&nbsp;"; }


     function lastLink() { spanLast.innerHTML = "<a href='javascript:last();'>>|</a >&nbsp;&nbsp;&nbsp;"; }
     function lastText() { spanLast.innerHTML = ">| &nbsp;&nbsp;&nbsp;"; }


     function hide() {
         for (var i = pageSize; i < numberRowsInTable; i++) {
             theTable.rows[i].style.display = 'none';
         }


         totalPage.innerHTML = pageCount();
         pageNum.innerHTML = '1';

 		if(pageCount()>1){
	         nextLink();
	         lastLink();
		}
     }


     hide();
     </script>
</body>
</html>

