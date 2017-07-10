/*
 * mips_programs.h
 *
 *  Created on: Jul 10, 2017
 *      Author: IHICAJO
 */

#ifndef SRC_MIPS_PROGRAMS_H_
#define SRC_MIPS_PROGRAMS_H_

#ifndef n
#define n 5
#endif

#ifdef FIB
u32 program[] = {
    0x34080001,
    0x34090001,
    0x34040000,
    0x340c0000 + n,
    0xac880000,
    0x20840004,
    0xac890000,
    0x20840004,
    0x8c88fffc,
    0x8c89fff8,
    0x01095020,
    0xac8a0000,
    0x20840004,
    0x218cffff,
    0x1580fff9,
    0x08000014,
    0xac0a0000,
    0xac0a0004,
    0xac0a0008,
    0xac0a000c,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
#endif

#ifdef HANOI
u32 program[] = {
		0x34040000 + n,
		0x341d0100,
		0x34100001,
		0x201f00f8,
		0x00885022,
		0x00084880,
		0xad2a0000,
		0x21080001,
		0x11040001,
		0x08000004,
		0x00044080,
		0xafa80000,
		0xafa80004,
		0x00084040,
		0xafa80008,
		0x23a50000,
		0x23a60008,
		0x23a70004,
		0x23bd000c,
		0x10900020,
		0xafbf0000,
		0xafa40004,
		0x23bd0008,
		0x34e80000,
		0x00063825,
		0x00083025,
		0x2084ffff,
		0x0c000013,
		0x34e80000,
		0x00063825,
		0x00083025,
		0x8cc80000,
		0x8ca90000,
		0x2129fffc,
		0x8d2a0000,
		0xad0a0000,
		0x21080004,
		0xad200000,
		0xacc80000,
		0xaca90000,
		0x8fa4fffc,
		0x2084ffff,
		0x00054025,
		0x00072825,
		0x00083825,
		0x0c000013,
		0x00054025,
		0x00072825,
		0x00083825,
		0x23bdfff8,
		0x8fbf0000,
		0x03e00008,
		0x8cc80000,
		0x8ca90000,
		0x2129fffc,
		0x8d2a0000,
		0xad0a0000,
		0x21080004,
		0xad200000,
		0xacc80000,
		0xaca90000,
		0x03e00008,
		0x00000000,
		0x00000000,
		0x00000000,
		0x00000000,
		0x00000000
};
#endif

#ifdef QSORT
u32 program[] = {
		0x341d0100,
		0x001c2025,
		0x34080005,
		0xac880000,
		0x34080008,
		0xac880004,
		0x34080002,
		0xac880008,
		0x34080009,
		0xac88000c,
		0x34080001,
		0xac880010,
		0x34080003,
		0xac880014,
		0x3408000a,
		0xac880018,
		0x34080004,
		0xac88001c,
		0x34060007,
		0x0c00002d,
		0x0800003d,
		0x00054080,
		0x00884820,
		0x8d2a0000,
		0x20abffff,
		0x20cc0001,
		0x218cffff,
		0x000c4080,
		0x00884020,
		0x8d0d0000,
		0x014d082a,
		0x1420fffa,
		0x216b0001,
		0x000b4880,
		0x00894820,
		0x8d2e0000,
		0x01ca082a,
		0x1420fffa,
		0x016c082a,
		0x10200003,
		0xad0e0000,
		0xad2d0000,
		0x0800001a,
		0x000c1025,
		0x03e00008,
		0x00a6082a,
		0x1020000d,
		0x23bd000c,
		0xafbffff4,
		0xafa6fff8,
		0x0c000015,
		0xafa2fffc,
		0x00403025,
		0x0c00002d,
		0x8fa2fffc,
		0x20450001,
		0x8fa6fff8,
		0x0c00002d,
		0x23bdfff4,
		0x8fbf0000,
		0x03e00008,
		0x00000000,
		0x00000000,
		0x00000000,
		0x00000000,
		0x00000000
};
#endif

#endif /* SRC_MIPS_PROGRAMS_H_ */