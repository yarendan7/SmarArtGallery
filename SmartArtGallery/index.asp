<!--#include file="includes/db.asp"-->
<!--#include file="includes/header.asp"-->
<%
Dim rsArtworks, sql
sql = "SELECT * FROM Artworks ORDER BY ID"
Set rsArtworks = conn.Execute(sql)
%>

<section class="hero">
  <div>
    <p class="eyebrow">Classic ASP Final Project</p>
    <h1>Smart Art Gallery</h1>
    <p>Sanat eserlerini listeleyen, yorum alan ve vizedeki taksit sorusuna benzer ödeme hesaplaması yapan sanal galeri sistemi.</p>
    <div class="hero-actions">
      <a class="btn primary" href="purchase.asp">Satın Alma Hesapla</a>
      <a class="btn secondary" href="admin-login.asp">Admin Paneli</a>
    </div>
  </div>
  <div class="hero-card">
    <span>Proje Kapsamı</span>
    <strong>HTML + CSS + ASP + Access</strong>
    <p>Veriler Access veritabanından çekilir, formlar ASP ile işlenir.</p>
  </div>
</section>

<section class="section-heading">
  <p class="eyebrow">Galeri</p>
  <h2>Sanat Eserleri</h2>
</section>

<section class="gallery-grid">
<%
Do While Not rsArtworks.EOF
%>
  <article class="art-card">
    <div class="art-image">
      <img src="<%=rsArtworks("ImageUrl")%>" alt="<%=rsArtworks("Title")%>">
    </div>
    <div class="art-body">
      <p class="eyebrow"><%=rsArtworks("Category")%></p>
      <h3><%=rsArtworks("Title")%></h3>
      <p><%=rsArtworks("Artist")%></p>
      <strong>$<%=FormatNumber(rsArtworks("Price"), 0)%></strong>
      <div class="card-actions">
        <a href="artwork-detail.asp?id=<%=rsArtworks("ID")%>">Detay</a>
        <a href="purchase.asp?artworkId=<%=rsArtworks("ID")%>">Satın Al</a>
      </div>
    </div>
  </article>
<%
  rsArtworks.MoveNext
Loop
rsArtworks.Close
Set rsArtworks = Nothing
%>
</section>

<!--#include file="includes/footer.asp"-->
