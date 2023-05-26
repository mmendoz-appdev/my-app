class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all

    @list_of_comments = matching_comments.order({ :created_at => :desc })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comments = Comment.where({ :id => the_id })

    @the_comment = matching_comments.at(0)

    render({ :template => "comments/show.html.erb" })
  end

  def create
    the_comment = Comment.new
    the_comment.body = params.fetch("query_body")
    the_comment.commenter_id = params.fetch("query_commenter_id")
    the_comment.post_id = params.fetch("query_post_id")

    if the_comment.valid?
      the_comment.save
      redirect_to("/posts/#{the_comment.post_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/posts/#{the_comment.post_id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)

    the_comment.destroy

    redirect_to("/posts/#{the_comment.post_id}", { :notice => "Comment deleted successfully."} )
  end
end
