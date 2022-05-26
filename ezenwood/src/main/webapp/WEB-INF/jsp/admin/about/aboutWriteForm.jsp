<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<style>
.input-file-button {
	background-color: #EFEFEF;
	border-radius: 3px;
	border: 1px solid;
	font-size: 16px;
}
</style>

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

<meta charset="UTF-8">

<title>about</title>
</head>
<body>
	<div>
		어바웃 수정
		<div>
			<div style="background-color: gray;">회색창</div>
			<div>
				<div>
					<input type="text">
				</div>

				<div id="attachFileDiv">
					<label class="input-file-button" for="input-file"> 찾아보기 </label> <input
						type="file" id="input-file" style="display: none" name="files"
						value="" size="40"><input type="button" value="추가"
						onclick="attachFile.add()" style="margin-left: 5px">
				</div>
				<div>
					<input type="submit" onclick="" value="수정"> <input
						type="button" onclick="" value="취소">
				</div>
			</div>
		</div>
	</div>



</body>
</html>