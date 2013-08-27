class EmailProcessor
	def self.process(email)
		attach = email.attachments
		if attach.empty?
			Post.create!({ body: email.body, email: email.from })#, attachment: "No data" })
		else
			Post.create!({ body: email.body, email: email.from })#, attachment: attach[0] })
		end
	end
end