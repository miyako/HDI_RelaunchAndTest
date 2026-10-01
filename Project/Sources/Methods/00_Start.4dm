//%attributes = {}
#DECLARE($params : Object)

var $splashWindowTitle : Text
$splashWindowTitle:=""

var $i; $window; $x; $y; $right; $bottom : Integer
ARRAY LONGINT($windows; 0)

If (Count parameters:C259=0)
	
	WINDOW LIST($windows)
	
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$splashWindowTitle)
			GET WINDOW RECT($x; $y; $right; $bottom; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($x; $y; $right; $bottom; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name:C684; New object:C1471)
	
Else 
	
	SET MENU BAR(1)
	READ ONLY:C145(*)
	
	var $options : Object
	$options:=New object:C1471
	
	var $r : Real
	var $s : Text
	$r:=Get database parameter:C643(User param value:K37:94; $s)
	
	If ($s="")  // 1st launch
		
		$options.title:=Localized string("HDI_Title")
		$options.blog:="blog.4d.com"
		$options.info:=Localized string("HDI_Info")
		$options.minimumVersion:="1730"  // 1730 means 17R3   1701 means 17.1 (do not use !)
		
		//$options.license:=4D Write license  // IF ANY NEEDED
		
		$window:=Open form window:C675("HDI"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		SET WINDOW TITLE($splashWindowTitle; $window)
		DIALOG:C40("HDI"; $options; *)
		
	Else 
		// skip the 1st HDI dialog
		$options.quit:=False:C215
		
		$window:=Open form window:C675("HDI2"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		SET WINDOW TITLE($splashWindowTitle; $window)
		DIALOG:C40("HDI2"; $options; *)
		
	End if 
	
End if 
