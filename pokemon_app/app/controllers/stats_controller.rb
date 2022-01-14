class StatsController < ApplicationController

  layout 'admin'

  def index
      @stats = Stat.alpha_sorted.paginate(:page => params[:page])
  end

  def show
    @stat = Stat.find(params[:id])
  end

  def new
    @stat = Stat.new
  end

  def create
    @stat = Stat.new(stat_params)

    if @stat.save
      flash[:notice] = "The Stat '#{@stat.name} (id: #{@stat.id})' was created successfully"
      redirect_to(stats_path(@stat, :page => params[:age]))
    else
      render('new')
    end
  end

  def edit
    @stat = Stat.find(params[:id])
  end

  def update
    @stat = Stat.find(params[:id])

    if @stat.update(stat_params)
      flash[:notice] = "The Stat was updated successfully"
      redirect_to(stats_path(@stat, :page => params[:age]))
    else
      render('edit', :locals => {:page => params[:page]})
    end
  end

  def delete
    @stat = Stat.find(params[:id])
  end

  def destroy
    @stat = Stat.find(params[:id])
    @stat.destroy
    flash[:notice] = "The Stat '#{@stat.name}' was removed successfully"
    redirect_to(stats_path(:page => params[:page]))
  end

  private
  def stat_params
    params.require(:stat).permit(:name, :url)
  end
end
