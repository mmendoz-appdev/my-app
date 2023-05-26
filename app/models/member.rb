# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  member_id  :integer
#
class Member < ApplicationRecord

  belongs_to(:member, { :required => true, :class_name => "User", :foreign_key => "member_id", :counter_cache => :memberships_count })

  belongs_to(:group, { :required => true, :class_name => "Group", :foreign_key => "group_id", :counter_cache => true })

end
