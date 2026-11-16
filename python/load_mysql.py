from pathlib import Path
import os, pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine
ROOT=Path(__file__).resolve().parents[1]; load_dotenv(ROOT/'.env')
url=f"mysql+pymysql://{os.getenv('DB_USER','root')}:{os.getenv('DB_PASSWORD','')}@{os.getenv('DB_HOST','localhost')}:{os.getenv('DB_PORT','3306')}/{os.getenv('DB_NAME','gestion_financiere')}?charset=utf8mb4"
engine=create_engine(url)
for table in ['departments','activities','revenues','expenses','budgets']:
    df=pd.read_csv(ROOT/'data'/'processed'/f'{table}.csv')
    df.to_sql(table,engine,if_exists='replace',index=False)
    print(table, len(df), 'lignes importées')
