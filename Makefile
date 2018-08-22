all:
	cd ~/g/elisp/mu && \
	git clean -dxf && \
	autoreconf -i && \
	./configure --prefix=/home/avar/local --disable-guile && \
	make -j 3 all && \
	make -j 3 install && \
	make -j 3 install-info
