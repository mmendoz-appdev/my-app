# == Schema Information
#
# Table name: parent_interests
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  interest_id :integer
#  parent_id   :integer
#
class ParentInterest < ApplicationRecord

  belongs_to(:parent, { :required => true, :class_name => "User", :foreign_key => "parent_id" })

  belongs_to(:interest, { :required => true, :class_name => "Interest", :foreign_key => "interest_id", :counter_cache => :interested_parents_count })

end
