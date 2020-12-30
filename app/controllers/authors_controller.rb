class AuthorsController < ApplicationController
  before_action :set_author, only: [:edit, :update]

  def index
    redirect_to signup_url
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to profile_path, notice: "Profile was edited." }
        format.json { render profile_path, status: :ok, location: profile_path }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      redirect_to home_path, notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name, :email, :password, :password_confirmation, :gender, :birthday, :avatar)
  end

  def set_author
    @author = current_author
  end
end
