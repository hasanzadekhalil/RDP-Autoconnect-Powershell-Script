$Server="192.168.0.1"
echo "Connecting to $Server"
$User="username"
$Password="P@ssw0rd"
cmdkey /generic:TERMSRV/$Server /user:$User /pass:$Password
# mstsc /v:$Server:port

$username = $env:UserName
$outputdirectory = "C:\Users\$username\AppData\Local\Temp"
  
$rdp = 'screen mode id:i:2
use multimon:i:1
desktopwidth:i:2560
desktopheight:i:1440
session bpp:i:24
winposstr:s:0,1,977,94,2337,1177
compression:i:1
keyboardhook:i:2
audiocapturemode:i:1
videoplaybackmode:i:1
connection type:i:7
networkautodetect:i:1
bandwidthautodetect:i:1
displayconnectionbar:i:1
enableworkspacereconnect:i:0
disable wallpaper:i:0
allow font smoothing:i:0
allow desktop composition:i:0
disable full window drag:i:1
disable menu anims:i:1
disable themes:i:0
disable cursor setting:i:0
bitmapcachepersistenable:i:0
full address:s:
audiomode:i:0
redirectprinters:i:1
redirectlocation:i:0
redirectcomports:i:0
redirectsmartcards:i:1
redirectclipboard:i:1
redirectposdevices:i:0
autoreconnection enabled:i:1
authentication level:i:2
prompt for credentials:i:0
negotiate security layer:i:1
remoteapplicationmode:i:0
alternate shell:s:
shell working directory:s:
gatewayhostname:s:
gatewayusagemethod:i:4
gatewaycredentialssource:i:4
gatewayprofileusagemethod:i:0
promptcredentialonce:i:0
gatewaybrokeringtype:i:0
use redirection server name:i:0
rdgiskdcproxy:i:0
kdcproxyname:s:
drivestoredirect:s:*
camerastoredirect:s:*
selectedmonitors:s:1
  '
  $rdp -f $Server | Out-File -FilePath "$outputdirectory\default.rdp"
  
mstsc "$outputdirectory\default.rdp" /v:$Server
