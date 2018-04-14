class SamplesController < ApplicationController
    before_action :set_request, except: [:index]
    before_action :set_sample, except: [:create, :import, :index]


    def index
      @samples = Sample.all
      @complete_samples = @samples.select{|h| h.time_completed}
      @incomplete_samples = @samples.select{|h| !h.time_completed}
    end

    def create
      @sample = @request.samples.create(sample_params)
      redirect_to "#{url_for(@request)}##{@sample.id}"
    end
  
    def destroy
      if @sample.destroy
        flash[:success] = "Sample was deleted"
      else
        flash[:error] = "Sample could not be deleted."
      end
      redirect_to "#{url_for(@request)}##{@sample.id-1}"
    end

    def edit
        @sample
    end

    def update
        @sample.update sample_params
        redirect_to "#{url_for(@request)}##{@sample.id}", notice: "Sample Updated!"
    end
  
    def complete
      @sample.update_attribute(:time_completed, Time.now.in_time_zone)
      redirect_to "#{url_for(@request)}##{@sample.id}", notice: "Sample Completed!"
    end

    def remove_complete
      @sample.update_attribute(:time_completed, nil)
      redirect_to "#{url_for(@request)}##{@sample.id}", notice: "Sample Not Complete"
    end

    def import
      if params[:file].blank?
        flash[:error] = 'No file selected.'
      end
      Sample.import(params[:file], @request, params[:sample_size])
      redirect_to @request, notice: "Samples imported"
    end

    def set_as_empty
      @sample.update_attribute(:is_empty, true)
      redirect_to "#{url_for(@request)}##{@sample.id}", notice: "Tank Empty!"
    end

    def remove_empty
      @sample.update_attribute(:is_empty, nil)
      redirect_to "#{url_for(@request)}##{@sample.id}", notice: "Tank Not Empty!"
    end
  
    private
  
    def set_request
      @request = Request.find(params[:request_id])
    end
  
    def set_sample
      @sample = @request.samples.find(params[:id])
    end
  
    def sample_params
      params[:sample].permit(:tank, :lot_id, :sample_size)
    end
end
