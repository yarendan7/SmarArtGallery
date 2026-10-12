<!--#include file="includes/db.asp"-->
<!--#include file="includes/header.asp"-->
<%
Dim buyerName, phone, artworkId, monthCount, interestRate
Dim rsArtwork, price, totalPayment, monthlyPayment, sqlInsert

buyerName = Request.Form("buyerName")
phone = Request.Form("phone")
artworkId = CLng(Request.Form("artworkId"))
monthCount = CLng(Request.Form("monthCount"))

If monthCount = 6 Then
  interestRate = 2
Else
  interestRate = 4
End If

Set rsArtwork = conn.Execute("SELECT * FROM Artworks WHERE ID=" & artworkId)
price = CDbl(rsArtwork("Price"))
totalPayment = price + (price * interestRate / 100)
monthlyPayment = totalPayment / monthCount

sqlInsert = "INSERT INTO Purchases (BuyerName, Phone, ArtworkID, Price, InterestRate, MonthCount, MonthlyPayment, TotalPayment, CreatedAt) VALUES (" & _
  SqlText(buyerName) & ", " & SqlText(phone) & ", " & artworkId & ", " & price & ", " & interestRate & ", " & monthCount & ", " & _
  Replace(CStr(monthlyPayment), ",", ".") & ", " & Replace(CStr(totalPayment), ",", ".") & ", Now())"
conn.Execute(sqlInsert)
%>

<section class="section-heading">
  <p class="eyebrow">Hesaplama Sonucu</p>
  <h1>Aylık Ödeme Tablosu</h1>
</section>

<table class="result-table">
  <tr>
    <th>Ad Soyad</th>
    <th>Telefon</th>
    <th>Eser</th>
    <th>Fiyat</th>
    <th>Faiz</th>
    <th>Ay</th>
    <th>Aylık Taksit</th>
    <th>Toplam</th>
  </tr>
  <tr>
    <td><%=buyerName%></td>
    <td><%=phone%></td>
    <td><%=rsArtwork("Title")%></td>
    <td>$<%=FormatNumber(price, 2)%></td>
    <td>%<%=interestRate%></td>
    <td><%=monthCount%></td>
    <td>$<%=FormatNumber(monthlyPayment, 2)%></td>
    <td>$<%=FormatNumber(totalPayment, 2)%></td>
  </tr>
</table>

<div class="message-box">
  <p>Formül: I = (P + (P * IR / 100)) / M</p>
  <a class="btn secondary" href="purchase.asp">Yeni Hesaplama</a>
  <a class="btn primary" href="index.asp">Ana Sayfa</a>
</div>

<%
rsArtwork.Close
Set rsArtwork = Nothing
%>
<!--#include file="includes/footer.asp"-->
