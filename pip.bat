set pip=C:\Users\<user>\AppData\Local\Programs\Python\Python39\Scripts\pip.exe
set what=tensorflow-gpu==2.6.0

:: %pip% show %what% && (pause) || (pause)
%pip% install %what% && (pause) || (pause)

