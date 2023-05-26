class UserAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force users to sign in before any other actions.

  #skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "user_authentication_templates/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id
      
        redirect_to("/home", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication_templates/sign_up.html.erb" })
  end

  def create_account
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")

    save_status = @user.save

    if save_status == true
      session[:user_id] = @user.id
   
      redirect_to("/create_profile", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => @user.errors.full_messages.to_sentence })
    end
  end
    
  def create_profile_form
 
    render({ :template => "/create_profile.html.erb" })
  end

  def create_profile
    @user = @current_user
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    @user.zipcode = params.fetch("query_zipcode")
    @user.bio = params.fetch("query_bio")
    @user.occupation = params.fetch("query_occupation")
    @user.religion = params.fetch("query_religion")
    @user.military_spouse = params.fetch("query_military_spouse", false)
    @user.special_needs_parent = params.fetch("query_special_needs_parent", false)
    @user.nationality_1 = params.fetch("query_nationality_1")
    @user.language_1 = params.fetch("query_language_1")
    @user.language_2 = params.fetch("query_language_2")
    @user.profile_picture = params.fetch("query_profile_picture")
    @user.save

    redirect_to("/add_interests_form", { :notice => "Your profile has been created successfully!"})
  end

  def add_interests
    @user = @current_user
    @user.playdates = params.fetch("query_playdates", false)
    @user.friends = params.fetch("query_friends", false)
    @user.support = params.fetch("query_support", false)
    @user.babysitting = params.fetch("query_babysitting", false)
    @user.nanny_sharing = params.fetch("query_nanny_sharing", false)
    redirect_to("/home", { :notice => "Your interests have been added successfully!"})
  end
 
  def edit_profile_form
    render({ :template => "user_authentication_templates/edit_profile.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    @user.zipcode = params.fetch("query_zipcode")
    @user.bio = params.fetch("query_bio")
    @user.occupation = params.fetch("query_occupation")
    @user.religion = params.fetch("query_religion")
    @user.military_spouse = params.fetch("query_military_spouse", false)
    @user.special_needs_parent = params.fetch("query_special_needs_parent", false)
    @user.nationality_1 = params.fetch("query_nationality_1")
    @user.nationality_2 = params.fetch("query_nationality_2")
    @user.language_1 = params.fetch("query_language_1")
    @user.language_2 = params.fetch("query_language_2")
    @user.language_3 = params.fetch("query_language_3")
    @user.profile_picture = params.fetch("query_profile_picture")
    @user.sent_follow_requests_count = params.fetch("query_sent_follow_requests_count")
    @user.received_follow_requests_count = params.fetch("query_received_follow_requests_count")
    @user.own_photos_count = params.fetch("query_own_photos_count")
    @user.memberships_count = params.fetch("query_memberships_count")
    @user.children_count = params.fetch("query_children_count")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "user_authentication/edit_profile_with_errors.html.erb" , :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/home", { :notice => "User account cancelled" })
  end
end
