## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(unheadr)
library(dplyr)
library(tidyr)

## -----------------------------------------------------------------------------
dat <- data.frame(
  drink = c(
    "Cold Drinks", "Soda", "Water", "Juice", "Lemonade",
    "Hot Drinks", "Tea", "Coffee"
  ),
  price = c(NA, 2.99, 1.99, 3.15, 2, NA, 3.99, 1.99), stringsAsFactors = FALSE
)

dat

## -----------------------------------------------------------------------------
untangle2(dat, "Drinks$", drink, "beverage_type")

## -----------------------------------------------------------------------------
OGames <- tibble(
  Games = c("Los Angeles 1984", "Barcelona", "1992", "Atlanta 1996", "Sydney 2000", "London", "2012"),
  Country = c("USA", "Spain", NA, "USA", "Australia", "UK", NA),
  Soccer_gold_medal = c("France", "Spain", NA, "Nigeria", "Cameroon", "Mexico", NA)
)
OGames

## -----------------------------------------------------------------------------
OGames %>%
  unbreak_vals("^[0-9]", Games, Games_unbroken, slice_groups = TRUE) %>%
  select(Games_unbroken, everything())

## -----------------------------------------------------------------------------
knicks <- data.frame(
  stringsAsFactors = FALSE,
  player = c("Allan Houston", NA, "Latrell Sprewell", NA, NA),
  teams = c(
    "Pistons", "Knicks", "Warriors", "Knicks",
    "Timberwolves"
  ),
  position = c("Shooting guard", NA, "Small forward", NA, NA)
)
knicks

## -----------------------------------------------------------------------------
knicks %>% unwrap_cols(groupingVar = player, separator = ", ")

## -----------------------------------------------------------------------------
merged_dat <- data.frame(
  stringsAsFactors = FALSE,
  Name = c("Valery V."),
  Asset = c("Apartment\n\nPlot\nHouse\nOther\nApartment"),
  Area = c("45.7\n\n69.2\n65.0\n32.2\n36.9\n\n\n"),
  Status = c("Owned\n\nOwned\nIn use\nUnknown\nOwned\n")
)
merged_dat

## -----------------------------------------------------------------------------
merged_dat %>%
  mutate(across(c(Asset:Status), squish_newlines)) %>%
  tidyr::separate_rows(c(Asset:Status), sep = "\n")

## -----------------------------------------------------------------------------
basketball <-
  data.frame(
    stringsAsFactors = FALSE,
    v1 = c(
      "Player", NA, "Sleve McDichael", "Dean Wesrey",
      "Karl Dandleton", "Mike Sernandez",
      "Glenallen Mixon", "Rey McSriff"
    ),
    v2 = c(
      "Most points", "in a game", "55", "43", "41", "111", "109", "104"
    ),
    v3 = c(
      "Season", "(year ending)", "2001", "2000", "2002",
      "2000", "2002", "2001"
    )
  )
basketball

## -----------------------------------------------------------------------------
unbreak_rows(basketball, "^Most", v2)

## -----------------------------------------------------------------------------
vehicles <- 
data.frame(
  stringsAsFactors = FALSE,
           Vehicle = c(NA, NA, NA, "Truck", "Motorcycle", "Sedan", "Van"),
             Price = c("in","2014",
                       "(local currency)","50000","44000","33000","50000"),
             Color = c(NA, NA, NA, "White", "Black", "Red", "White"),
         Emissions = c("Certificate", NA, NA, "TRUE", "FALSE", "TRUE", "TRUE")
)
vehicles

## -----------------------------------------------------------------------------
mash_colnames(df= vehicles, n_name_rows = 3, keep_names = TRUE)

## -----------------------------------------------------------------------------
vehicles_skip <- 
data.frame(
  stringsAsFactors = FALSE,
                X1 = c("Vehicle",NA,NA,NA,"Truck",
                       "Motorcycle","Sedan","Van"),
                X2 = c("Price","in","2014",
                       "(local currency)","50000","44000","33000","50000"),
                X3 = c("Color", NA, NA, NA, "White", "Black", "Red", "White"),
                X4 = c("Emissions","Certificate",NA,
                       NA,"TRUE","FALSE","TRUE","TRUE")
)
vehicles_skip

## -----------------------------------------------------------------------------
mash_colnames(df= vehicles_skip, n_name_rows = 4, keep_names = FALSE)

## -----------------------------------------------------------------------------
survey <- 
data.frame(
  stringsAsFactors = FALSE,
                X1 = c("Participant", NA, "12", "34", "45", "123"),
                X2 = c("How did you hear about us?",
                       "TV","TRUE","FALSE","FALSE","FALSE"),
                X3 = c(NA, "Social Media", "FALSE", "TRUE", "FALSE", "FALSE"),
                X4 = c(NA, "Radio", "FALSE", "TRUE", "FALSE", "TRUE"),
                X5 = c(NA, "Flyer", "FALSE", "FALSE", "FALSE", "FALSE"),
                X6 = c("Age", NA, "31", "23", "19", "24")
)

survey
mash_colnames(survey,2,keep_names = FALSE,sliding_headers = TRUE, sep = "_")

## -----------------------------------------------------------------------------
example_spreadsheet <- system.file("extdata/dog_test.xlsx", package = "unheadr")
annotate_mf(example_spreadsheet, orig = Task, new = Task_annotated)

## -----------------------------------------------------------------------------
example_spreadsheetb <- system.file("extdata/boutiques.xlsx", package = "unheadr")
annotate_mf_all(example_spreadsheetb)

## -----------------------------------------------------------------------------
guests <- 
  unlist(strsplit(c("6     COAHUILA        20/03/2020
712        COAHUILA             20/03/2020"),"\n"))

guests

## -----------------------------------------------------------------------------
regex_valign(guests, "\\b(?=[A-Z])")

