class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id]) # como se comporta como un hash, con params puedo llamarlo por su simbol.
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
    render :new; status :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
	  @list.update(list_params)
	  redirect_to list_path(@list) #le paso la instancia, y entinde que tiene que sacar el ID de ahi.
  end

  def destroy
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
