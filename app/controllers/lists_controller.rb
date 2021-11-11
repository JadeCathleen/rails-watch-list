class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_param)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  private

  def list_param
    params.require(:list).permit(:name)
  end
end
