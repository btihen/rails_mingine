class Blogs::UsersController < ApplicationController
  before_action :set_blogs_user, only: %i[ show edit update destroy ]

  # GET /blogs/users or /blogs/users.json
  def index
    @blogs_users = Blogs::User.all
  end

  # GET /blogs/users/1 or /blogs/users/1.json
  def show
  end

  # GET /blogs/users/new
  def new
    @blogs_user = Blogs::User.new
  end

  # GET /blogs/users/1/edit
  def edit
  end

  # POST /blogs/users or /blogs/users.json
  def create
    @blogs_user = Blogs::User.new(blogs_user_params)

    respond_to do |format|
      if @blogs_user.save
        format.html { redirect_to user_url(@blogs_user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @blogs_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blogs_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/users/1 or /blogs/users/1.json
  def update
    respond_to do |format|
      if @blogs_user.update(blogs_user_params)
        format.html { redirect_to user_url(@blogs_user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @blogs_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blogs_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/users/1 or /blogs/users/1.json
  def destroy
    @blogs_user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogs_user
      @blogs_user = Blogs::User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blogs_user_params
      params.require(:user).permit(:full_name, :email)
    end
end
