gen:
	protoc -I ./proto \
	--go_out=./proto --go_opt paths=source_relative \
	--go-grpc_out=require_unimplemented_servers=false:./proto \
	--go-grpc_opt paths=source_relative \
	./proto/*.proto

gen-gw:
	protoc -I . \
	--go_out=. --go_opt paths=source_relative \
	--go-grpc_out=require_unimplemented_servers=false:. --go-grpc_opt paths=source_relative \
	--grpc-gateway_out=. --grpc-gateway_opt paths=source_relative \
	./proto/*.proto

# We use the go and go-grpc plugins to generate Go types and gRPC service definitions. We’re outputting the generated files relative to the proto folder, and we’re using the paths=source_relative option, which means that the generated files will appear in the same directory as the source .proto file.