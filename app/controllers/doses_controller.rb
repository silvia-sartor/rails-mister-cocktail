class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail_id: params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_set)
    @dose.cocktail = @cocktail
    @ingredients = Ingredient.all

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    set_dose
    @dose.delete
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def params_set
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
