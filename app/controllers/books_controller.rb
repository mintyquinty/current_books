
class BooksController < ApplicationController
  def index
    if request.post?
      type = params[:type]
      if type == 'ISBN'
        redirect_to :action => 'show_from_isbn', :ISBN => params[:q]
      elsif type == 'Title'
        redirect_to :action => 'show_from_title', :Title => params[:q]
      elsif type == 'FullTitle'
        redirect_to :action => 'show_from_full_title', :TitleArticle => params[:q], :Title => params[:q_prime]
      elsif type == 'AuthorLastName'
        redirect_to :action => 'show_from_author_last_name', :AuthorLastName => params[:q]
      elsif type == 'Author'
        redirect_to :action => 'show_from_author_full_name', :AuthorFirstName => params[:q], :AuthorLastName => params[:q_prime]
      else
        redirect_to :action => 'show', :id => params[:q]
      end
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(params[:book])
    @book.save
    redirect_to :action => 'show', :id => @book.id
  end

  def edit
    @book = Book.find(params[:id])
    if request.post? 
      @book.update_attributes(params[:book]) 
      redirect_to :action => 'show', :id => @book.id
    end
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.all(:conditions => {:book_id => params[:id]})
  end

  def show_from_isbn
    @book = Book.first(:conditions => {:ISBN => params[:ISBN]})
    render 'show'
  end

  def show_from_title
    @books = Book.all(:conditions => {:Title => params[:Title]}).page(params[:page]).per(5)
    render 'list'
  end

  def show_from_full_title
    @books = Book.all(:conditions => {:TitleArticle => params[:TitleArticle], :Title => params[:Title]}).page(params[:page]).per(5)
    render 'list'
  end
	
  def show_from_author_last_name
    @books = Book.all(:conditions => {:AuthorLastName => params[:AuthorLastName]}).page(params[:page]).per(5)
    render 'list'
  end
	
  def show_from_author_full_name
    #@books = Book.all(:conditions => {:AuthorFirstName => params[:AuthorFirstName], :AuthorLastName => params[:AuthorLastName]})
    @books = Book.all(:conditions => {:AuthorFirstName => params[:AuthorFirstName], :AuthorLastName => params[:AuthorLastName]}).page(params[:page]).per(5)
    render 'list'
  end
end
