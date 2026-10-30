# Veri ihlali müdahale planı — OFISCHI

Kişisel veri sızıntısı ya da yetkisiz erişim fark edildiğinde bu adımlar sırayla uygulanır.
Kurula bildirim süresi: fark edilme anından itibaren **72 saat**.

## Roller

| Rol | Kişi | Görev |
|---|---|---|
| Sorumlu | Ammar | Karar verir, KVKK bildirimini yapar |
| Teknik müdahale | Ammar (yedek: ____) | Erişimi keser, kanıtı korur |
| Müşteri iletişimi | ____ | Etkilenen kişilere haber verir |

## Sistemler

| Sistem | Ne tutuyor | Nereden yönetilir |
|---|---|---|
| Supabase projesi `irudfkepeocdcmocyvpi` (İrlanda, eu-west-1) | `site_data` (katalog içeriği), `admin_config`, `super_admins`, yönetici hesapları (Auth) | supabase.com → Ofischi projesi |
| Supabase Storage `catalog-images` | Ürün, logo ve arka plan görselleri (herkese açık okunur) | Storage → catalog-images |
| GitHub `axrsrs/Ofischi` | Site kodu (`index.html`) | github.com |

Sitede ziyaretçi formu yoktur; kişisel veri sadece yönetici hesaplarında (e-posta, şifre özeti) bulunur.

## Zaman çizelgesi (T = fark edilme anı)

| Süre | Adım |
|---|---|
| T + 1 saat | **Erişimi kes.** Şüpheli yönetici hesabını Authentication → Users'tan sil ya da şifresini değiştir; `super_admins` tablosundan çıkar. Anahtar sızdıysa Settings → API Keys'ten publishable anahtarı döndür ve `index.html` içindeki `SUPABASE_ANON_KEY` değerini güncelle. |
| T + 4 saat | **Kanıtı al.** Supabase → Logs (API, Auth, Postgres, Storage) kayıtlarını dışa aktar. Free planda kayıtlar yaklaşık 1 gün tutulur; bu adım ilk iş yapılır. GitHub commit geçmişini ve ekran görüntülerini sakla. |
| T + 24 saat | **Kapsamı yaz.** Hangi tablo veya dosya, kaç kayıt, hangi kişiler (yönetici, müşteri), hangi tarih aralığı. |
| T + 48 saat | **Bildirimi hazırla.** Kurul bildirim formunu doldur, etkilenen kişilerin listesini çıkar. |
| T + 72 saat | **Bildir.** Kişisel Verileri Koruma Kurumu'na bildirimi gönder; etkilenen kişilere bilgi ver. |
| Sonra | Kök nedeni düzelt, aşağıdaki olay kaydına işle, bu planı güncelle. |

## Olay kaydı

| Tarih | Ne oldu | Etkilenen | Bildirim tarihi | Yapılan düzeltme |
|---|---|---|---|---|
| | | | | |
