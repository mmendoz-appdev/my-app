# == Schema Information
#
# Table name: interests
#
#  id                       :integer          not null, primary key
#  interest                 :string
#  interest_1               :boolean
#  interest_2               :boolean
#  interest_3               :boolean
#  interest_4               :boolean
#  interest_5               :boolean
#  interested_parents_count :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  parent_id                :integer
#
class Interest < ApplicationRecord

  has_many(:interested_parents, { :class_name => "ParentInterest", :foreign_key => "interest_id", :dependent => :nullify })


end
