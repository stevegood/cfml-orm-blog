<!---
	Author: Steve Good
--->
<cfcomponent displayname="A blog post comment" persistent="true">
	
	<cfproperty name="commentID" type="numeric" datatype="integer" fieldtype="id" generator="identity" />
	<cfproperty name="post" fieldtype="many-to-one" cfc="com.vo.Post" fkcolumn="postID" missingrowignored="true" />
	<cfproperty name="commenterName" type="string" length="255" />
	<cfproperty name="commenterEmail" type="string" />
	<cfproperty name="commentBody" type="string" />
	<cfproperty name="published" type="date" fieldtype="timestamp" />
	
</cfcomponent>