class AlunosController < ApplicationController
  before_filter :authenticate_usuario! 
  
  # GET /alunos
  # GET /alunos.json
  def import_page
    respond_to do |format|
      format.html # index.html.erb}
    end
  end

  def import
    if (Aluno.all).size > 0 then
      Aluno.delete_all
    end      
    file = params[:upload].read
    file.split("\n").each do |line|
      array = line.split(",")
      aluno = Aluno.new(
      :matriz_curso => array[1].split("-")[0].encode('UTF-8', :undef => :replace, :invalid => :replace,
    :replace => "?"),  
      :curso => array[1].split("-")[1].encode('UTF-8', :undef => :replace, :invalid => :replace,
    :replace => "?"),
      :matricula => array[15],
      :nome => array[16].encode('UTF-8', :undef => :replace, :invalid => :replace,
    :replace => "?"),
      :p => array[17],
      :ti => array[18],
      :ta => array[19],
      :qr => array[20],
      :mra => array[21],
      :mga => array[22],
      :mgc => array[23])
      aluno.save
    end

    respond_to do |format|
      @alunos = Aluno.all
      format.html { render action: "index", notice: 'Alunos importados com sucesso' }
    end
  end

  def index
    @alunos = Aluno.all(:order => :nome)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alunos }
    end
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
    @aluno = Aluno.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @aluno }
    end
  end

  # GET /alunos/new
  # GET /alunos/new.json
  def new
    @aluno = Aluno.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @aluno }
    end
  end

  # GET /alunos/1/edit
  def edit
    @aluno = Aluno.find(params[:id])
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(params[:aluno])

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Aluno foi criado com sucesso.' }
        format.json { render json: @aluno, status: :created, location: @aluno }
      else
        format.html { render action: "new" }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alunos/1
  # PUT /alunos/1.json
  def update
    @aluno = Aluno.find(params[:id])

    respond_to do |format|
      if @aluno.update_attributes(params[:aluno])
        format.html { redirect_to @aluno, notice: 'Aluno was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno = Aluno.find(params[:id])
    @aluno.destroy

    respond_to do |format|
      format.html { redirect_to alunos_url }
      format.json { head :no_content }
    end
  end
end
