#%%
import time
import pandas as pd

# %%
tic = time.perf_counter()
pd.read_csv("..\\data-raw\\flights\\flights.csv");
toc = time.perf_counter() - tic
print(toc)