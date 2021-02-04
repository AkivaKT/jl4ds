# This package stores the data objects used in the R for data science book.


pacman::p_load(tidyverse, glue, fs)
pacman::p_load_gh("byuidss/DataPushR")

package_name_text <- "data4python4ds"
base_folder <- "../../byuidatascience/"
user <- "byuidatascience"
package_path <- str_c(base_folder, package_name_text)

github_info <- dpr_info_github(user, package_name_text)
usethis::proj_set(package_path)

####  Run to create repo locally and on GitHub.  ######
 
# github_info <- dpr_create_github(user, package_name_text)
#  
# package_path <- dpr_create_package(list_data = NULL,
#                                      package_name = package_name_text,
#                                      export_folder = base_folder,
#                                      git_remote = github_info$clone_url)

##### dpr_delete_github(user, package_name_text) ####
####### End create section


#### mpg data

mpg <- ggplot2::mpg

dpr_export(mpg, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_document(mpg, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "mpg", title = "Fuel economy data from 1999 to 2008 for 38 popular models of cars",
             description = "This dataset contains a subset of the fuel economy data that the EPA makes available on http://fueleconomy.gov. It contains only models which had a new release every year between 1999 and 2008 - this was used as a proxy for the popularity of the car.",
             source = "https://github.com/tidyverse/ggplot2",
             var_details = list(manufacturer = "manufacturer name",
                                model = "model name",
                                displ = "engine displacement, in litres",
                                year = "year of manufacture",
                                cyl = "number of cylinders",
                                trans = "type of transmission",
                                drv = "the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd",
                                cty = "city miles per gallon",
                                hwy = "highway miles per gallon",
                                fl = "fuel type",
                                class = "'type' of car"))

usethis::use_data(mpg)

# diamonds

diamonds <- ggplot2::diamonds

usethis::use_data(diamonds)

dpr_export(diamonds, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_document(diamonds, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "diamonds", title = "Prices of over 50,000 round cut diamonds",
             description = "A dataset containing the prices and other attributes of almost 54,000 diamonds. The variables are as follows:",
             source = "https://github.com/tidyverse/ggplot2",
             var_details = list(price = "price in US dollars (326–18,823)",
              carat = "weight of the diamond (0.2–5.01)",
              cut = "quality of the cut (Fair, Good, Very Good, Premium, Ideal)",
              color = "diamond colour, from D (best) to J (worst)",
              clarity = "a measurement of how clear the diamond is (I1 (worst), SI2, SI1, VS2, VS1, VVS2, VVS1, IF (best))",
              x = "length in mm (0–10.74)",
              y = "width in mm (0–58.9)",
              z = "depth in mm (0–31.8)",
              depth = "total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43–79)",
              table = "width of top of diamond relative to widest point (43–95)"))


# nycflights13

flights <- nycflights13::flights

usethis::use_data(flights)

dpr_export(flights, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".sav", ".dta"))

dpr_document(flights, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "flights", title = "Flights data",
             description = "On-time data for all flights that departed NYC (i.e. JFK, LGA or EWR) in 2013.",
             source = "https://github.com/hadley/nycflights13",
             var_details = list(year = "Year of departure",
                                month = "Month of departure",
                                day = "Day of departure",
                                dep_time = "Actual departure time (format HHMM or HMM), local tz.",
                                arr_time = "Actual arrival times (format HHMM or HMM), local tz.",
                                sched_dep_time = "Scheduled departure time (format HHMM or HMM), local tz.", 
                                sched_arr_time = "Scheduled arrival time (format HHMM or HMM), local tz.",
                                dep_delay = "Departure delay, in minutes. Negative times represent early departures.",
                                arr_delay = "Arrival delays, in minutes. Negative times represent early arrivals.",
                                carrier = "Two letter carrier abbreviation. See airlines in nycflights13 R package to get names.",
                                flight = "Flight number.",
                                tailnum = "Plane tail number. See planes in nycflights13 R package for additional metadata.",
                                
                                origin = "Origin. See airports in nycflights13 R package for additional metadata.",
                                dest = "Destination. See airports in nycflights13 R package for additional metadata.",
                                air_time = "Amount of time spent in the air, in minutes.",
                                distance = "Distance between airports, in miles.",
                                hour = "Time of scheduled departure broken into hour and minutes.",
                                minute = "Time of scheduled departure broken into hour and minutes.",
                                time_hour = "Scheduled date and hour of the flight as a POSIXct date. Along with origin, can be used to join flights data to weather data.")
                                )

airlines <- nycflights13::airlines
airports <- nycflights13::airports
planes <- nycflights13::planes
weather <- nycflights13::weather

usethis::use_data(airlines, airports, planes, weather)

dpr_export(airlines, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".sav", ".dta"))
dpr_export(airports, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".sav", ".dta"))
dpr_export(planes, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".sav", ".dta"))
dpr_export(weather, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".sav", ".dta"))

dpr_document(airlines, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "airlines", title = "Airline names",
             description = "Look up airline names from their carrier codes.",
             source = "https://github.com/hadley/nycflights13",
             var_details = list(
               carrier = "Two letter abbreviation",
               name = 'Full name'))

dpr_document(airports, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "airports", title = "Airport metadata",
             description = "Useful metadata about airports.",
             source = "https://github.com/hadley/nycflights13",
             var_details = list(
               faa = 'FAA airport code',
               name = 'Usual name of the airport',
               lat = 'Lattitude of the airport location',
               lon = 'Longitude of the airport location',
               alt = 'Altitude in feet',
               tz = 'Timezone offset from GMT',
               dst = 'Daylight savings time zone. A = Standard US DST: starts on the second Sunday of March, ends on the first Sunday of November. U = unknown. N = no dst.',
               tzone = 'IANA time zone, as determined by GeoNames webservice.'))

dpr_document(planes, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "planes", title = "Plane metadata",
             description = "Plane metadata for all plane tailnumbers found in the FAA aircraft registry. American Airways (AA) and Envoy Air (MQ) report fleet numbers rather than tail numbers so can't be matched.",
             source = "https://github.com/hadley/nycflights13",
             var_details = list(
               tailnum = 'Tail number',
               year = 'Year manufactured',
               manufacturer = "Manufacturer",
               model = 'model',
               engines = 'Number of engines',
               seats = 'Number of seats',
               speed = 'Average cruising speed in mph',
               engine = "Type of engine"))             

dpr_document(weather, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "weather", title = "Hourly weather data",
             description = "Hourly meterological data for LGA, JFK and EWR.",
             source = "https://github.com/hadley/nycflights13",
             var_details = list(
               origin = 'Weather station. Named origin to facilitate merging with flights data.',
               year = 'year',
               month = 'month',
               day = 'day',
               hour = 'hour',
               temp = "Temperature in F",
               dewp = 'Dewpoint in F',
               humid = 'Relative humidity',
               wind_dir = "Wind direction",
               wind_speed = "Wind speed in mph",
               wind_gust = "Wind gust speed in mph",
               precip = "Precipitation in inches",
               pressure = "Sea level pressure in millibars",
               visib = "Visibility in miles",
               time_hour = "Date and hour of the recording as a POSIXct date."))

             
### Lahman Baseball data

batting <- Lahman::Batting

usethis::use_data(batting)

dpr_export(batting, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".sav", ".dta"))

dpr_document(batting, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "batting", title = "Batting table",
             description = "Batting table - batting statistics",
             source = "https://github.com/cdalzell/Lahman",
             var_details = list(
               playerID = "Player ID code",
               yearID = "Year",
               stint = "player's stint (order of appearances within a season)",
               teamID = "Team",
               lgID = "League; with values AA AL FL NL PL UA",
               G = "Games: number of games in which a player played",
               AB = "At Bats",
               R = "Runs",
               H = "Hits: times reached base because of a batted, fair ball without error by the defense",
               X2B = "Doubles: hits on which the batter reached second base safely",
               X3B = "Triples: hits on which the batter reached third base safely",
               HR = "Homeruns",
               RBI = "Runs Batted In",
               SB = "Stolen Bases",
               CS = "Caught Stealing",
               BB = "Base on Balls",
               SO = "Strikeouts",
               IBB = "Intentional walks",
               HBP = "Hit by pitch",
               SH = "Sacrifice hits",
               SF = "Sacrifice flies",
               GIDP = "Grounded into double plays"))

### Old Faithful data

# faithful

usethis::use_data(faithful)

dpr_export(faithful, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".xlsx", ".sav", ".dta"))

dpr_document(faithful, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "faithful", title = "Old Faithful Geyser Data",
             description = "Waiting time between eruptions and the duration of the eruption for the Old Faithful geyser in Yellowstone National Park, Wyoming, USA.",
             source = "https://doi.org/10.2307/2347385",
             var_details = list(eruptions = 'Eruption time in minutes',
                                waiting = 'Waiting time to next eruption'))

### Tabular data from tidyr


library(tidyr)
usethis::use_data(table1, table2, table3, table4a, table4b, table5)

dpr_export(table1, export_folder = path(package_path, "data-raw"), export_format = c(".csv", ".xlsx", ".json"))
dpr_export(table2, export_folder = path(package_path, "data-raw"), export_format = c(".csv", ".xlsx", ".json"))
dpr_export(table3, export_folder = path(package_path, "data-raw"), export_format = c(".csv", ".xlsx", ".json"))
dpr_export(table4a, export_folder = path(package_path, "data-raw"), export_format = c(".csv", ".xlsx", ".json"))
dpr_export(table4b, export_folder = path(package_path, "data-raw"), export_format = c(".csv", ".xlsx", ".json"))
dpr_export(table5, export_folder = path(package_path, "data-raw"), export_format = c(".csv", ".xlsx", ".json"))

# See the 'tidyr_tabular_data_notes.R' where the data description was used to copy and past into the data.md and data.r folders.

#### Who data

library(tidyr)
usethis::use_data(who)

dpr_export(who, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))



cnames <- colnames(who)[-c(1:4)]

varlist <- vector("list", length(cnames))
varlist[1:length(cnames)] <- "Counts of new TB cases recorded by group. Column names encode three variables that describe the group (see details)."
names(varlist) <- cnames


dpr_document(who, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "who", 
             title = "Word Health Organization (WHO) Tuberculosis as found in the R for Data Science Book",
             description = "The data uses the original codes given by the World Health Organization. The column names for columns five through 60 are made by combining new_ to a code for method of diagnosis (rel = relapse, sn = negative pulmonary smear, sp = positive pulmonary smear, ep = extrapulmonary) to a code for gender (f = female, m = male) to a code for age group (014 = 0-14 yrs of age, 1524 = 15-24 years of age, 2534 = 25 to 34 years of age, 3544 = 35 to 44 years of age, 4554 = 45 to 54 years of age, 5564 = 55 to 64 years of age, 65 = 65 years of age or older).",
             source = "https://tidyr.tidyverse.org/reference/who.html",
             var_details = c(list(country = "Country name",
                                iso2 = "2 letter ISO country code",
                                iso3 = "3 letter ISO country code",
                                year = "year"),
                                varlist))

### Fruit strings

fruit <- tibble(name = stringr::fruit)

usethis::use_data(fruit, overwrite = TRUE)

dpr_export(fruit, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_document(fruit, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "fruit", 
             title = "Sample strings of fruits for practicing string manipulations",
             description = "fruit comes from the rcorpora package written by Gabor Csardi; the data was collected by Darius Kazemi and made available at https://github.com/dariusk/corpora.",
             source = "https://github.com/dariusk/corpora",
             var_details = list(name = "Names of fruit"))

words <- tibble(name = stringr::words)

usethis::use_data(words, overwrite = TRUE)

dpr_export(words, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_document(words, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "words", 
             title = "Sample strings of words for practicing string manipulations",
             description = "words comes from the rcorpora package written by Gabor Csardi; the data was collected by Darius Kazemi and made available at https://github.com/dariusk/corpora.",
             source = "https://github.com/dariusk/corpora",
             var_details = list(name = "words"))

sentences <- tibble(name = stringr::sentences)

usethis::use_data(sentences)

dpr_export(sentences, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_document(sentences, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "sentences", 
             title = "Sample strings of sentences for practicing string manipulations",
             description = "the Harvard sentences, which were designed to test VOIP systems, but are also useful for practicing regexps.",
             source = "https://en.wikipedia.org/wiki/Harvard_sentences",
             var_details = list(name = "Harvard sentences"))

## categorical chapter

gss_cat <- forcats::gss_cat

usethis::use_data(gss_cat, overwrite = TRUE)

dpr_export(gss_cat, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_document(gss_cat, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "gss_cat", 
             title = "A sample of categorical variables from the General Social survey",
             description = "A sample of categorical variables from the General Social survey",
             source = "Downloaded from https://gssdataexplorer.norc.org/.",
             var_details = list(year = "year of survey, 2000–2014",
                                age = "age. Maximum age truncated to 89.",
                                marital = "marital status",
                                race = "race",
                                rincome = "reported income",
                                partyid = "party affiliation",
                                relig = "religion",
                                denom = "denomination",
                                tvhours = "hours per day watching tv"))


presidential <- ggplot2::presidential

usethis::use_data(presidential, overwrite = TRUE)

dpr_export(presidential, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_document(presidential, extension = ".md.R", export_folder = usethis::proj_get(),
             object_name = "presidential", 
             title = "Terms of 11 presidents from Eisenhower to Obama",
             description = "The names of each president, the start and end date of their term, and their party of 11 US presidents from Eisenhower to Obama.",
             source = "https://github.com/tidyverse/ggplot2",
             var_details = list(name = "Last name of president",
                                start = "Presidency start date",
                                end = "Presidency end date",
                                party = "Party of president"))

### documentation

dpr_readme(usethis::proj_get(), package_name_text, user)

dpr_write_script(folder_dir = package_path, r_read = "scripts_general/python4ds_data.R", 
                 r_folder_write = "data-raw", r_write = str_c(package_name_text, ".R"))

devtools::document(package_path)

dpr_push(folder_dir = package_path, message = "'category gss_cat'", repo_url = NULL)

