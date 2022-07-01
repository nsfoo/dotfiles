## Repeat key on windows
<https://ludditus.com/2016/07/15/microsoft-the-keyboard-repeat-rate-and-sleeping-how-to-work-around-their-idiocy/>

``` powershell
[HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
"AutoRepeatDelay"="300"
"AutoRepeatRate"="10"
"DelayBeforeAcceptance"="0"
"Flags"="27"
"BounceTime"="0"
```

## Disable show more option on right click menu

<https://www.reddit.com/r/microsoft/comments/sv88tb/comment/hxepvbb/?utm_source=share&utm_medium=web2x&context=3>

`reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve`

## Enable network between hyper-v (default switch) and wsl

[Reference](https://github.com/microsoft/WSL/issues/4288#issuecomment-778790363)

```
PS> Set-NetIPInterface -ifAlias "vEthernet (WSL)" -Forwarding Enabled
PS> Set-NetIPInterface -ifAlias "vEthernet (Default Switch)" -Forwarding Enabled
```

## Install Distrod in different location

```powershell
$env:LOCALAPPDATA = "D:\wsl\nsf"
distrod_wsl_launcher.exe -d distrod-debian-k0s-node1
```

## setting static ip for wsl

<https://github.com/microsoft/WSL/issues/4210#issuecomment-648570493>

```
wsl -d Ubuntu -u root ip addr add 192.168.50.16/24 broadcast 192.168.50.255 dev eth0 label eth0:1
netsh interface ip add address "vEthernet (WSL)" 192.168.50.88 255.255.255.0
```

### setup bat job on start
- Task Scheduler -> import task
