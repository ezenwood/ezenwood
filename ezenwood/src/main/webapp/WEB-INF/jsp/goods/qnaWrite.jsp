<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠 우드</title>
<link rel="shortcut icon" href="/ezenwood/resource/image/letter-e (1).png" type=”image/x-icon” />
<link href="/ezenwood/css/reset.css" type="text/css" rel="stylesheet">
<link href="/ezenwood/css/layout.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/board.css" type="text/css" rel="stylesheet">
    <link href="/ezenwood/css/button.css" type="text/css" rel="stylesheet">
</head>
<body>
<%@include file ="/include/header.jsp" %>
<div id="container">
        <div id="contents">
            

            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>QNA</h2>
                        </div>
                        <div class="board_zone_cont">

                            <form id="frmWrite" action="#" method="post" enctype="multipart/form-data" class="frmWrite" novalidate="novalidate">
                            <input type="hidden" name="QNA_PARENT" value="${QNA_PARENT }">
                            <input type="hidden" name="bdId" value="goodsqa">
                            <input type="hidden" name="bdId" value="goodsqa">
                                <input type="hidden" name="bdId" value="goodsqa">
                                <input type="hidden" name="sno" value>
                                <input type="hidden" name="mode" value="write">
                                <input type="hidden" name="returnUrl" value="bdId=goodsqa">
                                <div class="board_zone_write">
                                    <div class="board_write_box">
                                        <table class="board_write_table">
                                            <colgroup>
                                                <col style="width: 15%">
                                                <col style="width: 85%">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">작성자</th>
                                                    <td>${writer }</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">상품 이름</th>
                                                    <td>${GOODS_TITLE }</td>
                                                </tr>
                                               
                                                <tr>
                                                    <th scope="row">제목</th>
                                                    <td>
                                                        <input type="text" name="QNA_TITLE" value>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">본문</th>
                                                    <td class="write_editor">
                                                        <div class="form_element">
                                                            <input type="checkbox" id="secret1" name="QNA_SECREAT" value="Y" checked>
                                                            <label class="check_s on" for="secret1">비밀글</label>
                                                        </div>
                                                        <textarea id="editor" name="QNA_CONTENT" title="내용" cols="80" rows="20"></textarea>
                                                        <!--<iframe frameborder="0" scrolling="no" style="width: 100%; height: 375px;" src="js/sister_js/SmartEditor2Skin.html"></iframe>-->
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">첨부파일</th>
                                                    <td id="uploadBox">
                                                        <div class="file_upload_sec">
                                                           <div style="overflow: hidden; width: 100%; margin: 5px 0 10px 0;">
                                                            <label for="attach1">
                                                                <input type="file" id="mainfile" name="mainImage" size="30" onchange="preview2()" />
                                                            </label>
                                                            <div class="btn_upload_box">
                                                               <div style="overflow: hidden; position: relative; float: left; width: 150px; padding: 0 0 0 6px;">
                                                                
                                                                

                                                            </div>
                                                               </div>
                                                        </div>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>


                                <div class="btn_center_box">
                                    <div style="text-align: center">
                                        <button type="button" class="btn_before" onclick="javascript:history.back()">
                                            <strong>이전</strong>
                                        </button>
                                        <button type="submit" class="btn_write_ok">
                                            <strong>저장</strong>
                                        </button>
                                    </div>
                                </div>

                                <!--
                            <a href="#this" class="btn" id="write">작성하기</a>
                            <a href="#this" class="btn" id="list">목록으로</a>-->
                            </form>
                        </div>
                        <!--//board_zone_cont-->
                    </div>
                    <!--//board_zone_sec-->

                    <script type="text/javascript">
                        var cfgUploadFl = 'y';
                        var cfgEditorFl = 'y';
                        var bdId = 'goodsqa';
                        var bdSno = '';
                       
                        gd_select_email_domain('writerEmail');
                      
                    </script>
              
             
                    <div id="addGoodsLayer" class="dn"></div>
                    <div id="addOrderLayer" class="dn"></div>




                </div>
            </div>
        </div>
    </div>
    <%@include file ="/include/footer.jsp" %>
</body>
</html>