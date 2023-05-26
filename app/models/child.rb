# == Schema Information
#
# Table name: children
#
#  id         :integer          not null, primary key
#  age        :integer
#  first_name :string
#  gender     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Child < ApplicationRecord

  has_many(:parents, { :class_name => "ChildBelongsTo", :foreign_key => "child_id", :dependent => :nullify })


end
