class CommentsController < ApplicationController
  before_action :set_code, only: %i(new create)

  def new
    @comment = @code.comments.new
  end

  def create
    @comment = @code.comments.new(comments_params)
    @comment.line = params[:line_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to code_path @code, anchor: "l#{params[:line_id]}" }
        format.json { render :show, status: :created, location: @comment.code }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_code
    @code = Code.active params[:code_id]
  end

  def comments_params
    params.require(:comment).permit(:comment, :author, :line_id)
  end
end
