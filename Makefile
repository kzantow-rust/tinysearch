.PHONY: index
index:
	cargo build	

.PHONY: pack
pack:
	wasm-pack build --target web --release

opt:
	wasm-opt -Oz -o pkg/tinysearch_bg_opt.wasm pkg/tinysearch_bg.wasm
	ls -l pkg/tinysearch_bg_opt.wasm

.PHONY: build
build: index pack opt

.PHONY: run
run:
	python3 -m http.server	