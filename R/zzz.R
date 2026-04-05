
.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    paste0("Please cite: ", utils::citation(pkgname)$textVersion)
  )
}