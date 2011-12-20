module ApplicationHelper
	
	# If there is not title use the default
	def title
		if @title.nil?
			@title = "JOYBLIND"
		else 
			@title
		end
	end
	
	
	
end
