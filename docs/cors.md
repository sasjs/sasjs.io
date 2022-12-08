CORS
====================

Cross Origin Resource Sharing (CORS) or "same-origin" policy is a feature that is disabled by default in most browsers to present cross site scripting attacks.  In our case, as we are working locally, we need to enable it (disable the security policy that prevents it) in order to connect to SAS on a different domain.


| OS    | Browser | Launch Command|
|:---:|:---:|:--:|
| Mac   | Chrome  | `open -n -a Google\ Chrome --args --disable-web-security --user-data-dir=/tmp/chrome` |
| Mac   | Brave   | `open -n -a /Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser -n --args --incognito --disable-web-security  --user-data-dir="/tmp/brave"` |
| Linux | Chrome  | `google-chrome --disable-web-security --user-data-dir="/tmp/chrome"`|
|Windows|Chrome|`"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --disable-web-security --disable-gpu --user-data-dir=C:\Temp`|

It does not seem to be possible to enable CORS in modern Firefox browsers.

You will know if you are successful if you see a `You are using an unsupported command-line flag: --disable-web-security. Stability and security will suffer.` message.

Note - even with CORS enabled you still may not be able to connect to SAS (9 or Viya) if whitelisting is enabled.  For this you will need to speak to your administrator.

A comprehensive article on CORS and CSRF management on SAS Viya is available [here](https://communities.sas.com/t5/SAS-Communities-Library/All-about-CORS-and-CSRF-for-developing-web-applications-with-the/ta-p/791124).

<meta name="description" content="Cross Origin Resource Sharing (CORS) is a feature that is disabled by default in most browsers to present cross site scripting attacks.">
