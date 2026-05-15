# TaiPingHouKui-
项目
# $\color{#00FF00}{\text{🚀 Crypto Dashboard: Python + Postgres + Power BI}}$

![Typing SVG](https://herokuapp.com)

## $\color{#00D1FF}{\text{🛠 Технологии}}$
* ![Python](https://shields.io) — **$\color{#00FF00}{\text{Сбор данных через CoinGecko API}}$**
* ![Postgres](https://shields.io) — **$\color{#00FF00}{\text{Хранение истории курсов}}$**
* ![Power Bi](https://shields.io) — **$\color{#00FF00}{\text{Интерактивный дашборд}}$**

---

## $\color{#00D1FF}{\text{📈 Меры DAX}}$
$\color{#00FF00}{\text{Для расчета показателей используются следующие формулы:}}$

**$\color{#00D1FF}{\text{Актуальный курс BTC:}}$**
```dax
Latest BTC = 
CALCULATE(
    SELECTEDVALUE('public api_currency_rates'[rate_to_usd]),
    'public api_currency_rates'[updated_at] = MAX('public api_currency_rates'[updated_at]),
    'public api_currency_rates'[currency_code] = "BTC"
)
```

**$\color{#00D1FF}{\text{Изменение цены (%%):}}$**
> $\color{#00FF00}{\text{Используется для динамики курса относительно предыдущего замера.}}$

---

## $\color{#00D1FF}{\text{🚀 Как запустить}}$
1. $\color{#00FF00}{\text{Настройте базу данных Postgres.}}$
2. $\color{#00FF00}{\text{Создайте файл .env с вашими доступами (см. пример ниже).}}$
3. $\color{#00FF00}{\text{Запустите main.py.}}$

```bash
python etl.py
```

---
$\color{#00D1FF}{\text{Статус системы: ONLINE}}$ 🟢
