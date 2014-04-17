class Curso < ActiveRecord::Base
  attr_accessible :nome
  has_many :usuarios
  has_many :disciplinas

end
