
.onAttach <- function(libname, pkgname) {

  ## load Img tk extension if available
  sysname <- Sys.info()[1]
  didLoad <- TRUE
  if (sysname == "Darwin") {
    dir <- system.file("Img-Darwin64", package = "tkimg")
    tcltk::addTclPath(dir)
    didLoad <- tcltk::tclRequire('Img')
    if(identical(didLoad, FALSE)) {
      packageStartupMessage("Could not load the tk Img extension.")
    }
  } else if (sysname == "Linux") {
    packageStartupMessage("Please install the libtk-img using your system package manager.")
  } else {
    packageStartupMessage("The tkimg package works only on Macs right now.")
  }

}

