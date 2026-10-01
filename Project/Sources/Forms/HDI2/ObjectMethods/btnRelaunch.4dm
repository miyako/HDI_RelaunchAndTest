C_OBJECT:C1216($userObject)
C_TEXT:C284($userParam)

If (Form:C1466.trace)
	TRACE:C157
End if 

$userObject:=New object:C1471()

$userObject.date:=Current date:C33
$userObject.time:=Current time:C178  // saved in seconds
$userObject.count:=Form:C1466.count+1

$userParam:=JSON Stringify:C1217($userObject)

SET DATABASE PARAMETER:C642(User param value:K37:94; $userParam)
RESTART 4D:C1292
