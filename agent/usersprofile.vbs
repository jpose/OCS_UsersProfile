Const HKLM = &h80000002

Const profiles = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList"

Set wmi = GetObject("winmgmts://./root/cimv2")

Set reg = GetObject("winmgmts://./root/default:StdRegProv")

Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objNet = WScript.CreateObject("WScript.Network")

Set objFolder = objFSO.GetFolder("C:\Users\"& objNet.Username &"")

reg.EnumKey HKLM, profiles, subkeys

For Each sid In subkeys
  
  Set acct = wmi.Get("Win32_SID.SID='" & sid & "'")
  
  If (acct.ReferencedDomainName <> "AUTORITE NT") Then
  
	If (acct.AccountName = objNet.Username) Then
  
		PROFILESIZE = ROUND(getFolderSize(objFolder)/(1024*1024),0)
  
	Else PROFILESIZE = 0
	
	End If
	
    Wscript.Echo _
	"<USERSPROFILE>" & vbCrLf & _
	"<PROFILENAME>" & acct.ReferencedDomainName & "\" & acct.AccountName & "</PROFILENAME>" & vbCrLf & _ 
	"<PROFILESIZE>" & PROFILESIZE & "</PROFILESIZE>" & vbCrLf & _ 
	"</USERSPROFILE>"
    
	End If
 
Next

Function getFolderSize(folderName)	
    
	On Error Resume Next
    
	size = 0
    
	hasSubfolders = False
    
	Set folder = objFSO.GetFolder(folderName)
    
	Err.Clear
    
	size = folder.Size

    If Err.Number <> 0 then   
    
		For Each subfolder in folder.SubFolders
            size = size + getFolderSize(subfolder.Path)
            hasSubfolders = True
        Next

        If not hasSubfolders then
            size = folder.Size
        End If
    
	End If

    getFolderSize = size

    Set folder = Nothing        

End Function
