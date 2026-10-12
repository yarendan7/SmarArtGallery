$dbPath = Join-Path $PSScriptRoot "database\smart_gallery.mdb"
New-Item -ItemType Directory -Force -Path (Split-Path $dbPath) | Out-Null

if (Test-Path $dbPath) {
  Remove-Item $dbPath -Force
}

$adox = New-Object -ComObject ADOX.Catalog
$adox.Create("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=$dbPath")

$conn = New-Object -ComObject ADODB.Connection
$conn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=$dbPath")

$conn.Execute("CREATE TABLE Artworks (ID COUNTER CONSTRAINT PrimaryKey PRIMARY KEY, Title TEXT(100), Artist TEXT(100), Category TEXT(80), Price DOUBLE, Description MEMO, ImageUrl TEXT(255))") | Out-Null
$conn.Execute("CREATE TABLE Comments (ID COUNTER CONSTRAINT PrimaryKey PRIMARY KEY, ArtworkID INTEGER, VisitorName TEXT(100), CommentText MEMO, CreatedAt DATETIME)") | Out-Null
$conn.Execute("CREATE TABLE Purchases (ID COUNTER CONSTRAINT PrimaryKey PRIMARY KEY, BuyerName TEXT(100), Phone TEXT(50), ArtworkID INTEGER, Price DOUBLE, InterestRate DOUBLE, MonthCount INTEGER, MonthlyPayment DOUBLE, TotalPayment DOUBLE, CreatedAt DATETIME)") | Out-Null

$conn.Execute("INSERT INTO Artworks (Title, Artist, Category, Price, Description, ImageUrl) VALUES ('Light Layers', 'Deniz Aral', 'Digital Art', 15000, 'A digital artwork inspired by light and movement.', 'assets/images/art1.jpg')") | Out-Null
$conn.Execute("INSERT INTO Artworks (Title, Artist, Category, Price, Description, ImageUrl) VALUES ('Silent Form', 'Ece Kaya', 'Sculpture', 40000, 'A modern sculpture focused on minimal form.', 'assets/images/art2.jpg')") | Out-Null
$conn.Execute("INSERT INTO Artworks (Title, Artist, Category, Price, Description, ImageUrl) VALUES ('Color Memory', 'Mert Demir', 'Painting', 17000, 'A colorful painting about memory and emotion.', 'assets/images/art3.jpg')") | Out-Null

$conn.Close()
Write-Host "Database created: $dbPath"
