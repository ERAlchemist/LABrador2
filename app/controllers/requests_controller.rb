class RequestsController < ApplicationController
    before_action :set_request, only: [:show, :edit, :update, :destroy, :close_out, :reopen]
    def index
        @requests = Request.all
        @requests.reverse
        @complete_requests = Request.where(complete: true)
        @complete_requests.sort{|x,y| y.time_completed - x.time_completed}
        @incomplete_requests = Request.where(time_completed: nil)
        @incomplete_requests.reverse

    end

    def show
        @request = Request.find(params[:id])
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.create request_params
        @request.complete = false
        redirect_to request_path(@request)
    end

    def edit
        @request = Request.find(params[:id])
    end

    def update
        @request = Request.find(params[:id])
        @request.update request_params
        redirect_to request_path(@request)
    end

    def destroy
        Request.find(params[:id]).destroy
        redirect_to root_path
    end

    def import
        Sample.import(params[:file])
       # redirect_to @request, notice: "Samples imported"
    end

    def close_out
        @request.update_attribute(:time_completed,  Time.now.in_time_zone)
        @request.update_attribute(:complete,  true)
        if @request.is_recurring
            new_request = @request.amoeba_dup
            new_request.due_date = @request.due_date + @request.recurrence_interval.days
            new_request.save!
        end
        redirect_to @request, notice: "Request Completed!"
    end

    def reopen
        @request.update_attribute(:time_completed, nil)
        @request.update_attribute(:complete, false)
        redirect_to @request, notice: "Request Re-opened!"
    end
        
        
  
    private
        def set_request
            @request = Request.find(params[:id])
        end

        def request_params
            params.require(:request).permit(:title, :description, :due_date, :is_recurring, :recurrence_interval)
        end

end
