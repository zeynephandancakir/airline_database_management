## ENG 

# Airline Reservation and Management System

This project is a relational airline database management system. It incorporates foreign key constraints, automated triggers, and a logical version-controlled migration architecture.

---

## Project Architecture (Directory Structure)

To demonstrate how the database is built step-by-step from scratch, the project uses a **Migration**-based structure:

``text
airline-project/
│
├── migrations/
│   ├── 001_initial_tables.sql    # Core tables created and initial data inserted         
│   ├── 002_flight_schedule_and_transactions.sql # Flight schedules and transactions updated, data updated/managed
│   └── 003_cancellations_and_trigger.sql  # Cancellation table and automated trigger established      
│
├── queries.sql                                
└── README.md

---

## Technologies Used

SQLite (Relational Database Management System)

SQL (DDL & DML): Schema definitions, constraints, and data manipulation

Database Triggers: Automated cascading deletion constraint (AFTER INSERT ON cancellations)

---

## Getting Started

To set up the database locally and execute the migration steps in order, follow these terminal commands:

Launch SQLite and create a new database file:

```bash
sqlite3 airport.db
```

Execute the migration files in chronological order:

```bash
.read migrations/001_initial_tables.sql
.read migrations/002_flight_schedule_and_transactions.sql
.read migrations/003_cancellations_and_trigger.sql
```

Verify the created tables:

```bash
.tables
```

---

## Sample Queries & Triggers

You can find pre-written analytical queries and examples testing the cancellation mechanism (trigger operations) inside the queries.sql file.

---

## TR

# Havayolu Rezervasyon ve Yönetim Sistemi

Bu proje, ilişkisel bir havayolu veritabanı yönetim sistemidir. Yabancı anahtar (foreign key) kısıtlamalarını, otomatik çalışan tetikleyicileri (trigger) ve mantıksal sürüm kontrollü bir migration (sürüm yönetimi) mimarisini kapsar.

---

## Proje Mimarisi (Klasör Yapısı)

Veritabanının sıfırdan adım adım nasıl kurulduğunu göstermek amacıyla proje **Migration** tabanlı bir yapıda kurgulanmıştır:

``text
airline-project/
│
├── migrations/
│   ├── 001_initial_tables.sql                 # Temel tabloların oluşturulduğu ve ilk verilerin eklendiği dosya
│   ├── 002_flight_schedule_and_transactions.sql # Uçuş programı ve işlem verilerinin güncellendiği ve yönetildiği dosya
│   └── 003_cancellations_and_trigger.sql        # İptal tablosunun ve otomasyon sağlayan tetikleyicinin kurulduğu dosya
│
├── queries.sql                                
└── README.md

---

## Kullanılan Teknolojiler

SQLite (İlişkisel Veritabanı Yönetim Sistemi)

SQL (DDL & DML): Şema tanımları, kısıtlamalar ve veri manipülasyonu

Veritabanı Tetikleyicileri (Triggers): Otomatik silme kısıtlaması (AFTER INSERT ON cancellations)

---

## Başlangıç 

Veritabanını yerel bilgisayarınızda kurmak ve migration adımlarını sırasıyla çalıştırmak için terminalde şu komutları takip edin:

SQLite'ı başlatın ve yeni bir veritabanı dosyası oluşturun:
```bash
sqlite3 airport.db
```

Migration dosyalarını kronolojik sırayla çalıştırın:
```bash
.read migrations/001_initial_tables.sql
.read migrations/002_flight_schedule_and_transactions.sql
.read migrations/003_cancellations_and_trigger.sql
```

Oluşturulan tabloları doğrulayın:
```bash
.tables
```
---

## Örnek Sorgular & Tetikleyiciler

Önceden hazırlanmış analitik sorguları ve iptal mekanizmasını (tetikleyici işlemlerini) test eden örnekleri queries.sql dosyası içinde bulabilirsiniz.

