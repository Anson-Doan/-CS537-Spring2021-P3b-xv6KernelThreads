#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "mmu.h"
//#include "stddef.h"
#include "param.h"

typedef struct ptr_storage {
    void* orig_ptr;
    void* offset_ptr;
    struct ptr_storage* next;
} ptr_storage;

//struct ptr_storage* ptrs_head;
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
}

char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
  return vdst;
}


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {

  void *curr_ptr = malloc(PGSIZE*2);
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
  }

  int i;
  for (i = 0; i < NPROC; i++) {
    if (cell_full[i] != 1) { break; }
  }
  if (cell_full[i] == 1) {
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
  ptr_pairs[i].offset_ptr = user_stack;
  cell_full[i] = 1;

  // if (ptrs_head == NULL) {
  //   ptrs_head = malloc(sizeof(ptr_storage));
  //   ptrs_head->orig_ptr = curr_ptr;
  //   ptrs_head->offset_ptr = user_stack;
  //   ptrs_head->next = NULL;
  // }
  // else {
  //   ptr_storage* curr_ptrs;
  //   for (curr_ptrs = ptrs_head; curr_ptrs->next != NULL; curr_ptrs = curr_ptrs->next);
  //   curr_ptrs->next = malloc(sizeof(ptr_storage));
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
}

int thread_join(){
  void* diov;
  int out = join(&diov);

  // if (ptrs_head == NULL) { return -1; }
  // ptr_storage* curr_ptrs;
  // ptr_storage* prev_ptrs = ptrs_head;
  // for (curr_ptrs = ptrs_head; curr_ptrs->offset_ptr != diov && curr_ptrs->next != NULL; curr_ptrs = curr_ptrs->next) {
  //   prev_ptrs = curr_ptrs;
  // }
  // if (curr_ptrs->next == NULL && curr_ptrs->offset_ptr != diov) { return -1; }
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
    if (ptr_pairs[i].offset_ptr == diov) { break; }
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }

  free(ptr_pairs[i].orig_ptr);
  cell_full[i] = 0;

  return out;
}

// https://en.wikipedia.org/wiki/Fetch-and-add 
static inline int fetch_and_add(int* variable, int value) {
    __asm__ volatile("lock; xaddl %0, %1"
      : "+r" (value), "+m" (*variable) // input + output
      : // No input-only
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
  lock->ticket = 0;
  lock->turn = 0;
}

void lock_acquire(lock_t *lock) {

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
      ; // spin
    }
}

void lock_release(lock_t *lock) {
    lock->turn = lock->turn + 1;
}
