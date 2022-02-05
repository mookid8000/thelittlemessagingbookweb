@echo off

if not exist ..\littlemessagingbook\output\index.html (
	echo Could not find book here:
	echo ..\littlemessagingbook\output\index.html
	goto exit_fail
)

if not exist ..\littlemessagingbook\output\pandoc.css (
	echo Could not find CSS here:
	echo ..\littlemessagingbook\output\pandoc.css
	goto exit_fail
)

if not exist .\book mkdir .\book
if %ERRORLEVEL% neq 0 (
	echo Could not create destination directory
 	goto exit_fail
)

xcopy ..\littlemessagingbook\output\index.html .\book\ /fy
if %ERRORLEVEL% neq 0 (
 	goto exit_fail
)

xcopy ..\littlemessagingbook\output\pandoc.css .\book\ /fy
if %ERRORLEVEL% neq 0 (
 	goto exit_fail
)





goto exit_success
:exit_fail
exit /b 1
:exit_success
