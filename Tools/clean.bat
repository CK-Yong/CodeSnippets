@echo off
cd %1

setlocal enableDelayedExpansion
set "search=.*node_modules.*"

for /d /r %%a in (*bin) do (
  for %%f in (%%a) do (
    if /i %%~nxf equ bin (
      echo(!%%f!|findstr /r /c:"!search!" >nul && (
        echo SKIPPING "%%a"
      ) || (
        echo rd /q /s "%%a"
        rd /q /s "%%a"
      )
    )
  )
)

for /d /r %%a in (*obj) do (
  for %%f in (%%a) do (
    if /i %%~nxf equ obj (
      echo rd /q /s "%%a"
      rd /q /s "%%a"
    )
  )
)

pause
