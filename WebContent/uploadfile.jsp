<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><center><h1>Login upload form</h1>
        <form action="Upload" method="POST" enctype="multipart/form-data">
            
            Photo: <br/><input type="file" name="photo" value="" /><br/>
            <input type="submit" value="Save" />
        </form>
        </center>
    </body>
</html>