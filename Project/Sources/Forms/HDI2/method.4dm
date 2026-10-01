C_REAL:C285($result)
C_TEXT:C284($userParam)
C_OBJECT:C1216($userObject)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.trace:=False:C215
		
		$result:=Get database parameter:C643(User param value:K37:94; $userParam)
		
		If ($userParam="")
			
			ALL RECORDS:C47([DOC:1])
			Form:C1466.count:=0
			Form:C1466.infos:=[DOC:1]Description:6
			OBJECT SET VISIBLE:C603(*; "btnHDI"; False:C215)
			
			ST SET ATTRIBUTES:C1093(*; "infos"; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 18)
			
		Else 
			
			//not the first launch
			
			$userObject:=JSON Parse:C1218($userParam)
			
			Form:C1466.date:=Date:C102($userObject.date)
			Form:C1466.time:=Time:C179($userObject.time)
			Form:C1466.count:=$userObject.count
			
			Form:C1466.infos:=""
			Form:C1466.infos:=Form:C1466.infos+"This database has been relaunched!"+Char:C90(Carriage return:K15:38)
			Form:C1466.infos:=Form:C1466.infos+"On: "+String:C10(Form:C1466.date; System date short:K1:1)+Char:C90(Carriage return:K15:38)
			Form:C1466.infos:=Form:C1466.infos+"At: "+Time string:C180(Form:C1466.time)+Char:C90(Carriage return:K15:38)
			Form:C1466.infos:=Form:C1466.infos+"Relanch number: "+String:C10(Form:C1466.count)
			
			OBJECT SET VISIBLE:C603(*; "btnHDI"; True:C214)
			
		End if 
		
End case 