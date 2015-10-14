class Step < ActiveRecord::Base
  belongs_to :recipe

  validates :recipe, :step_number, :description, presence: true
end
