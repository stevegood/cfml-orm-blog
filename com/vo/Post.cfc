<!---
	Author: Steve Good
--->
<cfcomponent hint="A blog post object" persistent="true">

	<cfproperty name="postID" type="Numeric" fieldtype="id" datatype="integer" generator="identity" />
	<cfproperty name="title" type="String" length="255" />
	<cfproperty name="body" type="String" />
	<cfproperty name="published" type="Date" fieldtype="timestamp" />
	<cfproperty name="comments" type="array" fieldtype="one-to-many" cfc="com.vo.Comment" fkcolumn="postID" inverse="true" cascade="all-delete-orphan" orderby="published" />

</cfcomponent>