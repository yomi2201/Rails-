class UsersController < ApplicationController
  def index
    @title='Users Index'
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @title='Add new'
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name: "github.png",
      # password: params[:password]
    )
    if @user.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/users/#{@user.id}")
    else
      render("/users/new")
    end
  end

  def edit
    @title='Edit it'
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name  = params[:name]
    @user.email = params[:email]
    # @user.image_name = "#{user.id}.jpg"
    
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("/users/edit")
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/users")
  end
end
