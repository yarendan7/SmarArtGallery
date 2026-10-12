<!--#include file="includes/db.asp"-->
<!--#include file="includes/header.asp"-->
<%
Dim artworkId, rsArtwork, rsComments, sqlArtwork, sqlComments
artworkId = CLng(Request.QueryString("id"))
sqlArtwork = "SELECT * FROM Artworks WHERE ID=" & artworkId
Set rsArtwork = conn.Execute(sqlArtwork)

If rsArtwork.EOF Then
%>
  <section class="message-box">
    <h2>Eser bulunamadı</h2>
    <a class="btn primary" href="index.asp">Ana sayfaya dön</a>
  </section>
<%
Else
%>
  <section class="detail-layout">
    <div class="detail-art">
      <img src="<%=rsArtwork("ImageUrl")%>" alt="<%=rsArtwork("Title")%>">
    </div>
    <div class="detail-content">
      <p class="eyebrow"><%=rsArtwork("Category")%></p>
      <h1><%=rsArtwork("Title")%></h1>
      <p class="artist"><%=rsArtwork("Artist")%></p>
      <p><%=rsArtwork("Description")%></p>
      <strong class="price">$<%=FormatNumber(rsArtwork("Price"), 0)%></strong>
      <a class="btn primary" href="purchase.asp?artworkId=<%=rsArtwork("ID")%>">Satın Alma Hesapla</a>
    </div>
  </section>

  <section class="two-column">
    <div>
      <h2>Ziyaretçi Yorumları</h2>
      <%
      sqlComments = "SELECT * FROM Comments WHERE ArtworkID=" & artworkId & " ORDER BY ID DESC"
      Set rsComments = conn.Execute(sqlComments)
      If rsComments.EOF Then
      %>
        <p class="muted">Bu eser için henüz yorum yapılmadı.</p>
      <%
      End If
      Do While Not rsComments.EOF
      %>
        <article class="comment">
          <strong><%=rsComments("VisitorName")%></strong>
          <p><%=rsComments("CommentText")%></p>
          <small><%=rsComments("CreatedAt")%></small>
        </article>
      <%
        rsComments.MoveNext
      Loop
      rsComments.Close
      Set rsComments = Nothing
      %>
    </div>

    <form class="form-card" method="post" action="add-comment.asp">
      <h2>Yorum Ekle</h2>
      <input type="hidden" name="artworkId" value="<%=rsArtwork("ID")%>">
      <label>Adınız
        <input type="text" name="visitorName" required>
      </label>
      <label>Yorumunuz
        <textarea name="commentText" rows="5" required></textarea>
      </label>
      <button class="btn primary" type="submit">Yorumu Kaydet</button>
    </form>
  </section>
<%
End If
rsArtwork.Close
Set rsArtwork = Nothing
%>

<!--#include file="includes/footer.asp"-->
