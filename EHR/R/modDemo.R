#' Run Demographic Data
#'
#' This module will load and modify demographic data.
#'
#' @param demo.path filename of a lab file (stored as RDS)
#' @param toexclude expression that should evaluate to a logical, indicating if
#' the observation should be excluded
#' @param demo.mod.list list of expressions, giving modifications to make
#'
#' @return list with two components
#'   \item{demo}{demographic data}
#'   \item{exclude}{vector of excluded visit IDs}
#'
#' @examples 
#' set.seed(2525)
#' demo <- data.frame(mod_id_visit = 1:10,
#'                    weight.lbs = rnorm(10,160,20),
#'                    age = rnorm(10, 50, 10),
#'                    enroll.date = sample(seq(as.Date('2019/01/01'), as.Date('2020/01/01'), by="day"), 10))
#' saveRDS(demo, 'ex.rds')
#'
#' # exclusion functions
#' exclude_wt <- function(x) x < 150
#' exclude_age <- function(x) x > 60
#' ind.risk <- function(wt, age) wt>170 & age>55
#' exclude_enroll <- function(x) x < as.Date('2019/04/01')
#'
#' # make demographic data that:
#' # (1) excludes ids with weight.lbs < 150, age > 60, or enroll.date before 2019/04/01
#' # (2) creates new 'highrisk' variable for subjects with weight.lbs>170 and age>55
#' out <- run_Demo(demo.path = "ex.rds",
#'                toexclude = expression(exclude_wt(weight.lbs)|exclude_age(age)|exclude_enroll(enroll.date)),
#'                demo.mod.list = list(highrisk = expression(ind.risk(weight.lbs, age))))
#' 
#' out
#'
#'
#' @export

run_Demo <- function(demo.path, toexclude, demo.mod.list) {
  # read and transform data
  demo.in <- readRDS(demo.path)
  demo <- dataTransformation(demo.in, modify = demo.mod.list)

  # exclusion criteria
  if (missing(toexclude)) {
    parsed.excl <- logical(nrow(demo))
  } else {
    parsed.excl <- eval(toexclude, demo)
  }

  excl.id <- demo[parsed.excl, 'mod_id_visit'] # the list of subject_id that should be excluded
  cat(sprintf('The number of subjects in the demographic data, who meet the exclusion criteria: %s\n', length(excl.id)))

  list(demo = demo, exclude = excl.id)
}
