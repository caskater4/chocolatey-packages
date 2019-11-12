$packageName = 'visualassist'
$url32 = 'https://www.wholetomato.com/downloads/getBuild.asp?2210'
$url64 = 'https://www.wholetomato.com/downloads/getBuild.asp?2210'
$checksum32 = ''
$checksum64 = ''

$sargs = "/S"
if ($env:VAX_licensee -And $env:VAX_license) {
  $sargs	+= " /LU `"$env:VAX_licensee`" /LK `"$env:VAX_license`""
}

$packageArgs = @{
  packageName    = $packageName
  installerType  = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = $sargs
}

Install-ChocolateyPackage @packageArgs
