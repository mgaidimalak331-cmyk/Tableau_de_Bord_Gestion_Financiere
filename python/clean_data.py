from pathlib import Path
import pandas as pd
ROOT=Path(__file__).resolve().parents[1]
RAW=ROOT/'data'/'raw'; OUT=ROOT/'data'/'processed'
OUT.mkdir(parents=True,exist_ok=True)
for fn,date_col,amount_col in [('revenues.csv','revenue_date','amount_tnd'),('expenses.csv','expense_date','amount_tnd'),('budgets.csv','budget_month','budget_amount_tnd')]:
    df=pd.read_csv(RAW/fn)
    df[date_col]=pd.to_datetime(df[date_col],errors='coerce')
    df[amount_col]=pd.to_numeric(df[amount_col],errors='coerce')
    df=df.dropna(subset=[date_col,amount_col]).drop_duplicates()
    if amount_col!='budget_amount_tnd': df=df[df[amount_col]>=0]
    df.to_csv(OUT/fn,index=False,date_format='%Y-%m-%d')
    print(f'{fn}: {len(df)} lignes préparées')
for fn in ['departments.csv','activities.csv']:
    pd.read_csv(RAW/fn).drop_duplicates().to_csv(OUT/fn,index=False)
