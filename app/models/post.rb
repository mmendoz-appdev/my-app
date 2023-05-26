# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  caption        :string
#  comments_count :integer
#  likes_count    :integer
#  location       :string
#  text           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  group_id       :integer
#  owner_id       :integer
#
class Post < ApplicationRecord

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id", :counter_cache => :own_photos_count })

  has_many(:likes, { :class_name => "Like", :foreign_key => "post_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "post_id", :dependent => :destroy })

  has_many(:fans, { :through => :likes, :source => :user })

  has_many(:followers, { :through => :owner, :source => :following })

  has_many(:fan_followers, { :through => :fans, :source => :following })

  validates(:text, { :presence => true })

  validates(:owner_id, { :presence => true })

end
