# Repeat key on windows

[Reference](https://ludditus.com/2016/07/15/microsoft-the-keyboard-repeat-rate-and-sleeping-how-to-work-around-their-idiocy/)

```
[HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response]
"AutoRepeatDelay"="300"
"AutoRepeatRate"="10"
"DelayBeforeAcceptance"="0"
"Flags"="27"
"BounceTime"="0"
```

# Disable show more option on right click menu

[Reference](https://www.reddit.com/r/microsoft/comments/sv88tb/comment/hxepvbb/?utm_source=share&utm_medium=web2x&context=3)

`reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve`

