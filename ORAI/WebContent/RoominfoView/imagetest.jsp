<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Image 버튼으로 넘기기</title>
 </head>
 <body leftmargin="0" topmargin="0">

  <br><br>

  <CENTER>
<TABLE border="0" cellpadding="3" bgcolor="#000000" width="300">
<TR height="300">
	<TD align="center">
	<!-- 맨처음 보여줄 이미지 설정 -->

	<IMG src="/ORAI/image/jsp/jsp1.PNG" name="gallery">
	</TD>
</TR>
<TR>
	<TD align="center">
		<FORM name="menu">
			<SCRIPT type="text/javascript">
			
			var photos = new Array();
			var which = 0;
			
			// 보여줄 이미지들을 아래의 방법으로 설정
			photos[0] = "/ORAI/image/jsp/jsp1.PNG";
			photos[1] = "/ORAI/image/jsp/jsp2.PNG";
			photos[2] = "/ORAI/image/jsp/jsp3.PNG";
			photos[3] = "/ORAI/image/jsp/jsp4.PNG";
			photos[4] = "/ORAI/image/jsp/jsp5.PNG";
		
			function backward()

			{	
				if (which > 0)
				{
					which --;
					document.images.gallery.src=photos[which];
				}
			}

	function forward()
	{
		if (which < photos.length-1)
		{
			which ++;
			document.images.gallery.src= photos[which];
		}
	}
			
			</SCRIPT>

		<INPUT type="button" value="<<뒤로" name="B2" onClick="backward();" onFocus="this.blur();" style="background-color:#800080;border:none;">
		<INPUT type="button" value="처음으로" onClick="which=1; backward();" onFocus="this.blur();" style="background-color:#cecece;border:none;">
		<INPUT type="button" value=">>앞으로" name="B1" onClick="forward();" onFocus="this.blur();" style="background-color:#ffffff;border:none;color:#ff0000">
		</FORM>
	</TD>
</TR>
</TABLE>
</CENTER>
 </body>
</html>