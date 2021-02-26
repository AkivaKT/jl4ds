
# add rdatasets, Queryverse
#pkg.add(example)
using RDatasets, Queryverse, DataFrames
# constructing a dataframe in Julia
dat = DataFrame(A = 1:4, B = ["A", "B", "C", "D"])
sizeof(table((A = 1:4, B = ["A", "B", "C", "D"])))

sizeof(dat)
# calling a dataset iris
iris = dataset("datasets", "iris")
iris = readtable(iris)

dataset("datasets", "iris")

DataTable(
  x = 1:5, 
  y = repeat([1], 5),
  z = collect(1:5) .^2 .+ 1,
  α = vcat(1:5) .^2 .+ 1
)


#
Base.remove_linenums!(@macroexpand @elapsed peakflops())

+(1,2)

x = 1:10;
y = vcat(fill('a', 4), fill('b', 6));
z = randn(10);

jdat = DataFrame(
  list_of_string = ["Apple", "Banana", "Orange", "Pineapple", "Dragonfruit"],
  number_range   = 1:5, 
  repeated_no    = fill(1, 5),
  collect_range  = collect(1:5) .^2 .+ 1,
  cat_range      = vcat(1:5) .^2 .+ 1,
)

col_names = [:list_of_string, :number_range, :α, :β, :ϵ]
# putting : in front of a variable/function makes it an symbol, which suppresses the evaluation of the call.
DataFrame(
    [["Apple", "Banana", "Orange", "Pineapple", "Dragonfruit"],
    vcat(1:5), 
    fill(1, 5),
    collect(1:5) .^2 .+ 1,
    vcat(1:5) .^2 .+ 1], 
    col_names)

jdat = DataFrame((
  list_of_string = ["Apple", "Banana", "Orange", "Pineapple", "Dragonfruit"],
  number_range   = 1:5, 
  repeated_no    = fill(1, 5),
  collect_range  = collect(1:5) .^2 .+ 1,
  cat_range      = vcat(1:5) .^2 .+ 1,
))

jdat = DataFrame(
  "list_of_string" => ["Apple", "Banana", "Orange", "Pineapple", "Dragonfruit"],
  "number_range"  => 1:5, 
  "repeated_no"    => fill(1, 5),
  "collect_range"  => collect(1:5) .^2 .+ 1,
  "cat_range"      => vcat(1:5) .^2 .+ 1,
)

DataFrame(:a => 1:2, :b => 0)

table((x = 1:10, y = randn(10)))
  
table([(1,2), (3,4)])

DataFrame([vcat(1:2), [0, 0]], [:a, :b])
  

x = randn(10000);
y = randn(10000);
z = randn(10000);
a = randn(10000);
b = randn(10000);

sizeof(table((x,y,z,a,b)))

sizeof(DataFrame((x,y,z,a,b)))

n = 10000000
ones = fill(0, n)
zeros = fill(1, n)
sizeof(table(zeros, zeros, zeros, zeros, ones,zeros, zeros,zeros,zeros))
sizeof(ndsparse((ones),(zeros, zeros, zeros, zeros, ones,zeros, zeros,zeros,zeros)))


x = 1:10
y = 1:10
z = 1:10
# dot-broadcasting a dot prefix that allows functions to be vectorized
√5
.√[2,3]
@. √(x^2 + y^2 + z^2)
@. √+(x^2, y^2, z^2)
.√.+(x.^2, y.^2, z.^2)


@. distance = √+(x^2, y^2, z^2)
dat = ndsparse((x=x, y=y, z=z), (distance = distance,))

dat[2,2,2]

size(jdat)
print(names(flights))
print(describe(flights))

typeof(readtable("data-raw/flights/flights.csv"))
typeof(CSV.read("data-raw/flights/flights.csv"))
flights[.&(flights[:month] .== 1, flights[:day] .== 1), :]



tuple_of_columns = (list_of_string = ["Apple", "Banana", "Orange", "Pineapple", "Dragonfruit"],
                    number_range   = 1:5, 
                    repeated_no    = fill(1, 5),
                    collect_range  = collect(1:5) .^2 .+ 1,
                    cat_range      = vcat(1:5) .^2 .+ 1)

DataFrame(tuple_of_columns)

(list_of_string = ["Apple", "Banana", "Orange", "Pineapple", "Dragonfruit"],
                    number_range   = 1:5, 
                    repeated_no    = fill(1, 5),
                    collect_range  = collect(1:5) .^2 .+ 1,
                    cat_range      = vcat(1:5) .^2 .+ 1)

using DataFrames
flights = readtable(download("https://raw.githubusercontent.com/estadistika/assets/master/data/nycflights13.csv"))
describe(flights)
print()

DataFrames.describe(flights)

map(String, names(flights))


jdat = DataFrame(
  list_of_string = ["Apple", "Banana", "Orange", "Pineapple", "Dragonfruit"],
  number_range   = 1:5, 
  repeated_no    = fill(1, 5),
  vector_no      = 5,
  collect_range  = collect(1:5) .^2 .+ 1,
  cat_range      = vcat(1:5) .^2 .+ 1,
)

df = DataFrame(a = rand(3))


include("scripts/packages.jl");
flights = readtable(download("https://raw.githubusercontent.com/estadistika/assets/master/data/nycflights13.csv"));
@time flights[:,:];
@time flights[!,:];
@time copy = flights[:,:year];
@time view = flights[!,:year];

col_list = [:year, :month,:day]


load(download("https://raw.githubusercontent.com/estadistika/assets/master/data/nycflights13.csv"))
path = download("https://raw.githubusercontent.com/estadistika/assets/master/data/nycflights13.csv")
load("C:\\Users\\keith\\AppData\\Local\\Temp\\jl_GCG6sH9YPz")

load(File(format"CSV", path))

include("scripts/packages.jl")
@time load("data-raw/flights/flights.csv") |> DataFrame;

using CSV 

@time CSV.File("data-raw/flights/flights.csv");


@time dat = DataFrame(load("C:/Users/keith/Desktop/feature_matrix_cleaned.csv"));
@time dat = CSV.File("C:/Users/keith/Desktop/feature_matrix_cleaned.csv");

DataFrame(dat)

x = ["true", "false", "NA"]
parse(Int, x)

parse.(Bool, x)

y = tryparse.(Bool, x)

replace(tryparse.(Bool, x), nothing => missing)
using Dates
tryparse.(Dates.Date, ["2020-01-02", "2020-03-26", "not a date"])

data = tsv"""a    b   c  
1     2     3 
4     5     6"""


