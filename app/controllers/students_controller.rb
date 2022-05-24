class StudentsController < ApplicationController
    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
        render 'form'
    end

    def create
        @student = Student.create(strong_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    def edit
        @student = Student.find(params[:id])
        render 'form'
    end

    def update
        @student = Student.update(strong_params(:first_name, :last_name))
        redirect_to student_path(@student)
    end

    private

    def strong_params(*args)
        params.require(:student).permit(*args)
    end

end