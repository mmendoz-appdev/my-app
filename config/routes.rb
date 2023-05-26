Rails.application.routes.draw do
 # Routes for the Parent interest resource:

  # CREATE
  post("/insert_parent_interest", { :controller => "parent_interests", :action => "create" })
          
  # READ
  get("/parent_interests", { :controller => "parent_interests", :action => "index" })
  
  get("/parent_interests/:path_id", { :controller => "parent_interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_parent_interest/:path_id", { :controller => "parent_interests", :action => "update" })
  
  # DELETE
  get("/delete_parent_interest/:path_id", { :controller => "parent_interests", :action => "destroy" })

  #------------------------------

  # Routes for the Interest resource:

  # CREATE
  get("/add_interests_form", { :controller => "interests", :action => "add_interests_form" })

  post("/insert_interest", { :controller => "interests", :action => "create" })
          
  # READ
  get("/interests", { :controller => "interests", :action => "index" })
  
  get("/interests/:path_id", { :controller => "interests", :action => "show" })
  
  # UPDATE
  
  post("/modify_interest/:path_id", { :controller => "interests", :action => "update" })
  
  # DELETE
  get("/delete_interest/:path_id", { :controller => "interests", :action => "destroy" })

  #------------------------------

  # Routes for the Child belongs to resource:

  # CREATE
  post("/insert_child_belongs_to", { :controller => "child_belongs_tos", :action => "create" })
          
  # READ
  get("/child_belongs_tos", { :controller => "child_belongs_tos", :action => "index" })
  
  get("/child_belongs_tos/:path_id", { :controller => "child_belongs_tos", :action => "show" })
  
  # UPDATE
  
  post("/modify_child_belongs_to/:path_id", { :controller => "child_belongs_tos", :action => "update" })
  
  # DELETE
  get("/delete_child_belongs_to/:path_id", { :controller => "child_belongs_tos", :action => "destroy" })

  #------------------------------

  # Routes for the Child resource:

  # CREATE
  post("/insert_child", { :controller => "children", :action => "create" })
          
  # READ
  get("/children", { :controller => "children", :action => "index" })
  
  get("/children/:path_id", { :controller => "children", :action => "show" })
  
  # UPDATE
  
  post("/modify_child/:path_id", { :controller => "children", :action => "update" })
  
  # DELETE
  get("/delete_child/:path_id", { :controller => "children", :action => "destroy" })

  #------------------------------

  # Routes for the Group resource:

  # CREATE
  post("/insert_group", { :controller => "groups", :action => "create" })
          
  # READ
  get("/groups", { :controller => "groups", :action => "index" })
  
  get("/groups/:path_id", { :controller => "groups", :action => "show" })
  
  # UPDATE
  
  post("/modify_group/:path_id", { :controller => "groups", :action => "update" })
  
  # DELETE
  get("/delete_group/:path_id", { :controller => "groups", :action => "destroy" })

  #------------------------------

  # Routes for the Member resource:

  # CREATE
  post("/insert_member", { :controller => "members", :action => "create" })
          
  # READ
  get("/members", { :controller => "members", :action => "index" })
  
  get("/members/:path_id", { :controller => "members", :action => "show" })
  
  # UPDATE
  
  post("/modify_member/:path_id", { :controller => "members", :action => "update" })
  
  # DELETE
  get("/delete_member/:path_id", { :controller => "members", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Follow request resource:

  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })
          
  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  
  get("/follow_requests/:path_id", { :controller => "follow_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })
  
  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  get("/home", { :controller => "posts", :action => "index" })
  
  get("/posts/:path_id", { :controller => "posts", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  # Routes for the User resource:
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })   
  #CREATE PROFILE FORM
  get("/create_profile", { :controller => "user_authentication", :action => "create_profile_form" })   
  # CREATE ACCOUNT RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create_account"  })
  #CREATE PROFILE RECORD
  post("/create_user_profile", { :controller => "user_authentication", :action => "create_profile"  })
  #ADD INTERESTS
  post("/add_interests", { :controller => "user_authentication", :action => "add_interests"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
