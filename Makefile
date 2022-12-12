# Makefile

OUT = ../build
DELEGATES = -DTFLITE_ENABLE_GPU=ON


clean:
	rm -Rf tflite_build ; \

build-setup:
	mkdir tflite_build; \
	cd tflite_build; \
	cmake ../tensorflow_src/tensorflow/lite/c $(DELEGATES)


mac-x86-64:
	cd tflite_build; \
	CMAKE_OSX_ARCHITECTURES=x86_64 cmake --build . -j ;\
	mkdir -p $(OUT)/mac/ ;\
	cp libtensorflowlite_c.dylib $(OUT)/mac/libtensorflowlite_c_x86_64.dylib ;\

mac-arm64:
	cd tflite_build; \
	cmake --build . -j ;\
	mkdir -p $(OUT)/mac/ ;\
	cp libtensorflowlite_c.dylib $(OUT)/mac/libtensorflowlite_c_arm64.dylib ;\

mac-merge-universal: 
	cd tflite_build; \
	lipo -create -output $(OUT)/mac/libtensorflowlite_c.dylib \
		$(OUT)/mac/libtensorflowlite_c_x86_64.dylib \
		$(OUT)/mac/libtensorflowlite_c_arm64.dylib \

mac: 
	$(MAKE) clean ; \
	$(MAKE) build-setup ; \
	$(MAKE) mac-arm64 ; \

	$(MAKE) clean ; \
	CMAKE_OSX_ARCHITECTURES=x86_64 $(MAKE) build-setup ; \
	$(MAKE) mac-x86-64  ; \

	$(MAKE) mac-merge-universal

test:
	
	$(MAKE) clean
	$(MAKE) build-setup
