## code to prepare `partidas_brasileirao` dataset goes here

partidas_brasileirao <- readr::read_csv2("https://git.io/JOqUN")

usethis::use_data(partidas_brasileirao, overwrite = TRUE)
