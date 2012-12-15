class ISBNer


	def initialize
		@pdf_files = Dir.glob("*.{pdf,PDF}")
	end

	def list_files
		puts @pdf_files
	end

end


pdfbooks = ISBNer.new

pdfbooks.list_files