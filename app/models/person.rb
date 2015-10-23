class Person < ActiveRecord::Base

  has_many :addresses, dependent: :destroy
  has_many :orders
  has_many :companies, through: :orders
  has_one :profile, dependent: :destroy

  accepts_nested_attributes_for :addresses

  validates :name, :lastname, presence: {message: "No debe estar vacio"}
  validates :ci, numericality: {only_integer: true, 
    greater_than: 99999, less_than:35000000}

  validate :check_year, unless: "birthday.nil?" 

  before_save :normalize

  def self.dame_by_name(name)
    where(name: name)
  end
  
  def full_name
    [name, lastname].join(" ")
  end

  private

  def normalize
    self.class.attribute_names.each do |attr| 
      self.send(attr).upcase! if self.send(attr).class == String
    end
  end

  def check_year
    if birthday.year > 2000
      errors.add(:birthday, "Debe ser mayor")
    end
  end
end