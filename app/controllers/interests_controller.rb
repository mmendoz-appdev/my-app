class InterestsController < ApplicationController
  def add_interests_form

    render({ :template => "/add_interests_form.html.erb" })
  end
  
  def index
    matching_interests = Interest.all

    @list_of_interests = matching_interests.order({ :created_at => :desc })

    render({ :template => "interests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interests = Interest.where({ :id => the_id })

    @the_interest = matching_interests.at(0)

    render({ :template => "interests/show.html.erb" })
  end

  def create
    the_interest = Interest.new
    the_interest.parent_id = @current_user.id
    @the_interest.interest_1 = params.fetch("query_interest_1")
    @the_interest.interest_2 = params.fetch("query_interest_2")
    @the_interest.interest_3 = params.fetch("query_interest_3")
    @the_interest.interest_4 = params.fetch("query_interest_4")
    @the_interest.interest_5 = params.fetch("query_interest_5")

    if the_interest.valid?
      the_interest.save
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.interest = params.fetch("query_interest")
    the_interest.interested_parents_count = params.fetch("query_interested_parents_count")

    if the_interest.valid?
      the_interest.save
      redirect_to("/interests/#{the_interest.id}", { :notice => "Interest updated successfully."} )
    else
      redirect_to("/interests/#{the_interest.id}", { :alert => the_interest.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interest = Interest.where({ :id => the_id }).at(0)

    the_interest.destroy

    redirect_to("/interests", { :notice => "Interest deleted successfully."} )
  end
end
