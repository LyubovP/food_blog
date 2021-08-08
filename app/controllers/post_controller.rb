class PostController < ApplicationController
  #befor_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
  end
  
  def new
    @post = Post.new
   # @post = current_user.posts.build
  end
  
  def edit
  end
    
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @post.update(post_params)
      render_to @post, notice: 'Post was successfully update.'
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    render_to posts_url, notice: 'Post was successfully destroy.'
  end
      
  def store
    # upload image to cloudinary
   @image = Cloudinary::Uploader.upload(params[:media])
   # @image = Cloudinary::Uploader.upload("sample.jpg", :crop => "limit", :tags => "samples", :width => 3000, :height => 2000)
    # create a new post object and save to db
    @post = Post.new({:title => params[:title], :body => params[:body], :user => params[:user],  :media => @image['secure_url']})
   if @post.save
   Pusher.trigger('posts-channel','new-post', {
            id: @post.id,
            title: @post.title,
            media: @post.media,
            body: @post.body
          })
   end
    redirect_to ('/')
  end
  

    
  private
  
  def set_post
      @post = current_user.posts.find(params[:id])
  end
      
  def post_params
      params.require(:post).permit(:title, :media, :body)
  end
 end