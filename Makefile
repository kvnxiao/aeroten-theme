.DEFAULT_GOAL := cleanbuild

FILE_NAME=metacity-theme-1
SRC_PUG_FOLDER=src/xml
SRC_IMG_FOLDER=src/images/.
BUILD_DIR=./metacity-1


cleanbuild: clean build

install:
	yarn install

build: images
	@[[ -d ${BUILD_DIR} ]] || mkdir ${BUILD_DIR}
	@./node_modules/xmlpug/bin/xmlpug ${SRC_PUG_FOLDER}/${FILE_NAME}.pug -o ${BUILD_DIR}/${FILE_NAME}.xml
	@sed -i 's/;//g' ${BUILD_DIR}/${FILE_NAME}.xml
	@echo 'Outputted MINIFIED .xml from pug source'

clean:
	@([[ -d ${BUILD_DIR} ]] && rm -r ${BUILD_DIR} && echo 'Cleaned ${BUILD_DIR} folder') || echo 'Skipping clean as the build directory ${BUILD_DIR} does not exist.'

dev: images
	@[[ -d ${BUILD_DIR} ]] || mkdir ${BUILD_DIR}
	@./node_modules/xmlpug/bin/xmlpug ${SRC_PUG_FOLDER}/${FILE_NAME}.pug -o ${BUILD_DIR}/${FILE_NAME}.xml -p
	@sed -i 's/;//g' ${BUILD_DIR}/${FILE_NAME}.xml
	@echo 'Outputted DEV (pretty-printed) .xml from pug source'

images:
	@[[ -d ${BUILD_DIR} ]] || mkdir ${BUILD_DIR}
	@cp -r ${SRC_IMG_FOLDER} ${BUILD_DIR}
	@echo 'Copying images to ${BUILD_DIR}'