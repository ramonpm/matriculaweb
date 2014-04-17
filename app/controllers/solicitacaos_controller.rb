class SolicitacaosController < ApplicationController
  before_filter :authenticate_usuario!
  skip_authorize_resource
  # GET /solicitacaos
  # GET /solicitacaos.json
  def index
    @solicitacaos = Solicitacao.find(:all, :conditions => {:usuario_id => current_usuario.id})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @solicitacaos }
    end
  end

  # GET /solicitacaos/1
  # GET /solicitacaos/1.json
  def show
    @solicitacao = Solicitacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solicitacao }
    end
  end

  def imprimir
    @solicitacao = Solicitacao.find(params[:id])
    @items = Array.new
    @items << ["Acao", "Turma", "Dias/Horario", "Curso"]
    turmas_solicitacaos = @solicitacao.turmas_solicitacaos
    turmas_solicitacaos.each do |t| 
      @items << [t.acao == 0 ? "Incluir " : "Excluir ", t.disciplina.nome, t.turma.dias_horarios, t.disciplina.curso.nome]
    end 
  end

  # GET /solicitacaos/new
  # GET /solicitacaos/new.json
  def new
    @solicitacao = Solicitacao.new
    @solicitacao.turmas_solicitacaos.build
    @turmas = Turma.all
    @disciplinas = Disciplina.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solicitacao }
    end
  end

  # GET /solicitacaos/1/edit
  def edit
    @solicitacao = Solicitacao.find(params[:id])
    @solicitacao.turmas_solicitacaos.build
    @turmas = Turma.find(:all, :joins => [:disciplina], :order => 'disciplinas.nome')
  end

  # POST /solicitacaos
  # POST /solicitacaos.json
  def create
    @solicitacao = Solicitacao.new(params[:solicitacao])
    @solicitacao.usuario_id = current_usuario.id

    respond_to do |format|
      if @solicitacao.save
        format.html { redirect_to @solicitacao, notice: 'Solicitacao foi criado com sucesso.' }
        format.json { render json: @solicitacao, status: :created, location: @solicitacao }
      else
        format.html { render action: "new" }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /solicitacaos/1
  # PUT /solicitacaos/1.json
  def update
    @solicitacao = Solicitacao.find(params[:id])

    respond_to do |format|
      if @solicitacao.update_attributes(params[:solicitacao])
        format.html { redirect_to @solicitacao, notice: 'Solicitacao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @solicitacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicitacaos/1
  # DELETE /solicitacaos/1.json
  def destroy
    @solicitacao = Solicitacao.find(params[:id])
    @solicitacao.destroy

    respond_to do |format|
      format.html { redirect_to solicitacaos_url }
      format.json { head :no_content }
    end
  end
end
