class RelatoriosController < ApplicationController
  before_filter :authenticate_usuario!

  def index
    @solicitacaos = Solicitacao.find(:all,  :joins => [:usuario], :conditions => {'usuarios.curso_id' => current_usuario.curso_id})
    @items = Array.new
    @items << ["Numero da Solicitacao", "Usuario"]
    
    @solicitacaos.each do |solicitacao| 
      @items << [solicitacao.id.to_s, solicitacao.usuario.nome]
    end 
  end

  def inclusoes_por_turma
    @turmas_solicitacaos = TurmasSolicitacao.find(:all,  :joins => [:disciplina => :curso], :conditions => {'cursos.id' => current_usuario.curso_id, 'turmas_solicitacaos.acao' => INCLUIR}, :order => 'disciplinas.nome asc')
  end

  def exclusoes_por_turma
  	@turmas = Turma.find(:all,  :joins => [:disciplina => :curso], :conditions => {'cursos.id' => current_usuario.curso_id}, :order => 'disciplinas.nome asc')
  end

  def inclusoes
    #@turma = Turma.find(params[:turma_id])
    @turmas_solicitacaos = TurmasSolicitacao.find(:all,  :joins => [:turma, :solicitacao => {:usuario => :aluno}], :conditions => {'usuarios.curso_id' => current_usuario.curso_id, 'turmas_solicitacaos.acao' => INCLUIR}, :order => 'alunos.p desc')
    
    @items = Array.new
    @items << ["Disciplina", "Turma","Curso Disciplina" ,"Matricula", "Indice de Prioridade"]
    @turmas_solicitacaos.each do |t| 
      @items << [t.disciplina.nome, t.turma.dias_horarios, t.disciplina.curso.nome, t.solicitacao.usuario.matricula.to_s, t.solicitacao.usuario.aluno.p] 
    end

  end

  def exclusoes
    #@turma = Turma.find(params[:turma_id])
    @turmas_solicitacaos = TurmasSolicitacao.find(:all,  :joins => [:turma, :solicitacao => {:usuario => :aluno}], :conditions => {'usuarios.curso_id' => current_usuario.curso_id, 'turmas_solicitacaos.acao' => EXCLUIR}, :order => 'alunos.p desc')
    
    @items = Array.new
    @items << ["Disciplina", "Turma","Curso Disciplina" ,"Matricula", "Indice de Prioridade"]
    @turmas_solicitacaos.each do |t| 
      @items << [t.disciplina.nome, t.turma.dias_horarios, t.disciplina.curso.nome, t.solicitacao.usuario.matricula.to_s, t.solicitacao.usuario.aluno.p] 
    end

  end
end
