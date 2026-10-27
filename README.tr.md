# SQL Server Course Labs — Temelden İş Raporlamasına

**[English](README.md) | Türkçe**

**[Türkçe öğrenme yolu](LEARNING_PATH.tr.md) · [English learning roadmap](LEARNING_PATH.md)**

Bu depo, **SQL Server ve T-SQL ile sıfırdan ileri düzey iş raporlamasına** uzanan uygulamalı bir çalışma arşividir.

Öğrenme alanları:

- Veritabanı oluşturma ve şema tasarımı (DDL)
- Veri tipleri, anahtarlar ve kısıtlar
- Sorgulama, filtreleme ve JOIN işlemleri
- Stored procedure ile prosedürel SQL
- Küme operatörleri ve alt sorgular
- Cursor ve trigger kullanımı
- Window function, YTD toplamlar ve yönetici raporlaması

Bu depo gerçek üretim ortamı yerine **eğitim ve portfolyo amaçlı SQL örneklerini** içerir.

## Teknolojiler

- **Veritabanı:** Microsoft SQL Server
- **Sorgu dili:** T-SQL
- **Örnek veri kümeleri:** BikeStores (satış, stok, personel); UniversityDB (akademik birimler ve dersler)

## Çalışma hedefleri

1. İlişkisel veritabanı tablolarını ve kısıtlarını tasarlamak.
2. Okunabilir, doğrulanabilir SQL sorguları yazmak.
3. Basit sorgulardan raporlama odaklı sorgulara ilerlemek.
4. Sıralama, satış performansı, yılbaşından bugüne toplam ve müşteri segmentasyonu örnekleriyle iş ihtiyaçlarını çözmek.

## Modül haritası

| Modül | Konu | Kazanım |
| --- | --- | --- |
| [00 — Database Setup](00-Database-Setup/) | BikeStores ve UniversityDB | Şema ve örnek veri hazırlığı |
| [01 — Introduction DDL](01-Introduction-DDL/) | CREATE/DROP, ALTER, IDENTITY | Veritabanı nesnelerini oluşturmak |
| [02 — Data Types & Constraints](02-DataTypes-Constraints/) | PK, FK, CHECK, DEFAULT, computed columns | Veri bütünlüğünü sağlamak |
| [03 — Basic Queries](03-Basic-Queries-Filtering/) | SELECT, WHERE, ORDER BY, LIKE | Filtreleme ve sıralama |
| [04 — Joins](04-Joins-Relations/) | INNER/LEFT/RIGHT/FULL JOIN | İlişkisel veri birleştirmek |
| [05 — Stored Procedures](05-Stored-Procedures/) | Parametre, değişken, IF/ELSE | Tekrar kullanılabilir T-SQL |
| [06 — Advanced Sets](06-Advanced-Set-Operators/) | UNION, INTERSECT, EXCEPT, EXISTS | Küme ve alt sorgular |
| [07 — Cursors & Triggers](07-Cursors-and-Triggers/) | Cursor döngüsü ve trigger | Veritabanı içi otomasyon |
| [08 — Complex Reporting](08-Complex-Reporting/) | Window functions, sıralama, raporlar | Yönetici düzeyi SQL raporlaması |

## Önerilen ilerleme

İlk önce `00-Database-Setup/` altındaki veritabanı kurulum dosyalarını incele ve uygun sırayla çalıştır. Daha sonra `01`–`08` klasörlerini sırayla takip et.

Her SQL dosyasında önce hangi nesnelerin gerektiğini kontrol et; ardından sorguyu küçük bölümler hâlinde çalıştır ve çıktıyı anlamlandır.

**[Adım adım Türkçe öğrenme yolu](LEARNING_PATH.tr.md)**

### 08 — Raporlama vitrini

Bu modül üç aşamalıdır:

- **Seviye 1:** Toplamlar, mağaza ve marka performansı.
- **Seviye 2:** Window function kullanarak YTD toplamlar ve sıralama.
- **Seviye 3:** CTE tabanlı müşteri segmentasyonu ve yönetici raporu.

Kısa proje gösterimi yapacaksan, önce veritabanı kurulumunu tamamlayıp sonra `08-Complex-Reporting/` klasörünü inceleyebilirsin.

## Kurulum ve kullanım notları

Bu depo SQL betiklerinden oluşur. Microsoft SQL Server erişimi ve SSMS/Azure Data Studio benzeri bir T-SQL istemcisi gerekir. Örnekler belirli veritabanı nesnelerine bağlı olabileceğinden her betiği çalıştırmadan önce `USE`, bağımlılık, oluşturma/silme etkilerini kontrol et.

**Uyarı:** `DROP`, veri temizleme, trigger ve veri değiştiren SQL ifadelerini gerçek veritabanlarında doğrudan uygulama; önce yalıtılmış test veritabanı kullan.

## Sonraki geliştirme fikirleri

- Her SQL laboratuvarına problem ve çözüm özeti.
- Önemli raporlarda beklenen çıktı örnekleri.
- Gelişmiş sorgulara indeksleme ve `SET STATISTICS IO/TIME` analizi.
- Transaction, hata yakalama (`TRY...CATCH`) ve rollback alıştırmaları.

**Geliştirici:** Mert Aydın · SQL Server çalışma arşivi (2026).

[English README](README.md) · [Türkçe öğrenme yolu](LEARNING_PATH.tr.md)
