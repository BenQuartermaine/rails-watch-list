class ListsController < ApplicationController
  def index
    @lists = List.all   
  end
  
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    if @list.save
      flash[:success] = "List successfully created"
      redirect_to @list
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @list = List.find(params[:id])

    # raise
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
  
end
