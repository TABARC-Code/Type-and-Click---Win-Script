# Type-and-Click---Win-Script
PowerShell script (type a word, click a screen location use other sscript to get screen location detail if needed.

This is dumb automation. It clicks pixels, not UI elements. - It can however if that aspect is on top of tother activiies. Think and leave the pc laptop alone.

The UI is in the foreground

The window must be active and focused.

SendKeys types into whatever has keyboard focus. It does not care what app it is.

The UI does not block synthetic input

Standard Win32, WinForms, WPF, Electron, most browsers: fine.

Games, some hardened apps, RDP edge cases: may ignore it.

This uses:

SendKeys to type text

user32.dll to move the mouse and click

Explicit timing so automation does not race the UI
