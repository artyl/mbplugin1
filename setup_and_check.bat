@echo OFF
%~d0 
cd "%~dp0"


@REM ������塞 � sys.path ���� � ����� ��㤠 ����饭 �ਯ� �� 㬮�砭��, � embedded �� ��祬�-� �몫�祭
cd python 
..\python\python -c "txt='''import os,sys\nsys.path.insert(0,os.path.split(sys.argv[0])[0])''';open('sitecustomize.py','w').write(txt)"

cd "%~dp0"
echo ���ᮡ�ࠥ� DLL 
call dllsource\compile_all_p.bat

cd "%~dp0"
echo ���ᮡ�ࠥ� JSMB LH plugin
python\python.exe plugin\compile_all_jsmblh.py

cd "%~dp0"
if NOT "%1"=="noweb" echo ������� lnk �� run_webserver.bat � ����頥� ��� � ��⮧���� � ����᪠��
if NOT "%1"=="noweb" python\python -c "import os, sys, win32com.client;shell = win32com.client.Dispatch('WScript.Shell');shortcut = shell.CreateShortCut('run_webserver.lnk');shortcut.Targetpath = os.path.abspath('run_webserver.bat');shortcut.save()"
if NOT "%1"=="noweb" copy run_webserver.lnk "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
if NOT "%1"=="noweb" start "" /MIN "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\run_webserver.lnk"
if NOT "%1"=="noweb" echo �������� ���� ���������
if NOT "%1"=="noweb" ping 127.0.0.1 -n 11 >nul

cd "%~dp0"
echo �஢��塞 �� �� ���㫨 ������������
python\python -c "import requests, telegram, win32api, win32gui, win32con, winerror, PIL, bs4, pyodbc, pyreadline, pyppeteer, psutil"

cd "%~dp0"
if NOT "%1"=="noweb" echo �஢��塞 �� �� ࠡ�⠥� JSMB LH PLUGIN ���⮩ ������
if NOT "%1"=="noweb" python\python -c "import re,requests;url=re.findall(r'(?usi)(http://127.0.0.1:.*?/)',open('jsmblhplugin\\p_test1_localweb.jsmb').read())[0];print(requests.session().get(url+'getbalance/p_test1/123/456/789').content.decode('cp1251'))"

cd "%~dp0"
if NOT "%1"=="noweb" echo �஢��塞 �� �� ࠡ�⠥� JSMB LH PLUGIN �१ Chrome
if NOT "%1"=="noweb" python\python -c "import re,requests;url=re.findall(r'(?usi)(http://127.0.0.1:.*?/)',open('jsmblhplugin\\p_test3_localweb.jsmb').read())[0];print(requests.session().get(url+'getbalance/p_test3/demo@saures.ru/demo/789').content.decode('cp1251'))"

cd "%~dp0"
echo �஢��塞 �� �� ࠡ�⠥� DLL PLUGIN
call plugin\test_mbplugin_dll_call.bat p_test1 123 456 
