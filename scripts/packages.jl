using RDatasets, Queryverse, DataFrames, Dates;
flights = readtable(download("https://raw.githubusercontent.com/estadistika/assets/master/data/nycflights13.csv"));