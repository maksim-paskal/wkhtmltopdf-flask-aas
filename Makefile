build:
	docker build . -t paskalmaksim/wkhtmltopdf-aas:latest
	docker history paskalmaksim/wkhtmltopdf-aas:latest
run:
	docker run -it --rm -p 8080:8080 paskalmaksim/wkhtmltopdf-aas:latest
test:
	rm -rf *.pdf
	curl -d "html=test" 127.0.0.1:8080/pdf -o test_html.pdf
	curl -d "url=http://cirici.com" 127.0.0.1:8080/pdf -o test_url.pdf
	curl -I 127.0.0.1:8080/health