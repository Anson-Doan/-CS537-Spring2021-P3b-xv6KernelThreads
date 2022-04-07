
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 31                	mov    (%ecx),%esi
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1d:	83 fe 01             	cmp    $0x1,%esi
  20:	7e 07                	jle    29 <main+0x29>
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  22:	bb 01 00 00 00       	mov    $0x1,%ebx
  27:	eb 2d                	jmp    56 <main+0x56>
    printf(2, "usage: kill pid...\n");
  29:	83 ec 08             	sub    $0x8,%esp
  2c:	68 7c 07 00 00       	push   $0x77c
  31:	6a 02                	push   $0x2
  33:	e8 87 04 00 00       	call   4bf <printf>
    exit();
  38:	e8 39 03 00 00       	call   376 <exit>
    kill(atoi(argv[i]));
  3d:	83 ec 0c             	sub    $0xc,%esp
  40:	ff 34 9f             	pushl  (%edi,%ebx,4)
  43:	e8 6a 01 00 00       	call   1b2 <atoi>
  48:	89 04 24             	mov    %eax,(%esp)
  4b:	e8 5e 03 00 00       	call   3ae <kill>
  for(i=1; i<argc; i++)
  50:	83 c3 01             	add    $0x1,%ebx
  53:	83 c4 10             	add    $0x10,%esp
  56:	39 f3                	cmp    %esi,%ebx
  58:	7c e3                	jl     3d <main+0x3d>
  exit();
  5a:	e8 17 03 00 00       	call   376 <exit>

0000005f <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  5f:	f3 0f 1e fb          	endbr32 
  63:	55                   	push   %ebp
  64:	89 e5                	mov    %esp,%ebp
  66:	56                   	push   %esi
  67:	53                   	push   %ebx
  68:	8b 75 08             	mov    0x8(%ebp),%esi
  6b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6e:	89 f0                	mov    %esi,%eax
  70:	89 d1                	mov    %edx,%ecx
  72:	83 c2 01             	add    $0x1,%edx
  75:	89 c3                	mov    %eax,%ebx
  77:	83 c0 01             	add    $0x1,%eax
  7a:	0f b6 09             	movzbl (%ecx),%ecx
  7d:	88 0b                	mov    %cl,(%ebx)
  7f:	84 c9                	test   %cl,%cl
  81:	75 ed                	jne    70 <strcpy+0x11>
    ;
  return os;
}
  83:	89 f0                	mov    %esi,%eax
  85:	5b                   	pop    %ebx
  86:	5e                   	pop    %esi
  87:	5d                   	pop    %ebp
  88:	c3                   	ret    

00000089 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  89:	f3 0f 1e fb          	endbr32 
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	8b 4d 08             	mov    0x8(%ebp),%ecx
  93:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  96:	0f b6 01             	movzbl (%ecx),%eax
  99:	84 c0                	test   %al,%al
  9b:	74 0c                	je     a9 <strcmp+0x20>
  9d:	3a 02                	cmp    (%edx),%al
  9f:	75 08                	jne    a9 <strcmp+0x20>
    p++, q++;
  a1:	83 c1 01             	add    $0x1,%ecx
  a4:	83 c2 01             	add    $0x1,%edx
  a7:	eb ed                	jmp    96 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  a9:	0f b6 c0             	movzbl %al,%eax
  ac:	0f b6 12             	movzbl (%edx),%edx
  af:	29 d0                	sub    %edx,%eax
}
  b1:	5d                   	pop    %ebp
  b2:	c3                   	ret    

000000b3 <strlen>:

uint
strlen(const char *s)
{
  b3:	f3 0f 1e fb          	endbr32 
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  bd:	b8 00 00 00 00       	mov    $0x0,%eax
  c2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  c6:	74 05                	je     cd <strlen+0x1a>
  c8:	83 c0 01             	add    $0x1,%eax
  cb:	eb f5                	jmp    c2 <strlen+0xf>
    ;
  return n;
}
  cd:	5d                   	pop    %ebp
  ce:	c3                   	ret    

000000cf <memset>:

void*
memset(void *dst, int c, uint n)
{
  cf:	f3 0f 1e fb          	endbr32 
  d3:	55                   	push   %ebp
  d4:	89 e5                	mov    %esp,%ebp
  d6:	57                   	push   %edi
  d7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  da:	89 d7                	mov    %edx,%edi
  dc:	8b 4d 10             	mov    0x10(%ebp),%ecx
  df:	8b 45 0c             	mov    0xc(%ebp),%eax
  e2:	fc                   	cld    
  e3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  e5:	89 d0                	mov    %edx,%eax
  e7:	5f                   	pop    %edi
  e8:	5d                   	pop    %ebp
  e9:	c3                   	ret    

000000ea <strchr>:

char*
strchr(const char *s, char c)
{
  ea:	f3 0f 1e fb          	endbr32 
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  f8:	0f b6 10             	movzbl (%eax),%edx
  fb:	84 d2                	test   %dl,%dl
  fd:	74 09                	je     108 <strchr+0x1e>
    if(*s == c)
  ff:	38 ca                	cmp    %cl,%dl
 101:	74 0a                	je     10d <strchr+0x23>
  for(; *s; s++)
 103:	83 c0 01             	add    $0x1,%eax
 106:	eb f0                	jmp    f8 <strchr+0xe>
      return (char*)s;
  return 0;
 108:	b8 00 00 00 00       	mov    $0x0,%eax
}
 10d:	5d                   	pop    %ebp
 10e:	c3                   	ret    

0000010f <gets>:

char*
gets(char *buf, int max)
{
 10f:	f3 0f 1e fb          	endbr32 
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	57                   	push   %edi
 117:	56                   	push   %esi
 118:	53                   	push   %ebx
 119:	83 ec 1c             	sub    $0x1c,%esp
 11c:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 11f:	bb 00 00 00 00       	mov    $0x0,%ebx
 124:	89 de                	mov    %ebx,%esi
 126:	83 c3 01             	add    $0x1,%ebx
 129:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 12c:	7d 2e                	jge    15c <gets+0x4d>
    cc = read(0, &c, 1);
 12e:	83 ec 04             	sub    $0x4,%esp
 131:	6a 01                	push   $0x1
 133:	8d 45 e7             	lea    -0x19(%ebp),%eax
 136:	50                   	push   %eax
 137:	6a 00                	push   $0x0
 139:	e8 58 02 00 00       	call   396 <read>
    if(cc < 1)
 13e:	83 c4 10             	add    $0x10,%esp
 141:	85 c0                	test   %eax,%eax
 143:	7e 17                	jle    15c <gets+0x4d>
      break;
    buf[i++] = c;
 145:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 149:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 14c:	3c 0a                	cmp    $0xa,%al
 14e:	0f 94 c2             	sete   %dl
 151:	3c 0d                	cmp    $0xd,%al
 153:	0f 94 c0             	sete   %al
 156:	08 c2                	or     %al,%dl
 158:	74 ca                	je     124 <gets+0x15>
    buf[i++] = c;
 15a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 15c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 160:	89 f8                	mov    %edi,%eax
 162:	8d 65 f4             	lea    -0xc(%ebp),%esp
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5f                   	pop    %edi
 168:	5d                   	pop    %ebp
 169:	c3                   	ret    

0000016a <stat>:

int
stat(const char *n, struct stat *st)
{
 16a:	f3 0f 1e fb          	endbr32 
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	56                   	push   %esi
 172:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 173:	83 ec 08             	sub    $0x8,%esp
 176:	6a 00                	push   $0x0
 178:	ff 75 08             	pushl  0x8(%ebp)
 17b:	e8 3e 02 00 00       	call   3be <open>
  if(fd < 0)
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	78 24                	js     1ab <stat+0x41>
 187:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 189:	83 ec 08             	sub    $0x8,%esp
 18c:	ff 75 0c             	pushl  0xc(%ebp)
 18f:	50                   	push   %eax
 190:	e8 41 02 00 00       	call   3d6 <fstat>
 195:	89 c6                	mov    %eax,%esi
  close(fd);
 197:	89 1c 24             	mov    %ebx,(%esp)
 19a:	e8 07 02 00 00       	call   3a6 <close>
  return r;
 19f:	83 c4 10             	add    $0x10,%esp
}
 1a2:	89 f0                	mov    %esi,%eax
 1a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a7:	5b                   	pop    %ebx
 1a8:	5e                   	pop    %esi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    
    return -1;
 1ab:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b0:	eb f0                	jmp    1a2 <stat+0x38>

000001b2 <atoi>:

int
atoi(const char *s)
{
 1b2:	f3 0f 1e fb          	endbr32 
 1b6:	55                   	push   %ebp
 1b7:	89 e5                	mov    %esp,%ebp
 1b9:	53                   	push   %ebx
 1ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1bd:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1c2:	0f b6 01             	movzbl (%ecx),%eax
 1c5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1c8:	80 fb 09             	cmp    $0x9,%bl
 1cb:	77 12                	ja     1df <atoi+0x2d>
    n = n*10 + *s++ - '0';
 1cd:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1d0:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1d3:	83 c1 01             	add    $0x1,%ecx
 1d6:	0f be c0             	movsbl %al,%eax
 1d9:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1dd:	eb e3                	jmp    1c2 <atoi+0x10>
  return n;
}
 1df:	89 d0                	mov    %edx,%eax
 1e1:	5b                   	pop    %ebx
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    

000001e4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1e4:	f3 0f 1e fb          	endbr32 
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	56                   	push   %esi
 1ec:	53                   	push   %ebx
 1ed:	8b 75 08             	mov    0x8(%ebp),%esi
 1f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1f3:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1f6:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1f8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1fb:	85 c0                	test   %eax,%eax
 1fd:	7e 0f                	jle    20e <memmove+0x2a>
    *dst++ = *src++;
 1ff:	0f b6 01             	movzbl (%ecx),%eax
 202:	88 02                	mov    %al,(%edx)
 204:	8d 49 01             	lea    0x1(%ecx),%ecx
 207:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 20a:	89 d8                	mov    %ebx,%eax
 20c:	eb ea                	jmp    1f8 <memmove+0x14>
  return vdst;
}
 20e:	89 f0                	mov    %esi,%eax
 210:	5b                   	pop    %ebx
 211:	5e                   	pop    %esi
 212:	5d                   	pop    %ebp
 213:	c3                   	ret    

00000214 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 214:	f3 0f 1e fb          	endbr32 
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	53                   	push   %ebx
 21c:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 21f:	68 00 20 00 00       	push   $0x2000
 224:	e8 c7 04 00 00       	call   6f0 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 229:	83 c4 10             	add    $0x10,%esp
 22c:	89 c2                	mov    %eax,%edx
 22e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 234:	74 22                	je     258 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 236:	b9 00 10 00 00       	mov    $0x1000,%ecx
 23b:	29 d1                	sub    %edx,%ecx
 23d:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 23f:	ba 00 00 00 00       	mov    $0x0,%edx
 244:	83 fa 3f             	cmp    $0x3f,%edx
 247:	7f 13                	jg     25c <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 249:	83 3c 95 20 0e 00 00 	cmpl   $0x1,0xe20(,%edx,4)
 250:	01 
 251:	75 09                	jne    25c <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 253:	83 c2 01             	add    $0x1,%edx
 256:	eb ec                	jmp    244 <thread_create+0x30>
  void *user_stack = curr_ptr;
 258:	89 c1                	mov    %eax,%ecx
 25a:	eb e3                	jmp    23f <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 25c:	83 3c 95 20 0e 00 00 	cmpl   $0x1,0xe20(,%edx,4)
 263:	01 
 264:	74 34                	je     29a <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 266:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 269:	c1 e3 02             	shl    $0x2,%ebx
 26c:	89 83 20 0b 00 00    	mov    %eax,0xb20(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 272:	89 8b 24 0b 00 00    	mov    %ecx,0xb24(%ebx)
  cell_full[i] = 1;
 278:	c7 04 95 20 0e 00 00 	movl   $0x1,0xe20(,%edx,4)
 27f:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 283:	ff 75 10             	pushl  0x10(%ebp)
 286:	ff 75 0c             	pushl  0xc(%ebp)
 289:	ff 75 08             	pushl  0x8(%ebp)
 28c:	51                   	push   %ecx
 28d:	e8 dc 00 00 00       	call   36e <clone>
 292:	83 c4 10             	add    $0x10,%esp
}
 295:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 298:	c9                   	leave  
 299:	c3                   	ret    
    return -1;
 29a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29f:	eb f4                	jmp    295 <thread_create+0x81>

000002a1 <thread_join>:

int thread_join(){
 2a1:	f3 0f 1e fb          	endbr32 
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	56                   	push   %esi
 2a9:	53                   	push   %ebx
 2aa:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 2ad:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2b0:	50                   	push   %eax
 2b1:	e8 d0 00 00 00       	call   386 <join>
 2b6:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 2b8:	83 c4 10             	add    $0x10,%esp
 2bb:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c0:	83 fb 3f             	cmp    $0x3f,%ebx
 2c3:	7f 14                	jg     2d9 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 2c5:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2cb:	39 14 85 24 0b 00 00 	cmp    %edx,0xb24(,%eax,4)
 2d2:	74 05                	je     2d9 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 2d4:	83 c3 01             	add    $0x1,%ebx
 2d7:	eb e7                	jmp    2c0 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 2d9:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2dc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 2df:	39 0c 85 24 0b 00 00 	cmp    %ecx,0xb24(,%eax,4)
 2e6:	75 26                	jne    30e <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 2e8:	83 ec 0c             	sub    $0xc,%esp
 2eb:	ff 34 85 20 0b 00 00 	pushl  0xb20(,%eax,4)
 2f2:	e8 35 03 00 00       	call   62c <free>
  cell_full[i] = 0;
 2f7:	c7 04 9d 20 0e 00 00 	movl   $0x0,0xe20(,%ebx,4)
 2fe:	00 00 00 00 

  return out;
 302:	83 c4 10             	add    $0x10,%esp
}
 305:	89 f0                	mov    %esi,%eax
 307:	8d 65 f8             	lea    -0x8(%ebp),%esp
 30a:	5b                   	pop    %ebx
 30b:	5e                   	pop    %esi
 30c:	5d                   	pop    %ebp
 30d:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 30e:	be ff ff ff ff       	mov    $0xffffffff,%esi
 313:	eb f0                	jmp    305 <thread_join+0x64>

00000315 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 315:	f3 0f 1e fb          	endbr32 
 319:	55                   	push   %ebp
 31a:	89 e5                	mov    %esp,%ebp
 31c:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 31f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 325:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 32c:	5d                   	pop    %ebp
 32d:	c3                   	ret    

0000032e <lock_acquire>:

void lock_acquire(lock_t *lock) {
 32e:	f3 0f 1e fb          	endbr32 
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 338:	b9 01 00 00 00       	mov    $0x1,%ecx
 33d:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 341:	b8 00 00 00 00       	mov    $0x0,%eax
 346:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 34b:	39 c1                	cmp    %eax,%ecx
 34d:	75 f2                	jne    341 <lock_acquire+0x13>
      ; // spin
    }
}
 34f:	5d                   	pop    %ebp
 350:	c3                   	ret    

00000351 <lock_release>:

void lock_release(lock_t *lock) {
 351:	f3 0f 1e fb          	endbr32 
 355:	55                   	push   %ebp
 356:	89 e5                	mov    %esp,%ebp
 358:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 35b:	8b 42 04             	mov    0x4(%edx),%eax
 35e:	83 c0 01             	add    $0x1,%eax
 361:	89 42 04             	mov    %eax,0x4(%edx)
}
 364:	5d                   	pop    %ebp
 365:	c3                   	ret    

00000366 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 366:	b8 01 00 00 00       	mov    $0x1,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <clone>:
SYSCALL(clone)
 36e:	b8 16 00 00 00       	mov    $0x16,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <exit>:
SYSCALL(exit)
 376:	b8 02 00 00 00       	mov    $0x2,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <wait>:
SYSCALL(wait)
 37e:	b8 03 00 00 00       	mov    $0x3,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <join>:
SYSCALL(join)
 386:	b8 17 00 00 00       	mov    $0x17,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <pipe>:
SYSCALL(pipe)
 38e:	b8 04 00 00 00       	mov    $0x4,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <read>:
SYSCALL(read)
 396:	b8 05 00 00 00       	mov    $0x5,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <write>:
SYSCALL(write)
 39e:	b8 10 00 00 00       	mov    $0x10,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <close>:
SYSCALL(close)
 3a6:	b8 15 00 00 00       	mov    $0x15,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <kill>:
SYSCALL(kill)
 3ae:	b8 06 00 00 00       	mov    $0x6,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <exec>:
SYSCALL(exec)
 3b6:	b8 07 00 00 00       	mov    $0x7,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <open>:
SYSCALL(open)
 3be:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <mknod>:
SYSCALL(mknod)
 3c6:	b8 11 00 00 00       	mov    $0x11,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <unlink>:
SYSCALL(unlink)
 3ce:	b8 12 00 00 00       	mov    $0x12,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <fstat>:
SYSCALL(fstat)
 3d6:	b8 08 00 00 00       	mov    $0x8,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <link>:
SYSCALL(link)
 3de:	b8 13 00 00 00       	mov    $0x13,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <mkdir>:
SYSCALL(mkdir)
 3e6:	b8 14 00 00 00       	mov    $0x14,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <chdir>:
SYSCALL(chdir)
 3ee:	b8 09 00 00 00       	mov    $0x9,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <dup>:
SYSCALL(dup)
 3f6:	b8 0a 00 00 00       	mov    $0xa,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <getpid>:
SYSCALL(getpid)
 3fe:	b8 0b 00 00 00       	mov    $0xb,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <sbrk>:
SYSCALL(sbrk)
 406:	b8 0c 00 00 00       	mov    $0xc,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <sleep>:
SYSCALL(sleep)
 40e:	b8 0d 00 00 00       	mov    $0xd,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <uptime>:
SYSCALL(uptime)
 416:	b8 0e 00 00 00       	mov    $0xe,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 41e:	55                   	push   %ebp
 41f:	89 e5                	mov    %esp,%ebp
 421:	83 ec 1c             	sub    $0x1c,%esp
 424:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 427:	6a 01                	push   $0x1
 429:	8d 55 f4             	lea    -0xc(%ebp),%edx
 42c:	52                   	push   %edx
 42d:	50                   	push   %eax
 42e:	e8 6b ff ff ff       	call   39e <write>
}
 433:	83 c4 10             	add    $0x10,%esp
 436:	c9                   	leave  
 437:	c3                   	ret    

00000438 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	57                   	push   %edi
 43c:	56                   	push   %esi
 43d:	53                   	push   %ebx
 43e:	83 ec 2c             	sub    $0x2c,%esp
 441:	89 45 d0             	mov    %eax,-0x30(%ebp)
 444:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 446:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 44a:	0f 95 c2             	setne  %dl
 44d:	89 f0                	mov    %esi,%eax
 44f:	c1 e8 1f             	shr    $0x1f,%eax
 452:	84 c2                	test   %al,%dl
 454:	74 42                	je     498 <printint+0x60>
    neg = 1;
    x = -xx;
 456:	f7 de                	neg    %esi
    neg = 1;
 458:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 45f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 464:	89 f0                	mov    %esi,%eax
 466:	ba 00 00 00 00       	mov    $0x0,%edx
 46b:	f7 f1                	div    %ecx
 46d:	89 df                	mov    %ebx,%edi
 46f:	83 c3 01             	add    $0x1,%ebx
 472:	0f b6 92 98 07 00 00 	movzbl 0x798(%edx),%edx
 479:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 47d:	89 f2                	mov    %esi,%edx
 47f:	89 c6                	mov    %eax,%esi
 481:	39 d1                	cmp    %edx,%ecx
 483:	76 df                	jbe    464 <printint+0x2c>
  if(neg)
 485:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 489:	74 2f                	je     4ba <printint+0x82>
    buf[i++] = '-';
 48b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 490:	8d 5f 02             	lea    0x2(%edi),%ebx
 493:	8b 75 d0             	mov    -0x30(%ebp),%esi
 496:	eb 15                	jmp    4ad <printint+0x75>
  neg = 0;
 498:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 49f:	eb be                	jmp    45f <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 4a1:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4a6:	89 f0                	mov    %esi,%eax
 4a8:	e8 71 ff ff ff       	call   41e <putc>
  while(--i >= 0)
 4ad:	83 eb 01             	sub    $0x1,%ebx
 4b0:	79 ef                	jns    4a1 <printint+0x69>
}
 4b2:	83 c4 2c             	add    $0x2c,%esp
 4b5:	5b                   	pop    %ebx
 4b6:	5e                   	pop    %esi
 4b7:	5f                   	pop    %edi
 4b8:	5d                   	pop    %ebp
 4b9:	c3                   	ret    
 4ba:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4bd:	eb ee                	jmp    4ad <printint+0x75>

000004bf <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4bf:	f3 0f 1e fb          	endbr32 
 4c3:	55                   	push   %ebp
 4c4:	89 e5                	mov    %esp,%ebp
 4c6:	57                   	push   %edi
 4c7:	56                   	push   %esi
 4c8:	53                   	push   %ebx
 4c9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4cc:	8d 45 10             	lea    0x10(%ebp),%eax
 4cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4d2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4d7:	bb 00 00 00 00       	mov    $0x0,%ebx
 4dc:	eb 14                	jmp    4f2 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4de:	89 fa                	mov    %edi,%edx
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	e8 36 ff ff ff       	call   41e <putc>
 4e8:	eb 05                	jmp    4ef <printf+0x30>
      }
    } else if(state == '%'){
 4ea:	83 fe 25             	cmp    $0x25,%esi
 4ed:	74 25                	je     514 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 4ef:	83 c3 01             	add    $0x1,%ebx
 4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4f9:	84 c0                	test   %al,%al
 4fb:	0f 84 23 01 00 00    	je     624 <printf+0x165>
    c = fmt[i] & 0xff;
 501:	0f be f8             	movsbl %al,%edi
 504:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 507:	85 f6                	test   %esi,%esi
 509:	75 df                	jne    4ea <printf+0x2b>
      if(c == '%'){
 50b:	83 f8 25             	cmp    $0x25,%eax
 50e:	75 ce                	jne    4de <printf+0x1f>
        state = '%';
 510:	89 c6                	mov    %eax,%esi
 512:	eb db                	jmp    4ef <printf+0x30>
      if(c == 'd'){
 514:	83 f8 64             	cmp    $0x64,%eax
 517:	74 49                	je     562 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 519:	83 f8 78             	cmp    $0x78,%eax
 51c:	0f 94 c1             	sete   %cl
 51f:	83 f8 70             	cmp    $0x70,%eax
 522:	0f 94 c2             	sete   %dl
 525:	08 d1                	or     %dl,%cl
 527:	75 63                	jne    58c <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 529:	83 f8 73             	cmp    $0x73,%eax
 52c:	0f 84 84 00 00 00    	je     5b6 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 532:	83 f8 63             	cmp    $0x63,%eax
 535:	0f 84 b7 00 00 00    	je     5f2 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 53b:	83 f8 25             	cmp    $0x25,%eax
 53e:	0f 84 cc 00 00 00    	je     610 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 544:	ba 25 00 00 00       	mov    $0x25,%edx
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	e8 cd fe ff ff       	call   41e <putc>
        putc(fd, c);
 551:	89 fa                	mov    %edi,%edx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	e8 c3 fe ff ff       	call   41e <putc>
      }
      state = 0;
 55b:	be 00 00 00 00       	mov    $0x0,%esi
 560:	eb 8d                	jmp    4ef <printf+0x30>
        printint(fd, *ap, 10, 1);
 562:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 565:	8b 17                	mov    (%edi),%edx
 567:	83 ec 0c             	sub    $0xc,%esp
 56a:	6a 01                	push   $0x1
 56c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	e8 bf fe ff ff       	call   438 <printint>
        ap++;
 579:	83 c7 04             	add    $0x4,%edi
 57c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 57f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 582:	be 00 00 00 00       	mov    $0x0,%esi
 587:	e9 63 ff ff ff       	jmp    4ef <printf+0x30>
        printint(fd, *ap, 16, 0);
 58c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 58f:	8b 17                	mov    (%edi),%edx
 591:	83 ec 0c             	sub    $0xc,%esp
 594:	6a 00                	push   $0x0
 596:	b9 10 00 00 00       	mov    $0x10,%ecx
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	e8 95 fe ff ff       	call   438 <printint>
        ap++;
 5a3:	83 c7 04             	add    $0x4,%edi
 5a6:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ac:	be 00 00 00 00       	mov    $0x0,%esi
 5b1:	e9 39 ff ff ff       	jmp    4ef <printf+0x30>
        s = (char*)*ap;
 5b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b9:	8b 30                	mov    (%eax),%esi
        ap++;
 5bb:	83 c0 04             	add    $0x4,%eax
 5be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5c1:	85 f6                	test   %esi,%esi
 5c3:	75 28                	jne    5ed <printf+0x12e>
          s = "(null)";
 5c5:	be 90 07 00 00       	mov    $0x790,%esi
 5ca:	8b 7d 08             	mov    0x8(%ebp),%edi
 5cd:	eb 0d                	jmp    5dc <printf+0x11d>
          putc(fd, *s);
 5cf:	0f be d2             	movsbl %dl,%edx
 5d2:	89 f8                	mov    %edi,%eax
 5d4:	e8 45 fe ff ff       	call   41e <putc>
          s++;
 5d9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5dc:	0f b6 16             	movzbl (%esi),%edx
 5df:	84 d2                	test   %dl,%dl
 5e1:	75 ec                	jne    5cf <printf+0x110>
      state = 0;
 5e3:	be 00 00 00 00       	mov    $0x0,%esi
 5e8:	e9 02 ff ff ff       	jmp    4ef <printf+0x30>
 5ed:	8b 7d 08             	mov    0x8(%ebp),%edi
 5f0:	eb ea                	jmp    5dc <printf+0x11d>
        putc(fd, *ap);
 5f2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5f5:	0f be 17             	movsbl (%edi),%edx
 5f8:	8b 45 08             	mov    0x8(%ebp),%eax
 5fb:	e8 1e fe ff ff       	call   41e <putc>
        ap++;
 600:	83 c7 04             	add    $0x4,%edi
 603:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 606:	be 00 00 00 00       	mov    $0x0,%esi
 60b:	e9 df fe ff ff       	jmp    4ef <printf+0x30>
        putc(fd, c);
 610:	89 fa                	mov    %edi,%edx
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	e8 04 fe ff ff       	call   41e <putc>
      state = 0;
 61a:	be 00 00 00 00       	mov    $0x0,%esi
 61f:	e9 cb fe ff ff       	jmp    4ef <printf+0x30>
    }
  }
}
 624:	8d 65 f4             	lea    -0xc(%ebp),%esp
 627:	5b                   	pop    %ebx
 628:	5e                   	pop    %esi
 629:	5f                   	pop    %edi
 62a:	5d                   	pop    %ebp
 62b:	c3                   	ret    

0000062c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 62c:	f3 0f 1e fb          	endbr32 
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	57                   	push   %edi
 634:	56                   	push   %esi
 635:	53                   	push   %ebx
 636:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 639:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63c:	a1 00 0b 00 00       	mov    0xb00,%eax
 641:	eb 02                	jmp    645 <free+0x19>
 643:	89 d0                	mov    %edx,%eax
 645:	39 c8                	cmp    %ecx,%eax
 647:	73 04                	jae    64d <free+0x21>
 649:	39 08                	cmp    %ecx,(%eax)
 64b:	77 12                	ja     65f <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64d:	8b 10                	mov    (%eax),%edx
 64f:	39 c2                	cmp    %eax,%edx
 651:	77 f0                	ja     643 <free+0x17>
 653:	39 c8                	cmp    %ecx,%eax
 655:	72 08                	jb     65f <free+0x33>
 657:	39 ca                	cmp    %ecx,%edx
 659:	77 04                	ja     65f <free+0x33>
 65b:	89 d0                	mov    %edx,%eax
 65d:	eb e6                	jmp    645 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 65f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 662:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 665:	8b 10                	mov    (%eax),%edx
 667:	39 d7                	cmp    %edx,%edi
 669:	74 19                	je     684 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 66b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 66e:	8b 50 04             	mov    0x4(%eax),%edx
 671:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 674:	39 ce                	cmp    %ecx,%esi
 676:	74 1b                	je     693 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 678:	89 08                	mov    %ecx,(%eax)
  freep = p;
 67a:	a3 00 0b 00 00       	mov    %eax,0xb00
}
 67f:	5b                   	pop    %ebx
 680:	5e                   	pop    %esi
 681:	5f                   	pop    %edi
 682:	5d                   	pop    %ebp
 683:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 684:	03 72 04             	add    0x4(%edx),%esi
 687:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 68a:	8b 10                	mov    (%eax),%edx
 68c:	8b 12                	mov    (%edx),%edx
 68e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 691:	eb db                	jmp    66e <free+0x42>
    p->s.size += bp->s.size;
 693:	03 53 fc             	add    -0x4(%ebx),%edx
 696:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 699:	8b 53 f8             	mov    -0x8(%ebx),%edx
 69c:	89 10                	mov    %edx,(%eax)
 69e:	eb da                	jmp    67a <free+0x4e>

000006a0 <morecore>:

static Header*
morecore(uint nu)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	53                   	push   %ebx
 6a4:	83 ec 04             	sub    $0x4,%esp
 6a7:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6a9:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6ae:	77 05                	ja     6b5 <morecore+0x15>
    nu = 4096;
 6b0:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6b5:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6bc:	83 ec 0c             	sub    $0xc,%esp
 6bf:	50                   	push   %eax
 6c0:	e8 41 fd ff ff       	call   406 <sbrk>
  if(p == (char*)-1)
 6c5:	83 c4 10             	add    $0x10,%esp
 6c8:	83 f8 ff             	cmp    $0xffffffff,%eax
 6cb:	74 1c                	je     6e9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6cd:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6d0:	83 c0 08             	add    $0x8,%eax
 6d3:	83 ec 0c             	sub    $0xc,%esp
 6d6:	50                   	push   %eax
 6d7:	e8 50 ff ff ff       	call   62c <free>
  return freep;
 6dc:	a1 00 0b 00 00       	mov    0xb00,%eax
 6e1:	83 c4 10             	add    $0x10,%esp
}
 6e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6e7:	c9                   	leave  
 6e8:	c3                   	ret    
    return 0;
 6e9:	b8 00 00 00 00       	mov    $0x0,%eax
 6ee:	eb f4                	jmp    6e4 <morecore+0x44>

000006f0 <malloc>:

void*
malloc(uint nbytes)
{
 6f0:	f3 0f 1e fb          	endbr32 
 6f4:	55                   	push   %ebp
 6f5:	89 e5                	mov    %esp,%ebp
 6f7:	53                   	push   %ebx
 6f8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	8d 58 07             	lea    0x7(%eax),%ebx
 701:	c1 eb 03             	shr    $0x3,%ebx
 704:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 707:	8b 0d 00 0b 00 00    	mov    0xb00,%ecx
 70d:	85 c9                	test   %ecx,%ecx
 70f:	74 04                	je     715 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 711:	8b 01                	mov    (%ecx),%eax
 713:	eb 4b                	jmp    760 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 715:	c7 05 00 0b 00 00 04 	movl   $0xb04,0xb00
 71c:	0b 00 00 
 71f:	c7 05 04 0b 00 00 04 	movl   $0xb04,0xb04
 726:	0b 00 00 
    base.s.size = 0;
 729:	c7 05 08 0b 00 00 00 	movl   $0x0,0xb08
 730:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 733:	b9 04 0b 00 00       	mov    $0xb04,%ecx
 738:	eb d7                	jmp    711 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 73a:	74 1a                	je     756 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 73c:	29 da                	sub    %ebx,%edx
 73e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 741:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 744:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 747:	89 0d 00 0b 00 00    	mov    %ecx,0xb00
      return (void*)(p + 1);
 74d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 750:	83 c4 04             	add    $0x4,%esp
 753:	5b                   	pop    %ebx
 754:	5d                   	pop    %ebp
 755:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 756:	8b 10                	mov    (%eax),%edx
 758:	89 11                	mov    %edx,(%ecx)
 75a:	eb eb                	jmp    747 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 75c:	89 c1                	mov    %eax,%ecx
 75e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 760:	8b 50 04             	mov    0x4(%eax),%edx
 763:	39 da                	cmp    %ebx,%edx
 765:	73 d3                	jae    73a <malloc+0x4a>
    if(p == freep)
 767:	39 05 00 0b 00 00    	cmp    %eax,0xb00
 76d:	75 ed                	jne    75c <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 76f:	89 d8                	mov    %ebx,%eax
 771:	e8 2a ff ff ff       	call   6a0 <morecore>
 776:	85 c0                	test   %eax,%eax
 778:	75 e2                	jne    75c <malloc+0x6c>
 77a:	eb d4                	jmp    750 <malloc+0x60>
