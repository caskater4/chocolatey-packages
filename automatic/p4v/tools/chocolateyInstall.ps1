$packageName = 'p4v'
$url32 = 'http://filehost.perforce.com/perforce/r17.3/bin.ntx86/p4vinst.exe'
$url64 = 'http://filehost.perforce.com/perforce/r17.3/bin.ntx64/p4vinst64.exe'
$checksum32  = 'c2b97b2462b4535705f0d4b3dce1f70cabf242b09e01c39d37022b89cdc4b8ab'
$checksum64  = 'f9f5cfad9d67a3d40502ac250994fdf0dcb69f1726c18e93086cd0fc677b7d98'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs	 = '/s /v"/qn"'
}

Install-ChocolateyPackage @packageArgs
