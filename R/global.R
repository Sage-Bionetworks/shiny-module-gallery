# Activate virtual env
Sys.unsetenv("RETICULATE_PYTHON")
# Note, the name of the virtual environment is defined in the GH Actions workflow
venv_name <- "virtual_env"
venv_path <- file.path(getwd(), venv_name)
print(venv_path)
list.files(getwd())
reticulate::use_virtualenv(venv_path, required = TRUE)
# We get a '126' error (non-executable) if we don't do this:
system(sprintf("chmod -R +x %s", venv_name))
