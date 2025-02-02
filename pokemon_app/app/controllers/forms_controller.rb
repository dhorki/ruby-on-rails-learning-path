# frozen_string_literal: true

class FormsController < ApplicationController
  layout 'admin'

  before_action :navigation_params

  def index
    @forms = Form.alpha_sorted.paginate(page: params[:page])
  end

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(form_params)

    if @form.save
      flash[:notice] = "The Form '#{@form.name} (id: #{@form.id})' was created successfully"
      redirect_to(forms_path(@form, @navigation_params))
    else
      render('new')
    end
  end

  def edit
    @form = Form.find(params[:id])
  end

  def update
    @form = Form.find(params[:id])

    if @form.update(form_params)
      flash[:notice] = 'The Form was updated successfully'
      redirect_to(forms_path(@form, page: params[:age]))
    else
      render('edit', locals: @navigation_params)
    end
  end

  def delete
    @form = Form.find(params[:id])
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    flash[:notice] = "The Form '#{@form.name}' was removed successfully"
    redirect_to(forms_path(@navigation_params))
  end

  private

  def form_params
    params.require(:form).permit(:name, :url)
  end

  def navigation_params
    @nav_params = {
      page: params[:page]
    }
  end
end
