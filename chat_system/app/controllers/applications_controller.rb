class ApplicationsController < ApplicationController
    def create
      @application = Application.new(application_params)
      if @application.save
        render json: { token: @application.token,name:@application.name }, status: :created
      else
        render json: @application.errors, status: :unprocessable_entity
      end
    end
    def index
        @application = Application.all
      end
    private
  
    def application_params
      params.require(:application).permit(:name)
    end
  end
  