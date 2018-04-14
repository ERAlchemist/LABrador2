class Sample < ApplicationRecord
    belongs_to :request, optional: true

    amoeba do
        enable
        nullify [:is_empty, :time_completed, :complete]
      end

    def completed?
        !time_completed.blank?
    end

    def empty?
        !is_empty.blank?
    end

    def self.import(file, request, size="250mL")
        return if file.blank?
         spreadsheet = Roo::Spreadsheet.open(file.path)
         sizer = spreadsheet.cell(2,3)
         size = sizer if !sizer.blank?
        # spreadsheet.set_value(1,3, 'request_id', nil)
        # header = spreadsheet.row(1)
        # header.push('request_id')
        header = ['tank','lot_id','request_id']
         (2..spreadsheet.last_row).each do |i|
           spreadsheet.set_value(i, 3, request.id, nil)
           row = Hash[[header, spreadsheet.row(i)].transpose]
           puts row
           puts "hello joe!"
           
           sample = Sample.new
           puts sample.sample_size 
           puts "hi"
           sample.attributes = row
           sample.sample_size = size if  sample.sample_size.blank?
           sample.save!
         end
       end 
=begin
    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then CSV.new(file.path, nil, :ignore)
        when ".xls" then Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end
=end
end

