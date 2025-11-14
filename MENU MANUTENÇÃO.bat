@echo off
title Menu de Reparo e Ferramentas de TI - v2.2
color 0A
rem ***************************************************
rem *        Criado por Caio Marcondes                *
rem * Menu de Reparo e Ferramentas de TI - v2.2      *
rem * Data de Criacao: Agosto de 2025                 *
rem ***************************************************

:menu
cls
echo ==================================================
echo     MENU DE REPARO E FERRAMENTAS DE TI - v2.2
echo ==================================================
echo 1.  Verificar e Reparar Disco (CHKDSK)
echo 2.  Reparar Arquivos de Sistema (SFC)
echo 3.  Limpar Arquivos Temporarios
echo 4.  Verificar Erros de Memoria (Diagnostico)
echo 5.  Restaurar Sistema
echo 6.  Verificar Conectividade de Rede (Ping/Teste)
echo 7.  Gerenciar Processos (Task Manager)
echo 8.  Backup de Drivers
echo 9.  Verificar Atualizacoes do Windows
echo 10. Informacoes do Sistema
echo 11. Limpar Cache DNS
echo 12. Reiniciar Servicos de Rede
echo 13. Desfragmentar Disco
echo 14. Monitor de Confiabilidade (Grafico de Erros)
echo 15. Gerenciar Usuarios Locais
echo 16. Verificar Integridade de Arquivos (DISM)
echo 17. Ativar/Desativar Firewall do Windows
echo 18. Verificar Logs de Eventos
echo 19. Testar Velocidade de Disco
echo 20. Criar Ponto de Restauracao
echo 21. Executar Comando Personalizado (CMD)
echo 22. Gerenciar Aplicativos com Winget
echo 23. Sair
echo ==================================================
set /p opcao=Escolha uma opcao (1-23):

if %opcao%==1 goto chkdsk
if %opcao%==2 goto sfc
if %opcao%==3 goto cleanup
if %opcao%==4 goto memory
if %opcao%==5 goto restore
if %opcao%==6 goto network
if %opcao%==7 goto taskmgr
if %opcao%==8 goto driverbackup
if %opcao%==9 goto updates
if %opcao%==10 goto sysinfo
if %opcao%==11 goto dnscache
if %opcao%==12 goto netrestart
if %opcao%==13 goto defrag
if %opcao%==14 goto reliability
if %opcao%==15 goto usermgmt
if %opcao%==16 goto dism
if %opcao%==17 goto firewall
if %opcao%==18 goto eventlog
if %opcao%==19 goto disktest
if %opcao%==20 goto restorepoint
if %opcao%==21 goto customcmd
if %opcao%==22 goto winget
if %opcao%==23 goto exit

echo Opcao invalida! Tente novamente.
pause
goto menu

:chkdsk
cls
echo Executando verificacao de disco...
chkdsk C: /f /r
pause
goto menu

:sfc
cls
echo Executando SFC...
sfc /scannow
pause
goto menu

:cleanup
cls
echo Limpando temporarios...
cleanmgr /sagerun:1
pause
goto menu

:memory
cls
echo Abrindo Diagnostico de Memoria...
mdsched.exe
pause
goto menu

:restore
cls
echo Abrindo Restauracao do Sistema...
rstrui.exe
pause
goto menu

:network
cls
echo Testando rede...
ping google.com -n 4
pause
goto menu

:taskmgr
cls
echo Abrindo Task Manager...
taskmgr
pause
goto menu

:driverbackup
cls
echo Fazendo backup de drivers...
mkdir C:\DriverBackup
dism /online /export-driver /destination:C:\DriverBackup
pause
goto menu

:updates
cls
echo Procurando atualizacoes...
wuauclt /detectnow /updatenow
pause
goto menu

:sysinfo
cls
systeminfo
pause
goto menu

:dnscache
cls
ipconfig /flushdns
pause
goto menu

:netrestart
cls
netsh winsock reset
netsh int ip reset
pause
goto menu

:defrag
cls
defrag C: /O
pause
goto menu

:reliability
cls
echo Abrindo Monitor de Confiabilidade...
perfmon /rel
pause
goto menu

:usermgmt
cls
lusrmgr.msc
pause
goto menu

:dism
cls
dism /online /cleanup-image /restorehealth
pause
goto menu

:firewall
cls
firewall.cpl
pause
goto menu

:eventlog
cls
eventvwr.msc
pause
goto menu

:disktest
cls
winsat disk -drive C
pause
goto menu

:restorepoint
cls
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Ponto de Restauracao - Caio", 100, 7
pause
goto menu

:customcmd
cls
cmd
pause
goto menu

:winget
cls
echo ==================================================
echo     GERENCIADOR DE APLICATIVOS COM WINGET
echo ==================================================
echo 1. Listar aplicativos instalados
echo 2. Procurar por um aplicativo
echo 3. Instalar aplicativo
echo 4. Atualizar todos os aplicativos
echo 5. Desinstalar aplicativo
echo 6. Voltar
set /p wingetopcao=Opcao (1-6):

if %wingetopcao%==1 goto wingetlist
if %wingetopcao%==2 goto wingetsearch
if %wingetopcao%==3 goto wingetinstall
if %wingetopcao%==4 goto wingetupgrade
if %wingetopcao%==5 goto wingetuninstall
if %wingetopcao%==6 goto menu

goto winget

:wingetlist
cls
winget list
pause
goto winget

:wingetsearch
cls
set /p appsearch=Nome do app:
winget search "%appsearch%"
pause
goto winget

:wingetinstall
cls
set /p appinstall=Nome/ID do app:
winget install "%appinstall%"
pause
goto winget

:wingetupgrade
cls
winget upgrade --all
pause
goto winget

:wingetuninstall
cls
set /p appuninstall=Nome/ID do app:
winget uninstall "%appuninstall%"
pause
goto winget

:exit
cls
echo Obrigado por usar o Menu de Reparo - Caio Marcondes!
pause
exit
