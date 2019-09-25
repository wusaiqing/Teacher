@echo off
set SVN_BINDIR=C:\Program Files\Subversion\bin
setlocal
set REPOS=%1
set TXN=%2
rem check that logmessage contains at least 10 characters
svnlook log "%REPOS%" -t "%TXN%" | findstr "..." > nul
if %errorlevel% gtr 0 goto err
exit 0
:err
echo 你忘了写提交日志喔!本次提交无效!日志至少3个字符!!! 1>&2
exit 1