<!--#include file="includes/db.asp"-->
<!--#include file="includes/header.asp"-->
<%
If Session("admin") <> True Then
  Response.Redirect "admin-login.asp"
End If

Dim artworkCount, commentCount, purchaseCount, rs
Set rs = conn.Execute("SELECT Count(*) AS Total FROM Artworks")
artworkCount = rs("Total")
rs.Close
Set rs = conn.Execute("SELECT Count(*) AS Total FROM Comments")
commentCount = rs("Total")
rs.Close
Set rs = conn.Execute("SELECT Count(*) AS Total FROM Purchases")
purchaseCount = rs("Total")
rs.Close
%>

<section class="section-heading">
  <p class="eyebrow">Admin Panel</p>
  <h1>Galeri Yönetimi</h1>
</section>

<section class="stats-grid">
  <article><span>Eser Sayısı</span><strong><%=artworkCount%></strong></article>
  <article><span>Yorum Sayısı</span><strong><%=commentCount%></strong></article>
  <article><span>Satın Alma Kaydı</span><strong><%=purchaseCount%></strong></article>
</section>

<div class="admin-actions">
  <a class="btn primary" href="add-artwork.asp">Yeni Eser Ekle</a>
  <a class="btn secondary" href="logout.asp">Çıkış Yap</a>
</div>

<h2>Son Satın Alma Kayıtları</h2>
<table class="result-table">
  <tr>
    <th>Alıcı</th>
    <th>Telefon</th>
    <th>Fiyat</th>
    <th>Faiz</th>
    <th>Ay</th>
    <th>Aylık</th>
    <th>Tarih</th>
  </tr>
<%
Set rs = conn.Execute("SELECT TOP 10 * FROM Purchases ORDER BY ID DESC")
Do While Not rs.EOF
%>
  <tr>
    <td><%=rs("BuyerName")%></td>
    <td><%=rs("Phone")%></td>
    <td>$<%=FormatNumber(rs("Price"), 2)%></td>
    <td>%<%=rs("InterestRate")%></td>
    <td><%=rs("MonthCount")%></td>
    <td>$<%=FormatNumber(rs("MonthlyPayment"), 2)%></td>
    <td><%=rs("CreatedAt")%></td>
  </tr>
<%
  rs.MoveNext
Loop
rs.Close
Set rs = Nothing
%>
</table>

<!--#include file="includes/footer.asp"-->
