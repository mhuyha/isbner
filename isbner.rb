require 'pdf/reader'


class ISBNer


	def initialize
		@pdf_files = Dir.glob("*.{pdf,PDF}")
	end

	def list_files
		puts @pdf_files[1]
	end

	def find_isbn(filename)
		file = Dir.pwd << "/#{filename}"

		# isbn 9 and 13 regex pattern
		isnbn_13 = /ISBN(-1(?:(0)|3))?:?\x20(\s)*[0-9]+[- ][0-9]+[- ][0-9]+[- ][0-9]*[- ]*[xX0-9]/

		# array to hold extracted isbns
		isbns = []

		PDF::Reader.open(file) do |reader|

			reader.pages[1..10].each do |page|
		    isbn_matches = page.text.match isnbn_13
		    isbns.push(isbn_matches) if isbn_matches
			end

			reader.pages[(reader.page_count-20)..reader.page_count].each do |page|
		    isbn_matches = page.text.match isnbn_13
		    isbns.push(isbn_matches) if isbn_matches
		    puts page.text
			end


			puts isbns

		end


	end

	def process_pdfs

		find_isbn(@pdf_files[1])

	end


end


pdfbooks = ISBNer.new

pdfbooks.list_files

pdfbooks.process_pdfs