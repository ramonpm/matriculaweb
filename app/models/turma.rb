class Turma < ActiveRecord::Base
  attr_accessible :dias_horarios
  validates_uniqueness_of :dias_horarios
  has_many :turmas_solicitacaos
end
