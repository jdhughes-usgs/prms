@ECHO OFF
..\..\bin\prms -C.\control\control -print
java -cp ..\..\dist\oui4.jar oui.paramtool.ParamTool .\input\params .\control\control.par_name
ECHO.
ECHO Run complete. Please press enter to continue.
PAUSE>NUL
