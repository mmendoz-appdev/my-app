class ChildBelongsTosController < ApplicationController
  def index
    matching_child_belongs_tos = ChildBelongsTo.all

    @list_of_child_belongs_tos = matching_child_belongs_tos.order({ :created_at => :desc })

    render({ :template => "child_belongs_tos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_child_belongs_tos = ChildBelongsTo.where({ :id => the_id })

    @the_child_belongs_to = matching_child_belongs_tos.at(0)

    render({ :template => "child_belongs_tos/show.html.erb" })
  end

  def create
    the_child_belongs_to = ChildBelongsTo.new
    the_child_belongs_to.parent_id = params.fetch("query_parent_id")
    the_child_belongs_to.child_id = params.fetch("query_child_id")

    if the_child_belongs_to.valid?
      the_child_belongs_to.save
      redirect_to("/child_belongs_tos", { :notice => "Child belongs to created successfully." })
    else
      redirect_to("/child_belongs_tos", { :alert => the_child_belongs_to.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_child_belongs_to = ChildBelongsTo.where({ :id => the_id }).at(0)

    the_child_belongs_to.parent_id = params.fetch("query_parent_id")
    the_child_belongs_to.child_id = params.fetch("query_child_id")

    if the_child_belongs_to.valid?
      the_child_belongs_to.save
      redirect_to("/child_belongs_tos/#{the_child_belongs_to.id}", { :notice => "Child belongs to updated successfully."} )
    else
      redirect_to("/child_belongs_tos/#{the_child_belongs_to.id}", { :alert => the_child_belongs_to.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_child_belongs_to = ChildBelongsTo.where({ :id => the_id }).at(0)

    the_child_belongs_to.destroy

    redirect_to("/child_belongs_tos", { :notice => "Child belongs to deleted successfully."} )
  end
end
