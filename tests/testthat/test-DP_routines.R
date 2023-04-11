# Pre-processing Needed:

#as.numeric.advanced <- function(x) {as.numeric(gsub("," ,".", x))}
#as.numeric.advanced_V <- Vectorize(as.numeric.advanced)

test_that("Sensitivity Test", {


  # Read our sample dataset as a data frame
  #DF_Biobank <- read.csv('../../data/sample.csv',sep = ";")
  DF_Biobank <- readr::read_csv2('../../data/sample.csv')

  # Filter
  DF_Biobank <- DF_Biobank %>% dplyr::filter(cohort_name == 'TNFFIRST')

  # Separate numeric from non-numeric fields
  DF_Biobank_numeric_cols <- c('age',
            'das28_m0','das28_m3',
            'das28_m6','das28_m12')

  #DF_Biobank_numeric <- DF_Biobank %>% select('age','body_mass_index_baseline',)
  DF_Biobank_numeric <- DF_Biobank %>% dplyr::select(all_of(DF_Biobank_numeric_cols)) %>%
    tidyr::drop_na()  %>% # TEMP Repercussion: Remove .na rows
    #dplyr::mutate(across(DF_Biobank_numeric_cols, function(x) x*2)) # Convert to as.numeric
    dplyr::mutate_at(DF_Biobank_numeric_cols,  as.numeric ) # Convert to as.numeric

  print(head(DF_Biobank_numeric))

  # Normalize all numeric variables between 0-1
  maxes <- DF_Biobank_numeric %>% dplyr::mutate_at( DF_Biobank_numeric_cols, function(x) {
    max(x, na.rm = T)
  })
  mins <- DF_Biobank_numeric %>% dplyr::mutate_at( DF_Biobank_numeric_cols, function(x) {
    min(x, na.rm = T)
  })

  #print(head(maxes))
  #print(head(mins))

  #DF_Biobank_numeric_norm <- DF_Biobank_numeric %>% dplyr::mutate_at( DF_Biobank_numeric_cols, function(x) {
  #  (x - min(x, na.rm = T))/(max(x, na.rm = T) - min(x, na.rm = T))
  #  })

  DF_Biobank_numeric_norm <- (DF_Biobank_numeric - mins)/(maxes-mins)
  #print(head(DF_Biobank_numeric_norm))

  # * TODO: SENSITIVITY OPTIONS: Assume 1, OR Estimate OR Take A-Priori Knowledge

  # Release
  DF_Biobank_numeric_perturbed_norm <- release_dataset_all_numeric(DF_Biobank_numeric_norm)

  # Un-normalize to expand (this can be done if you know the original min and max)

  #y (max-min) + min = X
  DF_Biobank_numeric_release <- DF_Biobank_numeric_perturbed_norm * (maxes - mins) + mins
  print(head(DF_Biobank_numeric_release))

  # TODO: Replace this so it checks for sum of absolute difference between
  # DF_Biobank_numeric_release and DF_Biobank_numeric  > 0
  expect_equal(2 * 2, 4)

})
