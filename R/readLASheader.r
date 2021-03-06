#' @importFrom tools file_ext
.loadLASheaders = function(files)
{
  valid = file.exists(files)
  islas = tools::file_ext(files) == "las"

  if( sum(!valid) != 0 )
    stop(paste("File(s) ", files[!valid], " not found\n", sep=""))

  if( sum(!islas) != 0 )
    stop(paste("File(s) ", files[!islas], " not supported\n", sep=""))

  data = readLASheader(files[1])

  for(file in files[-1])
    data = list(data, readLASheader(file))

  return(data)
}

#' Read a .las file header
#'
#' Methods to read .las file header. This function musn't be used by users. Use \link[lidR:LoadLidar]{LoadLidar}.
#'
#' @param LASfile character. Filename of .las file
#' @return A list with the las header fields
#' @seealso \link[lidR:LoadLidar]{LoadLidar}
#' @export readLASheader
readLASheader = function(LASfile)
{
  hd <- publicHeaderDescription()

  pheader <- vector("list", nrow(hd))
  names(pheader) <- hd$Item

  con <- file(LASfile, open = "rb")
  isLASFbytes <- readBin(con, "raw", size = 1, n = 4, endian = "little")
  pheader[[hd$Item[1]]] <- readBin(isLASFbytes, "character", size = 4, endian = "little")

  if (! pheader[[hd$Item[1]]] == "LASF")
    stop("The LASfile input is not a valid LAS file")

  for (i in 2:nrow(hd))
    pheader[[hd$Item[i]]] <- readBin(con, what = hd$what[i], size = hd$Rsize[i], endian = "little", n = hd$n[i])

  close(con)

  return(pheader)
}

