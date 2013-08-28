require 'csv'
class EmailProcessor
	def self.process(email)
		attach = email.attachments
		puts "attach: #{attach}\n"#attach.tempfile: #{attach.tempfile}"
		puts "Latest Row: #{CSV.read(attach[0].tempfile)[7]}"
		puts "Latest Row Calls Only: #{CSV.read(attach[0].tempfile)[7][2]}"
		#binding.pry
		if attach.empty?
			Post.create!({ body: email.body, email: email.from, attachment: "No data" })
		else
#			CSV.foreach()
			Post.create!({ body: email.body, email: email.from})#, attachment: attach[0] })
		end
	end
end