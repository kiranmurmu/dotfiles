.SILENT:
.PHONY: load reload clean

load:
	stow -S home -t ~

reload:
	stow -R home -t ~

clean:
	stow -D home -t ~
