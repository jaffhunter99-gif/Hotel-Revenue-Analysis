# Hotel Revenue Analysis

SQL və Tableau istifadə edərək 8 hotel brendinin gəlir performansının analizi.

## Məqsəd

Bu layihə aşağıdakı sualı cavablandırır: **Hansı hotel brendi ən çox gəlir gətirir və niyə?**

## Verilənlər bazası

Oracle SQL-də şəxsi diplom layihəsi çərçivəsində qurulmuş 8 hotel brendini əhatə edən verilənlər bazası istifadə olunub:

- Kempinski, Hilton, Marriott, Sheraton, Hyatt, InterContinental, Holiday Inn Express, Best Western
- 12 cədvəl: Hotel, Customer, Booking, Reservation, Room, Address, Invoice, Line_n, Services, Transactions, Satisfaction, Season
- Hər hotel üçün ~500 sətir, ümumilikdə ~36,000 sətir

## İstifadə olunan alətlər

- **Oracle SQL** – data modelləşdirmə və analitik sorğular
- **Tableau** – dashboard və vizuallaşdırma

## Metodologiya

1. SQL ilə otaq qiyməti (`ROOM_PRICE`) və qalma müddətini (`NO_OF_DAYS`) birləşdirərək hər brendin ümumi gəliri hesablanıb
2. Gəlir fərqinin səbəbini tapmaq üçün orta otaq qiyməti və orta qalma müddəti ayrıca müqayisə olunub
3. Mövsümi (Spring/Summer/Autumn/Winter) qiymət dəyişimi araşdırılıb
4. Nəticələr Tableau-da 4 qrafikli dashboard-da vizuallaşdırılıb

SQL sorğularının hamısı [`hotel_revenue_analysis.sql`](./hotel_revenue_analysis.sql) faylındadır.

## Dashboard

Dashboard-u interaktiv görmək üçün [`dashboard.twbx`](./dashboard.twbx) faylını endirib Tableau Desktop-da açın (Tableau Public pulsuz mövcuddur).

Dashboard 4 hissədən ibarətdir:
- **Total Revenue by Hotel** – brend üzrə ümumi gəlir
- **Avg Room Price by Hotel** – brend üzrə orta otaq qiyməti
- **Room Price vs Nights Stayed** – qiymət və qalma müddəti arasında əlaqə
- **Seasonal Price Trend by Hotel** – mövsüm üzrə qiymət dəyişimi

## Əsas nəticə

**Hyatt** ən yüksək gəliri (219,215) əldə edir, çünki:
- Ən yüksək orta otaq qiyməti (141.48) — 5★ otellər arasında belə ən bahalısı
- Ən uzun orta qalma müddəti (3.12 gecə)

Ümumilikdə, **ulduz reytinqi ilə gəlir arasında güclü müsbət əlaqə** müşahidə olunur: 5★ otellər (Hyatt, Kempinski, Hilton) gəlir siralamasında ilk 3 yeri tutur, 3★ otellər (Holiday Inn Express, Best Western) isə sonuncu yerlərdədir.

Maraqlı məqam: booking sayı brendlər arasında demək olar bərabərdir (~500 hər birində), yəni gəlir fərqi **müştəri sayından deyil, hər müştərinin orta xərcindən** qaynaqlanır.

| `hotel_revenue_analysis.sql` | Bütün analitik SQL sorğuları |
| `dashboard.twbx` | İnteraktiv Tableau dashboard faylı |
