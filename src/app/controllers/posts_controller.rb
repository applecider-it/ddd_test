class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    repository = Posts::ActiveRecord::PostRepositoryImpl.new
    @posts = repository.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post_form = Posts::PostForm.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post_form = Posts::PostForm.new(post_params)

    if @post_form.valid?
      new_id = Posts::UseCases::CreatePost.new(Posts::ActiveRecord::PostRepositoryImpl.new).call(
        title: Posts::Entities::Post::Title.new(@post_form.title),
        content: Posts::Entities::Post::Content.new(@post_form.content)
      )
      redirect_to post_path(new_id), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @post_form = Posts::PostForm.new
    @post_form.assign_attributes(post_params)

    if @post_form.valid?
      Posts::UseCases::UpdatePost.new(Posts::ActiveRecord::PostRepositoryImpl.new).call(
        id: @post.id,
        title: Posts::Entities::Post::Title.new(@post_form.title),
        content: Posts::Entities::Post::Content.new(@post_form.content)
      )

      redirect_to post_path(@post.id), notice: "Post was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    Posts::UseCases::DeletePost.new(Posts::ActiveRecord::PostRepositoryImpl.new).call(
      id: @post.id,
    )

    redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      repository = Posts::ActiveRecord::PostRepositoryImpl.new
      @post = repository.find(params.expect(:id))
      @post_form = Posts::PostForm.new
      @post_form.title = @post.title
      @post_form.content = @post.content
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :title, :content ])
    end
end
