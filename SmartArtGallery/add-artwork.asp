<!--#include file="includes/db.asp"-->
<!--#include file="includes/header.asp"-->
<%
If Session("admin") <> True Then
  Response.Redirect "admin-login.asp"
End If

If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
  Dim sql
  sql = "INSERT INTO Artworks (Title, Artist, Category, Price, Description, ImageUrl) VALUES (" & _
    SqlText(Request.Form("title")) & ", " & SqlText(Request.Form("artist")) & ", " & SqlText(Request.Form("category")) & ", " & _
    CDbl(Request.Form("price")) & ", " & SqlText(Request.Form("description")) & ", " & SqlText(Request.Form("imageUrl")) & ")"
  conn.Execute(sql)
  Response.Redirect "admin-panel.asp"
End If
%>

<section class="section-heading">
  <p class="eyebrow">Admin</p>
  <h1>Yeni Sanat Eseri Ekle</h1>
</section>

<form class="form-card wide" method="post" action="add-artwork.asp">
  <label>Eser Adı
    <input type="text" name="title" required>
  </label>
  <label>Sanatçı
    <input type="text" name="artist" required>
  </label>
  <label>Kategori
    <input type="text" name="category" required>
  </label>
  <label>Fiyat
    <input type="number" name="price" required>
  </label>
  <label>Açıklama
    <textarea name="description" rows="5" required></textarea>
  </label>
  <label>Görsel Yolu
    <input type="text" name="imageUrl" value="assets/images/art-new.jpg">
  </label>
  <button class="btn primary" type="submit">Eseri Kaydet</button>
</form>

<!--#include file="includes/footer.asp"-->
