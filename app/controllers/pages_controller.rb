class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :all_info

  private

    def all_info
      case params[:id]
      when 'home'
        @books = Book.all
        @authors = Author.all
        @users = User.all
      end
    end
end
