-- Ofischi · 30.10.2026
-- 1) Görsel deposu: en fazla 5 MB, sadece JPEG / PNG / WebP (panel görselleri zaten 700–1200 px'e küçültüp yüklüyor)
update storage.buckets
   set file_size_limit = 5242880,
       allowed_mime_types = array['image/jpeg','image/png','image/webp']
 where id = 'catalog-images';

-- 2) Eski PIN sistemi kaldırıldı (giriş artık e-posta + şifre): kullanılmayan fonksiyonlar ve tablo
drop function if exists public.admin_get_pin();
drop function if exists public.admin_set_pin(text);
drop table if exists public.admin_config;
