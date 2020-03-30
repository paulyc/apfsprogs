all: lib mkapfs apfsck

mkapfs:
	make -C mkapfs
apfsck:
	make -C apfsck
.PHONY: mkapfs apfsck

mkapfs_install:
	make -C mkapfs install
apfsck_install:
	make -C apfsck install
lib_install: mkapfs apfsck
	make -C lib install
install: mkapfs_install apfsck_install lib_install
.PHONY:  mkapfs_install apfsck_install lib_install

mkapfs_uninstall:
	make -C mkapfs uninstall
apfsck_uninstall:
	make -C apfsck uninstall
lib_uninstall:
	make -C lib uninstall
uninstall: mkapfs_uninstall apfsck_uninstall lib_uninstall
.PHONY:  mkapfs_uninstall apfsck_uninstall lib_uninstall

mkapfs_clean:
	make -C mkapfs clean
apfsck_clean:
	make -C apfsck clean
lib_clean:
	make -C lib clean
clean: mkapfs_clean apfsck_clean lib_clean
.PHONY:	mkapfs_clean apfsck_clean lib_clean
