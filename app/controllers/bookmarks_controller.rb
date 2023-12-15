class BookmarksController < ApplicationController
  def new
    @bookmarks = Bookmark.all
  end

  def create
  end

  def destroy
  end
end
