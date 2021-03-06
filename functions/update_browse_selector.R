update_browse_selector <- function(session, prev_selection) {
  datasets <- list.files(path = "json", pattern="*.json")
  dataset_choices <- datasets
  
  if (length(prev_selection)==0 && length(datasets)>0) { prev_selection <- dataset_choices[1] }
  
  datasets_choices <-
      setNames(datasets,
               lapply(datasets,
                      function(xxx) {
                          gsub("_", " ", gsub("^data_\\d+_(.*?)\\.json$", "\\1", xxx))
                      }
                      )
               )
  test2 <<- datasets_choices
  print(datasets_choices)
  updateRadioButtons(session, 'dataSet', 
                     choices=datasets_choices,
                     selected=prev_selection
  )
}
