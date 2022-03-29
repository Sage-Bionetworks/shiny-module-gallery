message("global test1")
# Activate virtual env
Sys.unsetenv("RETICULATE_PYTHON")
# Note, the name of the virtual environment is defined in the GH Actions workflow
venv_name <- "virtual_env"
# We get a '126' error (non-executable) if we don't do this:
message("global test2")
system(sprintf("chmod -R +x %s", venv_name))
message("global test3")
reticulate::use_virtualenv(file.path(getwd(), venv_name), required = TRUE)
message("global test4")

