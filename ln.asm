
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  13:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  16:	83 39 03             	cmpl   $0x3,(%ecx)
  19:	74 14                	je     2f <main+0x2f>
    printf(2, "Usage: ln old new\n");
  1b:	83 ec 08             	sub    $0x8,%esp
  1e:	68 80 07 00 00       	push   $0x780
  23:	6a 02                	push   $0x2
  25:	e8 96 04 00 00       	call   4c0 <printf>
    exit();
  2a:	e8 48 03 00 00       	call   377 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2f:	83 ec 08             	sub    $0x8,%esp
  32:	ff 73 08             	pushl  0x8(%ebx)
  35:	ff 73 04             	pushl  0x4(%ebx)
  38:	e8 a2 03 00 00       	call   3df <link>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	85 c0                	test   %eax,%eax
  42:	78 05                	js     49 <main+0x49>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  44:	e8 2e 03 00 00       	call   377 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  49:	ff 73 08             	pushl  0x8(%ebx)
  4c:	ff 73 04             	pushl  0x4(%ebx)
  4f:	68 93 07 00 00       	push   $0x793
  54:	6a 02                	push   $0x2
  56:	e8 65 04 00 00       	call   4c0 <printf>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	eb e4                	jmp    44 <main+0x44>

00000060 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  60:	f3 0f 1e fb          	endbr32 
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	56                   	push   %esi
  68:	53                   	push   %ebx
  69:	8b 75 08             	mov    0x8(%ebp),%esi
  6c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6f:	89 f0                	mov    %esi,%eax
  71:	89 d1                	mov    %edx,%ecx
  73:	83 c2 01             	add    $0x1,%edx
  76:	89 c3                	mov    %eax,%ebx
  78:	83 c0 01             	add    $0x1,%eax
  7b:	0f b6 09             	movzbl (%ecx),%ecx
  7e:	88 0b                	mov    %cl,(%ebx)
  80:	84 c9                	test   %cl,%cl
  82:	75 ed                	jne    71 <strcpy+0x11>
    ;
  return os;
}
  84:	89 f0                	mov    %esi,%eax
  86:	5b                   	pop    %ebx
  87:	5e                   	pop    %esi
  88:	5d                   	pop    %ebp
  89:	c3                   	ret    

0000008a <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8a:	f3 0f 1e fb          	endbr32 
  8e:	55                   	push   %ebp
  8f:	89 e5                	mov    %esp,%ebp
  91:	8b 4d 08             	mov    0x8(%ebp),%ecx
  94:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  97:	0f b6 01             	movzbl (%ecx),%eax
  9a:	84 c0                	test   %al,%al
  9c:	74 0c                	je     aa <strcmp+0x20>
  9e:	3a 02                	cmp    (%edx),%al
  a0:	75 08                	jne    aa <strcmp+0x20>
    p++, q++;
  a2:	83 c1 01             	add    $0x1,%ecx
  a5:	83 c2 01             	add    $0x1,%edx
  a8:	eb ed                	jmp    97 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  aa:	0f b6 c0             	movzbl %al,%eax
  ad:	0f b6 12             	movzbl (%edx),%edx
  b0:	29 d0                	sub    %edx,%eax
}
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strlen>:

uint
strlen(const char *s)
{
  b4:	f3 0f 1e fb          	endbr32 
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  be:	b8 00 00 00 00       	mov    $0x0,%eax
  c3:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  c7:	74 05                	je     ce <strlen+0x1a>
  c9:	83 c0 01             	add    $0x1,%eax
  cc:	eb f5                	jmp    c3 <strlen+0xf>
    ;
  return n;
}
  ce:	5d                   	pop    %ebp
  cf:	c3                   	ret    

000000d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d0:	f3 0f 1e fb          	endbr32 
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  d7:	57                   	push   %edi
  d8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  db:	89 d7                	mov    %edx,%edi
  dd:	8b 4d 10             	mov    0x10(%ebp),%ecx
  e0:	8b 45 0c             	mov    0xc(%ebp),%eax
  e3:	fc                   	cld    
  e4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e6:	89 d0                	mov    %edx,%eax
  e8:	5f                   	pop    %edi
  e9:	5d                   	pop    %ebp
  ea:	c3                   	ret    

000000eb <strchr>:

char*
strchr(const char *s, char c)
{
  eb:	f3 0f 1e fb          	endbr32 
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  f9:	0f b6 10             	movzbl (%eax),%edx
  fc:	84 d2                	test   %dl,%dl
  fe:	74 09                	je     109 <strchr+0x1e>
    if(*s == c)
 100:	38 ca                	cmp    %cl,%dl
 102:	74 0a                	je     10e <strchr+0x23>
  for(; *s; s++)
 104:	83 c0 01             	add    $0x1,%eax
 107:	eb f0                	jmp    f9 <strchr+0xe>
      return (char*)s;
  return 0;
 109:	b8 00 00 00 00       	mov    $0x0,%eax
}
 10e:	5d                   	pop    %ebp
 10f:	c3                   	ret    

00000110 <gets>:

char*
gets(char *buf, int max)
{
 110:	f3 0f 1e fb          	endbr32 
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	57                   	push   %edi
 118:	56                   	push   %esi
 119:	53                   	push   %ebx
 11a:	83 ec 1c             	sub    $0x1c,%esp
 11d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 120:	bb 00 00 00 00       	mov    $0x0,%ebx
 125:	89 de                	mov    %ebx,%esi
 127:	83 c3 01             	add    $0x1,%ebx
 12a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12d:	7d 2e                	jge    15d <gets+0x4d>
    cc = read(0, &c, 1);
 12f:	83 ec 04             	sub    $0x4,%esp
 132:	6a 01                	push   $0x1
 134:	8d 45 e7             	lea    -0x19(%ebp),%eax
 137:	50                   	push   %eax
 138:	6a 00                	push   $0x0
 13a:	e8 58 02 00 00       	call   397 <read>
    if(cc < 1)
 13f:	83 c4 10             	add    $0x10,%esp
 142:	85 c0                	test   %eax,%eax
 144:	7e 17                	jle    15d <gets+0x4d>
      break;
    buf[i++] = c;
 146:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 14a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14d:	3c 0a                	cmp    $0xa,%al
 14f:	0f 94 c2             	sete   %dl
 152:	3c 0d                	cmp    $0xd,%al
 154:	0f 94 c0             	sete   %al
 157:	08 c2                	or     %al,%dl
 159:	74 ca                	je     125 <gets+0x15>
    buf[i++] = c;
 15b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 161:	89 f8                	mov    %edi,%eax
 163:	8d 65 f4             	lea    -0xc(%ebp),%esp
 166:	5b                   	pop    %ebx
 167:	5e                   	pop    %esi
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    

0000016b <stat>:

int
stat(const char *n, struct stat *st)
{
 16b:	f3 0f 1e fb          	endbr32 
 16f:	55                   	push   %ebp
 170:	89 e5                	mov    %esp,%ebp
 172:	56                   	push   %esi
 173:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 174:	83 ec 08             	sub    $0x8,%esp
 177:	6a 00                	push   $0x0
 179:	ff 75 08             	pushl  0x8(%ebp)
 17c:	e8 3e 02 00 00       	call   3bf <open>
  if(fd < 0)
 181:	83 c4 10             	add    $0x10,%esp
 184:	85 c0                	test   %eax,%eax
 186:	78 24                	js     1ac <stat+0x41>
 188:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 18a:	83 ec 08             	sub    $0x8,%esp
 18d:	ff 75 0c             	pushl  0xc(%ebp)
 190:	50                   	push   %eax
 191:	e8 41 02 00 00       	call   3d7 <fstat>
 196:	89 c6                	mov    %eax,%esi
  close(fd);
 198:	89 1c 24             	mov    %ebx,(%esp)
 19b:	e8 07 02 00 00       	call   3a7 <close>
  return r;
 1a0:	83 c4 10             	add    $0x10,%esp
}
 1a3:	89 f0                	mov    %esi,%eax
 1a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a8:	5b                   	pop    %ebx
 1a9:	5e                   	pop    %esi
 1aa:	5d                   	pop    %ebp
 1ab:	c3                   	ret    
    return -1;
 1ac:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b1:	eb f0                	jmp    1a3 <stat+0x38>

000001b3 <atoi>:

int
atoi(const char *s)
{
 1b3:	f3 0f 1e fb          	endbr32 
 1b7:	55                   	push   %ebp
 1b8:	89 e5                	mov    %esp,%ebp
 1ba:	53                   	push   %ebx
 1bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1be:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1c3:	0f b6 01             	movzbl (%ecx),%eax
 1c6:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1c9:	80 fb 09             	cmp    $0x9,%bl
 1cc:	77 12                	ja     1e0 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 1ce:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1d1:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1d4:	83 c1 01             	add    $0x1,%ecx
 1d7:	0f be c0             	movsbl %al,%eax
 1da:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1de:	eb e3                	jmp    1c3 <atoi+0x10>
  return n;
}
 1e0:	89 d0                	mov    %edx,%eax
 1e2:	5b                   	pop    %ebx
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    

000001e5 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1e5:	f3 0f 1e fb          	endbr32 
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	56                   	push   %esi
 1ed:	53                   	push   %ebx
 1ee:	8b 75 08             	mov    0x8(%ebp),%esi
 1f1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1f7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1f9:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1fc:	85 c0                	test   %eax,%eax
 1fe:	7e 0f                	jle    20f <memmove+0x2a>
    *dst++ = *src++;
 200:	0f b6 01             	movzbl (%ecx),%eax
 203:	88 02                	mov    %al,(%edx)
 205:	8d 49 01             	lea    0x1(%ecx),%ecx
 208:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 20b:	89 d8                	mov    %ebx,%eax
 20d:	eb ea                	jmp    1f9 <memmove+0x14>
  return vdst;
}
 20f:	89 f0                	mov    %esi,%eax
 211:	5b                   	pop    %ebx
 212:	5e                   	pop    %esi
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    

00000215 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 215:	f3 0f 1e fb          	endbr32 
 219:	55                   	push   %ebp
 21a:	89 e5                	mov    %esp,%ebp
 21c:	53                   	push   %ebx
 21d:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 220:	68 00 20 00 00       	push   $0x2000
 225:	e8 c7 04 00 00       	call   6f1 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 22a:	83 c4 10             	add    $0x10,%esp
 22d:	89 c2                	mov    %eax,%edx
 22f:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 235:	74 22                	je     259 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 237:	b9 00 10 00 00       	mov    $0x1000,%ecx
 23c:	29 d1                	sub    %edx,%ecx
 23e:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 240:	ba 00 00 00 00       	mov    $0x0,%edx
 245:	83 fa 3f             	cmp    $0x3f,%edx
 248:	7f 13                	jg     25d <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 24a:	83 3c 95 40 0e 00 00 	cmpl   $0x1,0xe40(,%edx,4)
 251:	01 
 252:	75 09                	jne    25d <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 254:	83 c2 01             	add    $0x1,%edx
 257:	eb ec                	jmp    245 <thread_create+0x30>
  void *user_stack = curr_ptr;
 259:	89 c1                	mov    %eax,%ecx
 25b:	eb e3                	jmp    240 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 25d:	83 3c 95 40 0e 00 00 	cmpl   $0x1,0xe40(,%edx,4)
 264:	01 
 265:	74 34                	je     29b <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 267:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 26a:	c1 e3 02             	shl    $0x2,%ebx
 26d:	89 83 40 0b 00 00    	mov    %eax,0xb40(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 273:	89 8b 44 0b 00 00    	mov    %ecx,0xb44(%ebx)
  cell_full[i] = 1;
 279:	c7 04 95 40 0e 00 00 	movl   $0x1,0xe40(,%edx,4)
 280:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 284:	ff 75 10             	pushl  0x10(%ebp)
 287:	ff 75 0c             	pushl  0xc(%ebp)
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	51                   	push   %ecx
 28e:	e8 dc 00 00 00       	call   36f <clone>
 293:	83 c4 10             	add    $0x10,%esp
}
 296:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 299:	c9                   	leave  
 29a:	c3                   	ret    
    return -1;
 29b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a0:	eb f4                	jmp    296 <thread_create+0x81>

000002a2 <thread_join>:

int thread_join(){
 2a2:	f3 0f 1e fb          	endbr32 
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	56                   	push   %esi
 2aa:	53                   	push   %ebx
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 2ae:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2b1:	50                   	push   %eax
 2b2:	e8 d0 00 00 00       	call   387 <join>
 2b7:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 2b9:	83 c4 10             	add    $0x10,%esp
 2bc:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c1:	83 fb 3f             	cmp    $0x3f,%ebx
 2c4:	7f 14                	jg     2da <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 2c6:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2cc:	39 14 85 44 0b 00 00 	cmp    %edx,0xb44(,%eax,4)
 2d3:	74 05                	je     2da <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 2d5:	83 c3 01             	add    $0x1,%ebx
 2d8:	eb e7                	jmp    2c1 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 2da:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2dd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 2e0:	39 0c 85 44 0b 00 00 	cmp    %ecx,0xb44(,%eax,4)
 2e7:	75 26                	jne    30f <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 2e9:	83 ec 0c             	sub    $0xc,%esp
 2ec:	ff 34 85 40 0b 00 00 	pushl  0xb40(,%eax,4)
 2f3:	e8 35 03 00 00       	call   62d <free>
  cell_full[i] = 0;
 2f8:	c7 04 9d 40 0e 00 00 	movl   $0x0,0xe40(,%ebx,4)
 2ff:	00 00 00 00 

  return out;
 303:	83 c4 10             	add    $0x10,%esp
}
 306:	89 f0                	mov    %esi,%eax
 308:	8d 65 f8             	lea    -0x8(%ebp),%esp
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5d                   	pop    %ebp
 30e:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 30f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 314:	eb f0                	jmp    306 <thread_join+0x64>

00000316 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 316:	f3 0f 1e fb          	endbr32 
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 320:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 326:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 32d:	5d                   	pop    %ebp
 32e:	c3                   	ret    

0000032f <lock_acquire>:

void lock_acquire(lock_t *lock) {
 32f:	f3 0f 1e fb          	endbr32 
 333:	55                   	push   %ebp
 334:	89 e5                	mov    %esp,%ebp
 336:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 339:	b9 01 00 00 00       	mov    $0x1,%ecx
 33e:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 342:	b8 00 00 00 00       	mov    $0x0,%eax
 347:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 34c:	39 c1                	cmp    %eax,%ecx
 34e:	75 f2                	jne    342 <lock_acquire+0x13>
      ; // spin
    }
}
 350:	5d                   	pop    %ebp
 351:	c3                   	ret    

00000352 <lock_release>:

void lock_release(lock_t *lock) {
 352:	f3 0f 1e fb          	endbr32 
 356:	55                   	push   %ebp
 357:	89 e5                	mov    %esp,%ebp
 359:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 35c:	8b 42 04             	mov    0x4(%edx),%eax
 35f:	83 c0 01             	add    $0x1,%eax
 362:	89 42 04             	mov    %eax,0x4(%edx)
}
 365:	5d                   	pop    %ebp
 366:	c3                   	ret    

00000367 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 367:	b8 01 00 00 00       	mov    $0x1,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <clone>:
SYSCALL(clone)
 36f:	b8 16 00 00 00       	mov    $0x16,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <exit>:
SYSCALL(exit)
 377:	b8 02 00 00 00       	mov    $0x2,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <wait>:
SYSCALL(wait)
 37f:	b8 03 00 00 00       	mov    $0x3,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <join>:
SYSCALL(join)
 387:	b8 17 00 00 00       	mov    $0x17,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <pipe>:
SYSCALL(pipe)
 38f:	b8 04 00 00 00       	mov    $0x4,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <read>:
SYSCALL(read)
 397:	b8 05 00 00 00       	mov    $0x5,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <write>:
SYSCALL(write)
 39f:	b8 10 00 00 00       	mov    $0x10,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <close>:
SYSCALL(close)
 3a7:	b8 15 00 00 00       	mov    $0x15,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <kill>:
SYSCALL(kill)
 3af:	b8 06 00 00 00       	mov    $0x6,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <exec>:
SYSCALL(exec)
 3b7:	b8 07 00 00 00       	mov    $0x7,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <open>:
SYSCALL(open)
 3bf:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <mknod>:
SYSCALL(mknod)
 3c7:	b8 11 00 00 00       	mov    $0x11,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <unlink>:
SYSCALL(unlink)
 3cf:	b8 12 00 00 00       	mov    $0x12,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <fstat>:
SYSCALL(fstat)
 3d7:	b8 08 00 00 00       	mov    $0x8,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <link>:
SYSCALL(link)
 3df:	b8 13 00 00 00       	mov    $0x13,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <mkdir>:
SYSCALL(mkdir)
 3e7:	b8 14 00 00 00       	mov    $0x14,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <chdir>:
SYSCALL(chdir)
 3ef:	b8 09 00 00 00       	mov    $0x9,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <dup>:
SYSCALL(dup)
 3f7:	b8 0a 00 00 00       	mov    $0xa,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <getpid>:
SYSCALL(getpid)
 3ff:	b8 0b 00 00 00       	mov    $0xb,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <sbrk>:
SYSCALL(sbrk)
 407:	b8 0c 00 00 00       	mov    $0xc,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <sleep>:
SYSCALL(sleep)
 40f:	b8 0d 00 00 00       	mov    $0xd,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <uptime>:
SYSCALL(uptime)
 417:	b8 0e 00 00 00       	mov    $0xe,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 41f:	55                   	push   %ebp
 420:	89 e5                	mov    %esp,%ebp
 422:	83 ec 1c             	sub    $0x1c,%esp
 425:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 428:	6a 01                	push   $0x1
 42a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 42d:	52                   	push   %edx
 42e:	50                   	push   %eax
 42f:	e8 6b ff ff ff       	call   39f <write>
}
 434:	83 c4 10             	add    $0x10,%esp
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	83 ec 2c             	sub    $0x2c,%esp
 442:	89 45 d0             	mov    %eax,-0x30(%ebp)
 445:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 447:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 44b:	0f 95 c2             	setne  %dl
 44e:	89 f0                	mov    %esi,%eax
 450:	c1 e8 1f             	shr    $0x1f,%eax
 453:	84 c2                	test   %al,%dl
 455:	74 42                	je     499 <printint+0x60>
    neg = 1;
    x = -xx;
 457:	f7 de                	neg    %esi
    neg = 1;
 459:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 460:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 465:	89 f0                	mov    %esi,%eax
 467:	ba 00 00 00 00       	mov    $0x0,%edx
 46c:	f7 f1                	div    %ecx
 46e:	89 df                	mov    %ebx,%edi
 470:	83 c3 01             	add    $0x1,%ebx
 473:	0f b6 92 b0 07 00 00 	movzbl 0x7b0(%edx),%edx
 47a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 47e:	89 f2                	mov    %esi,%edx
 480:	89 c6                	mov    %eax,%esi
 482:	39 d1                	cmp    %edx,%ecx
 484:	76 df                	jbe    465 <printint+0x2c>
  if(neg)
 486:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 48a:	74 2f                	je     4bb <printint+0x82>
    buf[i++] = '-';
 48c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 491:	8d 5f 02             	lea    0x2(%edi),%ebx
 494:	8b 75 d0             	mov    -0x30(%ebp),%esi
 497:	eb 15                	jmp    4ae <printint+0x75>
  neg = 0;
 499:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4a0:	eb be                	jmp    460 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 4a2:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4a7:	89 f0                	mov    %esi,%eax
 4a9:	e8 71 ff ff ff       	call   41f <putc>
  while(--i >= 0)
 4ae:	83 eb 01             	sub    $0x1,%ebx
 4b1:	79 ef                	jns    4a2 <printint+0x69>
}
 4b3:	83 c4 2c             	add    $0x2c,%esp
 4b6:	5b                   	pop    %ebx
 4b7:	5e                   	pop    %esi
 4b8:	5f                   	pop    %edi
 4b9:	5d                   	pop    %ebp
 4ba:	c3                   	ret    
 4bb:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4be:	eb ee                	jmp    4ae <printint+0x75>

000004c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4c0:	f3 0f 1e fb          	endbr32 
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	57                   	push   %edi
 4c8:	56                   	push   %esi
 4c9:	53                   	push   %ebx
 4ca:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4cd:	8d 45 10             	lea    0x10(%ebp),%eax
 4d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4d3:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4dd:	eb 14                	jmp    4f3 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4df:	89 fa                	mov    %edi,%edx
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	e8 36 ff ff ff       	call   41f <putc>
 4e9:	eb 05                	jmp    4f0 <printf+0x30>
      }
    } else if(state == '%'){
 4eb:	83 fe 25             	cmp    $0x25,%esi
 4ee:	74 25                	je     515 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 4f0:	83 c3 01             	add    $0x1,%ebx
 4f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4fa:	84 c0                	test   %al,%al
 4fc:	0f 84 23 01 00 00    	je     625 <printf+0x165>
    c = fmt[i] & 0xff;
 502:	0f be f8             	movsbl %al,%edi
 505:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 508:	85 f6                	test   %esi,%esi
 50a:	75 df                	jne    4eb <printf+0x2b>
      if(c == '%'){
 50c:	83 f8 25             	cmp    $0x25,%eax
 50f:	75 ce                	jne    4df <printf+0x1f>
        state = '%';
 511:	89 c6                	mov    %eax,%esi
 513:	eb db                	jmp    4f0 <printf+0x30>
      if(c == 'd'){
 515:	83 f8 64             	cmp    $0x64,%eax
 518:	74 49                	je     563 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 51a:	83 f8 78             	cmp    $0x78,%eax
 51d:	0f 94 c1             	sete   %cl
 520:	83 f8 70             	cmp    $0x70,%eax
 523:	0f 94 c2             	sete   %dl
 526:	08 d1                	or     %dl,%cl
 528:	75 63                	jne    58d <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 52a:	83 f8 73             	cmp    $0x73,%eax
 52d:	0f 84 84 00 00 00    	je     5b7 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 533:	83 f8 63             	cmp    $0x63,%eax
 536:	0f 84 b7 00 00 00    	je     5f3 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 53c:	83 f8 25             	cmp    $0x25,%eax
 53f:	0f 84 cc 00 00 00    	je     611 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 545:	ba 25 00 00 00       	mov    $0x25,%edx
 54a:	8b 45 08             	mov    0x8(%ebp),%eax
 54d:	e8 cd fe ff ff       	call   41f <putc>
        putc(fd, c);
 552:	89 fa                	mov    %edi,%edx
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	e8 c3 fe ff ff       	call   41f <putc>
      }
      state = 0;
 55c:	be 00 00 00 00       	mov    $0x0,%esi
 561:	eb 8d                	jmp    4f0 <printf+0x30>
        printint(fd, *ap, 10, 1);
 563:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 566:	8b 17                	mov    (%edi),%edx
 568:	83 ec 0c             	sub    $0xc,%esp
 56b:	6a 01                	push   $0x1
 56d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	e8 bf fe ff ff       	call   439 <printint>
        ap++;
 57a:	83 c7 04             	add    $0x4,%edi
 57d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 580:	83 c4 10             	add    $0x10,%esp
      state = 0;
 583:	be 00 00 00 00       	mov    $0x0,%esi
 588:	e9 63 ff ff ff       	jmp    4f0 <printf+0x30>
        printint(fd, *ap, 16, 0);
 58d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 590:	8b 17                	mov    (%edi),%edx
 592:	83 ec 0c             	sub    $0xc,%esp
 595:	6a 00                	push   $0x0
 597:	b9 10 00 00 00       	mov    $0x10,%ecx
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	e8 95 fe ff ff       	call   439 <printint>
        ap++;
 5a4:	83 c7 04             	add    $0x4,%edi
 5a7:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5aa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ad:	be 00 00 00 00       	mov    $0x0,%esi
 5b2:	e9 39 ff ff ff       	jmp    4f0 <printf+0x30>
        s = (char*)*ap;
 5b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ba:	8b 30                	mov    (%eax),%esi
        ap++;
 5bc:	83 c0 04             	add    $0x4,%eax
 5bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5c2:	85 f6                	test   %esi,%esi
 5c4:	75 28                	jne    5ee <printf+0x12e>
          s = "(null)";
 5c6:	be a7 07 00 00       	mov    $0x7a7,%esi
 5cb:	8b 7d 08             	mov    0x8(%ebp),%edi
 5ce:	eb 0d                	jmp    5dd <printf+0x11d>
          putc(fd, *s);
 5d0:	0f be d2             	movsbl %dl,%edx
 5d3:	89 f8                	mov    %edi,%eax
 5d5:	e8 45 fe ff ff       	call   41f <putc>
          s++;
 5da:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5dd:	0f b6 16             	movzbl (%esi),%edx
 5e0:	84 d2                	test   %dl,%dl
 5e2:	75 ec                	jne    5d0 <printf+0x110>
      state = 0;
 5e4:	be 00 00 00 00       	mov    $0x0,%esi
 5e9:	e9 02 ff ff ff       	jmp    4f0 <printf+0x30>
 5ee:	8b 7d 08             	mov    0x8(%ebp),%edi
 5f1:	eb ea                	jmp    5dd <printf+0x11d>
        putc(fd, *ap);
 5f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f6:	0f be 17             	movsbl (%edi),%edx
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	e8 1e fe ff ff       	call   41f <putc>
        ap++;
 601:	83 c7 04             	add    $0x4,%edi
 604:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 607:	be 00 00 00 00       	mov    $0x0,%esi
 60c:	e9 df fe ff ff       	jmp    4f0 <printf+0x30>
        putc(fd, c);
 611:	89 fa                	mov    %edi,%edx
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	e8 04 fe ff ff       	call   41f <putc>
      state = 0;
 61b:	be 00 00 00 00       	mov    $0x0,%esi
 620:	e9 cb fe ff ff       	jmp    4f0 <printf+0x30>
    }
  }
}
 625:	8d 65 f4             	lea    -0xc(%ebp),%esp
 628:	5b                   	pop    %ebx
 629:	5e                   	pop    %esi
 62a:	5f                   	pop    %edi
 62b:	5d                   	pop    %ebp
 62c:	c3                   	ret    

0000062d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 62d:	f3 0f 1e fb          	endbr32 
 631:	55                   	push   %ebp
 632:	89 e5                	mov    %esp,%ebp
 634:	57                   	push   %edi
 635:	56                   	push   %esi
 636:	53                   	push   %ebx
 637:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 63a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63d:	a1 20 0b 00 00       	mov    0xb20,%eax
 642:	eb 02                	jmp    646 <free+0x19>
 644:	89 d0                	mov    %edx,%eax
 646:	39 c8                	cmp    %ecx,%eax
 648:	73 04                	jae    64e <free+0x21>
 64a:	39 08                	cmp    %ecx,(%eax)
 64c:	77 12                	ja     660 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64e:	8b 10                	mov    (%eax),%edx
 650:	39 c2                	cmp    %eax,%edx
 652:	77 f0                	ja     644 <free+0x17>
 654:	39 c8                	cmp    %ecx,%eax
 656:	72 08                	jb     660 <free+0x33>
 658:	39 ca                	cmp    %ecx,%edx
 65a:	77 04                	ja     660 <free+0x33>
 65c:	89 d0                	mov    %edx,%eax
 65e:	eb e6                	jmp    646 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 660:	8b 73 fc             	mov    -0x4(%ebx),%esi
 663:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 666:	8b 10                	mov    (%eax),%edx
 668:	39 d7                	cmp    %edx,%edi
 66a:	74 19                	je     685 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 66c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 66f:	8b 50 04             	mov    0x4(%eax),%edx
 672:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 675:	39 ce                	cmp    %ecx,%esi
 677:	74 1b                	je     694 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 679:	89 08                	mov    %ecx,(%eax)
  freep = p;
 67b:	a3 20 0b 00 00       	mov    %eax,0xb20
}
 680:	5b                   	pop    %ebx
 681:	5e                   	pop    %esi
 682:	5f                   	pop    %edi
 683:	5d                   	pop    %ebp
 684:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 685:	03 72 04             	add    0x4(%edx),%esi
 688:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 68b:	8b 10                	mov    (%eax),%edx
 68d:	8b 12                	mov    (%edx),%edx
 68f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 692:	eb db                	jmp    66f <free+0x42>
    p->s.size += bp->s.size;
 694:	03 53 fc             	add    -0x4(%ebx),%edx
 697:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 69a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 69d:	89 10                	mov    %edx,(%eax)
 69f:	eb da                	jmp    67b <free+0x4e>

000006a1 <morecore>:

static Header*
morecore(uint nu)
{
 6a1:	55                   	push   %ebp
 6a2:	89 e5                	mov    %esp,%ebp
 6a4:	53                   	push   %ebx
 6a5:	83 ec 04             	sub    $0x4,%esp
 6a8:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6aa:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6af:	77 05                	ja     6b6 <morecore+0x15>
    nu = 4096;
 6b1:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6b6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6bd:	83 ec 0c             	sub    $0xc,%esp
 6c0:	50                   	push   %eax
 6c1:	e8 41 fd ff ff       	call   407 <sbrk>
  if(p == (char*)-1)
 6c6:	83 c4 10             	add    $0x10,%esp
 6c9:	83 f8 ff             	cmp    $0xffffffff,%eax
 6cc:	74 1c                	je     6ea <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6ce:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6d1:	83 c0 08             	add    $0x8,%eax
 6d4:	83 ec 0c             	sub    $0xc,%esp
 6d7:	50                   	push   %eax
 6d8:	e8 50 ff ff ff       	call   62d <free>
  return freep;
 6dd:	a1 20 0b 00 00       	mov    0xb20,%eax
 6e2:	83 c4 10             	add    $0x10,%esp
}
 6e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6e8:	c9                   	leave  
 6e9:	c3                   	ret    
    return 0;
 6ea:	b8 00 00 00 00       	mov    $0x0,%eax
 6ef:	eb f4                	jmp    6e5 <morecore+0x44>

000006f1 <malloc>:

void*
malloc(uint nbytes)
{
 6f1:	f3 0f 1e fb          	endbr32 
 6f5:	55                   	push   %ebp
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	53                   	push   %ebx
 6f9:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	8d 58 07             	lea    0x7(%eax),%ebx
 702:	c1 eb 03             	shr    $0x3,%ebx
 705:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 708:	8b 0d 20 0b 00 00    	mov    0xb20,%ecx
 70e:	85 c9                	test   %ecx,%ecx
 710:	74 04                	je     716 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 712:	8b 01                	mov    (%ecx),%eax
 714:	eb 4b                	jmp    761 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 716:	c7 05 20 0b 00 00 24 	movl   $0xb24,0xb20
 71d:	0b 00 00 
 720:	c7 05 24 0b 00 00 24 	movl   $0xb24,0xb24
 727:	0b 00 00 
    base.s.size = 0;
 72a:	c7 05 28 0b 00 00 00 	movl   $0x0,0xb28
 731:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 734:	b9 24 0b 00 00       	mov    $0xb24,%ecx
 739:	eb d7                	jmp    712 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 73b:	74 1a                	je     757 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 73d:	29 da                	sub    %ebx,%edx
 73f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 742:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 745:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 748:	89 0d 20 0b 00 00    	mov    %ecx,0xb20
      return (void*)(p + 1);
 74e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 751:	83 c4 04             	add    $0x4,%esp
 754:	5b                   	pop    %ebx
 755:	5d                   	pop    %ebp
 756:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 757:	8b 10                	mov    (%eax),%edx
 759:	89 11                	mov    %edx,(%ecx)
 75b:	eb eb                	jmp    748 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75d:	89 c1                	mov    %eax,%ecx
 75f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 761:	8b 50 04             	mov    0x4(%eax),%edx
 764:	39 da                	cmp    %ebx,%edx
 766:	73 d3                	jae    73b <malloc+0x4a>
    if(p == freep)
 768:	39 05 20 0b 00 00    	cmp    %eax,0xb20
 76e:	75 ed                	jne    75d <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 770:	89 d8                	mov    %ebx,%eax
 772:	e8 2a ff ff ff       	call   6a1 <morecore>
 777:	85 c0                	test   %eax,%eax
 779:	75 e2                	jne    75d <malloc+0x6c>
 77b:	eb d4                	jmp    751 <malloc+0x60>
