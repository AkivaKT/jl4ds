### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ fe4d2b00-72fb-11eb-05e1-476762055bbd
using Gadfly, Queryverse, CSV;

# ╔═╡ 4e15c800-7788-11eb-1bc2-31f2150b3a9b
begin
	@bind t html"<input type='range'>"
end

# ╔═╡ 99177100-7788-11eb-2d4a-cfc945fca333
t

# ╔═╡ b64640be-76f3-11eb-33df-8318781bbe11
begin
	t
	mgp = load(".\\data-raw\\mpg\\mpg.csv") |> 
	      DataFrame |>
	      @filter(_.hwy < t) |> DataFrame;
end;

# ╔═╡ 239c5d80-76f4-11eb-1741-7dfa9ebc9613
plot(mgp, x = :displ, y = :hwy, Geom.point)

# ╔═╡ 692b8650-76f4-11eb-1f4d-fb7c026e07ad
plot(mgp, x = :displ, y = :hwy, color = :class, Geom.point)

# ╔═╡ c12526a0-76f3-11eb-26eb-c9ba307a7b9d
plot(mgp, x = :displ, y = :hwy, size = :class, Geom.point)

# ╔═╡ 008f64a0-76f3-11eb-0998-55b58493c71d
plot(mgp, x = :displ, y = :hwy, shape = :class, Geom.point,
	Theme(discrete_highlight_color=identity, alphas=[0.1], point_size=3pt))

# ╔═╡ fce7e070-76f2-11eb-39bb-15f0c8d4c27e
begin
	df = DataFrame(name=["John", "Sally", "Kirk"], age=[23., 42., 59.], children=[3,5,2])
	
	x = df |>
  		@filter(_.age>50) |>
  		@map({_.name, _.children}) |>
  		DataFrame
end

# ╔═╡ f7c99ac0-76f2-11eb-3a3b-b34e56a60630
flights = load("./data-raw/flights/flights.csv") |> DataFrame

# ╔═╡ 62d511f0-76f8-11eb-0533-f92525e9f813
CSV.read(download("https://github.com/byuidatascience/data4python4ds/raw/master/data-raw/flights/flights.csv"), DataFrame)

# ╔═╡ ef422ab0-76f8-11eb-1214-95100f32d8cc
describe(flights)[[:variable, :eltype]] |> showall

# ╔═╡ a0ee9030-76fb-11eb-1018-9baaef9c229e
(names(flights) => eltype.(eachcol(flights)))

# ╔═╡ d54299c0-76fc-11eb-0b23-ad682e7ba602
names(flights)

# ╔═╡ d1a5eb00-76fc-11eb-07eb-b5f715b670af


# ╔═╡ Cell order:
# ╠═fe4d2b00-72fb-11eb-05e1-476762055bbd
# ╠═99177100-7788-11eb-2d4a-cfc945fca333
# ╠═b64640be-76f3-11eb-33df-8318781bbe11
# ╠═239c5d80-76f4-11eb-1741-7dfa9ebc9613
# ╠═4e15c800-7788-11eb-1bc2-31f2150b3a9b
# ╠═692b8650-76f4-11eb-1f4d-fb7c026e07ad
# ╠═c12526a0-76f3-11eb-26eb-c9ba307a7b9d
# ╠═008f64a0-76f3-11eb-0998-55b58493c71d
# ╠═fce7e070-76f2-11eb-39bb-15f0c8d4c27e
# ╠═f7c99ac0-76f2-11eb-3a3b-b34e56a60630
# ╠═62d511f0-76f8-11eb-0533-f92525e9f813
# ╠═ef422ab0-76f8-11eb-1214-95100f32d8cc
# ╠═a0ee9030-76fb-11eb-1018-9baaef9c229e
# ╠═d54299c0-76fc-11eb-0b23-ad682e7ba602
# ╠═d1a5eb00-76fc-11eb-07eb-b5f715b670af
