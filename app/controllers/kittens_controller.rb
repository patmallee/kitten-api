class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render :json => @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end
  
  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "You have successfully created a kitten named #{@kitten.name}! MEOW!"
      redirect_to root_url
    else
      flash.now[:alert] = "It's a kitten... you MAKE it... *purrrr*"
      render 'new'
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end
  
  def update
    @kitten = Kitten.find(params[:id])
    @kitten.update_attributes(kitten_params)
    if @kitten.save
      flash[:success] = "You have successfully modified kitten #{@kitten.name}! Mew mew -"
      redirect_to @kitten
    else
      flash.now[:alert] = "How hard can it be to modify your kitten... seriously... *hisssss*"
      render 'edit'
    end
  end
  
  def destroy
    @kitten = Kitten.find(params[:id])
    if @kitten.delete
      flash[:success] = "You've successfully deleted this kitten... *sad meow*"
      redirect_to root_path
    else
      flash.now[:alert] = "Don't you know cats have 9 lives? PuuurrRR!"
      render @kitten
    end
  end
  
  private
  
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
