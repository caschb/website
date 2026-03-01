all:
	emacs -q --script export.el

clean:
	rm -r html/*
