require 'roo'

class Import
	def initialize(file_path)
		@path = file_path
	end

	def run
		headers = [ 
							  :client_id, 
					      :last_name, 
					      :first_name, 
					      :inventory_type, 
					      :inventory_id, 
					      :delivery_date, 
					      :days_used, 
					      :return_date, 
					      :cost_per_day, 
					      :max_cost, 
					      :actual_cost, 
					      :running_total, 
					      :street_address, 
					      :city, 
					      :phone, 
					      :delivered_by1, 
					      :delivered_by2 ]

		startIdx = 3 # remove header rows
		doc = Excel.new(@path)
		puts "Found #{doc.sheets.count} sheets"

		sheetIdx = 0
		doc.sheets.each do |sheet|
			sheetIdx += 1
			lastRowIdx = doc.last_row(sheet)
			(startIdx..lastRowIdx).each do |ridx|
				colMax = doc.last_column(sheet)
				row = {}
				(1..colMax).each do |cidx|
					row[headers[cidx - 1]] = doc.cell(ridx, cidx, sheet).to_s
				end
				
				unless Client.find_by_old_id row[:client_id]
					Client.create!(:first_name => row[:first_name], :last_name => row[:last_name], :old_id => row[:client_id])
				end

			end
		end
	end
end