<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example</title>
    </head>
     
          <body background="http://www.designyourway.net/blog/wp-content/uploads/2017/12/Amazing-Computer-Wallpapers-Free-Download-wallpaper-desktop-images-background-photos-download-hd-windows-wallpaper-iphone-mac-1920x1080.jpg">
        
        <form method="post" action="login.jsp">
          
            <center>
           <font face = "Comic Sans MS"> 
        <font size = "6">LOGIN PAGE</font><br><br/>
       
            <table border="0" cellpadding="2">
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Yet Not Registered!! <a href="reg.jsp">Register Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
    </body>
</html>