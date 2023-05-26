# == Schema Information
#
# Table name: users
#
#  id                             :integer          not null, primary key
#  babysitting                    :boolean
#  bio                            :text
#  children_count                 :integer
#  email                          :string
#  first_name                     :string
#  friends                        :boolean
#  language_1                     :string
#  language_2                     :string
#  language_3                     :string
#  last_name                      :string
#  memberships_count              :integer
#  military_spouse                :boolean
#  nanny_sharing                  :boolean
#  nationality_1                  :string
#  nationality_2                  :string
#  occupation                     :string
#  own_photos_count               :integer
#  password_digest                :string
#  playdates                      :boolean
#  profile_picture                :string
#  received_follow_requests_count :integer
#  religion                       :string
#  sent_follow_requests_count     :integer
#  special_needs_parent           :boolean
#  support                        :boolean
#  zipcode                        :string
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password


  has_many(:likes, { :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy })

  has_many(:sent_follow_requests, { :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy })

  has_many(:received_follow_requests, { :class_name => "FollowRequest", :foreign_key => "recipient_id", :dependent => :destroy })

  has_many(:own_photos, { :class_name => "Post", :foreign_key => "owner_id", :dependent => :destroy })

  has_many(:groups, { :class_name => "Group", :foreign_key => "owner_id", :dependent => :nullify })

  has_many(:memberships, { :class_name => "Member", :foreign_key => "member_id", :dependent => :destroy })

  has_many(:children, { :class_name => "ChildBelongsTo", :foreign_key => "parent_id", :dependent => :destroy })

  has_many(:parent_interests, { :class_name => "ParentInterest", :foreign_key => "parent_id", :dependent => :destroy })

  has_many(:following, { :through => :sent_follow_requests, :source => :recipient })

  has_many(:followers, { :through => :received_follow_requests, :source => :sender })

  has_many(:liked_photos, { :through => :likes, :source => :photo })

  has_many(:feed, { :through => :following, :source => :own_photos })

  has_many(:activity, { :through => :following, :source => :liked_photos })

end
