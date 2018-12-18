class PostsController < ApplicationController
  def index
    @title='Posts Index'
    @post = Post.all
    # @post = Post.all.order(created_at: :desc)
  end

  def show
    @title='Show id'
    @post = Post.find_by(id:params[:id])
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to('posts/index')
  end

  def edit
    @title='Edit it'
    @post = Post.find_by(:id)
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to('posts/index')
  end

  def destroy
    @post = Post.find_by(:id)
    @post.destroy
    redirect_to('post/index')
  end
end
