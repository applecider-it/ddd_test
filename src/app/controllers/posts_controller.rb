class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Posts::UseCases::AllPost.new(post_repository).call
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
      create_post_dto = Posts::Dto::CreatePostDto.new(
        title: @post_form.title,
        content: @post_form.content,
      )
      new_id = Posts::UseCases::CreatePost.new(post_repository).call(create_post_dto)
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
      update_post_dto = Posts::Dto::UpdatePostDto.new(
        id: @post_dto.id,
        title: @post_form.title,
        content: @post_form.content,
      )
      Posts::UseCases::UpdatePost.new(post_repository).call(update_post_dto)

      redirect_to post_path(@post_dto.id), notice: "Post was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    Posts::UseCases::DeletePost.new(post_repository).call(
      id: @post_dto.id,
    )

    redirect_to posts_path, notice: "Post was successfully destroyed.", status: :see_other
  end

  private
    def post_repository
      @post_repository ||= Posts::Repositories::PostRepository.new
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post_dto = Posts::UseCases::FindPost.new(post_repository).call(
        id: Integer(params.expect(:id)),
      )
      @post_form = Posts::PostForm.new
      @post_form.title = @post_dto.title
      @post_form.content = @post_dto.content
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :title, :content ])
    end
end
