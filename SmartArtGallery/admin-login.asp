<!--#include file="includes/header.asp"-->

<section class="section-heading">
  <p class="eyebrow">Admin</p>
  <h1>Yönetici Girişi</h1>
</section>

<%
Dim errorMessage
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
  If Request.Form("username") = "admin" And Request.Form("password") = "1234" Then
    Session("admin") = True
    Response.Redirect "admin-panel.asp"
  Else
    errorMessage = "Kullanıcı adı veya şifre hatalı."
  End If
End If
%>

<form class="form-card wide" method="post" action="admin-login.asp">
  <% If errorMessage <> "" Then %>
    <p class="error"><%=errorMessage%></p>
  <% End If %>
  <label>Kullanıcı Adı
    <input type="text" name="username" required>
  </label>
  <label>Şifre
    <input type="password" name="password" required>
  </label>
  <button class="btn primary" type="submit">Giriş Yap</button>
  <p class="muted">Demo giriş: admin / 1234</p>
</form>

<!--#include file="includes/footer.asp"-->
