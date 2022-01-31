# frozen_string_literal: true

class AbilitiesController < ApplicationController
  layout 'admin'

  before_action :navigation_params

  def index
    @abilities = Ability.alpha_sorted.paginate(page: params[:page])
  end

  def show
    @ability = Ability.find(params[:id])
  end

  def new
    @ability = Ability.new
  end

  def create
    @ability = Ability.new(ability_params)

    if @ability.save
      flash[:notice] = "The Ability '#{@ability.name} (id: #{@ability.id})' was created successfully"
      redirect_to(abilities_path(@ability, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @ability = Ability.find(params[:id])
  end

  def update
    @ability = Ability.find(params[:id])

    if @ability.update(ability_params)
      flash[:notice] = 'The Ability was updated successfully'
      redirect_to(abilities_path(@ability, @nav_params))
    else
      render('edit', locals: @nav_params)
    end
  end

  def delete
    @ability = Ability.find(params[:id])
  end

  def destroy
    @ability = Ability.find(params[:id])
    @ability.destroy
    flash[:notice] = "The Ability '#{@ability.name}' was removed successfully"
    redirect_to(abilities_path(@nav_params))
  end

  private

  def ability_params
    params.require(:ability).permit(:name, :url)
  end

  def navigation_params
    @nav_params = {
      page: params[:page]
    }
  end
end
