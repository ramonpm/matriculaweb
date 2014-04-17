class Aluno < ActiveRecord::Base
  self.primary_key = "matricula"
  attr_accessible :curso, :matricula, :matriz_curso, :mga, :mgc, :mra, :nome, :p, :qr, :ta, :ti
  has_one :usuario
end
