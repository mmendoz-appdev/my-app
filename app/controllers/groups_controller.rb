class GroupsController < ApplicationController
  def index
    matching_groups = Group.all

    @list_of_groups = matching_groups.order({ :created_at => :desc })

    render({ :template => "group_templates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_groups = Group.where({ :id => the_id })

    @the_group = matching_groups.at(0)

    render({ :template => "group_templates/show.html.erb" })
  end

  def create
    the_group = Group.new
    the_group.name = params.fetch("query_name")
    the_group.description = params.fetch("query_description")
    the_group.owner_id = @current_user.id
    the_group.private = params.fetch("query_private", false)

    if the_group.valid?
      the_group.save
      redirect_to("/groups", { :notice => "Group created successfully." })
    else
      redirect_to("/groups", { :alert => the_group.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.name = params.fetch("query_name")
    the_group.description = params.fetch("query_description")
    the_group.owner_id = @current_user.id
    the_group.private = params.fetch("query_private", false)

    if the_group.valid?
      the_group.save
      redirect_to("/groups/#{the_group.id}", { :notice => "Group updated successfully."} )
    else
      redirect_to("/groups/#{the_group.id}", { :alert => the_group.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_group = Group.where({ :id => the_id }).at(0)

    the_group.destroy

    redirect_to("/groups", { :notice => "Group deleted successfully."} )
  end
end
