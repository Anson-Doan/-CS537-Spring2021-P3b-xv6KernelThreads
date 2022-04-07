
_echo:     file format elf32-i386


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
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	53                   	push   %ebx
  14:	51                   	push   %ecx
  15:	83 ec 08             	sub    $0x8,%esp
  18:	8b 31                	mov    (%ecx),%esi
  1a:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  1d:	b8 01 00 00 00       	mov    $0x1,%eax
  22:	eb 1a                	jmp    3e <main+0x3e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  24:	ba 74 07 00 00       	mov    $0x774,%edx
  29:	52                   	push   %edx
  2a:	ff 34 87             	pushl  (%edi,%eax,4)
  2d:	68 78 07 00 00       	push   $0x778
  32:	6a 01                	push   $0x1
  34:	e8 7c 04 00 00       	call   4b5 <printf>
  39:	83 c4 10             	add    $0x10,%esp
  for(i = 1; i < argc; i++)
  3c:	89 d8                	mov    %ebx,%eax
  3e:	39 f0                	cmp    %esi,%eax
  40:	7d 0e                	jge    50 <main+0x50>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  42:	8d 58 01             	lea    0x1(%eax),%ebx
  45:	39 f3                	cmp    %esi,%ebx
  47:	7d db                	jge    24 <main+0x24>
  49:	ba 76 07 00 00       	mov    $0x776,%edx
  4e:	eb d9                	jmp    29 <main+0x29>
  exit();
  50:	e8 17 03 00 00       	call   36c <exit>

00000055 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  55:	f3 0f 1e fb          	endbr32 
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	56                   	push   %esi
  5d:	53                   	push   %ebx
  5e:	8b 75 08             	mov    0x8(%ebp),%esi
  61:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  64:	89 f0                	mov    %esi,%eax
  66:	89 d1                	mov    %edx,%ecx
  68:	83 c2 01             	add    $0x1,%edx
  6b:	89 c3                	mov    %eax,%ebx
  6d:	83 c0 01             	add    $0x1,%eax
  70:	0f b6 09             	movzbl (%ecx),%ecx
  73:	88 0b                	mov    %cl,(%ebx)
  75:	84 c9                	test   %cl,%cl
  77:	75 ed                	jne    66 <strcpy+0x11>
    ;
  return os;
}
  79:	89 f0                	mov    %esi,%eax
  7b:	5b                   	pop    %ebx
  7c:	5e                   	pop    %esi
  7d:	5d                   	pop    %ebp
  7e:	c3                   	ret    

0000007f <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7f:	f3 0f 1e fb          	endbr32 
  83:	55                   	push   %ebp
  84:	89 e5                	mov    %esp,%ebp
  86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  89:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  8c:	0f b6 01             	movzbl (%ecx),%eax
  8f:	84 c0                	test   %al,%al
  91:	74 0c                	je     9f <strcmp+0x20>
  93:	3a 02                	cmp    (%edx),%al
  95:	75 08                	jne    9f <strcmp+0x20>
    p++, q++;
  97:	83 c1 01             	add    $0x1,%ecx
  9a:	83 c2 01             	add    $0x1,%edx
  9d:	eb ed                	jmp    8c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  9f:	0f b6 c0             	movzbl %al,%eax
  a2:	0f b6 12             	movzbl (%edx),%edx
  a5:	29 d0                	sub    %edx,%eax
}
  a7:	5d                   	pop    %ebp
  a8:	c3                   	ret    

000000a9 <strlen>:

uint
strlen(const char *s)
{
  a9:	f3 0f 1e fb          	endbr32 
  ad:	55                   	push   %ebp
  ae:	89 e5                	mov    %esp,%ebp
  b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  b3:	b8 00 00 00 00       	mov    $0x0,%eax
  b8:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  bc:	74 05                	je     c3 <strlen+0x1a>
  be:	83 c0 01             	add    $0x1,%eax
  c1:	eb f5                	jmp    b8 <strlen+0xf>
    ;
  return n;
}
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    

000000c5 <memset>:

void*
memset(void *dst, int c, uint n)
{
  c5:	f3 0f 1e fb          	endbr32 
  c9:	55                   	push   %ebp
  ca:	89 e5                	mov    %esp,%ebp
  cc:	57                   	push   %edi
  cd:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  d0:	89 d7                	mov    %edx,%edi
  d2:	8b 4d 10             	mov    0x10(%ebp),%ecx
  d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  d8:	fc                   	cld    
  d9:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  db:	89 d0                	mov    %edx,%eax
  dd:	5f                   	pop    %edi
  de:	5d                   	pop    %ebp
  df:	c3                   	ret    

000000e0 <strchr>:

char*
strchr(const char *s, char c)
{
  e0:	f3 0f 1e fb          	endbr32 
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	8b 45 08             	mov    0x8(%ebp),%eax
  ea:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
  ee:	0f b6 10             	movzbl (%eax),%edx
  f1:	84 d2                	test   %dl,%dl
  f3:	74 09                	je     fe <strchr+0x1e>
    if(*s == c)
  f5:	38 ca                	cmp    %cl,%dl
  f7:	74 0a                	je     103 <strchr+0x23>
  for(; *s; s++)
  f9:	83 c0 01             	add    $0x1,%eax
  fc:	eb f0                	jmp    ee <strchr+0xe>
      return (char*)s;
  return 0;
  fe:	b8 00 00 00 00       	mov    $0x0,%eax
}
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    

00000105 <gets>:

char*
gets(char *buf, int max)
{
 105:	f3 0f 1e fb          	endbr32 
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	57                   	push   %edi
 10d:	56                   	push   %esi
 10e:	53                   	push   %ebx
 10f:	83 ec 1c             	sub    $0x1c,%esp
 112:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 115:	bb 00 00 00 00       	mov    $0x0,%ebx
 11a:	89 de                	mov    %ebx,%esi
 11c:	83 c3 01             	add    $0x1,%ebx
 11f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 122:	7d 2e                	jge    152 <gets+0x4d>
    cc = read(0, &c, 1);
 124:	83 ec 04             	sub    $0x4,%esp
 127:	6a 01                	push   $0x1
 129:	8d 45 e7             	lea    -0x19(%ebp),%eax
 12c:	50                   	push   %eax
 12d:	6a 00                	push   $0x0
 12f:	e8 58 02 00 00       	call   38c <read>
    if(cc < 1)
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	7e 17                	jle    152 <gets+0x4d>
      break;
    buf[i++] = c;
 13b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 13f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 142:	3c 0a                	cmp    $0xa,%al
 144:	0f 94 c2             	sete   %dl
 147:	3c 0d                	cmp    $0xd,%al
 149:	0f 94 c0             	sete   %al
 14c:	08 c2                	or     %al,%dl
 14e:	74 ca                	je     11a <gets+0x15>
    buf[i++] = c;
 150:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 152:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 156:	89 f8                	mov    %edi,%eax
 158:	8d 65 f4             	lea    -0xc(%ebp),%esp
 15b:	5b                   	pop    %ebx
 15c:	5e                   	pop    %esi
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <stat>:

int
stat(const char *n, struct stat *st)
{
 160:	f3 0f 1e fb          	endbr32 
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
 167:	56                   	push   %esi
 168:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 169:	83 ec 08             	sub    $0x8,%esp
 16c:	6a 00                	push   $0x0
 16e:	ff 75 08             	pushl  0x8(%ebp)
 171:	e8 3e 02 00 00       	call   3b4 <open>
  if(fd < 0)
 176:	83 c4 10             	add    $0x10,%esp
 179:	85 c0                	test   %eax,%eax
 17b:	78 24                	js     1a1 <stat+0x41>
 17d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 17f:	83 ec 08             	sub    $0x8,%esp
 182:	ff 75 0c             	pushl  0xc(%ebp)
 185:	50                   	push   %eax
 186:	e8 41 02 00 00       	call   3cc <fstat>
 18b:	89 c6                	mov    %eax,%esi
  close(fd);
 18d:	89 1c 24             	mov    %ebx,(%esp)
 190:	e8 07 02 00 00       	call   39c <close>
  return r;
 195:	83 c4 10             	add    $0x10,%esp
}
 198:	89 f0                	mov    %esi,%eax
 19a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5d                   	pop    %ebp
 1a0:	c3                   	ret    
    return -1;
 1a1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1a6:	eb f0                	jmp    198 <stat+0x38>

000001a8 <atoi>:

int
atoi(const char *s)
{
 1a8:	f3 0f 1e fb          	endbr32 
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	53                   	push   %ebx
 1b0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1b3:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1b8:	0f b6 01             	movzbl (%ecx),%eax
 1bb:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1be:	80 fb 09             	cmp    $0x9,%bl
 1c1:	77 12                	ja     1d5 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 1c3:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1c6:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1c9:	83 c1 01             	add    $0x1,%ecx
 1cc:	0f be c0             	movsbl %al,%eax
 1cf:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1d3:	eb e3                	jmp    1b8 <atoi+0x10>
  return n;
}
 1d5:	89 d0                	mov    %edx,%eax
 1d7:	5b                   	pop    %ebx
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    

000001da <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1da:	f3 0f 1e fb          	endbr32 
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	56                   	push   %esi
 1e2:	53                   	push   %ebx
 1e3:	8b 75 08             	mov    0x8(%ebp),%esi
 1e6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1e9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 1ec:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 1ee:	8d 58 ff             	lea    -0x1(%eax),%ebx
 1f1:	85 c0                	test   %eax,%eax
 1f3:	7e 0f                	jle    204 <memmove+0x2a>
    *dst++ = *src++;
 1f5:	0f b6 01             	movzbl (%ecx),%eax
 1f8:	88 02                	mov    %al,(%edx)
 1fa:	8d 49 01             	lea    0x1(%ecx),%ecx
 1fd:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 200:	89 d8                	mov    %ebx,%eax
 202:	eb ea                	jmp    1ee <memmove+0x14>
  return vdst;
}
 204:	89 f0                	mov    %esi,%eax
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5d                   	pop    %ebp
 209:	c3                   	ret    

0000020a <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 20a:	f3 0f 1e fb          	endbr32 
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
 211:	53                   	push   %ebx
 212:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 215:	68 00 20 00 00       	push   $0x2000
 21a:	e8 c7 04 00 00       	call   6e6 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 21f:	83 c4 10             	add    $0x10,%esp
 222:	89 c2                	mov    %eax,%edx
 224:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 22a:	74 22                	je     24e <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 22c:	b9 00 10 00 00       	mov    $0x1000,%ecx
 231:	29 d1                	sub    %edx,%ecx
 233:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 235:	ba 00 00 00 00       	mov    $0x0,%edx
 23a:	83 fa 3f             	cmp    $0x3f,%edx
 23d:	7f 13                	jg     252 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 23f:	83 3c 95 20 0e 00 00 	cmpl   $0x1,0xe20(,%edx,4)
 246:	01 
 247:	75 09                	jne    252 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 249:	83 c2 01             	add    $0x1,%edx
 24c:	eb ec                	jmp    23a <thread_create+0x30>
  void *user_stack = curr_ptr;
 24e:	89 c1                	mov    %eax,%ecx
 250:	eb e3                	jmp    235 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 252:	83 3c 95 20 0e 00 00 	cmpl   $0x1,0xe20(,%edx,4)
 259:	01 
 25a:	74 34                	je     290 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 25c:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 25f:	c1 e3 02             	shl    $0x2,%ebx
 262:	89 83 20 0b 00 00    	mov    %eax,0xb20(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 268:	89 8b 24 0b 00 00    	mov    %ecx,0xb24(%ebx)
  cell_full[i] = 1;
 26e:	c7 04 95 20 0e 00 00 	movl   $0x1,0xe20(,%edx,4)
 275:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 279:	ff 75 10             	pushl  0x10(%ebp)
 27c:	ff 75 0c             	pushl  0xc(%ebp)
 27f:	ff 75 08             	pushl  0x8(%ebp)
 282:	51                   	push   %ecx
 283:	e8 dc 00 00 00       	call   364 <clone>
 288:	83 c4 10             	add    $0x10,%esp
}
 28b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28e:	c9                   	leave  
 28f:	c3                   	ret    
    return -1;
 290:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 295:	eb f4                	jmp    28b <thread_create+0x81>

00000297 <thread_join>:

int thread_join(){
 297:	f3 0f 1e fb          	endbr32 
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	56                   	push   %esi
 29f:	53                   	push   %ebx
 2a0:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 2a3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2a6:	50                   	push   %eax
 2a7:	e8 d0 00 00 00       	call   37c <join>
 2ac:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 2ae:	83 c4 10             	add    $0x10,%esp
 2b1:	bb 00 00 00 00       	mov    $0x0,%ebx
 2b6:	83 fb 3f             	cmp    $0x3f,%ebx
 2b9:	7f 14                	jg     2cf <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 2bb:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2be:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2c1:	39 14 85 24 0b 00 00 	cmp    %edx,0xb24(,%eax,4)
 2c8:	74 05                	je     2cf <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 2ca:	83 c3 01             	add    $0x1,%ebx
 2cd:	eb e7                	jmp    2b6 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 2cf:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2d2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 2d5:	39 0c 85 24 0b 00 00 	cmp    %ecx,0xb24(,%eax,4)
 2dc:	75 26                	jne    304 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 2de:	83 ec 0c             	sub    $0xc,%esp
 2e1:	ff 34 85 20 0b 00 00 	pushl  0xb20(,%eax,4)
 2e8:	e8 35 03 00 00       	call   622 <free>
  cell_full[i] = 0;
 2ed:	c7 04 9d 20 0e 00 00 	movl   $0x0,0xe20(,%ebx,4)
 2f4:	00 00 00 00 

  return out;
 2f8:	83 c4 10             	add    $0x10,%esp
}
 2fb:	89 f0                	mov    %esi,%eax
 2fd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 300:	5b                   	pop    %ebx
 301:	5e                   	pop    %esi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 304:	be ff ff ff ff       	mov    $0xffffffff,%esi
 309:	eb f0                	jmp    2fb <thread_join+0x64>

0000030b <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 30b:	f3 0f 1e fb          	endbr32 
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 315:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 31b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 322:	5d                   	pop    %ebp
 323:	c3                   	ret    

00000324 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 324:	f3 0f 1e fb          	endbr32 
 328:	55                   	push   %ebp
 329:	89 e5                	mov    %esp,%ebp
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 32e:	b9 01 00 00 00       	mov    $0x1,%ecx
 333:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 337:	b8 00 00 00 00       	mov    $0x0,%eax
 33c:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 341:	39 c1                	cmp    %eax,%ecx
 343:	75 f2                	jne    337 <lock_acquire+0x13>
      ; // spin
    }
}
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <lock_release>:

void lock_release(lock_t *lock) {
 347:	f3 0f 1e fb          	endbr32 
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 351:	8b 42 04             	mov    0x4(%edx),%eax
 354:	83 c0 01             	add    $0x1,%eax
 357:	89 42 04             	mov    %eax,0x4(%edx)
}
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35c:	b8 01 00 00 00       	mov    $0x1,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <clone>:
SYSCALL(clone)
 364:	b8 16 00 00 00       	mov    $0x16,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <exit>:
SYSCALL(exit)
 36c:	b8 02 00 00 00       	mov    $0x2,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <wait>:
SYSCALL(wait)
 374:	b8 03 00 00 00       	mov    $0x3,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <join>:
SYSCALL(join)
 37c:	b8 17 00 00 00       	mov    $0x17,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <pipe>:
SYSCALL(pipe)
 384:	b8 04 00 00 00       	mov    $0x4,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <read>:
SYSCALL(read)
 38c:	b8 05 00 00 00       	mov    $0x5,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <write>:
SYSCALL(write)
 394:	b8 10 00 00 00       	mov    $0x10,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <close>:
SYSCALL(close)
 39c:	b8 15 00 00 00       	mov    $0x15,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <kill>:
SYSCALL(kill)
 3a4:	b8 06 00 00 00       	mov    $0x6,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <exec>:
SYSCALL(exec)
 3ac:	b8 07 00 00 00       	mov    $0x7,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <open>:
SYSCALL(open)
 3b4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <mknod>:
SYSCALL(mknod)
 3bc:	b8 11 00 00 00       	mov    $0x11,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <unlink>:
SYSCALL(unlink)
 3c4:	b8 12 00 00 00       	mov    $0x12,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <fstat>:
SYSCALL(fstat)
 3cc:	b8 08 00 00 00       	mov    $0x8,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <link>:
SYSCALL(link)
 3d4:	b8 13 00 00 00       	mov    $0x13,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <mkdir>:
SYSCALL(mkdir)
 3dc:	b8 14 00 00 00       	mov    $0x14,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <chdir>:
SYSCALL(chdir)
 3e4:	b8 09 00 00 00       	mov    $0x9,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <dup>:
SYSCALL(dup)
 3ec:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <getpid>:
SYSCALL(getpid)
 3f4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <sbrk>:
SYSCALL(sbrk)
 3fc:	b8 0c 00 00 00       	mov    $0xc,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <sleep>:
SYSCALL(sleep)
 404:	b8 0d 00 00 00       	mov    $0xd,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <uptime>:
SYSCALL(uptime)
 40c:	b8 0e 00 00 00       	mov    $0xe,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	83 ec 1c             	sub    $0x1c,%esp
 41a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 41d:	6a 01                	push   $0x1
 41f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 422:	52                   	push   %edx
 423:	50                   	push   %eax
 424:	e8 6b ff ff ff       	call   394 <write>
}
 429:	83 c4 10             	add    $0x10,%esp
 42c:	c9                   	leave  
 42d:	c3                   	ret    

0000042e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 42e:	55                   	push   %ebp
 42f:	89 e5                	mov    %esp,%ebp
 431:	57                   	push   %edi
 432:	56                   	push   %esi
 433:	53                   	push   %ebx
 434:	83 ec 2c             	sub    $0x2c,%esp
 437:	89 45 d0             	mov    %eax,-0x30(%ebp)
 43a:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 43c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 440:	0f 95 c2             	setne  %dl
 443:	89 f0                	mov    %esi,%eax
 445:	c1 e8 1f             	shr    $0x1f,%eax
 448:	84 c2                	test   %al,%dl
 44a:	74 42                	je     48e <printint+0x60>
    neg = 1;
    x = -xx;
 44c:	f7 de                	neg    %esi
    neg = 1;
 44e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 455:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 45a:	89 f0                	mov    %esi,%eax
 45c:	ba 00 00 00 00       	mov    $0x0,%edx
 461:	f7 f1                	div    %ecx
 463:	89 df                	mov    %ebx,%edi
 465:	83 c3 01             	add    $0x1,%ebx
 468:	0f b6 92 84 07 00 00 	movzbl 0x784(%edx),%edx
 46f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 473:	89 f2                	mov    %esi,%edx
 475:	89 c6                	mov    %eax,%esi
 477:	39 d1                	cmp    %edx,%ecx
 479:	76 df                	jbe    45a <printint+0x2c>
  if(neg)
 47b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 47f:	74 2f                	je     4b0 <printint+0x82>
    buf[i++] = '-';
 481:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 486:	8d 5f 02             	lea    0x2(%edi),%ebx
 489:	8b 75 d0             	mov    -0x30(%ebp),%esi
 48c:	eb 15                	jmp    4a3 <printint+0x75>
  neg = 0;
 48e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 495:	eb be                	jmp    455 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 497:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 49c:	89 f0                	mov    %esi,%eax
 49e:	e8 71 ff ff ff       	call   414 <putc>
  while(--i >= 0)
 4a3:	83 eb 01             	sub    $0x1,%ebx
 4a6:	79 ef                	jns    497 <printint+0x69>
}
 4a8:	83 c4 2c             	add    $0x2c,%esp
 4ab:	5b                   	pop    %ebx
 4ac:	5e                   	pop    %esi
 4ad:	5f                   	pop    %edi
 4ae:	5d                   	pop    %ebp
 4af:	c3                   	ret    
 4b0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4b3:	eb ee                	jmp    4a3 <printint+0x75>

000004b5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b5:	f3 0f 1e fb          	endbr32 
 4b9:	55                   	push   %ebp
 4ba:	89 e5                	mov    %esp,%ebp
 4bc:	57                   	push   %edi
 4bd:	56                   	push   %esi
 4be:	53                   	push   %ebx
 4bf:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4c2:	8d 45 10             	lea    0x10(%ebp),%eax
 4c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4c8:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4cd:	bb 00 00 00 00       	mov    $0x0,%ebx
 4d2:	eb 14                	jmp    4e8 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4d4:	89 fa                	mov    %edi,%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	e8 36 ff ff ff       	call   414 <putc>
 4de:	eb 05                	jmp    4e5 <printf+0x30>
      }
    } else if(state == '%'){
 4e0:	83 fe 25             	cmp    $0x25,%esi
 4e3:	74 25                	je     50a <printf+0x55>
  for(i = 0; fmt[i]; i++){
 4e5:	83 c3 01             	add    $0x1,%ebx
 4e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4eb:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 4ef:	84 c0                	test   %al,%al
 4f1:	0f 84 23 01 00 00    	je     61a <printf+0x165>
    c = fmt[i] & 0xff;
 4f7:	0f be f8             	movsbl %al,%edi
 4fa:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 4fd:	85 f6                	test   %esi,%esi
 4ff:	75 df                	jne    4e0 <printf+0x2b>
      if(c == '%'){
 501:	83 f8 25             	cmp    $0x25,%eax
 504:	75 ce                	jne    4d4 <printf+0x1f>
        state = '%';
 506:	89 c6                	mov    %eax,%esi
 508:	eb db                	jmp    4e5 <printf+0x30>
      if(c == 'd'){
 50a:	83 f8 64             	cmp    $0x64,%eax
 50d:	74 49                	je     558 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 50f:	83 f8 78             	cmp    $0x78,%eax
 512:	0f 94 c1             	sete   %cl
 515:	83 f8 70             	cmp    $0x70,%eax
 518:	0f 94 c2             	sete   %dl
 51b:	08 d1                	or     %dl,%cl
 51d:	75 63                	jne    582 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 51f:	83 f8 73             	cmp    $0x73,%eax
 522:	0f 84 84 00 00 00    	je     5ac <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 528:	83 f8 63             	cmp    $0x63,%eax
 52b:	0f 84 b7 00 00 00    	je     5e8 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 531:	83 f8 25             	cmp    $0x25,%eax
 534:	0f 84 cc 00 00 00    	je     606 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 53a:	ba 25 00 00 00       	mov    $0x25,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	e8 cd fe ff ff       	call   414 <putc>
        putc(fd, c);
 547:	89 fa                	mov    %edi,%edx
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	e8 c3 fe ff ff       	call   414 <putc>
      }
      state = 0;
 551:	be 00 00 00 00       	mov    $0x0,%esi
 556:	eb 8d                	jmp    4e5 <printf+0x30>
        printint(fd, *ap, 10, 1);
 558:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 55b:	8b 17                	mov    (%edi),%edx
 55d:	83 ec 0c             	sub    $0xc,%esp
 560:	6a 01                	push   $0x1
 562:	b9 0a 00 00 00       	mov    $0xa,%ecx
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	e8 bf fe ff ff       	call   42e <printint>
        ap++;
 56f:	83 c7 04             	add    $0x4,%edi
 572:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 575:	83 c4 10             	add    $0x10,%esp
      state = 0;
 578:	be 00 00 00 00       	mov    $0x0,%esi
 57d:	e9 63 ff ff ff       	jmp    4e5 <printf+0x30>
        printint(fd, *ap, 16, 0);
 582:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 585:	8b 17                	mov    (%edi),%edx
 587:	83 ec 0c             	sub    $0xc,%esp
 58a:	6a 00                	push   $0x0
 58c:	b9 10 00 00 00       	mov    $0x10,%ecx
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	e8 95 fe ff ff       	call   42e <printint>
        ap++;
 599:	83 c7 04             	add    $0x4,%edi
 59c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 59f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5a2:	be 00 00 00 00       	mov    $0x0,%esi
 5a7:	e9 39 ff ff ff       	jmp    4e5 <printf+0x30>
        s = (char*)*ap;
 5ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5af:	8b 30                	mov    (%eax),%esi
        ap++;
 5b1:	83 c0 04             	add    $0x4,%eax
 5b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5b7:	85 f6                	test   %esi,%esi
 5b9:	75 28                	jne    5e3 <printf+0x12e>
          s = "(null)";
 5bb:	be 7d 07 00 00       	mov    $0x77d,%esi
 5c0:	8b 7d 08             	mov    0x8(%ebp),%edi
 5c3:	eb 0d                	jmp    5d2 <printf+0x11d>
          putc(fd, *s);
 5c5:	0f be d2             	movsbl %dl,%edx
 5c8:	89 f8                	mov    %edi,%eax
 5ca:	e8 45 fe ff ff       	call   414 <putc>
          s++;
 5cf:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5d2:	0f b6 16             	movzbl (%esi),%edx
 5d5:	84 d2                	test   %dl,%dl
 5d7:	75 ec                	jne    5c5 <printf+0x110>
      state = 0;
 5d9:	be 00 00 00 00       	mov    $0x0,%esi
 5de:	e9 02 ff ff ff       	jmp    4e5 <printf+0x30>
 5e3:	8b 7d 08             	mov    0x8(%ebp),%edi
 5e6:	eb ea                	jmp    5d2 <printf+0x11d>
        putc(fd, *ap);
 5e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5eb:	0f be 17             	movsbl (%edi),%edx
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	e8 1e fe ff ff       	call   414 <putc>
        ap++;
 5f6:	83 c7 04             	add    $0x4,%edi
 5f9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 5fc:	be 00 00 00 00       	mov    $0x0,%esi
 601:	e9 df fe ff ff       	jmp    4e5 <printf+0x30>
        putc(fd, c);
 606:	89 fa                	mov    %edi,%edx
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	e8 04 fe ff ff       	call   414 <putc>
      state = 0;
 610:	be 00 00 00 00       	mov    $0x0,%esi
 615:	e9 cb fe ff ff       	jmp    4e5 <printf+0x30>
    }
  }
}
 61a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61d:	5b                   	pop    %ebx
 61e:	5e                   	pop    %esi
 61f:	5f                   	pop    %edi
 620:	5d                   	pop    %ebp
 621:	c3                   	ret    

00000622 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 622:	f3 0f 1e fb          	endbr32 
 626:	55                   	push   %ebp
 627:	89 e5                	mov    %esp,%ebp
 629:	57                   	push   %edi
 62a:	56                   	push   %esi
 62b:	53                   	push   %ebx
 62c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 62f:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 632:	a1 00 0b 00 00       	mov    0xb00,%eax
 637:	eb 02                	jmp    63b <free+0x19>
 639:	89 d0                	mov    %edx,%eax
 63b:	39 c8                	cmp    %ecx,%eax
 63d:	73 04                	jae    643 <free+0x21>
 63f:	39 08                	cmp    %ecx,(%eax)
 641:	77 12                	ja     655 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 643:	8b 10                	mov    (%eax),%edx
 645:	39 c2                	cmp    %eax,%edx
 647:	77 f0                	ja     639 <free+0x17>
 649:	39 c8                	cmp    %ecx,%eax
 64b:	72 08                	jb     655 <free+0x33>
 64d:	39 ca                	cmp    %ecx,%edx
 64f:	77 04                	ja     655 <free+0x33>
 651:	89 d0                	mov    %edx,%eax
 653:	eb e6                	jmp    63b <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 655:	8b 73 fc             	mov    -0x4(%ebx),%esi
 658:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65b:	8b 10                	mov    (%eax),%edx
 65d:	39 d7                	cmp    %edx,%edi
 65f:	74 19                	je     67a <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 661:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 664:	8b 50 04             	mov    0x4(%eax),%edx
 667:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 66a:	39 ce                	cmp    %ecx,%esi
 66c:	74 1b                	je     689 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 66e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 670:	a3 00 0b 00 00       	mov    %eax,0xb00
}
 675:	5b                   	pop    %ebx
 676:	5e                   	pop    %esi
 677:	5f                   	pop    %edi
 678:	5d                   	pop    %ebp
 679:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 67a:	03 72 04             	add    0x4(%edx),%esi
 67d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 680:	8b 10                	mov    (%eax),%edx
 682:	8b 12                	mov    (%edx),%edx
 684:	89 53 f8             	mov    %edx,-0x8(%ebx)
 687:	eb db                	jmp    664 <free+0x42>
    p->s.size += bp->s.size;
 689:	03 53 fc             	add    -0x4(%ebx),%edx
 68c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 692:	89 10                	mov    %edx,(%eax)
 694:	eb da                	jmp    670 <free+0x4e>

00000696 <morecore>:

static Header*
morecore(uint nu)
{
 696:	55                   	push   %ebp
 697:	89 e5                	mov    %esp,%ebp
 699:	53                   	push   %ebx
 69a:	83 ec 04             	sub    $0x4,%esp
 69d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 69f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6a4:	77 05                	ja     6ab <morecore+0x15>
    nu = 4096;
 6a6:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6ab:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6b2:	83 ec 0c             	sub    $0xc,%esp
 6b5:	50                   	push   %eax
 6b6:	e8 41 fd ff ff       	call   3fc <sbrk>
  if(p == (char*)-1)
 6bb:	83 c4 10             	add    $0x10,%esp
 6be:	83 f8 ff             	cmp    $0xffffffff,%eax
 6c1:	74 1c                	je     6df <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6c3:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6c6:	83 c0 08             	add    $0x8,%eax
 6c9:	83 ec 0c             	sub    $0xc,%esp
 6cc:	50                   	push   %eax
 6cd:	e8 50 ff ff ff       	call   622 <free>
  return freep;
 6d2:	a1 00 0b 00 00       	mov    0xb00,%eax
 6d7:	83 c4 10             	add    $0x10,%esp
}
 6da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6dd:	c9                   	leave  
 6de:	c3                   	ret    
    return 0;
 6df:	b8 00 00 00 00       	mov    $0x0,%eax
 6e4:	eb f4                	jmp    6da <morecore+0x44>

000006e6 <malloc>:

void*
malloc(uint nbytes)
{
 6e6:	f3 0f 1e fb          	endbr32 
 6ea:	55                   	push   %ebp
 6eb:	89 e5                	mov    %esp,%ebp
 6ed:	53                   	push   %ebx
 6ee:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f1:	8b 45 08             	mov    0x8(%ebp),%eax
 6f4:	8d 58 07             	lea    0x7(%eax),%ebx
 6f7:	c1 eb 03             	shr    $0x3,%ebx
 6fa:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 6fd:	8b 0d 00 0b 00 00    	mov    0xb00,%ecx
 703:	85 c9                	test   %ecx,%ecx
 705:	74 04                	je     70b <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 707:	8b 01                	mov    (%ecx),%eax
 709:	eb 4b                	jmp    756 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 70b:	c7 05 00 0b 00 00 04 	movl   $0xb04,0xb00
 712:	0b 00 00 
 715:	c7 05 04 0b 00 00 04 	movl   $0xb04,0xb04
 71c:	0b 00 00 
    base.s.size = 0;
 71f:	c7 05 08 0b 00 00 00 	movl   $0x0,0xb08
 726:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 729:	b9 04 0b 00 00       	mov    $0xb04,%ecx
 72e:	eb d7                	jmp    707 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 730:	74 1a                	je     74c <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 732:	29 da                	sub    %ebx,%edx
 734:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 737:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 73a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 73d:	89 0d 00 0b 00 00    	mov    %ecx,0xb00
      return (void*)(p + 1);
 743:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 746:	83 c4 04             	add    $0x4,%esp
 749:	5b                   	pop    %ebx
 74a:	5d                   	pop    %ebp
 74b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 74c:	8b 10                	mov    (%eax),%edx
 74e:	89 11                	mov    %edx,(%ecx)
 750:	eb eb                	jmp    73d <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 752:	89 c1                	mov    %eax,%ecx
 754:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 756:	8b 50 04             	mov    0x4(%eax),%edx
 759:	39 da                	cmp    %ebx,%edx
 75b:	73 d3                	jae    730 <malloc+0x4a>
    if(p == freep)
 75d:	39 05 00 0b 00 00    	cmp    %eax,0xb00
 763:	75 ed                	jne    752 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 765:	89 d8                	mov    %ebx,%eax
 767:	e8 2a ff ff ff       	call   696 <morecore>
 76c:	85 c0                	test   %eax,%eax
 76e:	75 e2                	jne    752 <malloc+0x6c>
 770:	eb d4                	jmp    746 <malloc+0x60>
