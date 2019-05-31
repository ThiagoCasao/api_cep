require 'test_helper'

class EstadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado = estados(:one)
  end

  test "should get index" do
    get estados_url, as: :json
    assert_response :success
  end

  test "should create estado" do
    assert_difference('Estado.count') do
      post estados_url, params: { estado: { uf: @estado.uf } }, as: :json
    end

    assert_response 201
  end

  test "should show estado" do
    get estado_url(@estado), as: :json
    assert_response :success
  end

  test "should update estado" do
    patch estado_url(@estado), params: { estado: { uf: @estado.uf } }, as: :json
    assert_response 200
  end

  test "should destroy estado" do
    assert_difference('Estado.count', -1) do
      delete estado_url(@estado), as: :json
    end

    assert_response 204
  end
end
