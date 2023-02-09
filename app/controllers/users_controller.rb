class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @email = @user.email
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save, notice: "Usuário criado com sucesso."
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
    redirect_to edit_user_path, notice: "Usuário foi atualizado."
  end

  def destroy
    @user = User.find(params[:id])
    #  or/and admin
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
    # to add if necessary :name, :reset_password_sent_at, :remember_created_at, :reset_password_token
  end
end
