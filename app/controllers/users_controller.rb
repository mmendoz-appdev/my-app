class UsersController < ApplicationController
 
  def index  
    @q = User.ransack(params[:q])
    @user = @q.result

    render({ :template => "user_templates/index.html.erb" })
  end
 
  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_user.at(0)

    render({ :template => "user_templates/show.html.erb" })
  end
end
