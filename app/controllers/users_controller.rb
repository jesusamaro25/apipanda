class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  #el wrap permite reducir el forma en que se envia el json
  #de {"user": {"name": "Konata"}} a {"name": "Konata"}
  wrap_parameters :user, include: [:username, :password, :name, :lastname, :bio, :photo]


  def follow #este metodo inserta un subdocumento seguidor en un documento usuario
    @users = User.where(username:params[:username]).push(seguidores:{user: params[:follower]})
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def numFollowers
    @users = User.collection.aggregate([{'$match':{'username': params[:username] }},
                                       {'$project': {seguidores:{'$size': '$seguidores'}}}]) 
    render json: @users 
  end


#-----------#
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    #def follow2 #este metodo inserta un subdocumento seguidor en un documento usuario
     # @users = User.where(username:params[:username]).push(seguidores:{user: params[:follower]})
    #end

    
    #Seguidores es el nombre del subdcoumento en la bd, el subdocumento tiene un campo llamdo user, y follower es el parámetro que debe entrar como Json.
#------------------------------------------------------------------------------------------------------------------#
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :name, :lastname, :bio, :photo, :follower)
    end
   

end
