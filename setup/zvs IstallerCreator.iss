; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#define use_dotnetfx45
#define use_sqlcompact4
#define use_vc2012

#define MyAppExeName "zVirtualScenes.exe"
#define MyAppName "zVirtualScenes"
#define MyAppVersion GetFileVersion(AddBackslash("..\bin\release\") + MyAppExeName)
#define MyAppPublisher "Nonce Labs"

[Setup]                            
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
PrivilegesRequired=admin
AppId={{09FA2C8A-D475-4DC3-A895-107587BF4B90}
AppMutex=zVirtualScenesGUIMutex
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppCopyright=Copyright � {#MyAppPublisher} 2012
VersionInfoVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
UninstallDisplayIcon={app}\zVirtualScenesGUI.exe
AllowNoIcons=yes
;OutputDir=;
OutputBaseFilename={#MyAppName} Setup {#MyAppVersion}
Compression=lzma
SolidCompression=yes
OutputDir=output

ArchitecturesAllowed=x86 x64 ia64
ArchitecturesInstallIn64BitMode=x64 ia64

;SignTool=Standard "setup\signtool.exe" sign /f "{#BuildPath}\zvs.Entities\zvsCert.pfx" /p 4CCAFE63BC9D97822E3FB96942C4F12A752BEDE0 /d $qzVirtualScenes Installer$q $f

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Types]
Name: "full"; Description: "Full installation"
Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "core"; Description: "zVirtualScenes Core"; Types: full compact custom; Flags: fixed
Name: "openzwave"; Description: "OpenZWave Adapter"; Types: full compact
;Name: "jabber"; Description: "Jabber Plug-in"; Types: full
;Name: "growl"; Description: "Growl Plug-in"; Types: full
Name: "http"; Description: "HTTP API Plug-in"; Types: full
Name: "webapi"; Description: "Web API Plug-in"; Types: full
Name: "lightswitch"; Description: "LightSwitch Server Plug-in"; Types: full
Name: "noaa"; Description: "NOAA Plug-in"; Types: full   
;Name: "controlthink"; Description: "ControlThink Plug-in"; Types: full
Name: "speech"; Description: "Speech Plug-in"; Types: full
Name: "smartphone"; Description: "SmartPhone Plug-in"; Types: full
Name: "tasker"; Description: "Android Tasker Plug-in"; Types: full
Name: "scripts"; Description: "Additional JavaScript files."; Types: full

[Files]
Source: "..\bin\release\EntityFramework.dll"; DestDir: "{app}"; Flags: ignoreversion   
Source: "..\bin\release\EntityFramework.SqlServer.dll"; DestDir: "{app}"; Flags: ignoreversion  
Source: "..\bin\release\EntityFramework.SqlServerCompact.dll"; DestDir: "{app}"; Flags: ignoreversion   
Source: "..\bin\release\EntityFramework.xml"; DestDir: "{app}"; Flags: ignoreversion   
Source: "..\bin\release\EntityFramework.SqlServer.xml"; DestDir: "{app}"; Flags: ignoreversion  
Source: "..\bin\release\EntityFramework.SqlServerCompact.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\log4net.dll"; DestDir: "{app}"; Flags: ignoreversion 
Source: "..\bin\release\log4net.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\Jint.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\Microsoft.Data.Edm.dll"; DestDir: "{app}"; Flags: ignoreversion            
Source: "..\bin\release\SciLexer.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\SciLexer64.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\ScintillaNET.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\ScintillaNET.xml"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\System.Data.SqlServerCe.dll"; DestDir: "{app}"; Flags: ignoreversion 
Source: "..\bin\release\WPFToolkit.Extended.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\zvs.dll"; DestDir: "{app}"; Flags: ignoreversion 
Source: "..\bin\release\zvs.Entities.dll"; DestDir: "{app}"; Flags: ignoreversion 
Source: "..\bin\release\zvs.Entities.dll.config"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\zvs.zVirtualScenes.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\zVirtualScenes.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\bin\release\zVirtualScenes.exe.config"; DestDir: "{app}"; Flags: ignoreversion 
Source: "..\bin\release\WpfAnimatedGif.dll"; DestDir: "{app}"; Flags: ignoreversion 

;ADAPTERS BASE
Source: "..\bin\release\adapters\EntityFramework.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion  
;Source: "..\bin\release\adapters\EntityFramework.xml"; DestDir: "{app}\adapters"; Flags: ignoreversion              
Source: "..\bin\release\adapters\EntityFramework.SqlServer.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion  
;Source: "..\bin\release\adapters\EntityFramework.SqlServer.xml"; DestDir: "{app}\adapters"; Flags: ignoreversion
Source: "..\bin\release\adapters\Jint.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion
Source: "..\bin\release\adapters\log4net.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion
Source: "..\bin\release\adapters\zvs.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion
Source: "..\bin\release\adapters\zvs.Entities.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion

;OPENZWAVE ADAPTER
Source: "..\bin\release\adapters\OpenZWaveDotNet.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion  ; Components: openzwave
Source: "..\bin\release\adapters\OpenZWaveAdapter.dll"; DestDir: "{app}\adapters"; Flags: ignoreversion   ; Components: openzwave
Source: "..\bin\release\adapters\OpenZWaveAdapter.dll.config"; DestDir: "{app}\adapters"; Flags: ignoreversion ; Components: openzwave
Source: "..\bin\release\adapters\config\*"; DestDir: "{app}\adapters\config"; Flags: ignoreversion recursesubdirs    ; Components: openzwave

;SCRIPTS
Source: "..\bin\release\scripts\*.js"; DestDir: "{app}\scripts"; Flags: ignoreversion  ; Components: scripts


 ;PLUGINS BASE
Source: "..\bin\release\plugins\EntityFramework.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion         
Source: "..\bin\release\plugins\EntityFramework.SqlServer.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion   
Source: "..\bin\release\plugins\Jint.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\bin\release\plugins\log4net.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\bin\release\plugins\zvs.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\bin\release\plugins\zvs.Entities.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion
Source: "..\bin\release\plugins\zvs.zVirtualScenes.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion             
    
;Source: "..\bin\release\plugins\jabber-net.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: jabber  
;Source: "..\bin\release\plugins\JabberPlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: jabber  
;Source: "..\bin\release\plugins\JabberPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: jabber

;Source: "..\bin\release\plugins\Growl.Connector.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: growl
;Source: "..\bin\release\plugins\Growl.CoreLibrary.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: growl
;Source: "..\bin\release\plugins\GrowlPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: growl
;Source: "..\bin\release\plugins\GrowlPlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: growl

Source: "..\bin\release\plugins\HttpAPI.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion ; Components: http
Source: "..\bin\release\plugins\HttpAPI.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion; Components: http 

Source: "..\bin\release\plugins\LightSwitchPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion ; Components: lightswitch
Source: "..\bin\release\plugins\LightSwitchPlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: lightswitch
Source: "..\bin\release\plugins\Mono.Zeroconf.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion   ; Components: lightswitch
Source: "..\bin\release\plugins\Mono.Zeroconf.Providers.Bonjour.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion     ; Components: openzwave

Source: "..\bin\release\plugins\NOAAPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion     ; Components: noaa
Source: "..\bin\release\plugins\NOAAPlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion ; Components: noaa

Source: "..\bin\release\plugins\SpeechPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion      ; Components: speech
Source: "..\bin\release\plugins\SpeechPlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion   ; Components: speech
                                                                            
																			
Source: "..\bin\release\plugins\SmartPhonePlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion      ; Components: smartphone
Source: "..\bin\release\plugins\SmartPhonePlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion   ; Components: smartphone
																			
Source: "..\bin\release\plugins\AndroidTaskerPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion      ; Components: tasker																
																			
;Source: "..\bin\release\plugins\ControlThink.ZWave.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion      ; Components: controlthink
;Source: "..\bin\release\plugins\ThinkStickHIDPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion     ; Components: controlthink
;Source: "..\bin\release\plugins\ThinkStickHIDPlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: controlthink


Source: "..\bin\release\plugins\WebAPIPlugin.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion      ; Components: webapi
Source: "..\bin\release\plugins\WebAPIPlugin.dll.config"; DestDir: "{app}\plugins"; Flags: ignoreversion     ; Components: webapi
Source: "..\bin\release\plugins\Microsoft.Data.Edm.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\Microsoft.Data.OData.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\Newtonsoft.Json.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Net.Http.Formatting.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Spatial.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Web.Cors.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Web.Http.Cors.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Web.Http.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Web.Http.OData.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Web.Http.SelfHost.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi
Source: "..\bin\release\plugins\System.Web.Http.WebHost.dll"; DestDir: "{app}\plugins"; Flags: ignoreversion  ; Components: webapi


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall runascurrentuser 

#include "scripts\products.iss"
#include "scripts\products\stringversion.iss"
#include "scripts\products\winversion.iss"
#include "scripts\products\fileversion.iss"
#include "scripts\products\dotnetfxversion.iss"

#ifdef use_sqlcompact4
#include "scripts\products\sqlcompact4.iss"
#endif

#ifdef use_dotnetfx45
#include "scripts\products\dotnetfx45full.iss"
#endif

#ifdef use_vc2012
#include "scripts\products\vcredist2012.iss"
#endif


[Code]
function InitializeSetup(): boolean;
begin
	//init windows version
	initwinversion();

  	// if no .netfx 4.5 is found, install the full (smallest)
#ifdef use_dotnetfx45
if (not netfxinstalled(NetFx45Full, '')) then
		dotnetfx45full();
#endif

#ifdef use_sqlcompact4
sqlcompact4();
#endif

#ifdef use_vc2012
	vcredist2012();
#endif


	Result := true;
end;