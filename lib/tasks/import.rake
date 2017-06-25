namespace :import do
	
	desc "import mobile data from csv"
	task mobile: :environment do
		filename = File.join Rails.root, "mobile_data.csv"

		CSV.foreach(filename, headers: true) do |row|
			p row
			p row["dt"]

			mobile = Mobile.create(uid: row["uid"], signup_dt: row["signup_dt"],
				auth_type: row["auth_type"], device: row["device"], dt: row["dt"])
		end

		puts "Imported Data"
	end

	desc "import unemployment data from csv"
	task unemployment: :environment do
		filename = File.join Rails.root, "unemployment.csv"

		CSV.foreach(filename, headers: true) do |row|
			p row
			p row["rate"]

			mobile = Unemployment.create(rate: row['rate'])
		end

		puts "Imported Unemployement Data"
	end	
end