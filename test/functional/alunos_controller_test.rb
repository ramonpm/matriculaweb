require 'test_helper'

class AlunosControllerTest < ActionController::TestCase
  setup do
    @aluno = alunos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alunos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aluno" do
    assert_difference('Aluno.count') do
      post :create, aluno: { curso: @aluno.curso, matricula: @aluno.matricula, matriz_curso: @aluno.matriz_curso, mga: @aluno.mga, mgc: @aluno.mgc, mra: @aluno.mra, nome: @aluno.nome, p: @aluno.p, qr: @aluno.qr, ta: @aluno.ta, ti: @aluno.ti }
    end

    assert_redirected_to aluno_path(assigns(:aluno))
  end

  test "should show aluno" do
    get :show, id: @aluno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aluno
    assert_response :success
  end

  test "should update aluno" do
    put :update, id: @aluno, aluno: { curso: @aluno.curso, matricula: @aluno.matricula, matriz_curso: @aluno.matriz_curso, mga: @aluno.mga, mgc: @aluno.mgc, mra: @aluno.mra, nome: @aluno.nome, p: @aluno.p, qr: @aluno.qr, ta: @aluno.ta, ti: @aluno.ti }
    assert_redirected_to aluno_path(assigns(:aluno))
  end

  test "should destroy aluno" do
    assert_difference('Aluno.count', -1) do
      delete :destroy, id: @aluno
    end

    assert_redirected_to alunos_path
  end
end
