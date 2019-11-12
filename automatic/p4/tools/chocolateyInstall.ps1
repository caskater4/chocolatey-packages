$packageName = 'p4'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32       = 'http://filehost.perforce.com/perforce/r17.1/bin.ntx86/helix-p4-x86.exe'
$url64       = 'http://filehost.perforce.com/perforce/r17.1/bin.ntx64/helix-p4-x64.exe'
$checksum32  = 'a5466b6644773dab94f6fdee01b977e8473421f498acdb4947fca109a176b60a'
$checksum64  = '0a65b8b0807b263765eee73fcb7d9b4d7cedf557f4dcc8a40fae7fdc9068b132'

$packageArgs = @{
  packageName    = $packageName
  softwareName   = 'Helix P4 Command-Line Client*'
  unzipLocation  = $toolsDir
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/S /v/qn'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
