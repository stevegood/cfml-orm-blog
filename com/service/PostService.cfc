<!---
	Author: Steve Good
--->
<cfcomponent>
	
	<cffunction name="getPosts" access="public" returntype="com.vo.Post[]" output="false">
		<cfreturn entityLoad('Post',{},'published desc') />
	</cffunction>
	
	<cffunction name="getPost" access="public" returntype="com.vo.Post[]" output="false">
		<cfargument name="postID" type="Numeric" required="true" />
		<cfreturn EntityLoad('Post',arguments.postID) />
	</cffunction> 
	
	<cffunction name="savePost" access="public" returntype="void" output="false">
		<cfargument name="post" type="com.vo.Post" required="true" />
		<cfset entitySave(arguments.post) />
		<cfset ormFlush() />
	</cffunction>
	
	<cffunction name="deletePost" access="public" returntype="void" output="false">
		<cfargument name="post" type="com.vo.Post" required="true" />
		<cfset entityDelete(arguments.post) />
		<cfset ormFlush() />
	</cffunction>
	
</cfcomponent>