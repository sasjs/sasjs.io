CORS
====================

Cross Origin Resource Sharing (CORS) is a feature that is disabled by default in most browsers to present cross site scripting attacks.  In our case, as we are working locally, we need to enable it (disable the security policy that prevents it) in order to connect to SAS on a different domain.


| OS    | Browser | Launch Command|
|:---:|:---:|:--:|
| Mac   | Chrome  | `open -n -a Google\ Chrome --args --disable-web-security --user-data-dir=/tmp/chrome` |
| Linux | Chrome  | `google-chrome --disable-web-security --user-data-dir="/tmp/chrome"`|
|Windows|Chrome|`"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --disable-web-security --disable-gpu --user-data-dir=C:\Temp`|

It does not seem to be possible to enable CORS in modern Firefox browsers.

You will know if you are successful if you see a `You are using an unsupported command-line flag: --disable-web-security. Stability and security will suffer.` message.