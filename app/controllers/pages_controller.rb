class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :all_books

  private

    def all_books
      case params[:id]
      when 'home'
        @books = Book.all
      end
    end
end
