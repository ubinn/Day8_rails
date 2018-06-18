class TweetController < ApplicationController
    
    def index
        @contents = Tweet.all
       #  cookies[:user_name] = "신유빈"
    end
    
    def new
       # p request
    end
    
    def create
        t1=Tweet.new
        t1.contents=params[:content]
        t1.ip_address=request.ip
        t1.nickname=params[:nickname]
        #t1.time=request.date.to_s
        t1.save
        flash[:success] = "새 글이 등록되었습니다."
        redirect_to "/tweet/#{t1.id}"
    end
    
    def show
        @content = Tweet.find(params[:id])
    end
    
    def edit
        @tweet=Tweet.find(params[:id])
    end
    
    def update
        tweet=Tweet.find(params[:id])
        tweet.contents = params[:content]
        tweet.nickname=params[:nickname]
        tweet.ip_address = request.ip
        tweet.save
        flash[:success] = "글이 수정되었습니다."
        redirect_to "/tweet/#{tweet.id}"
    end
    
    def destroy
        id=Tweet.find(params[:id])
        id.destroy
        flash[:error] = "글이 삭제되었습니다."
        redirect_to "/tweet"
    end

    
end
