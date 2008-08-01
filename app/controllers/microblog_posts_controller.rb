class MicroblogPostsController < ApplicationController
  before_filter :load_microblog_posts, :only => [:index]
  before_filter :load_microblog_post,  :only => [:show]

protected
  def load_microblog_posts
    @microblog_posts = MicroblogPost.find(:all, :order => "created_at DESC")
  end

  def load_microblog_post
    @microblog_post = MicroblogPost.find(params[:id])
  end

public
  # GET /microblog_posts
  # GET /microblog_posts.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @microblog_posts }
    end
  end

  # GET /microblog_posts/1
  # GET /microblog_posts/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @microblog_post }
    end
  end
end
