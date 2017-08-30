Dim MGMTSRV
MGMTSRV = "YOURURL"
Dim MGMTSVC
MGMTSVC = "inv"
Dim nodename
Dim nodeipaddrs
nodeipaddrs = ""
Set objnetwork = WScript.CreateObject("WScript.Network")
nodename = objnetwork.ComputerName

Dim XmlHttpClient
Set XmlHttpClient = WScript.CreateObject("MSXML2.XMLHTTP")

strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colItems = objWMIService.ExecQuery("Select IPAddress From Win32_NetworkAdapterConfiguration Where IPEnabled = True")
For Each objItem in colItems
     For Each objAddress in objItem.IPAddress
   If NOT Instr(objAddress, ":") > 0 Then
        nodeipaddrs =  objAddress & "," & nodeipaddrs
   End If
     Next
Next
Wscript.Echo nodename & " has " & nodeipaddrs

XmlHttpClient.Open "GET", _
MGMTSRV & "/" & MGMTSVC  & "?" &  "nodename=" & nodename &  "&" &  "nodeipaddrs=" & nodeipaddrs & "&" &  "systype=" & "Windows"  , False
XmlHttpClient.Send
