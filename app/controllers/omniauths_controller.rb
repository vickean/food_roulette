class OmniauthsController < ApplicationController
  before_action :set_omniauth, only: [:show, :edit, :update, :destroy]

  # GET /omniauths
  # GET /omniauths.json
  def index
    @omniauths = Omniauth.all
  end

  # GET /omniauths/1
  # GET /omniauths/1.json
  def show
  end

  # GET /omniauths/new
  def new
    @omniauth = Omniauth.new
  end

  # GET /omniauths/1/edit
  def edit
  end

  # POST /omniauths
  # POST /omniauths.json
  def create
    @omniauth = Omniauth.new(omniauth_params)

    respond_to do |format|
      if @omniauth.save
        format.html { redirect_to @omniauth, notice: 'Omniauth was successfully created.' }
        format.json { render :show, status: :created, location: @omniauth }
      else
        format.html { render :new }
        format.json { render json: @omniauth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /omniauths/1
  # PATCH/PUT /omniauths/1.json
  def update
    respond_to do |format|
      if @omniauth.update(omniauth_params)
        format.html { redirect_to @omniauth, notice: 'Omniauth was successfully updated.' }
        format.json { render :show, status: :ok, location: @omniauth }
      else
        format.html { render :edit }
        format.json { render json: @omniauth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /omniauths/1
  # DELETE /omniauths/1.json
  def destroy
    @omniauth.destroy
    respond_to do |format|
      format.html { redirect_to omniauths_url, notice: 'Omniauth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_omniauth
      @omniauth = Omniauth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def omniauth_params
      params.fetch(:omniauth, {})
    end
end