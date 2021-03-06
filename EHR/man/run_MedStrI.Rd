% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modMedStr1.R
\name{run_MedStrI}
\alias{run_MedStrI}
\title{Run Str Data}
\usage{
run_MedStrI(
  flow.path,
  flow.select = c("mod_id", "mod_id_visit", "Perform.Date", "Final.Wt..kg.",
    "Final.Rate..NFR.units.", "Final.Units"),
  flow.rename = c("mod_id", "mod_id_visit", "Perform.Date", "weight", "rate",
    "final.units"),
  flow.mod.list = list(date.time = expression(parse_dates(fixDates(Perform.Date))),
    unit = expression(sub(".*[ ]", "", rate)), rate =
    expression(as.numeric(sub("([0-9.]+).*", "\\\\1", rate)))),
  medchk.path,
  mar.path,
  demo.list = NULL,
  check.path,
  failflow_fn = "FailFlow",
  failunit_fn = "Unit",
  failnowgt_fn = "NoWgt",
  infusion.unit = "mcg/kg/hr",
  bolus.unit = "mcg",
  bol.rate.thresh = Inf,
  rateunit = "mcg/hr",
  ratewgtunit = "mcg/kg/hr",
  weightunit = "kg",
  drugname
)
}
\arguments{
\item{flow.path}{filename of flow data (stored as RDS)}

\item{flow.select}{columns to select}

\item{flow.rename}{new column names for flow data}

\item{flow.mod.list}{list of expressions, giving modifications to make}

\item{medchk.path}{filename containing data set (stored as CSV); should have
the column \sQuote{medname} with list of acceptable drug names used to filter
MAR data}

\item{mar.path}{filename of MAR data (stored as RDS)}

\item{demo.list}{demographic information; if available, missing weight may be
imputed from demographics}

\item{check.path}{path to \sQuote{check} directory, where check files are
created}

\item{failflow_fn}{filename for duplicate flow data with rate zero}

\item{failunit_fn}{filename for MAR data with invalid unit}

\item{failnowgt_fn}{filename for infusion data with missing weight where unit
indicates weight is required}

\item{infusion.unit}{acceptable unit for infusion data}

\item{bolus.unit}{acceptable unit for bolus data}

\item{bol.rate.thresh}{upper limit for bolus rate; values above this are invalid}

\item{rateunit}{acceptable unit for hourly rate; defaults to \sQuote{mcg/hr}}

\item{ratewgtunit}{acceptable unit for hourly rate by weight; defaults to \sQuote{mcg/kg/hr}}

\item{weightunit}{acceptable unit for weight; defaults to \sQuote{kg}}

\item{drugname}{drug of interest, included in filename of check files}
}
\value{
str data set
}
\description{
This module will load and modify infusion and bolus data.
}
