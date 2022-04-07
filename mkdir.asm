
_mkdir:     file format elf32-i386


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
  15:	83 ec 18             	sub    $0x18,%esp
  18:	8b 39                	mov    (%ecx),%edi
  1a:	8b 41 04             	mov    0x4(%ecx),%eax
  1d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int i;

  if(argc < 2){
  20:	83 ff 01             	cmp    $0x1,%edi
  23:	7e 25                	jle    4a <main+0x4a>
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  25:	bb 01 00 00 00       	mov    $0x1,%ebx
  2a:	39 fb                	cmp    %edi,%ebx
  2c:	7d 44                	jge    72 <main+0x72>
    if(mkdir(argv[i]) < 0){
  2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  31:	8d 34 98             	lea    (%eax,%ebx,4),%esi
  34:	83 ec 0c             	sub    $0xc,%esp
  37:	ff 36                	pushl  (%esi)
  39:	e8 c0 03 00 00       	call   3fe <mkdir>
  3e:	83 c4 10             	add    $0x10,%esp
  41:	85 c0                	test   %eax,%eax
  43:	78 19                	js     5e <main+0x5e>
  for(i = 1; i < argc; i++){
  45:	83 c3 01             	add    $0x1,%ebx
  48:	eb e0                	jmp    2a <main+0x2a>
    printf(2, "Usage: mkdir files...\n");
  4a:	83 ec 08             	sub    $0x8,%esp
  4d:	68 94 07 00 00       	push   $0x794
  52:	6a 02                	push   $0x2
  54:	e8 7e 04 00 00       	call   4d7 <printf>
    exit();
  59:	e8 30 03 00 00       	call   38e <exit>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  5e:	83 ec 04             	sub    $0x4,%esp
  61:	ff 36                	pushl  (%esi)
  63:	68 ab 07 00 00       	push   $0x7ab
  68:	6a 02                	push   $0x2
  6a:	e8 68 04 00 00       	call   4d7 <printf>
      break;
  6f:	83 c4 10             	add    $0x10,%esp
    }
  }

  exit();
  72:	e8 17 03 00 00       	call   38e <exit>

00000077 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  77:	f3 0f 1e fb          	endbr32 
  7b:	55                   	push   %ebp
  7c:	89 e5                	mov    %esp,%ebp
  7e:	56                   	push   %esi
  7f:	53                   	push   %ebx
  80:	8b 75 08             	mov    0x8(%ebp),%esi
  83:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  86:	89 f0                	mov    %esi,%eax
  88:	89 d1                	mov    %edx,%ecx
  8a:	83 c2 01             	add    $0x1,%edx
  8d:	89 c3                	mov    %eax,%ebx
  8f:	83 c0 01             	add    $0x1,%eax
  92:	0f b6 09             	movzbl (%ecx),%ecx
  95:	88 0b                	mov    %cl,(%ebx)
  97:	84 c9                	test   %cl,%cl
  99:	75 ed                	jne    88 <strcpy+0x11>
    ;
  return os;
}
  9b:	89 f0                	mov    %esi,%eax
  9d:	5b                   	pop    %ebx
  9e:	5e                   	pop    %esi
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    

000000a1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a1:	f3 0f 1e fb          	endbr32 
  a5:	55                   	push   %ebp
  a6:	89 e5                	mov    %esp,%ebp
  a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  ab:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
  ae:	0f b6 01             	movzbl (%ecx),%eax
  b1:	84 c0                	test   %al,%al
  b3:	74 0c                	je     c1 <strcmp+0x20>
  b5:	3a 02                	cmp    (%edx),%al
  b7:	75 08                	jne    c1 <strcmp+0x20>
    p++, q++;
  b9:	83 c1 01             	add    $0x1,%ecx
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	eb ed                	jmp    ae <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
  c1:	0f b6 c0             	movzbl %al,%eax
  c4:	0f b6 12             	movzbl (%edx),%edx
  c7:	29 d0                	sub    %edx,%eax
}
  c9:	5d                   	pop    %ebp
  ca:	c3                   	ret    

000000cb <strlen>:

uint
strlen(const char *s)
{
  cb:	f3 0f 1e fb          	endbr32 
  cf:	55                   	push   %ebp
  d0:	89 e5                	mov    %esp,%ebp
  d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  d5:	b8 00 00 00 00       	mov    $0x0,%eax
  da:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  de:	74 05                	je     e5 <strlen+0x1a>
  e0:	83 c0 01             	add    $0x1,%eax
  e3:	eb f5                	jmp    da <strlen+0xf>
    ;
  return n;
}
  e5:	5d                   	pop    %ebp
  e6:	c3                   	ret    

000000e7 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e7:	f3 0f 1e fb          	endbr32 
  eb:	55                   	push   %ebp
  ec:	89 e5                	mov    %esp,%ebp
  ee:	57                   	push   %edi
  ef:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f2:	89 d7                	mov    %edx,%edi
  f4:	8b 4d 10             	mov    0x10(%ebp),%ecx
  f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  fa:	fc                   	cld    
  fb:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  fd:	89 d0                	mov    %edx,%eax
  ff:	5f                   	pop    %edi
 100:	5d                   	pop    %ebp
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	f3 0f 1e fb          	endbr32 
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
 109:	8b 45 08             	mov    0x8(%ebp),%eax
 10c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 110:	0f b6 10             	movzbl (%eax),%edx
 113:	84 d2                	test   %dl,%dl
 115:	74 09                	je     120 <strchr+0x1e>
    if(*s == c)
 117:	38 ca                	cmp    %cl,%dl
 119:	74 0a                	je     125 <strchr+0x23>
  for(; *s; s++)
 11b:	83 c0 01             	add    $0x1,%eax
 11e:	eb f0                	jmp    110 <strchr+0xe>
      return (char*)s;
  return 0;
 120:	b8 00 00 00 00       	mov    $0x0,%eax
}
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    

00000127 <gets>:

char*
gets(char *buf, int max)
{
 127:	f3 0f 1e fb          	endbr32 
 12b:	55                   	push   %ebp
 12c:	89 e5                	mov    %esp,%ebp
 12e:	57                   	push   %edi
 12f:	56                   	push   %esi
 130:	53                   	push   %ebx
 131:	83 ec 1c             	sub    $0x1c,%esp
 134:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 137:	bb 00 00 00 00       	mov    $0x0,%ebx
 13c:	89 de                	mov    %ebx,%esi
 13e:	83 c3 01             	add    $0x1,%ebx
 141:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 144:	7d 2e                	jge    174 <gets+0x4d>
    cc = read(0, &c, 1);
 146:	83 ec 04             	sub    $0x4,%esp
 149:	6a 01                	push   $0x1
 14b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 14e:	50                   	push   %eax
 14f:	6a 00                	push   $0x0
 151:	e8 58 02 00 00       	call   3ae <read>
    if(cc < 1)
 156:	83 c4 10             	add    $0x10,%esp
 159:	85 c0                	test   %eax,%eax
 15b:	7e 17                	jle    174 <gets+0x4d>
      break;
    buf[i++] = c;
 15d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 161:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 164:	3c 0a                	cmp    $0xa,%al
 166:	0f 94 c2             	sete   %dl
 169:	3c 0d                	cmp    $0xd,%al
 16b:	0f 94 c0             	sete   %al
 16e:	08 c2                	or     %al,%dl
 170:	74 ca                	je     13c <gets+0x15>
    buf[i++] = c;
 172:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 174:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 178:	89 f8                	mov    %edi,%eax
 17a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17d:	5b                   	pop    %ebx
 17e:	5e                   	pop    %esi
 17f:	5f                   	pop    %edi
 180:	5d                   	pop    %ebp
 181:	c3                   	ret    

00000182 <stat>:

int
stat(const char *n, struct stat *st)
{
 182:	f3 0f 1e fb          	endbr32 
 186:	55                   	push   %ebp
 187:	89 e5                	mov    %esp,%ebp
 189:	56                   	push   %esi
 18a:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 18b:	83 ec 08             	sub    $0x8,%esp
 18e:	6a 00                	push   $0x0
 190:	ff 75 08             	pushl  0x8(%ebp)
 193:	e8 3e 02 00 00       	call   3d6 <open>
  if(fd < 0)
 198:	83 c4 10             	add    $0x10,%esp
 19b:	85 c0                	test   %eax,%eax
 19d:	78 24                	js     1c3 <stat+0x41>
 19f:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1a1:	83 ec 08             	sub    $0x8,%esp
 1a4:	ff 75 0c             	pushl  0xc(%ebp)
 1a7:	50                   	push   %eax
 1a8:	e8 41 02 00 00       	call   3ee <fstat>
 1ad:	89 c6                	mov    %eax,%esi
  close(fd);
 1af:	89 1c 24             	mov    %ebx,(%esp)
 1b2:	e8 07 02 00 00       	call   3be <close>
  return r;
 1b7:	83 c4 10             	add    $0x10,%esp
}
 1ba:	89 f0                	mov    %esi,%eax
 1bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1bf:	5b                   	pop    %ebx
 1c0:	5e                   	pop    %esi
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
    return -1;
 1c3:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1c8:	eb f0                	jmp    1ba <stat+0x38>

000001ca <atoi>:

int
atoi(const char *s)
{
 1ca:	f3 0f 1e fb          	endbr32 
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	53                   	push   %ebx
 1d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 1d5:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 1da:	0f b6 01             	movzbl (%ecx),%eax
 1dd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e0:	80 fb 09             	cmp    $0x9,%bl
 1e3:	77 12                	ja     1f7 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 1e5:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 1e8:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 1eb:	83 c1 01             	add    $0x1,%ecx
 1ee:	0f be c0             	movsbl %al,%eax
 1f1:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 1f5:	eb e3                	jmp    1da <atoi+0x10>
  return n;
}
 1f7:	89 d0                	mov    %edx,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5d                   	pop    %ebp
 1fb:	c3                   	ret    

000001fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1fc:	f3 0f 1e fb          	endbr32 
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	8b 75 08             	mov    0x8(%ebp),%esi
 208:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 20b:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 20e:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 210:	8d 58 ff             	lea    -0x1(%eax),%ebx
 213:	85 c0                	test   %eax,%eax
 215:	7e 0f                	jle    226 <memmove+0x2a>
    *dst++ = *src++;
 217:	0f b6 01             	movzbl (%ecx),%eax
 21a:	88 02                	mov    %al,(%edx)
 21c:	8d 49 01             	lea    0x1(%ecx),%ecx
 21f:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 222:	89 d8                	mov    %ebx,%eax
 224:	eb ea                	jmp    210 <memmove+0x14>
  return vdst;
}
 226:	89 f0                	mov    %esi,%eax
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret    

0000022c <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 22c:	f3 0f 1e fb          	endbr32 
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 237:	68 00 20 00 00       	push   $0x2000
 23c:	e8 c7 04 00 00       	call   708 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 241:	83 c4 10             	add    $0x10,%esp
 244:	89 c2                	mov    %eax,%edx
 246:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 24c:	74 22                	je     270 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 24e:	b9 00 10 00 00       	mov    $0x1000,%ecx
 253:	29 d1                	sub    %edx,%ecx
 255:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 257:	ba 00 00 00 00       	mov    $0x0,%edx
 25c:	83 fa 3f             	cmp    $0x3f,%edx
 25f:	7f 13                	jg     274 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 261:	83 3c 95 60 0e 00 00 	cmpl   $0x1,0xe60(,%edx,4)
 268:	01 
 269:	75 09                	jne    274 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 26b:	83 c2 01             	add    $0x1,%edx
 26e:	eb ec                	jmp    25c <thread_create+0x30>
  void *user_stack = curr_ptr;
 270:	89 c1                	mov    %eax,%ecx
 272:	eb e3                	jmp    257 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 274:	83 3c 95 60 0e 00 00 	cmpl   $0x1,0xe60(,%edx,4)
 27b:	01 
 27c:	74 34                	je     2b2 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 27e:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 281:	c1 e3 02             	shl    $0x2,%ebx
 284:	89 83 60 0b 00 00    	mov    %eax,0xb60(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 28a:	89 8b 64 0b 00 00    	mov    %ecx,0xb64(%ebx)
  cell_full[i] = 1;
 290:	c7 04 95 60 0e 00 00 	movl   $0x1,0xe60(,%edx,4)
 297:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 29b:	ff 75 10             	pushl  0x10(%ebp)
 29e:	ff 75 0c             	pushl  0xc(%ebp)
 2a1:	ff 75 08             	pushl  0x8(%ebp)
 2a4:	51                   	push   %ecx
 2a5:	e8 dc 00 00 00       	call   386 <clone>
 2aa:	83 c4 10             	add    $0x10,%esp
}
 2ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    
    return -1;
 2b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2b7:	eb f4                	jmp    2ad <thread_create+0x81>

000002b9 <thread_join>:

int thread_join(){
 2b9:	f3 0f 1e fb          	endbr32 
 2bd:	55                   	push   %ebp
 2be:	89 e5                	mov    %esp,%ebp
 2c0:	56                   	push   %esi
 2c1:	53                   	push   %ebx
 2c2:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 2c5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 2c8:	50                   	push   %eax
 2c9:	e8 d0 00 00 00       	call   39e <join>
 2ce:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 2d0:	83 c4 10             	add    $0x10,%esp
 2d3:	bb 00 00 00 00       	mov    $0x0,%ebx
 2d8:	83 fb 3f             	cmp    $0x3f,%ebx
 2db:	7f 14                	jg     2f1 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 2dd:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2e3:	39 14 85 64 0b 00 00 	cmp    %edx,0xb64(,%eax,4)
 2ea:	74 05                	je     2f1 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 2ec:	83 c3 01             	add    $0x1,%ebx
 2ef:	eb e7                	jmp    2d8 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 2f1:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 2f4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 2f7:	39 0c 85 64 0b 00 00 	cmp    %ecx,0xb64(,%eax,4)
 2fe:	75 26                	jne    326 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 300:	83 ec 0c             	sub    $0xc,%esp
 303:	ff 34 85 60 0b 00 00 	pushl  0xb60(,%eax,4)
 30a:	e8 35 03 00 00       	call   644 <free>
  cell_full[i] = 0;
 30f:	c7 04 9d 60 0e 00 00 	movl   $0x0,0xe60(,%ebx,4)
 316:	00 00 00 00 

  return out;
 31a:	83 c4 10             	add    $0x10,%esp
}
 31d:	89 f0                	mov    %esi,%eax
 31f:	8d 65 f8             	lea    -0x8(%ebp),%esp
 322:	5b                   	pop    %ebx
 323:	5e                   	pop    %esi
 324:	5d                   	pop    %ebp
 325:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 326:	be ff ff ff ff       	mov    $0xffffffff,%esi
 32b:	eb f0                	jmp    31d <thread_join+0x64>

0000032d <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 32d:	f3 0f 1e fb          	endbr32 
 331:	55                   	push   %ebp
 332:	89 e5                	mov    %esp,%ebp
 334:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 337:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 33d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 344:	5d                   	pop    %ebp
 345:	c3                   	ret    

00000346 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 346:	f3 0f 1e fb          	endbr32 
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 350:	b9 01 00 00 00       	mov    $0x1,%ecx
 355:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 359:	b8 00 00 00 00       	mov    $0x0,%eax
 35e:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 363:	39 c1                	cmp    %eax,%ecx
 365:	75 f2                	jne    359 <lock_acquire+0x13>
      ; // spin
    }
}
 367:	5d                   	pop    %ebp
 368:	c3                   	ret    

00000369 <lock_release>:

void lock_release(lock_t *lock) {
 369:	f3 0f 1e fb          	endbr32 
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 373:	8b 42 04             	mov    0x4(%edx),%eax
 376:	83 c0 01             	add    $0x1,%eax
 379:	89 42 04             	mov    %eax,0x4(%edx)
}
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    

0000037e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37e:	b8 01 00 00 00       	mov    $0x1,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <clone>:
SYSCALL(clone)
 386:	b8 16 00 00 00       	mov    $0x16,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <exit>:
SYSCALL(exit)
 38e:	b8 02 00 00 00       	mov    $0x2,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <wait>:
SYSCALL(wait)
 396:	b8 03 00 00 00       	mov    $0x3,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <join>:
SYSCALL(join)
 39e:	b8 17 00 00 00       	mov    $0x17,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <pipe>:
SYSCALL(pipe)
 3a6:	b8 04 00 00 00       	mov    $0x4,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <read>:
SYSCALL(read)
 3ae:	b8 05 00 00 00       	mov    $0x5,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <write>:
SYSCALL(write)
 3b6:	b8 10 00 00 00       	mov    $0x10,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <close>:
SYSCALL(close)
 3be:	b8 15 00 00 00       	mov    $0x15,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <kill>:
SYSCALL(kill)
 3c6:	b8 06 00 00 00       	mov    $0x6,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <exec>:
SYSCALL(exec)
 3ce:	b8 07 00 00 00       	mov    $0x7,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <open>:
SYSCALL(open)
 3d6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <mknod>:
SYSCALL(mknod)
 3de:	b8 11 00 00 00       	mov    $0x11,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <unlink>:
SYSCALL(unlink)
 3e6:	b8 12 00 00 00       	mov    $0x12,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <fstat>:
SYSCALL(fstat)
 3ee:	b8 08 00 00 00       	mov    $0x8,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <link>:
SYSCALL(link)
 3f6:	b8 13 00 00 00       	mov    $0x13,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <mkdir>:
SYSCALL(mkdir)
 3fe:	b8 14 00 00 00       	mov    $0x14,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <chdir>:
SYSCALL(chdir)
 406:	b8 09 00 00 00       	mov    $0x9,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <dup>:
SYSCALL(dup)
 40e:	b8 0a 00 00 00       	mov    $0xa,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <getpid>:
SYSCALL(getpid)
 416:	b8 0b 00 00 00       	mov    $0xb,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <sbrk>:
SYSCALL(sbrk)
 41e:	b8 0c 00 00 00       	mov    $0xc,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <sleep>:
SYSCALL(sleep)
 426:	b8 0d 00 00 00       	mov    $0xd,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <uptime>:
SYSCALL(uptime)
 42e:	b8 0e 00 00 00       	mov    $0xe,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	83 ec 1c             	sub    $0x1c,%esp
 43c:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 43f:	6a 01                	push   $0x1
 441:	8d 55 f4             	lea    -0xc(%ebp),%edx
 444:	52                   	push   %edx
 445:	50                   	push   %eax
 446:	e8 6b ff ff ff       	call   3b6 <write>
}
 44b:	83 c4 10             	add    $0x10,%esp
 44e:	c9                   	leave  
 44f:	c3                   	ret    

00000450 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 2c             	sub    $0x2c,%esp
 459:	89 45 d0             	mov    %eax,-0x30(%ebp)
 45c:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 462:	0f 95 c2             	setne  %dl
 465:	89 f0                	mov    %esi,%eax
 467:	c1 e8 1f             	shr    $0x1f,%eax
 46a:	84 c2                	test   %al,%dl
 46c:	74 42                	je     4b0 <printint+0x60>
    neg = 1;
    x = -xx;
 46e:	f7 de                	neg    %esi
    neg = 1;
 470:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 477:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 47c:	89 f0                	mov    %esi,%eax
 47e:	ba 00 00 00 00       	mov    $0x0,%edx
 483:	f7 f1                	div    %ecx
 485:	89 df                	mov    %ebx,%edi
 487:	83 c3 01             	add    $0x1,%ebx
 48a:	0f b6 92 d0 07 00 00 	movzbl 0x7d0(%edx),%edx
 491:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 495:	89 f2                	mov    %esi,%edx
 497:	89 c6                	mov    %eax,%esi
 499:	39 d1                	cmp    %edx,%ecx
 49b:	76 df                	jbe    47c <printint+0x2c>
  if(neg)
 49d:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 4a1:	74 2f                	je     4d2 <printint+0x82>
    buf[i++] = '-';
 4a3:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 4a8:	8d 5f 02             	lea    0x2(%edi),%ebx
 4ab:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4ae:	eb 15                	jmp    4c5 <printint+0x75>
  neg = 0;
 4b0:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 4b7:	eb be                	jmp    477 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 4b9:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 4be:	89 f0                	mov    %esi,%eax
 4c0:	e8 71 ff ff ff       	call   436 <putc>
  while(--i >= 0)
 4c5:	83 eb 01             	sub    $0x1,%ebx
 4c8:	79 ef                	jns    4b9 <printint+0x69>
}
 4ca:	83 c4 2c             	add    $0x2c,%esp
 4cd:	5b                   	pop    %ebx
 4ce:	5e                   	pop    %esi
 4cf:	5f                   	pop    %edi
 4d0:	5d                   	pop    %ebp
 4d1:	c3                   	ret    
 4d2:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4d5:	eb ee                	jmp    4c5 <printint+0x75>

000004d7 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4d7:	f3 0f 1e fb          	endbr32 
 4db:	55                   	push   %ebp
 4dc:	89 e5                	mov    %esp,%ebp
 4de:	57                   	push   %edi
 4df:	56                   	push   %esi
 4e0:	53                   	push   %ebx
 4e1:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 4e4:	8d 45 10             	lea    0x10(%ebp),%eax
 4e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 4ea:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 4ef:	bb 00 00 00 00       	mov    $0x0,%ebx
 4f4:	eb 14                	jmp    50a <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 4f6:	89 fa                	mov    %edi,%edx
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	e8 36 ff ff ff       	call   436 <putc>
 500:	eb 05                	jmp    507 <printf+0x30>
      }
    } else if(state == '%'){
 502:	83 fe 25             	cmp    $0x25,%esi
 505:	74 25                	je     52c <printf+0x55>
  for(i = 0; fmt[i]; i++){
 507:	83 c3 01             	add    $0x1,%ebx
 50a:	8b 45 0c             	mov    0xc(%ebp),%eax
 50d:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 511:	84 c0                	test   %al,%al
 513:	0f 84 23 01 00 00    	je     63c <printf+0x165>
    c = fmt[i] & 0xff;
 519:	0f be f8             	movsbl %al,%edi
 51c:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 51f:	85 f6                	test   %esi,%esi
 521:	75 df                	jne    502 <printf+0x2b>
      if(c == '%'){
 523:	83 f8 25             	cmp    $0x25,%eax
 526:	75 ce                	jne    4f6 <printf+0x1f>
        state = '%';
 528:	89 c6                	mov    %eax,%esi
 52a:	eb db                	jmp    507 <printf+0x30>
      if(c == 'd'){
 52c:	83 f8 64             	cmp    $0x64,%eax
 52f:	74 49                	je     57a <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 531:	83 f8 78             	cmp    $0x78,%eax
 534:	0f 94 c1             	sete   %cl
 537:	83 f8 70             	cmp    $0x70,%eax
 53a:	0f 94 c2             	sete   %dl
 53d:	08 d1                	or     %dl,%cl
 53f:	75 63                	jne    5a4 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 541:	83 f8 73             	cmp    $0x73,%eax
 544:	0f 84 84 00 00 00    	je     5ce <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 54a:	83 f8 63             	cmp    $0x63,%eax
 54d:	0f 84 b7 00 00 00    	je     60a <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 553:	83 f8 25             	cmp    $0x25,%eax
 556:	0f 84 cc 00 00 00    	je     628 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 55c:	ba 25 00 00 00       	mov    $0x25,%edx
 561:	8b 45 08             	mov    0x8(%ebp),%eax
 564:	e8 cd fe ff ff       	call   436 <putc>
        putc(fd, c);
 569:	89 fa                	mov    %edi,%edx
 56b:	8b 45 08             	mov    0x8(%ebp),%eax
 56e:	e8 c3 fe ff ff       	call   436 <putc>
      }
      state = 0;
 573:	be 00 00 00 00       	mov    $0x0,%esi
 578:	eb 8d                	jmp    507 <printf+0x30>
        printint(fd, *ap, 10, 1);
 57a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 57d:	8b 17                	mov    (%edi),%edx
 57f:	83 ec 0c             	sub    $0xc,%esp
 582:	6a 01                	push   $0x1
 584:	b9 0a 00 00 00       	mov    $0xa,%ecx
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	e8 bf fe ff ff       	call   450 <printint>
        ap++;
 591:	83 c7 04             	add    $0x4,%edi
 594:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 597:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59a:	be 00 00 00 00       	mov    $0x0,%esi
 59f:	e9 63 ff ff ff       	jmp    507 <printf+0x30>
        printint(fd, *ap, 16, 0);
 5a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5a7:	8b 17                	mov    (%edi),%edx
 5a9:	83 ec 0c             	sub    $0xc,%esp
 5ac:	6a 00                	push   $0x0
 5ae:	b9 10 00 00 00       	mov    $0x10,%ecx
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	e8 95 fe ff ff       	call   450 <printint>
        ap++;
 5bb:	83 c7 04             	add    $0x4,%edi
 5be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 5c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5c4:	be 00 00 00 00       	mov    $0x0,%esi
 5c9:	e9 39 ff ff ff       	jmp    507 <printf+0x30>
        s = (char*)*ap;
 5ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d1:	8b 30                	mov    (%eax),%esi
        ap++;
 5d3:	83 c0 04             	add    $0x4,%eax
 5d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 5d9:	85 f6                	test   %esi,%esi
 5db:	75 28                	jne    605 <printf+0x12e>
          s = "(null)";
 5dd:	be c7 07 00 00       	mov    $0x7c7,%esi
 5e2:	8b 7d 08             	mov    0x8(%ebp),%edi
 5e5:	eb 0d                	jmp    5f4 <printf+0x11d>
          putc(fd, *s);
 5e7:	0f be d2             	movsbl %dl,%edx
 5ea:	89 f8                	mov    %edi,%eax
 5ec:	e8 45 fe ff ff       	call   436 <putc>
          s++;
 5f1:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 5f4:	0f b6 16             	movzbl (%esi),%edx
 5f7:	84 d2                	test   %dl,%dl
 5f9:	75 ec                	jne    5e7 <printf+0x110>
      state = 0;
 5fb:	be 00 00 00 00       	mov    $0x0,%esi
 600:	e9 02 ff ff ff       	jmp    507 <printf+0x30>
 605:	8b 7d 08             	mov    0x8(%ebp),%edi
 608:	eb ea                	jmp    5f4 <printf+0x11d>
        putc(fd, *ap);
 60a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 60d:	0f be 17             	movsbl (%edi),%edx
 610:	8b 45 08             	mov    0x8(%ebp),%eax
 613:	e8 1e fe ff ff       	call   436 <putc>
        ap++;
 618:	83 c7 04             	add    $0x4,%edi
 61b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 61e:	be 00 00 00 00       	mov    $0x0,%esi
 623:	e9 df fe ff ff       	jmp    507 <printf+0x30>
        putc(fd, c);
 628:	89 fa                	mov    %edi,%edx
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	e8 04 fe ff ff       	call   436 <putc>
      state = 0;
 632:	be 00 00 00 00       	mov    $0x0,%esi
 637:	e9 cb fe ff ff       	jmp    507 <printf+0x30>
    }
  }
}
 63c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63f:	5b                   	pop    %ebx
 640:	5e                   	pop    %esi
 641:	5f                   	pop    %edi
 642:	5d                   	pop    %ebp
 643:	c3                   	ret    

00000644 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 644:	f3 0f 1e fb          	endbr32 
 648:	55                   	push   %ebp
 649:	89 e5                	mov    %esp,%ebp
 64b:	57                   	push   %edi
 64c:	56                   	push   %esi
 64d:	53                   	push   %ebx
 64e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 651:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 654:	a1 40 0b 00 00       	mov    0xb40,%eax
 659:	eb 02                	jmp    65d <free+0x19>
 65b:	89 d0                	mov    %edx,%eax
 65d:	39 c8                	cmp    %ecx,%eax
 65f:	73 04                	jae    665 <free+0x21>
 661:	39 08                	cmp    %ecx,(%eax)
 663:	77 12                	ja     677 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 665:	8b 10                	mov    (%eax),%edx
 667:	39 c2                	cmp    %eax,%edx
 669:	77 f0                	ja     65b <free+0x17>
 66b:	39 c8                	cmp    %ecx,%eax
 66d:	72 08                	jb     677 <free+0x33>
 66f:	39 ca                	cmp    %ecx,%edx
 671:	77 04                	ja     677 <free+0x33>
 673:	89 d0                	mov    %edx,%eax
 675:	eb e6                	jmp    65d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 677:	8b 73 fc             	mov    -0x4(%ebx),%esi
 67a:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67d:	8b 10                	mov    (%eax),%edx
 67f:	39 d7                	cmp    %edx,%edi
 681:	74 19                	je     69c <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 683:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 686:	8b 50 04             	mov    0x4(%eax),%edx
 689:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 68c:	39 ce                	cmp    %ecx,%esi
 68e:	74 1b                	je     6ab <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 690:	89 08                	mov    %ecx,(%eax)
  freep = p;
 692:	a3 40 0b 00 00       	mov    %eax,0xb40
}
 697:	5b                   	pop    %ebx
 698:	5e                   	pop    %esi
 699:	5f                   	pop    %edi
 69a:	5d                   	pop    %ebp
 69b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 69c:	03 72 04             	add    0x4(%edx),%esi
 69f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a2:	8b 10                	mov    (%eax),%edx
 6a4:	8b 12                	mov    (%edx),%edx
 6a6:	89 53 f8             	mov    %edx,-0x8(%ebx)
 6a9:	eb db                	jmp    686 <free+0x42>
    p->s.size += bp->s.size;
 6ab:	03 53 fc             	add    -0x4(%ebx),%edx
 6ae:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6b1:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6b4:	89 10                	mov    %edx,(%eax)
 6b6:	eb da                	jmp    692 <free+0x4e>

000006b8 <morecore>:

static Header*
morecore(uint nu)
{
 6b8:	55                   	push   %ebp
 6b9:	89 e5                	mov    %esp,%ebp
 6bb:	53                   	push   %ebx
 6bc:	83 ec 04             	sub    $0x4,%esp
 6bf:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 6c1:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 6c6:	77 05                	ja     6cd <morecore+0x15>
    nu = 4096;
 6c8:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 6cd:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6d4:	83 ec 0c             	sub    $0xc,%esp
 6d7:	50                   	push   %eax
 6d8:	e8 41 fd ff ff       	call   41e <sbrk>
  if(p == (char*)-1)
 6dd:	83 c4 10             	add    $0x10,%esp
 6e0:	83 f8 ff             	cmp    $0xffffffff,%eax
 6e3:	74 1c                	je     701 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6e5:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6e8:	83 c0 08             	add    $0x8,%eax
 6eb:	83 ec 0c             	sub    $0xc,%esp
 6ee:	50                   	push   %eax
 6ef:	e8 50 ff ff ff       	call   644 <free>
  return freep;
 6f4:	a1 40 0b 00 00       	mov    0xb40,%eax
 6f9:	83 c4 10             	add    $0x10,%esp
}
 6fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 6ff:	c9                   	leave  
 700:	c3                   	ret    
    return 0;
 701:	b8 00 00 00 00       	mov    $0x0,%eax
 706:	eb f4                	jmp    6fc <morecore+0x44>

00000708 <malloc>:

void*
malloc(uint nbytes)
{
 708:	f3 0f 1e fb          	endbr32 
 70c:	55                   	push   %ebp
 70d:	89 e5                	mov    %esp,%ebp
 70f:	53                   	push   %ebx
 710:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 713:	8b 45 08             	mov    0x8(%ebp),%eax
 716:	8d 58 07             	lea    0x7(%eax),%ebx
 719:	c1 eb 03             	shr    $0x3,%ebx
 71c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 71f:	8b 0d 40 0b 00 00    	mov    0xb40,%ecx
 725:	85 c9                	test   %ecx,%ecx
 727:	74 04                	je     72d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 729:	8b 01                	mov    (%ecx),%eax
 72b:	eb 4b                	jmp    778 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 72d:	c7 05 40 0b 00 00 44 	movl   $0xb44,0xb40
 734:	0b 00 00 
 737:	c7 05 44 0b 00 00 44 	movl   $0xb44,0xb44
 73e:	0b 00 00 
    base.s.size = 0;
 741:	c7 05 48 0b 00 00 00 	movl   $0x0,0xb48
 748:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 74b:	b9 44 0b 00 00       	mov    $0xb44,%ecx
 750:	eb d7                	jmp    729 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 752:	74 1a                	je     76e <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 754:	29 da                	sub    %ebx,%edx
 756:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 759:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 75c:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 75f:	89 0d 40 0b 00 00    	mov    %ecx,0xb40
      return (void*)(p + 1);
 765:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 768:	83 c4 04             	add    $0x4,%esp
 76b:	5b                   	pop    %ebx
 76c:	5d                   	pop    %ebp
 76d:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 76e:	8b 10                	mov    (%eax),%edx
 770:	89 11                	mov    %edx,(%ecx)
 772:	eb eb                	jmp    75f <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 774:	89 c1                	mov    %eax,%ecx
 776:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 778:	8b 50 04             	mov    0x4(%eax),%edx
 77b:	39 da                	cmp    %ebx,%edx
 77d:	73 d3                	jae    752 <malloc+0x4a>
    if(p == freep)
 77f:	39 05 40 0b 00 00    	cmp    %eax,0xb40
 785:	75 ed                	jne    774 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 787:	89 d8                	mov    %ebx,%eax
 789:	e8 2a ff ff ff       	call   6b8 <morecore>
 78e:	85 c0                	test   %eax,%eax
 790:	75 e2                	jne    774 <malloc+0x6c>
 792:	eb d4                	jmp    768 <malloc+0x60>
