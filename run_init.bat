@echo off
setlocal enabledelayedexpansion

rem Đọc file init.txt
for /f "tokens=1,* delims=" %%i in (./init.txt) do (
    if "%%i"=="-dir" (
        set "mode=dir"
    ) else if "%%i"=="-file" (
        set "mode=file"
    ) else (
        if "!mode!"=="dir" (
            mkdir "%%i"
        ) else if "!mode!"=="file" (
            rem Tạo file và thư mục nếu chưa tồn tại
            for %%j in ("%%i") do (
                if not exist "%%~dpj" mkdir "%%~dpj"
                if not exist "%%i" echo. > "%%i"
            )
        )
    )
)

endlocal