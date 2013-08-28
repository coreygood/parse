require 'csv'
class EmailProcessor
	def self.process(email)
		attach = email.attachments
		#inding.pry
		puts "attach: #{attach}\n"#attach.tempfile: #{attach.tempfile}"
		puts "Latest Row: #{CSV.read(attach[0].tempfile, encoding: 'windows-1251:utf-8')[7]}"
		puts "Latest Row Calls Only: #{CSV.read(attach[0].tempfile, encoding: 'windows-1251:utf-8')[7][2]}"
		#binding.pry
		if attach.empty?
			#Post.create!({ body: email.body, email: email.from,  })
			puts "No attachment with email; ignoring"
		else
			begin
				total = CSV.read(attach[0].tempfile, encoding: 'windows-1251:utf-8')[7][2].to_i
			rescue
				total = 0
			end
			puts "total: #{total}"
			begin
				last = Post.select("total_calls").last.total_calls
			rescue
				last = 0
			end
			puts "last: #{last}"
			hourly = total-last
			# account for daily rollover back to 0
			if hourly < 0
				hourly = total
			end
			puts "hourly: #{hourly}"
			Post.create!({ body: email.body, email: email.from, hourly_calls: hourly, total_calls: total })
		end
	end
end