class PostsController < ApplicationController
  def index
    @title='Posts Index'
    # @posts = Post.all
    @post = Post.all.order(created_at: :desc)
  end

  def show
    @title='Show id'
    @post = Post.find_by(id: params[:id])
  end

  def new
    @title='Add new'
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts")
    else
      render("posts/new")
    end
  end

  def edit
    @title='Edit it'
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to('/posts')
    else
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts")
  end
end
