class Address < ActiveRecord::Base
  belongs_to :person

  validates :line1, presence: true
end
