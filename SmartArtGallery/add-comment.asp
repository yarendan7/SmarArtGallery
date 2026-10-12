<!--#include file="includes/db.asp"-->
<%
Dim artworkId, visitorName, commentText, sql
artworkId = CLng(Request.Form("artworkId"))
visitorName = Request.Form("visitorName")
commentText = Request.Form("commentText")

sql = "INSERT INTO Comments (ArtworkID, VisitorName, CommentText, CreatedAt) VALUES (" & artworkId & ", " & SqlText(visitorName) & ", " & SqlText(commentText) & ", Now())"
conn.Execute(sql)
Response.Redirect "artwork-detail.asp?id=" & artworkId
%>
