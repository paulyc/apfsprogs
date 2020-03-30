all: mkapfs apfsck
mkapfs:
	make -C mkapfs
apfsck:
	make -C apfsck
mkapfs_install:
	make -C mkapfs install
apfsck_install:
	make -C apfsck install
install: mkapfs_install apfsck_install
mkapfs_clean:
	make -C mkapfs clean
apfsck_clean:
	make -C apfsck clean
clean: mkapfs_clean apfsck_clean

.PHONY: mkapfs apfsck mkapfs_install apfsck_install mkapfs_clean apfsck_clean
