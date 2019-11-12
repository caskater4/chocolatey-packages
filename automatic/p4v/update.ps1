import-module au

$releaseNotesUrl = 'https://www.perforce.com/perforce/doc.current/user/p4vnotes.txt'
$baseUrl = 'https://cdist2.perforce.com/perforce/r'
$x86Path = 'bin.ntx86'
$x64Path = 'bin.ntx64'
$checksumsFileName = 'SHA256SUMS'
$x86FileName = 'p4vinst.exe'
$x64FileName = 'p4vinst64.exe'
$forceUpdate = $au_Force

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $releaseNotes = Invoke-WebRequest -Uri $releaseNotesUrl

    #The new version number is located on the third line of the file and has the form
	# Version XXXX.XX
    $re  = "Version 20[0-9][0-9]\.[0-9]+"

	$found = $releaseNotes.Content -match $re
	if ($found) {
		$version = $matches[0] -split ' ' | select -Last 1
		
		# The file URLs don't use the full version number for the year, only a two digit shorthand. e.g. 2016.2 is 16.2
		$shortVersion = $version.Substring(2)
		
		# Compute the path to the exe
		$url32 = $baseUrl + $shortVersion + '/' + $x86Path + '/' + $x86FileName
		$url64 = $baseUrl + $shortVersion + '/' + $x64Path + '/' + $x64FileName
		
		# Grab the checksums for the exe's
		$checksumsUrl32 = $baseUrl + $shortVersion + '/' + $x86Path + '/' + $checksumsFileName
		$checksums32 = Invoke-WebRequest -Uri $checksumsUrl32
		$found = $checksums32 -match '[a-zA-Z0-9]+ \*'+$x86FileName
		if ($found) {
			$sum32 = $matches[0] -split ' ' | select -First 1
		}
		$checksumsUrl64 = $baseUrl + $shortVersion + '/' + $x64Path + '/' + $checksumsFileName
		$checksums64 = Invoke-WebRequest -Uri $checksumsUrl64
		$found = $checksums64 -match '[a-zA-Z0-9]+ \*'+$x64FileName
		if ($found) {
			$sum64 = $matches[0] -split ' ' | select -First 1
		}
		$result = Get-Content 'tools\chocolateyInstall.ps1' | Select-String "checksum32 = '$checksum32'" -quiet
		if ($result) {
			$forceUpdate = $True
			Write-Host Checksum values have changed. Forcing update.
		}
		$Latest = @{ URL32 = $url32; Checksum32 = $sum32; URL64 = $url64; Checksum64 = $sum64; Version = $version }
	} else {
		Write-Host Version not found
	}
    
    return $Latest
}

$origForce = $au_Force
$au_Force = $forceUpdate
update
$au_Force = $origForce