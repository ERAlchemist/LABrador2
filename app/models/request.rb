class Request < ApplicationRecord
    has_many :samples

    amoeba do
        enable
        nullify [:time_completed, :complete]
        clone :samples
      end

    def completed?
        !time_completed.blank?
    end
    
end
