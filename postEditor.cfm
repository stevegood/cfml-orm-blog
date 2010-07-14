<!---
	author: Steve Good
--->

<cfparam name="url.postid" default="0" type="numeric" />
<cfparam name="url.action" default="" type="string" />

<cfset postTitle = "" />
<cfset postBody = "" />

<cfscript>
import com.service.PostService;
postSvc = new PostService();
</cfscript>

<cfif url.postid NEQ 0>
	
	<cfset postArray = postSvc.getPost(url.postid) />
	<cfif ArrayLen(postArray)>
		<cfset post = postArray[1] />
		
		<cfset postTitle = post.getTitle() />
		<cfset postBody = post.getBody() />
		
		<cfif url.action IS 'delete'>
			<cfset postSvc.deletePost(post) />
			<cflocation url="/" addtoken="false" />
		</cfif>
	<cfelse>
		No blog post with that ID could be located.
		<cfabort />
	</cfif>
	
</cfif>

<cfif isDefined('form.submit')>
	<cfscript>
	import com.vo.Post;
	nextLocation = '/viewPost.cfm?postid=' & url.postid;
	if (url.postid == 0){
		nextLocation = '/';
		post = new Post();
		post.setPublished(now());
	}
	post.setTitle(form.postTitle);
	post.setBody(form.postBody);
	
	postSvc.savePost(post);
	location(nextLocation);
	</cfscript>
<cfelse>

	<cfoutput>
		
		      
		<!--- display the edit / new form --->
    	<form name="newPostForm" action="" method="post">
			<label for="postTitle">Title</label><br/>
			<input name="postTitle" id="postTitle" type="text" value="#postTitle#" /><br/>
			<label for="postBody">Body</label><br/>
			<textarea name="postBody" id="postBody" cols="32">#postBody#</textarea><br/>
			<button name="submit" type="submit">Publish Blog Post</button>
		</form>
			  
		
	</cfoutput>
</cfif>
