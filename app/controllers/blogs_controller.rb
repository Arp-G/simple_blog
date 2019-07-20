class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]


  def index
    @blogs = Blog.all.order("created_at desc")
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)

      if @blog.save
         redirect_to @blog, notice: 'Blog was successfully created.' 
      else
        render :new 
      end

  end

  def update
  
      if @blog.update(blog_params)
        redirect_to @blog, notice: 'Blog was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    if @blog.destroy
      redirect_to blogs_url, notice: 'Blog was successfully destroyed.' 
    end
  end

  def search

    key = Regexp.new(params[:search],"i")
    @result = []
    Blog.all.each do |blog|
      if blog.title.match(key) or blog.author.match(key)
        @result<<blog
      end
    end
  end

  def get_pdf
    send_data make_pdf.render,
      filename: "blog_#{@blog.title}.pdf",
      type: 'application/pdf',
      disposition: 'inline'
  end


  private

    def set_blog
      @blog = Blog.find(params[:id])
    end


    def blog_params
      params.require(:blog).permit(:title, :author, :content)
    end

    def make_pdf
      Prawn::Document.new do |pdf|    
        @blog = Blog.find(params[:blog_id])   
        pdf.text <<-STR,:inline_format => true

        <b>Title :</b> #{@blog.title} 

        <b>Author :</b> #{@blog.author} 

        #{@blog.content} 

        STR
      end
    end

end
