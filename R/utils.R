document_to_html <- function(function_name){
  temp_file_name <- tools::Rd2HTML(
    Rd  = gbRd::Rd_fun(function_name),
    out = stringr::str_c(function_name, ".html")
  )
  html = readr::read_file(temp_file_name)
  file.remove(temp_file_name)
  return(html)
}
