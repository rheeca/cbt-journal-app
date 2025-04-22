#!/usr/bin/env bash

# App
PROTOS=protos
OUTPUT_DIR=app/lib/generated
rm -r $OUTPUT_DIR
mkdir $OUTPUT_DIR

PROTOC="protoc --dart_out=grpc:$OUTPUT_DIR -Iprotos -I$PROTOS_DIR"
$PROTOC $(find $PROTOS/ -iname "*.proto")
$PROTOC $PROTOS_DIR/google/protobuf/timestamp.proto

# Journal service
OUTPUT_DIR=services/journal_service/lib/generated
rm -r $OUTPUT_DIR
mkdir $OUTPUT_DIR

PROTOC="protoc --dart_out=grpc:$OUTPUT_DIR -Iprotos -I$PROTOS_DIR"
$PROTOC $(find $PROTOS -iname "*.proto")
$PROTOC $PROTOS_DIR/google/protobuf/timestamp.proto
