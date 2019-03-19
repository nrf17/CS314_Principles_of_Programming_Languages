

#ifndef HASH_H
#define HAS_H

typedef unsigned int (*HashFunction) (const char *str);

unsigned int RSHash(const char *str);
unsigned int JSHash(const char *str);
unsigned int BKDRHash(const char *str);
unsigned int ELFHash(const char *str);
unsigned int SDBMHash(const char *str);
unsigned int DJBHash(const char *str);
unsigned int DEKHash(const char *str);
unsigned int BPHash(const char *str);
unsigned int FNVHash(const char *str);
unsigned int APHash(const char *str);

unsigned int hash_div_701(const char *str);
unsigned int hash_div_899(const char *str);
unsigned int hash_mult_699(const char *str);
unsigned int hash_mult_700(const char *str);
unsigned int hash_mult_900(const char *str);
#endif
