<!---
	Author: Steve Good
--->
<cfcomponent>
	
	<cfscript>
	this.name = 'ormblog';
	this.datasource = 'ormblog';
	this.ormenabled = true;
	this.ormsettings = {dialect='MySQLwithInnoDB',cfclocation='com',dbcreate='update',logSQL=true};
	</cfscript>
	
</cfcomponent>