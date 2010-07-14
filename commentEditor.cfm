<!---
	author: Steve Good
--->

<cfparam name="url.postid" default="0" type="numeric" />


<cfif url.postid NEQ 0>

	<cfif isDefined('form.submit')>
		<cfscript>
		import com.service.*;
		import com.vo.Comment;
		
		url.postid = form.postid;
		</cfscript>
		
		<cfset postArray = new PostService().getPost(url.postid) />
		<cfif ArrayLen(postArray)>
			<cfscript>
			post = postArray[1];
			newComment = new Comment();
			newComment.setCommenterName(form.commenterName);
			newComment.setCommenterEmail(form.commenterEmail);
			newComment.setPost(post);
			newComment.setPublished(now());
			newComment.setCommentBody(form.commentBody);
			new CommentService().saveComment(newComment);
			location('/viewPost.cfm?postid=' & url.postid);
			</cfscript>
		<cfelse>
			No blog post with that ID could be located.
			<cfabort />
		</cfif>
	<cfelse>
		<cfoutput>
		<form name="addCommentForm" action="" method="post">
			<input type="hidden" name="postid" value="#url.postid#" />
			<label for="commenterName">Your Name</label><br/>
			<input name="commenterName" id="commenterName" type="text" /><br/>
			<label for="commenterEmail">Email Address</label><br/>
			<input name="commenterEmail" id="commenterEmail" type="text" /><br/>
			<label for="commentBody">Comment</label><br/>
			<textarea name="commentBody" id="commentBody" cols="35"></textarea><br/>
			<button name="submit" type="submit">Add Comment</button>
		</form>
		</cfoutput>
	</cfif>
<cfelse>
	No blog post with that ID could be located.
	<cfabort />
</cfif>
