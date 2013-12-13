class PostsController < ApplicationController

def new
 @post = Post.new
end


def create
   @post = Post.new(params[:post].permit(:title, :text,:email))
 
  if @post.save
    redirect_to @post
	flash[:notice] = "Post kreiran"
  else
    flash[:alert] = "Neki problemi jebote!"
	render 'new'	
  end
end

def index
  @posts = Post.all
end

def show
  @post = Post.find(params[:id])
end 



def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:title, :text, :email))
    redirect_to @post
	flash[:notice] = "Post updatean"
  else
	flash[:alert] = "Neki problemi jebote!"
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
  flash[:notice] = "Post obrisan"
end

#paziti jer kod ispod privatea nece da sljaka!
private
  def post_params
    params.require(:post).permit(:title, :text, :email)
  end


end
