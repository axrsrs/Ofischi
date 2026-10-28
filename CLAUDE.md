# OFISCHI

Bağımsız proje. NearDiji / Restoran-men-, ASODA, NEAR, PRONTO ile dosya, repo, anahtar veya kural paylaşmaz. Başka projeden bir şey kopyalama.

## Dil ve çıktı
- Kullanıcı arayüzü metinleri Türkçe, doğal ve doğru olmalı. Yönetici panelinde İngilizce metin olmaz.
- Üretim kalitesinde çalış: demo, yer tutucu, "sonra eklenir" yok. Kapsamdaki her sayfa tam çalışır.
- Mobilde yatay kaydırma, taşma, üst üste binen buton olmaz. Mobilde kart ve büyük dokunma alanı, küçültülmüş tablo değil.
- Tasarım: premium, sade, altın/siyah vurgu, glassmorphism serbest. Logo (`ofischi_logo_transparent.png`) olduğu gibi kullanılır.

## Yapı
- Tek dosya: `index.html` (~8200 satır). Tailwind CDN + React 18 + Babel standalone + supabase-js 2, tarayıcıda derlenir. Derleme adımı yok.
- Ana bileşen `App()`. Yardımcı bileşenler: `Icon`, `AdminLabel`, `ColorInput`.
- Sabit diziler: `STORES`, `CATS`, `THEMES`, `CURRENCIES`.
- Veri akışı: `normalizeData` → `normalizeStore` → `normalizeCategories` → `normalizeItem` → `normalizePrice`. Yeni alan eklenirse önce buraya eklenir.
- Fiyat: parçalı fiyat (`addPricePart` / `updatePricePart` / `deletePricePart`), para birimi dönüşümü `getCurrency` / `convertPrice` / `formatAmount`. Kilitli: TRY, USD ve diğer `CURRENCIES` kimlikleri değiştirilmez.
- Görsel: `resizeImg` → `uploadBlobToStorage` (kova `catalog-images`).
- Bağlantı haritası: `graphify/graph.html` ve `graphify/graph.json`.

## Supabase
- Bu projenin kendi Supabase projesi vardır (`index.html` içindeki `SUPABASE_URL`). NearDiji'nin Supabase projesiyle karıştırılmaz.
- Tek tablo: `site_data` (`SITE_ID=1`). Realtime kanalı ile canlı güncellenir; kanal `removeChannel` ile temizlenir.
- Anahtar yalnızca anon/publishable olabilir. `service_role` veya gizli anahtar dosyaya yazılmaz.

## Bilinen riskler
- Yönetici kilidi tarayıcıda çalışır; varsayılan PIN `1234` (`defaultData`). Gerçek yetki sınırı RLS politikalarıdır, PIN değil. Canlıya çıkan her müşteri için PIN değiştirilmeli ve `site_data` yazma yetkisi RLS ile kısıtlanmalı.
- `graphify/` klasörü site ile aynı yerden yayınlanıyorsa herkese açık olur. Yayın biçimi netleşince dışlanmalı.

## Çalışma kuralları
- Kullanıcının verdiği karar (fiyat mantığı, para birimi, alan adı, durum adı) kilitlidir; gerçek bir sorun varsa önce kısaca söyle, sonra kararı uygula.
- Çeviri gerekiyorsa yalnızca düzenlenen alanlar çevrilir, tüm site değil.
- Girdi doğrulama, parametreli sorgu ve gizli anahtar yazmama varsayılandır.
- Geliştirme dalı: `claude/graphify-gce9g5`. PR istenmedikçe açılmaz.
