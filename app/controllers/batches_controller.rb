class BatchesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
    @students = @batch.students
  end

  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)
    if @batch.save
      redirect_to @batch, notice: "Batch created"
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @Batch.update(batch_params)
      redirect_to @batch, notice: "Batch updated"
    else
      render :edit
    end
  end

  def destroy
    @batch = Batch.find(params[:id])
      if @batch.present?
        @batch.destroy
      end
    redirect_to root_path, notice: "Batch deleted"
  end

  def question
    @batch = Batch.find(params[:batch_id])
    student = @batch.get_student
    flash[:alert] = "Ask a question to #{student}"
    redirect_to batch_path(@batch)
  end

  private

  def batch_params
    params
      .require(:batch)
      .permit(
        :number, :start_date, :end_date
      )
  end
end
