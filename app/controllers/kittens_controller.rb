class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end
  
  def create
    #to be filled
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    #to be filled
  end
  
  def destroy
    #to be filled
  end
end
