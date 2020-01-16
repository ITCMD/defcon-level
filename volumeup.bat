@if (@a==@b) @end /*

:: batch portion

@ECHO OFF

cscript /e:jscript "%~f0"
exit


:: JScript portion */

var shl = new ActiveXObject("WScript.Shell");
for (var i=0; i<5; i++) {
    shl.SendKeys(String.fromCharCode(0xAF));
}