FILE_NAME=metacity-theme-1
SRC_PUG_FOLDER=src/xml
SRC_IMG_FOLDER=src/images/.
BUILD_DIR=./build/Aeroten
METACITY_BUILD_DIR=$(BUILD_DIR)/metacity-1
THEMES_FOLDER=$(HOME)/.themes

build: clean images
	@./node_modules/xmlpug/bin/xmlpug $(SRC_PUG_FOLDER)/$(FILE_NAME).pug -o $(METACITY_BUILD_DIR)/$(FILE_NAME).xml
	@sed -i 's/;//g' $(METACITY_BUILD_DIR)/$(FILE_NAME).xml
	@echo 'Outputted MINIFIED .xml from Pug source to $(METACITY_BUILD_DIR)/$(FILE_NAME).xml'

clean:
	@([[ -d ./build ]] && rm -r ./build && echo 'Cleaned ./build folder') || echo 'Skipping clean as the directory ./build does not exist.'

dev: clean images
	@./node_modules/xmlpug/bin/xmlpug $(SRC_PUG_FOLDER)/$(FILE_NAME).pug -o $(METACITY_BUILD_DIR)/$(FILE_NAME).xml -p
	@sed -i 's/;//g' $(METACITY_BUILD_DIR)/$(FILE_NAME).xml
	@echo 'Outputted DEV (pretty-printed) .xml from Pug source to $(METACITY_BUILD_DIR)/$(FILE_NAME).xml'

images:
	@mkdir -p $(METACITY_BUILD_DIR)
	@cp -r $(SRC_IMG_FOLDER) $(METACITY_BUILD_DIR)
	@echo 'Copying metacity images to $(METACITY_BUILD_DIR)'

dep:
	yarn install

install: build
	@([[ -d $(THEMES_FOLDER) ]] && echo 'Found user themes folder at $(THEMES_FOLDER)') || (mkdir -p $(THEMES_FOLDER) && echo "User themes folder doesn't exist. Creating one at $(THEMES_FOLDER)")
	@cp -rf $(BUILD_DIR) $(THEMES_FOLDER) && echo 'Copied built theme to $(THEMES_FOLDER)'

uninstall:
	@echo 'Deleting $(THEMES_FOLDER)/Aeroten'
	@rm -r $(THEMES_FOLDER)/Aeroten