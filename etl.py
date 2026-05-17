import os
import requests
import pandas as pd
import time

from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

# Параметры БД
DB_URL = os.getenv("DB_URL")
API_KEY = os.getenv("COINGECKO_API_KEY")

COINS = ['bitcoin', 'ethereum', 'solana']


def run_etl():
    engine = create_engine(DB_URL)
    all_data = []

    for coin in COINS:
        print(f"-> Стучимся в API за {coin}...")

        # Правильный CoinGecko endpoint
        base_url = "https://api.coingecko.com/api/v3/coins"
        full_url = f"{base_url}/{coin}/market_chart"

        params = {
            'vs_currency': 'usd',
            'days': '30',
            'interval': 'daily',
            'x_cg_demo_api_key': API_KEY
        }

        try:
            r = requests.get(full_url, params=params, timeout=15)
            r.raise_for_status()

            data = r.json()

            # Обработка
            df = pd.DataFrame(data['prices'], columns=['ts', 'price_usd'])
            df['coin_name'] = coin.capitalize()
            df['timestamp'] = pd.to_datetime(df['ts'], unit='ms')

            all_data.append(df[['coin_name', 'price_usd', 'timestamp']])

            print(f"✅ {coin} получен!")

        except Exception as e:
            print(f"❌ Ошибка в {coin}: {e}")

        time.sleep(10)

    if all_data:
        final_df = pd.concat(all_data)

        final_df.to_sql(
            'crypto_marketing_data',
            engine,
            if_exists='replace',
            index=False
        )

        print("\n" + "=" * 30)
        print("🔥 ПОБЕДА! ДАННЫЕ В POSTGRES!")
        print("=" * 30)


if __name__ == "__main__":
    run_etl()
