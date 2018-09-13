class Recipe < ApplicationRecord
  belongs_to :user
  def chef
    user && user.name
  end
end
