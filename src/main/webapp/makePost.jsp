<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Post Creation Form</title>
</head>
<body>
<h3>Simple Post Creation Form</h3>
    <form action="CreatePost" method="post" enctype="multipart/form-data">
    	<label for="title">Title:</label>
        <input type="text" id="title" name="title">
        <br></br>
        <label for="location">Location:</label>
        <input type="text" id="location" name="location">
        <br></br>
        <label for="image">img:</label>
        <input type="file" id="image" name="image">
        <br></br>
        <label for="resources">resources:</label>
        <input type="text" id="resources" name="resources">
        <br></br>
        <label for="details">details:</label>
        <input type="text" id="details" name="details">
        <br></br>
        <button type="submit">POST</button>
    </form>
</body>
</html>
