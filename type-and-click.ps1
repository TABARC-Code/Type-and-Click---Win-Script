# TABARC-Code
# Purpose: Type a word, then click an absolute screen location - nice little ai autopilot and othr crap. it can also auto other repetative jobs.
# Notes:
# - Screen coordinates are absolute pixels
# - 0,0 is top-left of primary display
# - Adjust sleeps if target app is slow

Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Mouse {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    [DllImport("user32.dll")]
    public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);

    public const int LEFTDOWN = 0x02;
    public const int LEFTUP   = 0x04;
}
"@

Add-Type -AssemblyName System.Windows.Forms

# ---------- CONFIG ----------
$WordToType = "HELLO"
$ClickX = 960   # X pixel
$ClickY = 540   # Y pixel
# ----------------------------

Start-Sleep -Milliseconds 500

# Type the word
[System.Windows.Forms.SendKeys]::SendWait($WordToType)

Start-Sleep -Milliseconds 300

# Move mouse
[Mouse]::SetCursorPos($ClickX, $ClickY)
Start-Sleep -Milliseconds 100

# Click
[Mouse]::mouse_event([Mouse]::LEFTDOWN, 0, 0, 0, 0)
Start-Sleep -Milliseconds 50
[Mouse]::mouse_event([Mouse]::LEFTUP, 0, 0, 0, 0)
