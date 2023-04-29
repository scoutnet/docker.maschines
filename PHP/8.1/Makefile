ORG=scoutnet
IMAGE_NAME=php81
TAG=latest

all: deploy

build:
	# build M1 version
	docker build . --platform linux/arm64/v8 -t ${ORG}/${IMAGE_NAME}:${TAG}-arm64v8
	# build x86_64 version
	docker build . --platform linux/amd64 -t ${ORG}/${IMAGE_NAME}:${TAG}-amd64

deploy: build
	# upload M1 version
	docker push ${ORG}/${IMAGE_NAME}:${TAG}-arm64v8
	# upload x86_64 version
	docker push ${ORG}/${IMAGE_NAME}:${TAG}-amd64

	# create manifest
	docker manifest create ${ORG}/${IMAGE_NAME}:${TAG} -a ${ORG}/${IMAGE_NAME}:${TAG}-arm64v8 -a ${ORG}/${IMAGE_NAME}:${TAG}-amd64
	# upload manifest
	docker manifest push ${ORG}/${IMAGE_NAME}:${TAG}
