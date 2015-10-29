class Step < ActiveRecord::Base
  belongs_to :recipe

  validates :step_number, :description, presence: true
end
