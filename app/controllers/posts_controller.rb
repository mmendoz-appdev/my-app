class PostsController < ApplicationController
  def index
    matching_posts = Post.all

    @list_of_posts = matching_posts.order({ :created_at => :desc })

    render({ :template => "posts_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_posts = Post.where({ :id => the_id })

    @the_post = matching_posts.at(0)

    render({ :template => "posts_templates/show.html.erb" })
  end

  def create
    the_post = Post.new
    the_post.caption = params.fetch("query_caption")
    the_post.text = params.fetch("query_text")
    the_post.owner_id = params.fetch("query_owner_id")
    the_post.location = params.fetch("query_location")
    the_post.group_id = params.fetch("query_group_id")


    if the_post.valid?
      the_post.save
      redirect_to("/home", { :notice => "Post created successfully." })
    else
      redirect_to("/home", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.caption = params.fetch("query_caption")
    the_post.text = params.fetch("query_text")
    the_post.owner_id = params.fetch("query_owner_id")
    the_post.location = params.fetch("query_location")
    the_post.group_id = params.fetch("query_group_id")
    the_post.likes_count = params.fetch("query_likes_count")
    the_post.comments_count = params.fetch("query_comments_count")

    if the_post.valid?
      the_post.save
      redirect_to("/posts/#{the_post.id}", { :notice => "Post updated successfully."} )
    else
      redirect_to("/posts/#{the_post.id}", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.destroy

    redirect_to("/home", { :notice => "Post deleted successfully."} )
  end
end
