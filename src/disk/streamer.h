// https://www.udemy.com/course/developing-a-multithreaded-kernel-from-scratch/learn/lecture/23983790
#pragma once
#include "disk.h"

// types
struct disk_stream {
    int pos;
    struct disk* disk;
};

// functions
struct disk_stream* diskstreamer_new( int disk_id );
int diskstreamer_seek( struct disk_stream* stream, int pos );
int diskstreamer_read( struct disk_stream* stream, void* out_buffer, int total_bytes );
void diskstreamer_close( struct disk_stream* stream );
