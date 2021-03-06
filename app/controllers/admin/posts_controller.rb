class Admin::PostsController < Admin::AdminController
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post!"
      redirect_to admin_posts_path
    else
      flash[:alert] = "Error creating new post!"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post"
      redirect_to admin_posts_path
    else
      flash[:alert] = "Error updating post"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Successfully deleted post!"
      redirect_to admin_posts_path
    else
      flash[:alert] = "Error deleting post!"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :photo, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
