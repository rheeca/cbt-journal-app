#!/usr/bin/env bash

OUTPUT_DIR=services/journal_service/lib/generated
rm -r $OUTPUT_DIR
mkdir $OUTPUT_DIR

PROTOC="protoc --dart_out=grpc:$OUTPUT_DIR -Iprotos -I$PROTOS_DIR"
$PROTOC protos/user.proto
