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

  def randomfind
    @batch = Batch.find(params[:batch_id])
    student = @batch.get_random_student
    flash[:alert] = "Randomly selected #{student}"
    flash[:alert] = "Randomly selected #{}"
    redirect_to batch_path(@batch)
  end

  def randomstudentselect

  end



  # def randomcolor
  #   @batch = Batch.find(params[:batch_id])
  #   student = @batch.pick_color
  #   flash[:alert] = "Ask a question to #{student}"
  #   redirect_to batch_path(@batch)
  # end

  # def random
  #   @batch = Batch.find(params[:batch_id])
  #   if (count = Students.evaluations.count) !=0
  #     Student.find(:first, :offser =>eand(count))
  #   end
  # end

  # def randomcolor
  #   @batch = Batch.find(params[:batch_id])
  #   @students = @batch.students
  #   @student.where(evaluation: 1).pluck(:id)
  # end

  # def random_student
  #   @batch = Batch.find(params[:batch_id])
  #   count = @batch.students.count
  #   random_offset = rand(count)
  #   random_student = Batch.students.offset(random_offset).first
  # end

  # def randomstudentpick
  #   @batch = Batch.find(params[:id])
  #   student = @batch.students.sample
  #   student = @batch.get_random_student
  #   flash[:alert] = "Randomly picked #{student}"
  #   redirect_to batch_path(@batch)
  # end

  # def randomstudentpick
  #   @batch = Batch.find(params[:id])
  #   @student = Student.offset(rand(Student.count)).first
  #   flash[:alert] = "Randomly picked #{student.name}"
  #   redirect_to batch_path(@batch)
  # end

  # def randomstudentpick
  #   @batch = Batch.find(params[:batch_id])
  #   students = @batch.students
  #   students.order("RANDOM()").limit(1)
  # end


  private

  def batch_params
    params
      .require(:batch)
      .permit(
        :number, :start_date, :end_date
      )
  end
end
