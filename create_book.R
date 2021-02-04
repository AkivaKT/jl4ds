julia = "C:/Users/keith/AppData/Local/Programs/Julia 1.5.3/bin"

JuliaCall::julia_setup(JULIA_HOME = julia)
bookdown::render_book("index.Rmd", "bookdown::gitbook")
