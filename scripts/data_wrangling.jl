
# add rdatasets, Queryverse
#pkg.add(example)
using RDatasets, Queryverse
# constructing a dataframe in Julia
dat = DataFrame(A = 1:4, B = ["A", "B", "C", "D"])

# calling a dataset iris
iris = dataset("datasets", "iris")
typeof(iris) # DataFrame
dtiris = DataTable(iris)
typeof(dtiris) # converted to a DataTable

#
Base.remove_linenums!(@macroexpand @elapsed peakflops())

+(1,2)