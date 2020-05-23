class CodesController < ApplicationController
  before_action :set_code, only: :show

  def show

  end

  def new
    @code = Code.new
  end

  def create
    @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: 'Code was successfully created.' }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_code
    @code = Code.where('expired_at > ?', DateTime.now).find_by!(permalink: params[:id])
  end

  def code_params
    params.require(:code).permit(:title, :author, :code, :syntax_id, :expires)
  end
end
