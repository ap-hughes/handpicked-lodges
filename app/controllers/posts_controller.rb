class PostsController < ApplicationController
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @previous_post = @post.next
    @next_post = @post.previous
  end
end
