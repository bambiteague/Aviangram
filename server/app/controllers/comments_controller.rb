class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def index
    comments = Comment.all

    render json: comments
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment, status: :created, location: comment
    else
      render json: comment.errors, status: :unprocessable_entity
    end
  end


  def destroy
    comment.destroy
  end

  private
  
    def set_comment
      comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
