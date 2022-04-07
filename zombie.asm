
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  15:	e8 1f 03 00 00       	call   339 <fork>
  1a:	85 c0                	test   %eax,%eax
  1c:	7f 05                	jg     23 <main+0x23>
    sleep(5);  // Let child exit before parent.
  exit();
  1e:	e8 26 03 00 00       	call   349 <exit>
    sleep(5);  // Let child exit before parent.
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	6a 05                	push   $0x5
  28:	e8 b4 03 00 00       	call   3e1 <sleep>
  2d:	83 c4 10             	add    $0x10,%esp
  30:	eb ec                	jmp    1e <main+0x1e>

00000032 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  32:	f3 0f 1e fb          	endbr32 
  36:	55                   	push   %ebp
  37:	89 e5                	mov    %esp,%ebp
  39:	56                   	push   %esi
  3a:	53                   	push   %ebx
  3b:	8b 75 08             	mov    0x8(%ebp),%esi
  3e:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  41:	89 f0                	mov    %esi,%eax
  43:	89 d1                	mov    %edx,%ecx
  45:	83 c2 01             	add    $0x1,%edx
  48:	89 c3                	mov    %eax,%ebx
  4a:	83 c0 01             	add    $0x1,%eax
  4d:	0f b6 09             	movzbl (%ecx),%ecx
  50:	88 0b                	mov    %cl,(%ebx)
  52:	84 c9                	test   %cl,%cl
  54:	75 ed                	jne    43 <strcpy+0x11>
    ;
  return os;
}
  56:	89 f0                	mov    %esi,%eax
  58:	5b                   	pop    %ebx
  59:	5e                   	pop    %esi
  5a:	5d                   	pop    %ebp
  5b:	c3                   	ret    

0000005c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  5c:	f3 0f 1e fb          	endbr32 
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  66:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  69:	0f b6 01             	movzbl (%ecx),%eax
  6c:	84 c0                	test   %al,%al
  6e:	74 0c                	je     7c <strcmp+0x20>
  70:	3a 02                	cmp    (%edx),%al
  72:	75 08                	jne    7c <strcmp+0x20>
    p++, q++;
  74:	83 c1 01             	add    $0x1,%ecx
  77:	83 c2 01             	add    $0x1,%edx
  7a:	eb ed                	jmp    69 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  7c:	0f b6 c0             	movzbl %al,%eax
  7f:	0f b6 12             	movzbl (%edx),%edx
  82:	29 d0                	sub    %edx,%eax
}
  84:	5d                   	pop    %ebp
  85:	c3                   	ret    

00000086 <strlen>:

uint
strlen(const char *s)
{
  86:	f3 0f 1e fb          	endbr32 
  8a:	55                   	push   %ebp
  8b:	89 e5                	mov    %esp,%ebp
  8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  90:	b8 00 00 00 00       	mov    $0x0,%eax
  95:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  99:	74 05                	je     a0 <strlen+0x1a>
  9b:	83 c0 01             	add    $0x1,%eax
  9e:	eb f5                	jmp    95 <strlen+0xf>
    ;
  return n;
}
  a0:	5d                   	pop    %ebp
  a1:	c3                   	ret    

000000a2 <memset>:

void*
memset(void *dst, int c, uint n)
{
  a2:	f3 0f 1e fb          	endbr32 
  a6:	55                   	push   %ebp
  a7:	89 e5                	mov    %esp,%ebp
  a9:	57                   	push   %edi
  aa:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  ad:	89 d7                	mov    %edx,%edi
  af:	8b 4d 10             	mov    0x10(%ebp),%ecx
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	fc                   	cld    
  b6:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  b8:	89 d0                	mov    %edx,%eax
  ba:	5f                   	pop    %edi
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret    

000000bd <strchr>:

char*
strchr(const char *s, char c)
{
  bd:	f3 0f 1e fb          	endbr32 
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  cb:	0f b6 10             	movzbl (%eax),%edx
  ce:	84 d2                	test   %dl,%dl
  d0:	74 09                	je     db <strchr+0x1e>
    if(*s == c)
  d2:	38 ca                	cmp    %cl,%dl
  d4:	74 0a                	je     e0 <strchr+0x23>
  for(; *s; s++)
  d6:	83 c0 01             	add    $0x1,%eax
  d9:	eb f0                	jmp    cb <strchr+0xe>
      return (char*)s;
  return 0;
  db:	b8 00 00 00 00       	mov    $0x0,%eax
}
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret    

000000e2 <gets>:

char*
gets(char *buf, int max)
{
  e2:	f3 0f 1e fb          	endbr32 
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  e9:	57                   	push   %edi
  ea:	56                   	push   %esi
  eb:	53                   	push   %ebx
  ec:	83 ec 1c             	sub    $0x1c,%esp
  ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
  f2:	bb 00 00 00 00       	mov    $0x0,%ebx
  f7:	89 de                	mov    %ebx,%esi
  f9:	83 c3 01             	add    $0x1,%ebx
  fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  ff:	7d 2e                	jge    12f <gets+0x4d>
    cc = read(0, &c, 1);
 101:	83 ec 04             	sub    $0x4,%esp
 104:	6a 01                	push   $0x1
 106:	8d 45 e7             	lea    -0x19(%ebp),%eax
 109:	50                   	push   %eax
 10a:	6a 00                	push   $0x0
 10c:	e8 58 02 00 00       	call   369 <read>
    if(cc < 1)
 111:	83 c4 10             	add    $0x10,%esp
 114:	85 c0                	test   %eax,%eax
 116:	7e 17                	jle    12f <gets+0x4d>
      break;
    buf[i++] = c;
 118:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 11c:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 11f:	3c 0a                	cmp    $0xa,%al
 121:	0f 94 c2             	sete   %dl
 124:	3c 0d                	cmp    $0xd,%al
 126:	0f 94 c0             	sete   %al
 129:	08 c2                	or     %al,%dl
 12b:	74 ca                	je     f7 <gets+0x15>
    buf[i++] = c;
 12d:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 12f:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 133:	89 f8                	mov    %edi,%eax
 135:	8d 65 f4             	lea    -0xc(%ebp),%esp
 138:	5b                   	pop    %ebx
 139:	5e                   	pop    %esi
 13a:	5f                   	pop    %edi
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    

0000013d <stat>:

int
stat(const char *n, struct stat *st)
{
 13d:	f3 0f 1e fb          	endbr32 
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 146:	83 ec 08             	sub    $0x8,%esp
 149:	6a 00                	push   $0x0
 14b:	ff 75 08             	pushl  0x8(%ebp)
 14e:	e8 3e 02 00 00       	call   391 <open>
  if(fd < 0)
 153:	83 c4 10             	add    $0x10,%esp
 156:	85 c0                	test   %eax,%eax
 158:	78 24                	js     17e <stat+0x41>
 15a:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 15c:	83 ec 08             	sub    $0x8,%esp
 15f:	ff 75 0c             	pushl  0xc(%ebp)
 162:	50                   	push   %eax
 163:	e8 41 02 00 00       	call   3a9 <fstat>
 168:	89 c6                	mov    %eax,%esi
  close(fd);
 16a:	89 1c 24             	mov    %ebx,(%esp)
 16d:	e8 07 02 00 00       	call   379 <close>
  return r;
 172:	83 c4 10             	add    $0x10,%esp
}
 175:	89 f0                	mov    %esi,%eax
 177:	8d 65 f8             	lea    -0x8(%ebp),%esp
 17a:	5b                   	pop    %ebx
 17b:	5e                   	pop    %esi
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
    return -1;
 17e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 183:	eb f0                	jmp    175 <stat+0x38>

00000185 <atoi>:

int
atoi(const char *s)
{
 185:	f3 0f 1e fb          	endbr32 
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	53                   	push   %ebx
 18d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 190:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 195:	0f b6 01             	movzbl (%ecx),%eax
 198:	8d 58 d0             	lea    -0x30(%eax),%ebx
 19b:	80 fb 09             	cmp    $0x9,%bl
 19e:	77 12                	ja     1b2 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 1a0:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1a3:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1a6:	83 c1 01             	add    $0x1,%ecx
 1a9:	0f be c0             	movsbl %al,%eax
 1ac:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1b0:	eb e3                	jmp    195 <atoi+0x10>
  return n;
}
 1b2:	89 d0                	mov    %edx,%eax
 1b4:	5b                   	pop    %ebx
 1b5:	5d                   	pop    %ebp
 1b6:	c3                   	ret    

000001b7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1b7:	f3 0f 1e fb          	endbr32 
 1bb:	55                   	push   %ebp
 1bc:	89 e5                	mov    %esp,%ebp
 1be:	56                   	push   %esi
 1bf:	53                   	push   %ebx
 1c0:	8b 75 08             	mov    0x8(%ebp),%esi
 1c3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1c6:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1c9:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1cb:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1ce:	85 c0                	test   %eax,%eax
 1d0:	7e 0f                	jle    1e1 <memmove+0x2a>
    *dst++ = *src++;
 1d2:	0f b6 01             	movzbl (%ecx),%eax
 1d5:	88 02                	mov    %al,(%edx)
 1d7:	8d 49 01             	lea    0x1(%ecx),%ecx
 1da:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 1dd:	89 d8                	mov    %ebx,%eax
 1df:	eb ea                	jmp    1cb <memmove+0x14>
  return vdst;
}
 1e1:	89 f0                	mov    %esi,%eax
 1e3:	5b                   	pop    %ebx
 1e4:	5e                   	pop    %esi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 1e7:	f3 0f 1e fb          	endbr32 
 1eb:	55                   	push   %ebp
 1ec:	89 e5                	mov    %esp,%ebp
 1ee:	53                   	push   %ebx
 1ef:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 1f2:	68 00 20 00 00       	push   $0x2000
 1f7:	e8 c7 04 00 00       	call   6c3 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 1fc:	83 c4 10             	add    $0x10,%esp
 1ff:	89 c2                	mov    %eax,%edx
 201:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 207:	74 22                	je     22b <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 209:	b9 00 10 00 00       	mov    $0x1000,%ecx
 20e:	29 d1                	sub    %edx,%ecx
 210:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 212:	ba 00 00 00 00       	mov    $0x0,%edx
 217:	83 fa 3f             	cmp    $0x3f,%edx
 21a:	7f 13                	jg     22f <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 21c:	83 3c 95 e0 0d 00 00 	cmpl   $0x1,0xde0(,%edx,4)
 223:	01 
 224:	75 09                	jne    22f <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 226:	83 c2 01             	add    $0x1,%edx
 229:	eb ec                	jmp    217 <thread_create+0x30>
  void *user_stack = curr_ptr;
 22b:	89 c1                	mov    %eax,%ecx
 22d:	eb e3                	jmp    212 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 22f:	83 3c 95 e0 0d 00 00 	cmpl   $0x1,0xde0(,%edx,4)
 236:	01 
 237:	74 34                	je     26d <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 239:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 23c:	c1 e3 02             	shl    $0x2,%ebx
 23f:	89 83 e0 0a 00 00    	mov    %eax,0xae0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 245:	89 8b e4 0a 00 00    	mov    %ecx,0xae4(%ebx)
  cell_full[i] = 1;
 24b:	c7 04 95 e0 0d 00 00 	movl   $0x1,0xde0(,%edx,4)
 252:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 256:	ff 75 10             	pushl  0x10(%ebp)
 259:	ff 75 0c             	pushl  0xc(%ebp)
 25c:	ff 75 08             	pushl  0x8(%ebp)
 25f:	51                   	push   %ecx
 260:	e8 dc 00 00 00       	call   341 <clone>
 265:	83 c4 10             	add    $0x10,%esp
}
 268:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 26b:	c9                   	leave  
 26c:	c3                   	ret    
    return -1;
 26d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 272:	eb f4                	jmp    268 <thread_create+0x81>

00000274 <thread_join>:

int thread_join(){
 274:	f3 0f 1e fb          	endbr32 
 278:	55                   	push   %ebp
 279:	89 e5                	mov    %esp,%ebp
 27b:	56                   	push   %esi
 27c:	53                   	push   %ebx
 27d:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 280:	8d 45 f4             	lea    -0xc(%ebp),%eax
 283:	50                   	push   %eax
 284:	e8 d0 00 00 00       	call   359 <join>
 289:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 28b:	83 c4 10             	add    $0x10,%esp
 28e:	bb 00 00 00 00       	mov    $0x0,%ebx
 293:	83 fb 3f             	cmp    $0x3f,%ebx
 296:	7f 14                	jg     2ac <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 298:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 29b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 29e:	39 14 85 e4 0a 00 00 	cmp    %edx,0xae4(,%eax,4)
 2a5:	74 05                	je     2ac <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 2a7:	83 c3 01             	add    $0x1,%ebx
 2aa:	eb e7                	jmp    293 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 2ac:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2af:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 2b2:	39 0c 85 e4 0a 00 00 	cmp    %ecx,0xae4(,%eax,4)
 2b9:	75 26                	jne    2e1 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 2bb:	83 ec 0c             	sub    $0xc,%esp
 2be:	ff 34 85 e0 0a 00 00 	pushl  0xae0(,%eax,4)
 2c5:	e8 35 03 00 00       	call   5ff <free>
  cell_full[i] = 0;
 2ca:	c7 04 9d e0 0d 00 00 	movl   $0x0,0xde0(,%ebx,4)
 2d1:	00 00 00 00 

  return out;
 2d5:	83 c4 10             	add    $0x10,%esp
}
 2d8:	89 f0                	mov    %esi,%eax
 2da:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2dd:	5b                   	pop    %ebx
 2de:	5e                   	pop    %esi
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 2e1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2e6:	eb f0                	jmp    2d8 <thread_join+0x64>

000002e8 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 2e8:	f3 0f 1e fb          	endbr32 
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 2f2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 2f8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    

00000301 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 301:	f3 0f 1e fb          	endbr32 
 305:	55                   	push   %ebp
 306:	89 e5                	mov    %esp,%ebp
 308:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 30b:	b9 01 00 00 00       	mov    $0x1,%ecx
 310:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 314:	b8 00 00 00 00       	mov    $0x0,%eax
 319:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 31e:	39 c1                	cmp    %eax,%ecx
 320:	75 f2                	jne    314 <lock_acquire+0x13>
      ; // spin
    }
}
 322:	5d                   	pop    %ebp
 323:	c3                   	ret    

00000324 <lock_release>:

void lock_release(lock_t *lock) {
 324:	f3 0f 1e fb          	endbr32 
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 32e:	8b 42 04             	mov    0x4(%edx),%eax
 331:	83 c0 01             	add    $0x1,%eax
 334:	89 42 04             	mov    %eax,0x4(%edx)
}
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    

00000339 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 339:	b8 01 00 00 00       	mov    $0x1,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <clone>:
SYSCALL(clone)
 341:	b8 16 00 00 00       	mov    $0x16,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <exit>:
SYSCALL(exit)
 349:	b8 02 00 00 00       	mov    $0x2,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <wait>:
SYSCALL(wait)
 351:	b8 03 00 00 00       	mov    $0x3,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <join>:
SYSCALL(join)
 359:	b8 17 00 00 00       	mov    $0x17,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <pipe>:
SYSCALL(pipe)
 361:	b8 04 00 00 00       	mov    $0x4,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <read>:
SYSCALL(read)
 369:	b8 05 00 00 00       	mov    $0x5,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <write>:
SYSCALL(write)
 371:	b8 10 00 00 00       	mov    $0x10,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <close>:
SYSCALL(close)
 379:	b8 15 00 00 00       	mov    $0x15,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <kill>:
SYSCALL(kill)
 381:	b8 06 00 00 00       	mov    $0x6,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <exec>:
SYSCALL(exec)
 389:	b8 07 00 00 00       	mov    $0x7,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <open>:
SYSCALL(open)
 391:	b8 0f 00 00 00       	mov    $0xf,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <mknod>:
SYSCALL(mknod)
 399:	b8 11 00 00 00       	mov    $0x11,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <unlink>:
SYSCALL(unlink)
 3a1:	b8 12 00 00 00       	mov    $0x12,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <fstat>:
SYSCALL(fstat)
 3a9:	b8 08 00 00 00       	mov    $0x8,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <link>:
SYSCALL(link)
 3b1:	b8 13 00 00 00       	mov    $0x13,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <mkdir>:
SYSCALL(mkdir)
 3b9:	b8 14 00 00 00       	mov    $0x14,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <chdir>:
SYSCALL(chdir)
 3c1:	b8 09 00 00 00       	mov    $0x9,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <dup>:
SYSCALL(dup)
 3c9:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <getpid>:
SYSCALL(getpid)
 3d1:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <sbrk>:
SYSCALL(sbrk)
 3d9:	b8 0c 00 00 00       	mov    $0xc,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <sleep>:
SYSCALL(sleep)
 3e1:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <uptime>:
SYSCALL(uptime)
 3e9:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3f1:	55                   	push   %ebp
 3f2:	89 e5                	mov    %esp,%ebp
 3f4:	83 ec 1c             	sub    $0x1c,%esp
 3f7:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 3fa:	6a 01                	push   $0x1
 3fc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 3ff:	52                   	push   %edx
 400:	50                   	push   %eax
 401:	e8 6b ff ff ff       	call   371 <write>
}
 406:	83 c4 10             	add    $0x10,%esp
 409:	c9                   	leave  
 40a:	c3                   	ret    

0000040b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	57                   	push   %edi
 40f:	56                   	push   %esi
 410:	53                   	push   %ebx
 411:	83 ec 2c             	sub    $0x2c,%esp
 414:	89 45 d0             	mov    %eax,-0x30(%ebp)
 417:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 419:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 41d:	0f 95 c2             	setne  %dl
 420:	89 f0                	mov    %esi,%eax
 422:	c1 e8 1f             	shr    $0x1f,%eax
 425:	84 c2                	test   %al,%dl
 427:	74 42                	je     46b <printint+0x60>
    neg = 1;
    x = -xx;
 429:	f7 de                	neg    %esi
    neg = 1;
 42b:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 432:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 437:	89 f0                	mov    %esi,%eax
 439:	ba 00 00 00 00       	mov    $0x0,%edx
 43e:	f7 f1                	div    %ecx
 440:	89 df                	mov    %ebx,%edi
 442:	83 c3 01             	add    $0x1,%ebx
 445:	0f b6 92 58 07 00 00 	movzbl 0x758(%edx),%edx
 44c:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 450:	89 f2                	mov    %esi,%edx
 452:	89 c6                	mov    %eax,%esi
 454:	39 d1                	cmp    %edx,%ecx
 456:	76 df                	jbe    437 <printint+0x2c>
  if(neg)
 458:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 45c:	74 2f                	je     48d <printint+0x82>
    buf[i++] = '-';
 45e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 463:	8d 5f 02             	lea    0x2(%edi),%ebx
 466:	8b 75 d0             	mov    -0x30(%ebp),%esi
 469:	eb 15                	jmp    480 <printint+0x75>
  neg = 0;
 46b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 472:	eb be                	jmp    432 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 474:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 479:	89 f0                	mov    %esi,%eax
 47b:	e8 71 ff ff ff       	call   3f1 <putc>
  while(--i >= 0)
 480:	83 eb 01             	sub    $0x1,%ebx
 483:	79 ef                	jns    474 <printint+0x69>
}
 485:	83 c4 2c             	add    $0x2c,%esp
 488:	5b                   	pop    %ebx
 489:	5e                   	pop    %esi
 48a:	5f                   	pop    %edi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    
 48d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 490:	eb ee                	jmp    480 <printint+0x75>

00000492 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 492:	f3 0f 1e fb          	endbr32 
 496:	55                   	push   %ebp
 497:	89 e5                	mov    %esp,%ebp
 499:	57                   	push   %edi
 49a:	56                   	push   %esi
 49b:	53                   	push   %ebx
 49c:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 49f:	8d 45 10             	lea    0x10(%ebp),%eax
 4a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4a5:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4aa:	bb 00 00 00 00       	mov    $0x0,%ebx
 4af:	eb 14                	jmp    4c5 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4b1:	89 fa                	mov    %edi,%edx
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	e8 36 ff ff ff       	call   3f1 <putc>
 4bb:	eb 05                	jmp    4c2 <printf+0x30>
      }
    } else if(state == '%'){
 4bd:	83 fe 25             	cmp    $0x25,%esi
 4c0:	74 25                	je     4e7 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 4c2:	83 c3 01             	add    $0x1,%ebx
 4c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c8:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4cc:	84 c0                	test   %al,%al
 4ce:	0f 84 23 01 00 00    	je     5f7 <printf+0x165>
    c = fmt[i] & 0xff;
 4d4:	0f be f8             	movsbl %al,%edi
 4d7:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4da:	85 f6                	test   %esi,%esi
 4dc:	75 df                	jne    4bd <printf+0x2b>
      if(c == '%'){
 4de:	83 f8 25             	cmp    $0x25,%eax
 4e1:	75 ce                	jne    4b1 <printf+0x1f>
        state = '%';
 4e3:	89 c6                	mov    %eax,%esi
 4e5:	eb db                	jmp    4c2 <printf+0x30>
      if(c == 'd'){
 4e7:	83 f8 64             	cmp    $0x64,%eax
 4ea:	74 49                	je     535 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4ec:	83 f8 78             	cmp    $0x78,%eax
 4ef:	0f 94 c1             	sete   %cl
 4f2:	83 f8 70             	cmp    $0x70,%eax
 4f5:	0f 94 c2             	sete   %dl
 4f8:	08 d1                	or     %dl,%cl
 4fa:	75 63                	jne    55f <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4fc:	83 f8 73             	cmp    $0x73,%eax
 4ff:	0f 84 84 00 00 00    	je     589 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 505:	83 f8 63             	cmp    $0x63,%eax
 508:	0f 84 b7 00 00 00    	je     5c5 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 50e:	83 f8 25             	cmp    $0x25,%eax
 511:	0f 84 cc 00 00 00    	je     5e3 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 517:	ba 25 00 00 00       	mov    $0x25,%edx
 51c:	8b 45 08             	mov    0x8(%ebp),%eax
 51f:	e8 cd fe ff ff       	call   3f1 <putc>
        putc(fd, c);
 524:	89 fa                	mov    %edi,%edx
 526:	8b 45 08             	mov    0x8(%ebp),%eax
 529:	e8 c3 fe ff ff       	call   3f1 <putc>
      }
      state = 0;
 52e:	be 00 00 00 00       	mov    $0x0,%esi
 533:	eb 8d                	jmp    4c2 <printf+0x30>
        printint(fd, *ap, 10, 1);
 535:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 538:	8b 17                	mov    (%edi),%edx
 53a:	83 ec 0c             	sub    $0xc,%esp
 53d:	6a 01                	push   $0x1
 53f:	b9 0a 00 00 00       	mov    $0xa,%ecx
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	e8 bf fe ff ff       	call   40b <printint>
        ap++;
 54c:	83 c7 04             	add    $0x4,%edi
 54f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 552:	83 c4 10             	add    $0x10,%esp
      state = 0;
 555:	be 00 00 00 00       	mov    $0x0,%esi
 55a:	e9 63 ff ff ff       	jmp    4c2 <printf+0x30>
        printint(fd, *ap, 16, 0);
 55f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 562:	8b 17                	mov    (%edi),%edx
 564:	83 ec 0c             	sub    $0xc,%esp
 567:	6a 00                	push   $0x0
 569:	b9 10 00 00 00       	mov    $0x10,%ecx
 56e:	8b 45 08             	mov    0x8(%ebp),%eax
 571:	e8 95 fe ff ff       	call   40b <printint>
        ap++;
 576:	83 c7 04             	add    $0x4,%edi
 579:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57f:	be 00 00 00 00       	mov    $0x0,%esi
 584:	e9 39 ff ff ff       	jmp    4c2 <printf+0x30>
        s = (char*)*ap;
 589:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58c:	8b 30                	mov    (%eax),%esi
        ap++;
 58e:	83 c0 04             	add    $0x4,%eax
 591:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 594:	85 f6                	test   %esi,%esi
 596:	75 28                	jne    5c0 <printf+0x12e>
          s = "(null)";
 598:	be 50 07 00 00       	mov    $0x750,%esi
 59d:	8b 7d 08             	mov    0x8(%ebp),%edi
 5a0:	eb 0d                	jmp    5af <printf+0x11d>
          putc(fd, *s);
 5a2:	0f be d2             	movsbl %dl,%edx
 5a5:	89 f8                	mov    %edi,%eax
 5a7:	e8 45 fe ff ff       	call   3f1 <putc>
          s++;
 5ac:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5af:	0f b6 16             	movzbl (%esi),%edx
 5b2:	84 d2                	test   %dl,%dl
 5b4:	75 ec                	jne    5a2 <printf+0x110>
      state = 0;
 5b6:	be 00 00 00 00       	mov    $0x0,%esi
 5bb:	e9 02 ff ff ff       	jmp    4c2 <printf+0x30>
 5c0:	8b 7d 08             	mov    0x8(%ebp),%edi
 5c3:	eb ea                	jmp    5af <printf+0x11d>
        putc(fd, *ap);
 5c5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5c8:	0f be 17             	movsbl (%edi),%edx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 1e fe ff ff       	call   3f1 <putc>
        ap++;
 5d3:	83 c7 04             	add    $0x4,%edi
 5d6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5d9:	be 00 00 00 00       	mov    $0x0,%esi
 5de:	e9 df fe ff ff       	jmp    4c2 <printf+0x30>
        putc(fd, c);
 5e3:	89 fa                	mov    %edi,%edx
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	e8 04 fe ff ff       	call   3f1 <putc>
      state = 0;
 5ed:	be 00 00 00 00       	mov    $0x0,%esi
 5f2:	e9 cb fe ff ff       	jmp    4c2 <printf+0x30>
    }
  }
}
 5f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fa:	5b                   	pop    %ebx
 5fb:	5e                   	pop    %esi
 5fc:	5f                   	pop    %edi
 5fd:	5d                   	pop    %ebp
 5fe:	c3                   	ret    

000005ff <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ff:	f3 0f 1e fb          	endbr32 
 603:	55                   	push   %ebp
 604:	89 e5                	mov    %esp,%ebp
 606:	57                   	push   %edi
 607:	56                   	push   %esi
 608:	53                   	push   %ebx
 609:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 60c:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60f:	a1 c0 0a 00 00       	mov    0xac0,%eax
 614:	eb 02                	jmp    618 <free+0x19>
 616:	89 d0                	mov    %edx,%eax
 618:	39 c8                	cmp    %ecx,%eax
 61a:	73 04                	jae    620 <free+0x21>
 61c:	39 08                	cmp    %ecx,(%eax)
 61e:	77 12                	ja     632 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 620:	8b 10                	mov    (%eax),%edx
 622:	39 c2                	cmp    %eax,%edx
 624:	77 f0                	ja     616 <free+0x17>
 626:	39 c8                	cmp    %ecx,%eax
 628:	72 08                	jb     632 <free+0x33>
 62a:	39 ca                	cmp    %ecx,%edx
 62c:	77 04                	ja     632 <free+0x33>
 62e:	89 d0                	mov    %edx,%eax
 630:	eb e6                	jmp    618 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 632:	8b 73 fc             	mov    -0x4(%ebx),%esi
 635:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 638:	8b 10                	mov    (%eax),%edx
 63a:	39 d7                	cmp    %edx,%edi
 63c:	74 19                	je     657 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 63e:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 641:	8b 50 04             	mov    0x4(%eax),%edx
 644:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 647:	39 ce                	cmp    %ecx,%esi
 649:	74 1b                	je     666 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 64b:	89 08                	mov    %ecx,(%eax)
  freep = p;
 64d:	a3 c0 0a 00 00       	mov    %eax,0xac0
}
 652:	5b                   	pop    %ebx
 653:	5e                   	pop    %esi
 654:	5f                   	pop    %edi
 655:	5d                   	pop    %ebp
 656:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 657:	03 72 04             	add    0x4(%edx),%esi
 65a:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 65d:	8b 10                	mov    (%eax),%edx
 65f:	8b 12                	mov    (%edx),%edx
 661:	89 53 f8             	mov    %edx,-0x8(%ebx)
 664:	eb db                	jmp    641 <free+0x42>
    p->s.size += bp->s.size;
 666:	03 53 fc             	add    -0x4(%ebx),%edx
 669:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 66c:	8b 53 f8             	mov    -0x8(%ebx),%edx
 66f:	89 10                	mov    %edx,(%eax)
 671:	eb da                	jmp    64d <free+0x4e>

00000673 <morecore>:

static Header*
morecore(uint nu)
{
 673:	55                   	push   %ebp
 674:	89 e5                	mov    %esp,%ebp
 676:	53                   	push   %ebx
 677:	83 ec 04             	sub    $0x4,%esp
 67a:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 67c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 681:	77 05                	ja     688 <morecore+0x15>
    nu = 4096;
 683:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 688:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 68f:	83 ec 0c             	sub    $0xc,%esp
 692:	50                   	push   %eax
 693:	e8 41 fd ff ff       	call   3d9 <sbrk>
  if(p == (char*)-1)
 698:	83 c4 10             	add    $0x10,%esp
 69b:	83 f8 ff             	cmp    $0xffffffff,%eax
 69e:	74 1c                	je     6bc <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6a0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6a3:	83 c0 08             	add    $0x8,%eax
 6a6:	83 ec 0c             	sub    $0xc,%esp
 6a9:	50                   	push   %eax
 6aa:	e8 50 ff ff ff       	call   5ff <free>
  return freep;
 6af:	a1 c0 0a 00 00       	mov    0xac0,%eax
 6b4:	83 c4 10             	add    $0x10,%esp
}
 6b7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ba:	c9                   	leave  
 6bb:	c3                   	ret    
    return 0;
 6bc:	b8 00 00 00 00       	mov    $0x0,%eax
 6c1:	eb f4                	jmp    6b7 <morecore+0x44>

000006c3 <malloc>:

void*
malloc(uint nbytes)
{
 6c3:	f3 0f 1e fb          	endbr32 
 6c7:	55                   	push   %ebp
 6c8:	89 e5                	mov    %esp,%ebp
 6ca:	53                   	push   %ebx
 6cb:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	8d 58 07             	lea    0x7(%eax),%ebx
 6d4:	c1 eb 03             	shr    $0x3,%ebx
 6d7:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6da:	8b 0d c0 0a 00 00    	mov    0xac0,%ecx
 6e0:	85 c9                	test   %ecx,%ecx
 6e2:	74 04                	je     6e8 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e4:	8b 01                	mov    (%ecx),%eax
 6e6:	eb 4b                	jmp    733 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 6e8:	c7 05 c0 0a 00 00 c4 	movl   $0xac4,0xac0
 6ef:	0a 00 00 
 6f2:	c7 05 c4 0a 00 00 c4 	movl   $0xac4,0xac4
 6f9:	0a 00 00 
    base.s.size = 0;
 6fc:	c7 05 c8 0a 00 00 00 	movl   $0x0,0xac8
 703:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 706:	b9 c4 0a 00 00       	mov    $0xac4,%ecx
 70b:	eb d7                	jmp    6e4 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 70d:	74 1a                	je     729 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 70f:	29 da                	sub    %ebx,%edx
 711:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 714:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 717:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 71a:	89 0d c0 0a 00 00    	mov    %ecx,0xac0
      return (void*)(p + 1);
 720:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 723:	83 c4 04             	add    $0x4,%esp
 726:	5b                   	pop    %ebx
 727:	5d                   	pop    %ebp
 728:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 729:	8b 10                	mov    (%eax),%edx
 72b:	89 11                	mov    %edx,(%ecx)
 72d:	eb eb                	jmp    71a <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 72f:	89 c1                	mov    %eax,%ecx
 731:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 733:	8b 50 04             	mov    0x4(%eax),%edx
 736:	39 da                	cmp    %ebx,%edx
 738:	73 d3                	jae    70d <malloc+0x4a>
    if(p == freep)
 73a:	39 05 c0 0a 00 00    	cmp    %eax,0xac0
 740:	75 ed                	jne    72f <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 742:	89 d8                	mov    %ebx,%eax
 744:	e8 2a ff ff ff       	call   673 <morecore>
 749:	85 c0                	test   %eax,%eax
 74b:	75 e2                	jne    72f <malloc+0x6c>
 74d:	eb d4                	jmp    723 <malloc+0x60>
