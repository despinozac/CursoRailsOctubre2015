class Company < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  #INFO: De la misma manera para nombrar sistemáticamente nuestras asociaciones podemos usar las opciones que provee
  #     el método has_many para realizar esta tarea.
  #     Pueden encontrar mas información en: http://api.rubyonrails.org/v4.1.7/  (has_many)
  has_many :messengers, through: :orders, source: :messenger

  validates :name, :rif, presence: true
end
