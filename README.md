# SmartUpTask - User Management API

Laravel 11 tabanlı, modern mimari prensipleriyle geliştirilmiş RESTful API projesi.

## İçindekiler

- [Özellikler](#özellikler)
- [Mimari](#mimari)
- [API Endpoint'leri](#api-endpointleri)
- [Test Verileri](#test-verileri)

---

## Özellikler

- Kullanıcı CRUD işlemleri (Create, Read, Update, Delete)
- Soft Delete & Restore özelliği
- Gelişmiş filtreleme ve pagination
- Email & Phone uniqueness kontrolü
- Service-Repository pattern
- Request validation
- API Response trait
- Faker ile fake data generation
- Database indexleme
- Error handling

---

## Mimari

### Katman İletişimi

```
Request
   ↓
Controller (UserController)
   ↓
Service (UserService) ← Business Logic
   ↓
Repository (UserRepository) ← Data Access
   ↓
Model (User, Company) ← Eloquent ORM
   ↓
Database (MySQL)
```

---

## API Endpoint'leri

Base URL: `http://localhost:8000/api/v1`

### Kullanıcı İşlemleri

| Method | Endpoint | Açıklama |
|--------|----------|----------|
| GET | `/users` | Tüm kullanıcıları listele |
| POST | `/users` | Yeni kullanıcı oluştur |
| GET | `/users/{id}` | Kullanıcı detayı |
| PUT | `/users/{id}` | Kullanıcı güncelle |
| DELETE | `/users/{id}` | Kullanıcı sil (soft delete) |
| POST | `/users/{id}/restore` | Silinmiş kullanıcıyı geri yükle |

---

## Test Verileri

### Factory ile Veri Oluşturma

```bash
# Tüm verileri sıfırla ve yeniden oluştur
php artisan migrate:fresh --seed

# Sadece seed (mevcut verilere ekler)
php artisan db:seed
```

### Varsayılan Test Verileri

`php artisan migrate:fresh --seed` komutu:
- **10 firma** oluşturur
- **50+ kullanıcı** oluşturur
- Her firmadan 3-7 arası kullanıcı
- Tüm email ve telefon numaraları unique

---

## Filtreleme Parametreleri

| Parametre | Açıklama | Örnek |
|-----------|----------|-------|
| per_page | Sayfa başına kayıt | `?per_page=20` |
| company_id | Firma ID'sine göre | `?company_id=1` |
| company_name | Firma adına göre (LIKE) | `?company_name=ABC` |
| email | Email'e göre (LIKE) | `?email=ahmet` |
| phone | Telefona göre (LIKE) | `?phone=0555` |
| first_name | Ada göre (LIKE) | `?first_name=Mehmet` |
| last_name | Soyada göre (LIKE) | `?last_name=Yılmaz` |

**Birden fazla filtre:**
```
GET /api/v1/users?company_name=ABC&email=ahmet&per_page=10
```

---

## Güvenlik Notları

- SQL Injection: Eloquent ORM ile korunuyor
- Mass Assignment: `$fillable` ile kontrol ediliyor
- Validation: Form Request ile tüm girdiler doğrulanıyor
- Error Handling: Try-catch blokları ile hata yönetimi
- Soft Delete: Veriler kalıcı silinmiyor

---

## Proje Hakkında

**Versiyon:** 1.0.0
**Framework:** Laravel 11.x
**PHP:** 8.2+
**Database:** MySQL 8.0+

**Özellikler:**
- Service-Repository Pattern
- API Response Trait
- Factory & Seeder
- Form Request Validation
- Soft Delete & Restore
- Pagination & Filtering
- Database Indexing
- Error Handling

---

**Laravel 11 ile geliştirilmiştir**
