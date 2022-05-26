<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script>
	attachFile = {
		idx : 0,
		add : function() { // 파일필드 추가
			var o = this;
			var idx = o.idx;

			var div = document.createElement('div');
			div.style.marginTop = '3px';
			div.id = 'file' + o.idx;

			var file = document.all ? document
					.createElement('<input name="files">') : document
					.createElement('input');
			file.type = 'file';
			file.name = 'files';
			file.size = '40';
			file.id = 'fileField' + o.idx;

			var btn = document.createElement('input');
			btn.type = 'button';
			btn.value = '삭제';
			btn.onclick = function() {
				o.del(idx)
			}
			btn.style.marginLeft = '5px';

			div.appendChild(file);
			div.appendChild(btn);
			document.getElementById('attachFileDiv').appendChild(div);

			o.idx++;
		},
		del : function(idx) { // 파일필드 삭제
			if (document.getElementById('fileField' + idx).value != ''
					&& !confirm('삭제 하시겠습니까?')) {
				return;
			}
			document.getElementById('attachFileDiv').removeChild(
					document.getElementById('file' + idx));
		}
	}
</script>
<head>
<meta charset="UTF-8">
<title>otoUpdateForm</title>
</head>
<body>
	<div>
		<div>
			<h3>1:1문의 수정</h3>
			<div>
				<p>1:1문의 수정 페이지입니다.</p>
				<div>
					<div style="margin: 50px">
					<form><!-- 여기서 값 받아오는거ㄴ -->
						<table>
							<tr>
								<td>제목</td>
								<td>배송문의</td>
							</tr>

							<tr>
								<td>내용</td>
								<td>배송관련 내용</td>
							</tr>
							<tr>
								<td><div id="attachFileDiv">
										<input type="file" name="files" value="" size="40"
											accept=".gif, .jpg, .png"><input type="button"
											value="추가" onclick="attachFile.add()"
											style="margin-left: 5px">
									</div></td>
							</tr>
						</table>
					</form>
					</div>

					<div align="center" style="width: 100%">
						<input type="button" value="등록" onclick="">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="button" value="취소" onclick="">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>