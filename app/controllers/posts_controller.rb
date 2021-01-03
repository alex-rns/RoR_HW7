class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_cookies
  before_action :check_current_author, only: [:new, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(updated_at: :desc, created_at: :desc).paginate(page: params[:page], per_page: 8)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post.increment!(:post_views)
    @comments = if params.dig(:post, :comment_status) == "unpublished"
                  @post.comments.unpublished
                else
                  @post.comments.roots.published
                end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.author_id = current_author.id
    @post.name = @post.author.name_with_initial
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @posts = Post.where("content ILIKE ? OR title ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    render :index
  end

  private

  def set_cookies
    unless current_author
      cookies[:views] = cookies[:views] ? cookies[:views].to_i + 1 : 1
    end
  end

  def check_current_author
    unless current_author
      redirect_to home_url
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:name, :title, :content, :image)
  end
end
