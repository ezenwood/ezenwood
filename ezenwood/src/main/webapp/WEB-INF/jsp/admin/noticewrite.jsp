<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<script language="JavaScript">
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

<meta charset="EUC-KR">
<title>admin notice write</title>
</head>
<body>
	<div>
		<div>
			<h1>공지사항 등록 그리고 수정</h1>
		</div>
		<div>
			<!-- 네모칸 -->
			<div>
				<div style="margin: 50px;">회색빈칸</div>
			</div>
			<div>
				<form>
					<table>
						<tr>
							<td><input type="text" size=20 placeholder="제목을 입력하세요"> </td>
						</tr>
						<tr>

							<td><textarea cols="40" rows="20" placeholder="내용을 입력하세요"></textarea></td>
						</tr>
						<tr>
							<td><div id="attachFileDiv">
									<input type="file" name="files" value="" size="40"><input
										type="button" value="추가" onclick="attachFile.add()"
										style="margin-left: 5px">
								</div></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>