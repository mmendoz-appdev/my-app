# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class Like < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:photo, { :required => true, :class_name => "Post", :foreign_key => "post_id", :counter_cache => true })

  validates(:user_id, { :presence => true })

  validates(:post_id, { :presence => true })

  validates(:post_id, { :uniqueness => { :scope => ["user_id"], :message => "already liked" } })

end
