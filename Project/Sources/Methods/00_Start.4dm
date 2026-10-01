//%attributes = {}
C_LONGINT:C283($1)
C_LONGINT:C283($ps; $win)
C_OBJECT:C1216($options)
C_TEXT:C284($cr)

Case of 
	: (Count parameters:C259=0)
		
		If (Application version:C493<"1650")  // 16R5
			ALERT:C41("Sorry, this \"How do I\" (HDI) example must be used with a newer version of 4D (v16 R5 and above)"; "Quit")
			QUIT 4D:C291
		Else 
			$ps:=New process:C317(Current method name:C684; 0; Current method name:C684; 0)
		End if 
		
	Else 
		
		$options:=New object:C1471
		
		C_REAL:C285($r)
		C_TEXT:C284($s)
		$r:=Get database parameter:C643(User param value:K37:94; $s)
		
		If ($s="")  // 1rst launch
			
			$cr:=Char:C90(Carriage return:K15:38)
			If (Shift down:C543)  //  for debug purpose only
				$win:=Open form window:C675("HDI"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
			Else 
				$win:=Open form window:C675("HDI"; Pop up form window:K39:11; Horizontally centered:K39:1; Vertically centered:K39:4)
			End if 
			
			$options.title:="test my own databases more easily and efficiently?"
			$options.blog:="blog.4d.com"
			$options.info:="Test & Quality Feature"  //ex : "4D View Pro feature"
			$options.minimumVersion:="1730"  // 1730 means 17R3   1701 means 17.1 (do not use !)
			
			//$options.license:=4D Write license  // IF ANY NEEDED
			
			DIALOG:C40("HDI"; $options)
			CLOSE WINDOW:C154
			
		Else 
			// skip the 1st HDI dialog
			$options.quit:=False:C215
		End if 
		
		If ($options.quit=True:C214)
			QUIT 4D:C291
		Else 
			
			READ ONLY:C145(*)
			$win:=Open form window:C675("HDI2"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
			DIALOG:C40("HDI2")
			CLOSE WINDOW:C154
			
		End if 
		
End case 

