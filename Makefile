push_blog: 
	git add . && git commit -m "Update" && git push

rebuild_public: 
	make clean_public && hugo --minify

clean_public: 
	rm -r public/*

push_public: 
	make rebuild_public && cd public && git add . && git commit -m "Site update" && git push

push_theme:
	cd themes/typo && git add . && git commit -m "$(m)" && git push

all: 
	- make push_theme
	- make push_public
	make push_blog

run: 
	hugo server --disableFastRender -D
