## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(unheadr)
library(dplyr)

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
  unbreak_vals("^[0-9]", Games, Games_unbroken, .slice_groups = TRUE) %>%
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
example_spreadsheet <- system.file("extdata/dog_test.xlsx", package = "unheadr")
annotate_mf(example_spreadsheet, orig = Task, new = Task_annotated)

