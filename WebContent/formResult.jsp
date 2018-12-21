<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <h1>Hello Result!</h1>
        <table border="1" width="250">
                <tr>
                    <td>Username: </td>
                    <td>${username}</td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td>${password}</td>
                </tr>
                <tr>
                    <td>Photo: </td>
                    <td><img src="images/${fileName}" width="120" height="150"></td>
                </tr>
        </table>
    </center>
    </body>
