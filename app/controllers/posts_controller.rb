class PostsController < ApplicationController

    def index
        
        @posts = Post.all
        @posts = Post.order(created_at: :desc)
    
        if params[:search].present?
            @posts = @posts.where("live LIKE ?", '%' + params[:search] + '%')
        end
    
        if params[:searchfee].present?
            @posts = @posts.where(fees: params[:searchfee])
        end

        if params[:searchroof].present?
            @posts = @posts.where(roof: params[:searchroof])
        end

        if params[:searchrstaytime].present?
            @posts = @posts.where(staytime: params[:searchstaytime])
        end

        @posts = @posts.page(params[:page]).per(5)
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])

        @comments = @post.comments
        @comment = Comment.new
    end

    def edit
        @post = Post.find(params[:id])
    end



    
    def create
        post = Post.new(post_params)

        post.user_id = current_user.id

        if post.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            redirect_to :action => "show", :id => post.id
        else
            redirect_to :action => "new"
        end
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        respond_to do |format|
            format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

    private
    def post_params
        params.require(:post).permit(:live, :name, :adress, :time, :fee, :staytime, :roof, :image, :lat, :lng, :times, :fees, :comment2)
    end
    #ここまで
    
end