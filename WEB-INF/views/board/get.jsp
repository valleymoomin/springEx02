<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  

   <%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">   Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Read
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">


								 <div class="form-group">
          				         <label>BNO</label>
                          	     <input class="form-control" name="bno" readonly="readonly" value= '<c:out value="${board.bno}"/>'>        			    
                              </div>
                         

                          	  <div class="form-group">
          				         <label>Title</label>
                          	     <input class="form-control" name="title" readonly="readonly" value= '<c:out value="${board.title}"/>'>        			    
                              </div>
                              
                                   
                          	  <div class="form-group">
          				         <label>Content</label>
                          	       <textarea class="form-control" id="textAreaExample1" rows="4" name="content" readonly="readonly"><c:out value="${board.content}"/></textarea>        			    
                              </div>
                              
                              
                               <div class="form-group">
          				         <label>Writer</label>
                          	     <input class="form-control" name="writer" readonly="readonly" value= '<c:out value="${board.writer}"/>'>        			    
                              </div>
                              
                                    <form id='actionForm' action="/board/list" method="get">
                          		 		<input type='hidden' name='pageNum' value='${cri.pageNum }'>
                           				<input type='hidden' name='amount' value='${cri.amount }'>
                           				<input type='hidden' name='bno' value='${board.bno }'>                           				
                           				<!-- board.bno, param.bno 둘다가능 -->
                           				<input type='hidden' name='type' value='${cri.type}'>  
                          			 	<input type='hidden' name='keyword' value='${cri.keyword}'>      
                          			 	    
                          			 </form>
                              
                                     <button type="button" class="btn btn-default listBtn"><a href='/board/list'>List</a></button>
                                      <button type="button" class="btn btn-default modBtn"><a href='/board/modify?bno=<c:out value="${board.bno}"/>'>Modify</a></button>
                              		
                              		
                              		<script type="text/javascript" src="/resources/js/reply.js"></script>
                              		<script>
                              		
                              			var actionForm = $("#actionForm");
                              		
                              			$(".listBtn").click(function(e){
                              				e.preventDefault();
                              				actionForm.find("input[name='bno']").remove();
                              				actionForm.submit();
                              			
                              			});
                              			
                              			
                              			$(".modBtn").click(function(e){
                              				e.preventDefault();
                              				actionForm.attr("action", "/board/modify");
                              				actionForm.submit();
                              			
                              			});
                              			
                              	
                              			
                              		</script>
                              		
                              	<script type="text/javascript">
                              /* 		$(document).ready(function(){
                              			console.log(replyService);
                              		}); */
                              		
                              		
                   /*            		console.log("===================");
                              		console.log("JS TEST");
                              		
                              		var bnoValue = '<c:out value="${board.bno}"/>';
                              		//for replyService add test
                     				    replyService.add(
                              			{reply:"JS test", replyer:"tester", bno:bnoValue},
                              			function(result){
                              				alert("RESULT: "+ result);
                              			}
                              		); 
                              		
                              		// getList test
                               		replyService.getList({bno:bnoValue, page:1}, function(list){
                              			for(var i=0, len= list.length||0; i<len; i++){
                              				console.log(list[i]);
                              			}
                              		}); 
                              		
                              		//16번 댓글 삭제 테스트
                              		replyService.remove(16,function(count){
                              			console.log(count);
                         
                              			if(count==="success") {
                              				alert("REMOVED");
                              			}
                              		}, function(err){
                              			alert('Error...');                              		
                              			
                              		});
                              		
                              		
                              		//19번 댓글 수정
                              		replyService.update({
                              			rno : 19,
                              			bno : bnoValue,
                              			reply : "Modified reply......."
                              		}, function(result){
                              			alert("수정 완료......");
                              		}); */
                           
                              		//6번 댓글읽기
                              		replyService.get(6, function(data){
                              			console.log(data);
                              		});
                              		
                              	</script>
                
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        
         
         <!-- row - reply -->
<div class="row">
    <div class="col-lg-12">
    <!-- /.panel -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-comments fa-fw"></i> Reply
                <!--  <sec:authorize access="isAuthenticated()"> -->
                    <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
      <!--           </sec:authorize>  -->
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <ul class="chat">
                    <!-- start reply -->
                    <li class="left clearfix" data-rno="12">
                        <div>
                            <div class="header">
                                <strong class="primary-font">user00</strong>
                                <small class="pull-right text-muted">2021-08-06 12:41</small>
                            </div>
                            <p>Good job!</p>
                        </div>
                    </li>
                    <!-- /.end reply -->
                </ul>
            </div>
            <!-- /.panel-body -->

            <!-- paging -->
            <div class="panel-footer"></div>
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row - reply -->
         
          
            <!-- /.row -->
     <!-- Modal -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
                                        </div>
                                        <div class="modal-body">
                                           <div class="form-group">
                                           		<label>Reply</label>
                                           		<input class = "form-control" name='reply' value='New Reply!!!'>                       	
                                          </div>
                                           <div class="form-group">
                                           		<label>Replyer</label>
                                           		<input class = "form-control" name='replyer' value='replyer'>
                                           </div>
                                           <div class="form-group">
                                           		<label>Reply Date</label>
                                           		<input class = "form-control" name='replyDate' value=''>
                                           		
                                           </div>
                                           
                                           
                                        <div class="modal-footer">
                                            <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
                                            <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
                                            <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
                                            <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
                                            
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->        
            
            
       

    <%@ include file="../includes/footer.jsp"%>
    
    
    <script>
    $(document).ready(function(){
    	var bnoValue = '<c:out value="${board.bno}"/>';
    	var replyUL = $(".chat");
    	
    	showList(1);
    	
    	function showList(page){
    		replyService.getList({bno:bnoValue, page: page||1}, function(list){
    			var str = "";
    			if(list == null || list.length ==0){
    				replyUL.html("");
    				return;
    			}
    			for(var i=0, len=list.length ||0; i<len; i++){
    				
    				str += "<li class ='left clearfix' data-rno='" + list[i].rno + "'>";
                    str += "  <div><div class='header'><strong class='primary-font'>" + list[i].replyer + "</strong>";
                    str += "    <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";
                    str += "    <p>" + list[i].reply + "</p></div></li>";
    			}
    			replyUL.html(str);
    		}); //end function
    	}// end showList
    	
    	
    	//댓글 추가시작시 버튼이벤트 처리
    	var modal =$(".modal");
    	var modalInputReply = modal.find("input[name='reply']");
    	var modalInputReplyer = modal.find("input[name='replyer']");
    	var modalInputReplyDate = modal.find("input[name='replyDate']");
    	
    	var modalModBtn =$("#modalModBtn");
    	var modalRemoveBtn = $("#modalRemoveBtn");
    	var modalRegisterBtn = $("#modalRegisterBtn");
    	
    	$("#addReplyBtn").on("click", function(e){
    		modal.find("input").val("");
    		modalInputReplyDate.closest("div").hide();
    		modal.find("button[id != 'modalCloseBtn']").hide();
    		
    		modalRegisterBtn.show();
    		
    		$(".modal").modal("show");
    	});
    	
    	
    	
    	//새로운 댓글 추가 처리
    	modalRegisterBtn.on("click", function(e){
    		
    		var reply ={
    				reply: modalInputReply.val(),
    				replyer : modalInputReplyer.val(),
    				bno : bnoValue
    		};
    		replyService.add(reply, function(result){
    			alert(result);
    			modal.find("input").val("");
    			modal.modal("hide");

    			//댓글 추가후 댓글목록 showList(1)을 갱신
    			showList(1);
    		})
    		
    	});
    
		//댓글 클릭이벤트 처리 - 모달오픈이벤트
		$(".chat").on("click", "li", function(e){
			var rno = $(this).data("rno");
			console.log(rno);
		
			//댓글 조회 클릭 이벤트 처리
			replyService.get(rno, function(reply){
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rno", reply.rno);
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
				
			});
		});
		
		//댓글ㅅ정
		
		modalModBtn.on("click", function(e){
			var reply ={rno:modal.data("rno"), reply:modalInputReply.val()};
		
			replyService.update(reply, function(result){
				alert(result);
				modal.modal("hide");
				showList(1);
			});
		
		});
		
		//댓글 삭제
		 modalRemoveBtn.on("click", function (e) {
	            var rno = modal.data("rno");
	    
	            replyService.remove(rno, function (result) {
	                alert(result);
	                modal.modal("hide");
	                showList(1);
	            });
	        });
    	
    	});
    	
    </script>