class RecurrencesController < ApplicationController
    before_action :set_recurrence, only: [:show, :edit, :update, :destroy]
    def index
        @recurrences = Recurrence.all
        @calendar_events = @recurrences.flat_map{ |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date ) }
    end

    def new
        @recurrence = Recurrence.new
    end

    def show
        begin
          @time = Time.parse(params[:time])
        rescue
          @time = @recurrence.start_time
        end
    end

    def edit
    end

    def create
        @recurrence = Recurrence.new(recurrence_params)
    
        respond_to do |format|
          if @recurrence.save
            format.html { redirect_to @recurrence, notice: 'Recurrence was successfully created.' }
            format.json { render :show, status: :created, location: @recurrence }
          else
            format.html { render :new }
            format.json { render json: @recurrence.errors, status: :unprocessable_entity }
          end
        end
    end

      def update
        respond_to do |format|
          if @recurrence.update(recurrence_params)
            format.html { redirect_to @recurrence, notice: 'Recurrence was successfully updated.' }
            format.json { render :show, status: :ok, location: @recurrence }
          else
            format.html { render :edit }
            format.json { render json: @recurrence.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        @recurrence.destroy
        respond_to do |format|
          format.html { redirect_to events_url, notice: 'Recurrence was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_recurrence
        @recurrence = Recurrence.find(params[:id])
      end
  
      # Never trust parameters from the scary internet, only allow the white list through.
      def recurrence_params
        params.require(:recurrence).permit(:title, :start_time, :description, :recurring)
      end
      
end
