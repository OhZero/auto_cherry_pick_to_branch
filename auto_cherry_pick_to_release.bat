@echo off
set /p cherry_pick_id=Please Input Commit ID:

git stash
git checkout release-jp-1.7.0
git pull


git cherry-pick %cherry_pick_id%

set cherry_pick_result=%ERRORLEVEL%

echo %cherry_pick_result%

git push
git checkout develop
git stash pop


IF %cherry_pick_result% neq 0 goto error
IF %cherry_pick_result% equ 0 goto finish

:error
mshta vbscript:msgbox("Cherry Pick Error",64,"Error")(window.close)
exit
:finish
mshta vbscript:msgbox("Cherry Pick Finish",64,"Finish")(window.close)
exit