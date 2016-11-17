all:
	cd ~/g/elisp/mu && \
	git clean -dxf && \
	autoreconf -i && \
	./configure --prefix=/home/avar/local --enable-perl && \
	make -j 3 all install && \
	make -j 3 install-info
