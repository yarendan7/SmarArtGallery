Project Title:
Smart Art Gallery: Classic ASP ile Sanat Eseri Satis ve Sergi Yonetim Sistemi

Course:
AII005 Internet Programming

Project Purpose:
This project is a virtual art gallery system developed with HTML, CSS, Classic ASP and Microsoft Access database. Visitors can view artworks, write comments, and calculate installment payments for artwork purchases. Admin users can add new artworks and view system statistics.

Technologies Used:
- HTML
- CSS
- Classic ASP
- VBScript
- Microsoft Access Database (.mdb)
- ADO Database Connection
- IIS localhost server

Main Features:
- Artwork listing page
- Artwork detail page
- Visitor comment form
- Artwork purchase and installment calculation
- Admin login with Session
- Admin panel statistics
- Add new artwork form
- Access database records

Midterm Similar Calculation:
The purchase module uses a calculation similar to the midterm question.

Formula:
I = (P + (P * IR / 100)) / M

P: Price
IR: Interest Rate
M: Month

Payment Options:
- 6 months: 2 percent interest
- 12 months: 4 percent interest

Admin Login:
Username: admin
Password: 1234

Installation:
1. Enable IIS and ASP from Windows Features.
2. Copy SmartArtGallery folder into C:\inetpub\wwwroot.
3. Open browser and visit:
   http://localhost/SmartArtGallery/index.asp

Database:
Database file is located at:
database/smart_gallery.mdb

Tables:
- Artworks
- Comments
- Purchases
