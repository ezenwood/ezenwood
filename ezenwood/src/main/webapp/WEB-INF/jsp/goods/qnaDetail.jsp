<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link href="css/reset.css" type="text/css" rel="stylesheet">
    <link href="css/layout.css" type="text/css" rel="stylesheet">
    <link href="css/common.css" type="text/css" rel="stylesheet">
    <link href="css/board.css" type="text/css" rel="stylesheet">
    <!--<link href="css/button.css" type="text/css" rel="stylesheet">
    <link href="css/qnaDetail.css" type="text/css" rel="stylesheet">-->


</head>

<body>

    <div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
                    <div class="board_zone_sec">
                        <div class="board_zone_tit">
                            <h2>QNA</h2>
                        </div>

                        <div class="board_zone_cont">
                            <div class="board_zone_view">
                                <div class="board_view_tit">
                                    <h3>����</h3>
                                </div>


                                <div class="xans-element- xans-board xans-board-product-4 xans-board-product xans-board-4 ec-base-box typeProduct ">
                                    <p class="thumbnail"><a href="#">
                                    <img src="#" alt=""></a></p>
                                    <div class="information">
                                        
                                        <h3><a href="#">��ǰ �̸�</a></h3>
                                        <p class="price">��ǰ ����<span id="sPrdTaxText"></span></p>
                                        <p class="button"><a href="#" class="btnEm" title="��â���� �̵�">��ǰ �󼼺���</a></p>
                                    </div>
                                </div>

                                <form id="BoardDelForm" name="" action="#" method="post" target="_self" enctype="multipart/form-data">
                                    <input id="no" name="no" value="#" type="hidden">
                                    <input id="bulletin_no" name="bulletin_no" value="#" type="hidden">
                                    <input id="board_no" name="board_no" value="#" type="hidden">
                                    <input id="member_id" name="member_id" value="���̵�" type="hidden">
                                    <input id="list_url" name="list_url" value="#" type="hidden">
                                    <input id="bdf_modify_url" name="bdf_modify_url" value="#" type="hidden">
                                    <input id="bdf_del_url" name="bdf_del_url" value="#" type="hidden">
                                    <input id="bdf_action_type" name="bdf_action_type" value="" type="hidden">
                                    <div class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
                                        
                                        <div class="ec-base-table typeWrite ">
                                            <table border="0" summary="">
                                                <caption>��ǰ �Խ��� ��</caption>
                                                <colgroup>
                                                    <col style="width:230px;">
                                                    <col style="width:auto;">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">����</th>
                                                        <td>��ǰ����</td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">�ۼ���</th>
                                                        <td> �ۼ��� �̸� </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <ul class="etcArea">
                                                                <li class="">
                                                                    <strong>�ۼ���</strong> <span class="txtNum">�ۼ���</span>
                                                                </li>
                                                            </ul>
                                                            <div class="detail">
                                                                <div class="fr-view fr-view-article">���� ����</div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr class="attach displaynone">
                                                        <th scope="row">÷������</th>
                                                        <td></td>
                                                    </tr>
                                                    <tr class=" displaynone">
                                                        <th scope="row">��й�ȣ</th>
                                                        <td><input id="password" name="password" fw-filter="" fw-label="��й�ȣ" fw-msg="" onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }" value="" type="password"> <span class="ec-base-help txtInfo">�����Ϸ��� ��й�ȣ�� �Է��ϼ���.</span>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="ec-base-button ">
                                            <span class="gLeft">
                                                
                                                <a href="#" class="btnNormalFix sizeS">���</a>
                                            </span>
                                            <span class="gRight">
                                                <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','#');" class="btnNormalFix sizeS ">����</a>
                                                <a href="#" class="btnEmFix sizeS ">����</a>
                                               
                                            </span>
                                        </div>
                                    </div>
                                </form>

                                <div class="xans-element- xans-board xans-board-commentpackage-4 xans-board-commentpackage xans-board-4 ">
                                    <div class="xans-element- xans-board xans-board-commentlist-4 xans-board-commentlist xans-board-4">
                                        
                                        <ul class="boardComment">
                                            <li class="first  xans-record-">
                                                <div class="commentTop">
                                                    <strong class="name"> ���� ���</strong>
                                                    <span class="date">�亯 ��¥</span>
                                                </div>
                                                <!--<span class="button">
                                                    <a href="javascript:;" class="btnNormal displaynone" onclick="BOARD_COMMENT.comment_update('163363','144433',this);">����</a>
                                                    <a href="javascript:;" class="btnNormal displaynone" onclick="BOARD_COMMENT.comment_delete('/board/product/comment_del.html?board_no=6&amp;no=163363&amp;comment_no=144433&amp;page=&amp;return_url=/board/product/read.html');"><i class="icoDelete"></i> ����</a>
                                                    <a href="javascript:;" onclick="" class="btnNormal displaynone">��� <img src="//img.echosting.cafe24.com/skin/base/common/btn_icon_reply.gif" alt=""></a>
                                                </span>-->
                                                <div class="comment">
                                                    
                                                    <span id="comment_contents144433">�亯 ����</span>
                                                </div>
                                            </li>
                                        </ul>
                                        
                                    </div>
                                    
                                    <form id="commentForm" name="" action="/exec/front/Board/CommentUpdate/6" method="post" target="_self" enctype="multipart/form-data" style="display: none;">
                                        <input id="board_no" name="board_no" value="6" type="hidden">
                                        <input id="no" name="no" value="163363" type="hidden">
                                        <input id="comment_no" name="comment_no" value="" type="hidden">
                                        <input id="member_id" name="member_id" value="" type="hidden">
                                        <div class="xans-element- xans-board xans-board-commentform-4 xans-board-commentform xans-board-4 ">
                                            <fieldset>
                                                <legend>��� ����</legend>
                                                <p>��й�ȣ : <input id="comment_password" name="comment_password" fw-filter="isFill" fw-label="��ۺ�й�ȣ" fw-msg="" value="" type="password"> <span class="secret displaynone"><label>��д��</label></span></p>
                                                <div class="view">
                                                    <textarea id="comment_modify" name="comment_modify" fw-filter="isFill" fw-label="��۳���" fw-msg=""></textarea> <span class="submit">
                                                        <a href="#none" class="btnEm sizeL" onclick="BOARD_COMMENT.comment_update_ok('commentForm');">����</a>
                                                        <a href="#none" class="btnNormal sizeL" onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');">���</a>
                                                    </span>
                                                </div>
                                                <p class="displaynone"> / byte</p>
                                            </fieldset>
                                        </div>
                                    </form>
                                    <form id="commentSecretForm" name="" action="/exec/front/Board/CommentSecret/6" method="post" target="_self" enctype="multipart/form-data" style="display: none;">
                                        <input id="board_no" name="board_no" value="6" type="hidden">
                                        <input id="comment_no" name="comment_no" value="" type="hidden">
                                        <input id="pass_check" name="pass_check" value="F" type="hidden">
                                        <div class="xans-element- xans-board xans-board-commentformsecret-1002 xans-board-commentformsecret xans-board-1002 ">
                                            <p>��й�ȣ : <input id="secure_password" name="secure_password" fw-filter="isFill" fw-label="��ۺ�й�ȣ" fw-msg="" value="" type="password"> <a href="#none" class="btnNormal" onclick="BOARD_COMMENT.show_secret_comment('commentSecretForm');">Ȯ��</a>
                                                <a href="#none" class="btnNormal" onclick="BOARD_COMMENT.hide_secret_comment_form('commentSecretForm');">���</a>
                                            </p>
                                        </div>
                                    </form>
                                    <div class="xans-element- xans-board xans-board-commentwrite-4 xans-board-commentwrite xans-board-4 ">
                                        
                                    </div>
                                </div>


                            </div>
                        </div>
                        <!--//board_zone_cont-->
                    </div>
                </div>
            </div>
        </div>

    </div>

</body></html>