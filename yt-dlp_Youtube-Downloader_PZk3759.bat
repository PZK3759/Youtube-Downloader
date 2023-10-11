@ECHO OFF
title yt-dlp Youtube-Downloader by PZK3759
:start
ECHO ======================================================================================================================
ECHO.
SET /P URL="[Enter video URL] "
ECHO.
ECHO ======================================================================================================================
goto formatList

:formatList
ECHO.
yt-dlp -F --list-subs "%URL%"
ECHO.
ECHO ======================================================================================================================
goto selection


:selection
ECHO.
ECHO 1) Video + Audio
ECHO 2) Audio only
ECHO.
SET /P option="Select option: "
if %option% == 1 (goto download)
if %option% == 2 (goto downloadSingle)
ECHO.
ECHO Unknown value
ECHO.
ECHO ======================================================================================================================
goto selection

:download
ECHO.
SET /P video="Select video format: "
SET /P audio="Select audio format: "
SET /P sub="enter subtitle command: "
ECHO.
ECHO ======================================================================================================================
ECHO.
yt-dlp -o "Videos/%%(title)s - %%(uploader)s.%%(ext)s" -f "%video%+%audio%" "%sub%" -i --ignore-config "%URL%"
ECHO.
ECHO ======================================================================================================================
ECHO.
ECHO Download Complete
ECHO.
ECHO 1) Download Again
ECHO 2) Exit
ECHO.
SET /P completed_option="Select option: "
if %completed_option% == 1 (goto start)
if %completed_option% == 2 (goto EXIT)

:downloadSingle
ECHO.
SET /P format="Select Audio Stream: "
ECHO.
ECHO ======================================================================================================================
ECHO.
yt-dlp -f "%format%" --extract-audio --audio-format mp3 -o "Audios/%%(title)s - %%(uploader)s.%%(ext)s" --add-metadata --embed-thumbnail --metadata-from-title "%%(artist)s - %%(title)s" -i --ignore-config "%URL%"
ECHO.
ECHO ======================================================================================================================
ECHO.
ECHO Download Complete
ECHO.
ECHO 1) Download Again
ECHO 2) Exit
ECHO.
SET /P completed_option="Select option: "
if %completed_option% == 1 (goto start)
if %completed_option% == 2 (goto EXIT)
