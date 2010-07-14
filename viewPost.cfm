<!---
	author: Steve Good
--->

<cfparam name="url.postid" default="0" type="numeric" />

<cfscript>
import com.service.PostService;
postArray = new PostService().getPost(url.postid);
</cfscript>

<cfif ArrayLen(postArray)>
	<cfset post = postArray[1] />
<cfelse>
	No blog post with that ID could be located.
	<cfabort />
</cfif>


<cfoutput>
<div class="right"><a href="/postEditor.cfm?postid=#post.getPostID()#">edit</a> || <a href="/postEditor.cfm?postid=#post.getPostID()#&action=delete">delete</a></div>
<h2>#post.getTitle()#</h2>
<p><strong>#DateFormat(post.getPublished(),'dd / mmmm / yy')# :: #TimeFormat(post.getPublished(),'short')#</strong><br/>
#post.getBody()#</p>

<div>
	<h4>comments (<a href="/commentEditor.cfm?postid=#post.getPostID()#">add comment</a>)</h4>
	<cfloop array="#post.getComments()#" index="comment">
		<div class="bg"></div>
		<div>
			<div>#comment.getCommenterName()# says:</div>
			<div>#comment.getCommentBody()#</div>
			<div>on #DateFormat(comment.getPublished(),'long')# at #TimeFormat(comment.getPublished(),'short')#</div>
		</div>
	</cfloop>
</div>
</cfoutput>
