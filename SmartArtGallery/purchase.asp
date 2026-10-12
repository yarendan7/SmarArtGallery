<!--#include file="includes/db.asp"-->
<!--#include file="includes/header.asp"-->
<%
Dim rsArtworks, selectedId
selectedId = Request.QueryString("artworkId")
Set rsArtworks = conn.Execute("SELECT * FROM Artworks ORDER BY ID")
%>

<section class="section-heading">
  <p class="eyebrow">Vize Benzeri Hesaplama</p>
  <h1>Sanat Eseri Satın Alma Formu</h1>
  <p>Form ikinci ASP sayfasına gönderilir ve seçilen eserin aylık ödeme tutarı hesaplanır.</p>
</section>

<form class="form-card wide" method="post" action="purchase-result.asp">
  <label>Ad Soyad
    <input type="text" name="buyerName" required>
  </label>
  <label>Telefon
    <input type="text" name="phone" required>
  </label>
  <label>Sanat Eseri
    <select name="artworkId" required>
      <%
      Do While Not rsArtworks.EOF
      %>
        <option value="<%=rsArtworks("ID")%>" <% If CStr(rsArtworks("ID")) = selectedId Then Response.Write("selected") End If %>>
          <%=rsArtworks("Title")%> - $<%=FormatNumber(rsArtworks("Price"), 0)%>
        </option>
      <%
        rsArtworks.MoveNext
      Loop
      rsArtworks.Close
      Set rsArtworks = Nothing
      %>
    </select>
  </label>
  <fieldset>
    <legend>Ödeme Süresi</legend>
    <label class="radio-line"><input type="radio" name="monthCount" value="6" required> 6 ay taksit, %2 faiz</label>
    <label class="radio-line"><input type="radio" name="monthCount" value="12" required> 12 ay taksit, %4 faiz</label>
  </fieldset>
  <button class="btn primary" type="submit">Hesapla</button>
</form>

<!--#include file="includes/footer.asp"-->
