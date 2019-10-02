@echo OFF
@rem Copyright (c) 2018 nexB Inc. http://www.nexb.com/ - All rights reserved.

@rem  A minimal shell wrapper to the CLI entry point

set TRACECODE_ROOT_DIR=%~dp0
@rem Use a trailing space in the next line to set the variable to an empty string
set TRACECODE_CMD_LINE_ARGS= 
set TRACECODE_CONFIGURED_PYTHON=%TRACECODE_ROOT_DIR%\bin\python.exe

@rem Collect all command line arguments in a variable
:collectarg
if ""%1""=="""" goto continue
call set TRACECODE_CMD_LINE_ARGS=%TRACECODE_CMD_LINE_ARGS% %1
shift
goto collectarg

:continue

if not exist "%TRACECODE_CONFIGURED_PYTHON%" goto configure
goto tracecode

:configure
echo * Configuring TraceCode for first use...
set CONFIGURE_QUIET=1
call "%TRACECODE_ROOT_DIR%\configure" etc/conf
if %errorlevel% neq 0 (
   exit /b %errorlevel%
)

:tracecode
"%TRACECODE_ROOT_DIR%\bin\tracecode" %TRACECODE_CMD_LINE_ARGS%

:EOS
