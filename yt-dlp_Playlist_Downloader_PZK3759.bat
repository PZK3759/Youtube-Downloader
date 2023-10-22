@ECHO OFF
title yt-dlp Playlist-Downloader by PZK3759

ECHO ======================================================================================================================
ECHO.
ECHO yt-dlp release
yt-dlp --version
ECHO.


:start
ECHO ======================================================================================================================
ECHO.
SET /P URL="Enter Playlist URL: "
ECHO.


:selection
ECHO ======================================================================================================================
ECHO.
ECHO 1) Download Full Playlist
ECHO 2) Download Specified
ECHO.
SET /P playlist_options="Select option: "
if %playlist_options% == 1 (goto full_playlist)
if %playlist_options% == 2 (goto specified)
ECHO.
ECHO Unknown value
ECHO Select a Valid Option
ECHO.
goto selection

:full_playlist
ECHO.
ECHO ======================================================================================================================
ECHO.
yt-dlp -o "Videos/%%(playlist)s/%%(playlist_index)s.%%(title)s - %%(uploader)s.%%(ext)s" -f bestvideo*+bestaudio/best --embed-thumbnail -i --ignore-config "%URL%"
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



:specified
ECHO.
ECHO ======================================================================================================================
ECHO.
SET /P start_index="Select First Index: "
SET /P end_index="Select Last Index: "
ECHO.
ECHO ======================================================================================================================
ECHO.
yt-dlp -o "Videos/%%(playlist)s/%%(playlist_index)s.%%(title)s - %%(uploader)s.%%(ext)s" --playlist-items "%start_index%-%end_index%" -f bestvideo*+bestaudio/best --embed-thumbnail -i --ignore-config "%URL%"
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