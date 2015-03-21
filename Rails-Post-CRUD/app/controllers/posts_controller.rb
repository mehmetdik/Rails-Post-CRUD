class PostsController < ApplicationController

def index
	@posts = Post.all
end

def show
	@post=Post.find(params[:id])
end

def new 
	@post = Post.new
end

def create
	@post = Post.new(post_params)

	if @post.save
		redirect_to posts_path, :notice => "Your post was saved"
	else
		render "new"
	end

end

def edit

	@post = Post.find(params[:id])
end
	
def update
	@post = Post.find(params[:id])

	if @post =update_attributes(post_params)
		redirect_to posts_path, :notice => "Your post has been update"
	else
		render "edit"
	end

end

def destroy

end

private

  def post_params
    params.require(:post).permit(:title,:content)
  end

end
