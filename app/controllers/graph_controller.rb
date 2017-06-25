class GraphController < ApplicationController

	def index
	end

	def data
		@device_count = Mobile.select('uid').uniq.group(:device).count
		@json = @device_count.map do |d|
			{:device => d[0], :count => d[1]}
		end.to_json


	    respond_to do |format|
	      format.json {
	        render :json => @json
	      }
	    end
	end

	def world_map
		@ids = Unemployment.pluck('id')
		@rates = Unemployment.pluck('rate')
		@rates_ids = @ids.zip(@rates)
		@rate_json = @rates_ids.map do |r|
			{:id => r[0], :rate => r[1]}
		end
		# raise @rates_ids.inspect
	end

	def world_map_data
		@ids = Unemployment.pluck('id')
		@rates = Unemployment.pluck('rate')
		@rates_ids = @ids.zip(@rates)
		@rate_json = @rates_ids.map do |r|
			{:id => r[0].to_s, :rate => r[1].to_f}
		end.to_json

		respond_to do |format|
			format.json{
				render :json => @rate_json
			}
		end
	end

	def barchart
		
	end

	def heatmap
		
	end
end
