message("global test1")
message(paste(list.files(), collapse = ", "))
message("global test2")
# Activate virtual env
Sys.unsetenv("RETICULATE_PYTHON")
# Note, the name of the virtual environment is defined in the GH Actions workflow
venv_name <- "virtual_env"
reticulate::use_virtualenv(file.path(getwd(), venv_name), required = TRUE)
# We get a '126' error (non-executable) if we don't do this:
system(sprintf("chmod -R +x %s", venv_name))
