<!---
	Author: Steve Good
--->
<cfcomponent>
	
	<cffunction name="saveComment" access="public" returntype="void" output="false">
		<cfargument name="comment" type="com.vo.Comment" required="true" />
		<cfset entitySave(arguments.comment) />
		<cfset ormFlush() />
	</cffunction>
	
	<cffunction name="deleteComment" access="public" returntype="void" output="false">
		<cfargument name="comment" type="com.vo.Comment" required="true" />
		<cfset entityDelete(arguments.comment) />
		<cfset ormFlush() />
	</cffunction>

</cfcomponent>