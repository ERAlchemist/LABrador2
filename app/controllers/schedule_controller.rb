class ScheduleController < ApplicationController
    def index
        @requests = Request.all
    end
    

end