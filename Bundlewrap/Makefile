ORG=scoutnet
IMAGE_NAME=bundlewrap
TAG=$(shell ./currentBWVersion.sh)
MINOR_TAG=$(shell ./currentBWVersion.sh -m)

all: deploy

build:
	# build M1 version
	docker build --platform linux/arm64/v8 -t ${ORG}/${IMAGE_NAME}:${TAG}-arm64v8 .
	# build x86_64 version
	docker build --platform linux/amd64 -t ${ORG}/${IMAGE_NAME}:${TAG}-amd64 .

tag_minor: build
	# Tag with minor Tag
	docker tag ${ORG}/${IMAGE_NAME}:${TAG}-arm64v8 ${ORG}/${IMAGE_NAME}:${MINOR_TAG}-arm64v8
	docker tag ${ORG}/${IMAGE_NAME}:${TAG}-amd64 ${ORG}/${IMAGE_NAME}:${MINOR_TAG}-amd64

deploy: build tag_minor
	# upload M1 version
	docker push ${ORG}/${IMAGE_NAME}:${TAG}-arm64v8
	docker push ${ORG}/${IMAGE_NAME}:${MINOR_TAG}-arm64v8

	# upload x86_64 version
	docker push ${ORG}/${IMAGE_NAME}:${TAG}-amd64
	docker push ${ORG}/${IMAGE_NAME}:${MINOR_TAG}-amd64

	# Create manifests
	docker manifest create ${ORG}/${IMAGE_NAME}:${TAG} -a ${ORG}/${IMAGE_NAME}:${TAG}-arm64v8 -a ${ORG}/${IMAGE_NAME}:${TAG}-amd64
	docker manifest create ${ORG}/${IMAGE_NAME}:${MINOR_TAG} -a ${ORG}/${IMAGE_NAME}:${MINOR_TAG}-arm64v8 -a ${ORG}/${IMAGE_NAME}:${MINOR_TAG}-amd64

	# upload manifests
	docker manifest push ${ORG}/${IMAGE_NAME}:${TAG}
	docker manifest push ${ORG}/${IMAGE_NAME}:${MINOR_TAG}