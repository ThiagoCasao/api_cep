class EstadosController < ApplicationController
  before_action :set_estado, only: [:show, :update, :destroy]

  # GET /estados
  def index
    @estados = Estado.all

    render json: @estados
  end

  # GET /estados/1
  def show
    render json: @estado
  end

  # POST /estados
  def create
    @estado = Estado.new(estado_params)

    if @estado.save
      render json: @estado, status: :created, location: @estado
    else
      render json: @estado.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /estados/1
  def update
    if @estado.update(estado_params)
      render json: @estado
    else
      render json: @estado.errors, status: :unprocessable_entity
    end
  end

  # DELETE /estados/1
  def destroy
    @estado.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def estado_params
      params.require(:estado).permit(:uf)
    end
end
