# == Schema Information
#
# Table name: child_belongs_tos
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  child_id   :integer
#  parent_id  :integer
#
class ChildBelongsTo < ApplicationRecord

  belongs_to(:parent, { :required => true, :class_name => "User", :foreign_key => "parent_id", :counter_cache => :children_count })

  belongs_to(:child, { :class_name => "Child", :foreign_key => "child_id" })

end
