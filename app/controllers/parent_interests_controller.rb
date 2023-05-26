class ParentInterestsController < ApplicationController
  def index
    matching_parent_interests = ParentInterest.all

    @list_of_parent_interests = matching_parent_interests.order({ :created_at => :desc })

    render({ :template => "parent_interests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_parent_interests = ParentInterest.where({ :id => the_id })

    @the_parent_interest = matching_parent_interests.at(0)

    render({ :template => "parent_interests/show.html.erb" })
  end

  def create
    the_parent_interest = ParentInterest.new
    the_parent_interest.interest_id = params.fetch("query_interest_id")
    the_parent_interest.parent_id = params.fetch("query_parent_id")

    if the_parent_interest.valid?
      the_parent_interest.save
      redirect_to("/parent_interests", { :notice => "Parent interest created successfully." })
    else
      redirect_to("/parent_interests", { :alert => the_parent_interest.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_parent_interest = ParentInterest.where({ :id => the_id }).at(0)

    the_parent_interest.interest_id = params.fetch("query_interest_id")
    the_parent_interest.parent_id = params.fetch("query_parent_id")

    if the_parent_interest.valid?
      the_parent_interest.save
      redirect_to("/parent_interests/#{the_parent_interest.id}", { :notice => "Parent interest updated successfully."} )
    else
      redirect_to("/parent_interests/#{the_parent_interest.id}", { :alert => the_parent_interest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_parent_interest = ParentInterest.where({ :id => the_id }).at(0)

    the_parent_interest.destroy

    redirect_to("/parent_interests", { :notice => "Parent interest deleted successfully."} )
  end
end
