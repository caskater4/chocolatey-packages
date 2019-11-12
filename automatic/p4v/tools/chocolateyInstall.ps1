$packageName = 'p4v'
$url32 = 'http://filehost.perforce.com/perforce/r15.2/bin.ntx86/p4vinst.exe'
$url64 = 'http://filehost.perforce.com/perforce/r15.2/bin.ntx64/p4vinst64.exe'
$checksum32  = '621d9688ae812201243ec71d3b3821998994b1b1642edb951d200506fde9204c'
$checksum64  = '00e47df9a776c04eda863178edd62e21346877991c6c371444cb82f612bf23ac'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S /v/qn'
}

Install-ChocolateyPackage @packageArgs
