class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]


  def index
    @posts = Post.order(id: :asc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  # 略
  def create
    # 次に注目！
    @post = Post.new(post_params)
    if @post.save
    redirect_to post, notice: "投稿しました"
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end
  # 略

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to @post
    redirect_to @post, alert: "削除しました"
  end

  private

  def set_post
  @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
