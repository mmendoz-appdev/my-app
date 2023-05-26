# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  description   :text
#  members_count :integer
#  name          :string
#  private       :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  owner_id      :integer
#
class Group < ApplicationRecord

  belongs_to(:owner, { :required => true, :class_name => "User", :foreign_key => "owner_id" })

  has_many(:members, { :class_name => "Member", :foreign_key => "group_id", :dependent => :nullify })

end
