<cfsilent>
	<cfscript>
	// import the services package
	import com.service.*;
	// get the post beans from the postService
	posts = new PostService().getPosts();
	</cfscript>
</cfsilent>

<cfif arrayLen(posts)>
	<cfoutput>
		<!--- loop over the post entities --->
		<cfloop array="#posts#" index="post">
			<h2><a href="/viewPost.cfm?postID=#post.getPostID()#">#post.getTitle()#</a></h2>
			<p><strong>#DateFormat(post.getPublished(),'dd / mmmm / yy')# :: #TimeFormat(post.getPublished(),'short')#</strong><br/>
			#post.getBody()#<br/>
			<span>#ArrayLen(post.getComments())# Comments</span></p>
		</cfloop>
	</cfoutput>
<cfelse>
	<h2>No Content</h2>
	<p>No blog entries have been posted yet. <a href="/postEditor.cfm" title="Add a blog post">Add one now!</a></p>
</cfif>