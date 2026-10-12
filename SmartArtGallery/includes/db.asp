<%
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
On Error Resume Next
conn.Open "Provider=Microsoft.ACE.OLEDB.16.0;Data Source=" & Server.MapPath("database/smart_gallery.mdb")
If Err.Number <> 0 Then
  Err.Clear
  conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("database/smart_gallery.mdb")
End If
On Error GoTo 0

Function SqlText(value)
  SqlText = "'" & Replace(value, "'", "''") & "'"
End Function
%>
