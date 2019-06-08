TAG ?= latest

build: Dockerfile
	docker image build -t conao3/nkf:$(TAG) .

push: build
	docker push conao3/nkf:$(TAG)
