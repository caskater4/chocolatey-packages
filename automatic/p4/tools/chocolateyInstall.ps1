$packageName = 'p4'
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32       = 'http://filehost.perforce.com/perforce/r17.1/bin.ntx86/helix-p4-x86.exe'
$url64       = 'http://filehost.perforce.com/perforce/r17.1/bin.ntx64/helix-p4-x64.exe'
$checksum32  = '185fc0de9753c2d1efb063f50a8e9538aedfbbb53a3f9ed143738d07722dcbc5'
$checksum64  = '625244e225495c43330643c2dcbf5ee2a41f0fa4f9dd8fba5e2daac6dab781ed'

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
  silentArgs	 = '/s /v"/qn"'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
