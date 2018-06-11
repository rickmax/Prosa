class PropostasController < ApplicationController
    skip_before_filter :verify_authenticity_token  
    before_action :set_proposta, only: [:show, :edit, :update, :destroy]

  def index
    @propostas = Propostum.all
    
    render json: @propostas
  end

  def show
    @proposta = Propostum.find(params[:id])
    render json: @proposta
  end

  def new
    @proposta = Propostum.new
  end

  def edit
    @proposta = Propostum.find(params[:id])
    render json: @proposta
  end

  def create
    @proposta = Propostum.new(proposta_params)

      if @proposta.save
        @proposta.update(descricao: set_html_safe(proposta_params[:descricao]))
        render json: @propostas
      else
        render json: @propostas.errors
      end
  end

  def update
    if @proposta.update(proposta_params)
      @proposta.update(descricao: set_html_safe(proposta_params[:descricao]))
      render json: @proposta
    else
      render json: @proposta.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @proposta.destroy
    render json: @proposta
  end

  def set_html_safe(str)
    str = ActionView::Base.full_sanitizer.sanitize(str)
  end

  private
    def set_proposta
      @proposta = Propostum.find(params[:id])
    end

    def proposta_params
      params.require(:proposta).permit(:nome, :descricao, :valor, :inicio, :fim, :estado, :cidade)
    end
end
