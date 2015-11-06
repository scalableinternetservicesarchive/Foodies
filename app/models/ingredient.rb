class Ingredient < ActiveRecord::Base
  belongs_to :recipe

  def self.search(search)
    search_condition = "%"+search+"%"
    where("name LIKE ?  ",  search_condition)
  end
end
