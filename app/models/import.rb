require 'iconv'
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
				# configure row data
				(1..colMax).each do |cidx|
					row[headers[cidx - 1]] = doc.cell(ridx, cidx, sheet).to_s
				end
				
				unless client = Client.find_by_old_id(row[:client_id])
					firstname = sheetIdx > 9 ? row[:first_name] : row[:last_name]
					lastname = sheetIdx > 9 ? row[:last_name] : row[:first_name]
					client = Client.create!(:first_name => firstname, :last_name => lastname, :old_id => row[:client_id])
				end

				unless type = ItemType.find_by_name(row[:inventory_type].strip.downcase)
					type = ItemType.create!(:name => row[:inventory_type])
				end

				unless location = Location.find_by_location_hash(row[:street_address], row[:city])
					location = Location.create!(:street_address => row[:street_address], :city => row[:city], :state => 'WA')
				end

				unless item = InventoryItem.find_by_old_item_id(row[:inventory_id])
					item = InventoryItem.create!(:old_item_id => row[:inventory_id], :item_type => type, :location => location)
				end

				order = Order.create!(:client => client, :location => location, :alternate_phone => row[:phone])
				order.add_line(type, item)
			end
		end
	end
end