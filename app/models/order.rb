class Order < ActiveRecord::Base
  belongs_to :company
  #INFO: Podemos nombrar de manera más semántica nuestras asociaciones, para eso Rails nos provee
  #    opciones para el método belongs_to. Como vamos a llamar "messenger" a nuestra asociación debemos
  #    indicarle cual es el nombre de la foreign_key por donde Rails va a realizar el query y cual es el nombre
  #    de la clase a quien nos estamos refiriendo.
  belongs_to :messenger, foreign_key: "person_id", class_name: "Person"
end
