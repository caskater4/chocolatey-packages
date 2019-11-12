$packageName = 'p4d'
$url32 = 'http://filehost.perforce.com/perforce/r16.2/bin.ntx86/helix-versioning-engine-x86.exe'
$url64 = 'http://filehost.perforce.com/perforce/r16.2/bin.ntx64/helix-versioning-engine-x64.exe'
$checksum32  = '52497c531ade7cf4d94092ee3043ad4fec418b387a71673e5d07a39a8ce64585'
$checksum64  = '3b3188ae54ce943f0b22aa014da4629caccd239eeea31d20479c7c63e803b187'

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
