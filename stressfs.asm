
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	56                   	push   %esi
  12:	53                   	push   %ebx
  13:	51                   	push   %ecx
  14:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  1a:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  21:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  28:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  2e:	68 40 08 00 00       	push   $0x840
  33:	6a 01                	push   $0x1
  35:	e8 46 05 00 00       	call   580 <printf>
  memset(data, 'a', sizeof(data));
  3a:	83 c4 0c             	add    $0xc,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 40 01 00 00       	call   190 <memset>

  for(i = 0; i < 4; i++)
  50:	83 c4 10             	add    $0x10,%esp
  53:	bb 00 00 00 00       	mov    $0x0,%ebx
  58:	83 fb 03             	cmp    $0x3,%ebx
  5b:	7f 0e                	jg     6b <main+0x6b>
    if(fork() > 0)
  5d:	e8 c5 03 00 00       	call   427 <fork>
  62:	85 c0                	test   %eax,%eax
  64:	7f 05                	jg     6b <main+0x6b>
  for(i = 0; i < 4; i++)
  66:	83 c3 01             	add    $0x1,%ebx
  69:	eb ed                	jmp    58 <main+0x58>
      break;

  printf(1, "write %d\n", i);
  6b:	83 ec 04             	sub    $0x4,%esp
  6e:	53                   	push   %ebx
  6f:	68 53 08 00 00       	push   $0x853
  74:	6a 01                	push   $0x1
  76:	e8 05 05 00 00       	call   580 <printf>

  path[8] += i;
  7b:	00 5d e6             	add    %bl,-0x1a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  7e:	83 c4 08             	add    $0x8,%esp
  81:	68 02 02 00 00       	push   $0x202
  86:	8d 45 de             	lea    -0x22(%ebp),%eax
  89:	50                   	push   %eax
  8a:	e8 f0 03 00 00       	call   47f <open>
  8f:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++)
  91:	83 c4 10             	add    $0x10,%esp
  94:	bb 00 00 00 00       	mov    $0x0,%ebx
  99:	eb 1b                	jmp    b6 <main+0xb6>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  9b:	83 ec 04             	sub    $0x4,%esp
  9e:	68 00 02 00 00       	push   $0x200
  a3:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  a9:	50                   	push   %eax
  aa:	56                   	push   %esi
  ab:	e8 af 03 00 00       	call   45f <write>
  for(i = 0; i < 20; i++)
  b0:	83 c3 01             	add    $0x1,%ebx
  b3:	83 c4 10             	add    $0x10,%esp
  b6:	83 fb 13             	cmp    $0x13,%ebx
  b9:	7e e0                	jle    9b <main+0x9b>
  close(fd);
  bb:	83 ec 0c             	sub    $0xc,%esp
  be:	56                   	push   %esi
  bf:	e8 a3 03 00 00       	call   467 <close>

  printf(1, "read\n");
  c4:	83 c4 08             	add    $0x8,%esp
  c7:	68 5d 08 00 00       	push   $0x85d
  cc:	6a 01                	push   $0x1
  ce:	e8 ad 04 00 00       	call   580 <printf>

  fd = open(path, O_RDONLY);
  d3:	83 c4 08             	add    $0x8,%esp
  d6:	6a 00                	push   $0x0
  d8:	8d 45 de             	lea    -0x22(%ebp),%eax
  db:	50                   	push   %eax
  dc:	e8 9e 03 00 00       	call   47f <open>
  e1:	89 c6                	mov    %eax,%esi
  for (i = 0; i < 20; i++)
  e3:	83 c4 10             	add    $0x10,%esp
  e6:	bb 00 00 00 00       	mov    $0x0,%ebx
  eb:	eb 1b                	jmp    108 <main+0x108>
    read(fd, data, sizeof(data));
  ed:	83 ec 04             	sub    $0x4,%esp
  f0:	68 00 02 00 00       	push   $0x200
  f5:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  fb:	50                   	push   %eax
  fc:	56                   	push   %esi
  fd:	e8 55 03 00 00       	call   457 <read>
  for (i = 0; i < 20; i++)
 102:	83 c3 01             	add    $0x1,%ebx
 105:	83 c4 10             	add    $0x10,%esp
 108:	83 fb 13             	cmp    $0x13,%ebx
 10b:	7e e0                	jle    ed <main+0xed>
  close(fd);
 10d:	83 ec 0c             	sub    $0xc,%esp
 110:	56                   	push   %esi
 111:	e8 51 03 00 00       	call   467 <close>

  wait();
 116:	e8 24 03 00 00       	call   43f <wait>

  exit();
 11b:	e8 17 03 00 00       	call   437 <exit>

00000120 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 120:	f3 0f 1e fb          	endbr32 
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	56                   	push   %esi
 128:	53                   	push   %ebx
 129:	8b 75 08             	mov    0x8(%ebp),%esi
 12c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 12f:	89 f0                	mov    %esi,%eax
 131:	89 d1                	mov    %edx,%ecx
 133:	83 c2 01             	add    $0x1,%edx
 136:	89 c3                	mov    %eax,%ebx
 138:	83 c0 01             	add    $0x1,%eax
 13b:	0f b6 09             	movzbl (%ecx),%ecx
 13e:	88 0b                	mov    %cl,(%ebx)
 140:	84 c9                	test   %cl,%cl
 142:	75 ed                	jne    131 <strcpy+0x11>
    ;
  return os;
}
 144:	89 f0                	mov    %esi,%eax
 146:	5b                   	pop    %ebx
 147:	5e                   	pop    %esi
 148:	5d                   	pop    %ebp
 149:	c3                   	ret    

0000014a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14a:	f3 0f 1e fb          	endbr32 
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
 151:	8b 4d 08             	mov    0x8(%ebp),%ecx
 154:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 157:	0f b6 01             	movzbl (%ecx),%eax
 15a:	84 c0                	test   %al,%al
 15c:	74 0c                	je     16a <strcmp+0x20>
 15e:	3a 02                	cmp    (%edx),%al
 160:	75 08                	jne    16a <strcmp+0x20>
    p++, q++;
 162:	83 c1 01             	add    $0x1,%ecx
 165:	83 c2 01             	add    $0x1,%edx
 168:	eb ed                	jmp    157 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 16a:	0f b6 c0             	movzbl %al,%eax
 16d:	0f b6 12             	movzbl (%edx),%edx
 170:	29 d0                	sub    %edx,%eax
}
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    

00000174 <strlen>:

uint
strlen(const char *s)
{
 174:	f3 0f 1e fb          	endbr32 
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
 183:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 187:	74 05                	je     18e <strlen+0x1a>
 189:	83 c0 01             	add    $0x1,%eax
 18c:	eb f5                	jmp    183 <strlen+0xf>
    ;
  return n;
}
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret    

00000190 <memset>:

void*
memset(void *dst, int c, uint n)
{
 190:	f3 0f 1e fb          	endbr32 
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 19b:	89 d7                	mov    %edx,%edi
 19d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a3:	fc                   	cld    
 1a4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1a6:	89 d0                	mov    %edx,%eax
 1a8:	5f                   	pop    %edi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret    

000001ab <strchr>:

char*
strchr(const char *s, char c)
{
 1ab:	f3 0f 1e fb          	endbr32 
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 1b5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1b9:	0f b6 10             	movzbl (%eax),%edx
 1bc:	84 d2                	test   %dl,%dl
 1be:	74 09                	je     1c9 <strchr+0x1e>
    if(*s == c)
 1c0:	38 ca                	cmp    %cl,%dl
 1c2:	74 0a                	je     1ce <strchr+0x23>
  for(; *s; s++)
 1c4:	83 c0 01             	add    $0x1,%eax
 1c7:	eb f0                	jmp    1b9 <strchr+0xe>
      return (char*)s;
  return 0;
 1c9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	56                   	push   %esi
 1d9:	53                   	push   %ebx
 1da:	83 ec 1c             	sub    $0x1c,%esp
 1dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1e5:	89 de                	mov    %ebx,%esi
 1e7:	83 c3 01             	add    $0x1,%ebx
 1ea:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ed:	7d 2e                	jge    21d <gets+0x4d>
    cc = read(0, &c, 1);
 1ef:	83 ec 04             	sub    $0x4,%esp
 1f2:	6a 01                	push   $0x1
 1f4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1f7:	50                   	push   %eax
 1f8:	6a 00                	push   $0x0
 1fa:	e8 58 02 00 00       	call   457 <read>
    if(cc < 1)
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	85 c0                	test   %eax,%eax
 204:	7e 17                	jle    21d <gets+0x4d>
      break;
    buf[i++] = c;
 206:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 20a:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 20d:	3c 0a                	cmp    $0xa,%al
 20f:	0f 94 c2             	sete   %dl
 212:	3c 0d                	cmp    $0xd,%al
 214:	0f 94 c0             	sete   %al
 217:	08 c2                	or     %al,%dl
 219:	74 ca                	je     1e5 <gets+0x15>
    buf[i++] = c;
 21b:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 21d:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 221:	89 f8                	mov    %edi,%eax
 223:	8d 65 f4             	lea    -0xc(%ebp),%esp
 226:	5b                   	pop    %ebx
 227:	5e                   	pop    %esi
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    

0000022b <stat>:

int
stat(const char *n, struct stat *st)
{
 22b:	f3 0f 1e fb          	endbr32 
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	56                   	push   %esi
 233:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 234:	83 ec 08             	sub    $0x8,%esp
 237:	6a 00                	push   $0x0
 239:	ff 75 08             	pushl  0x8(%ebp)
 23c:	e8 3e 02 00 00       	call   47f <open>
  if(fd < 0)
 241:	83 c4 10             	add    $0x10,%esp
 244:	85 c0                	test   %eax,%eax
 246:	78 24                	js     26c <stat+0x41>
 248:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 24a:	83 ec 08             	sub    $0x8,%esp
 24d:	ff 75 0c             	pushl  0xc(%ebp)
 250:	50                   	push   %eax
 251:	e8 41 02 00 00       	call   497 <fstat>
 256:	89 c6                	mov    %eax,%esi
  close(fd);
 258:	89 1c 24             	mov    %ebx,(%esp)
 25b:	e8 07 02 00 00       	call   467 <close>
  return r;
 260:	83 c4 10             	add    $0x10,%esp
}
 263:	89 f0                	mov    %esi,%eax
 265:	8d 65 f8             	lea    -0x8(%ebp),%esp
 268:	5b                   	pop    %ebx
 269:	5e                   	pop    %esi
 26a:	5d                   	pop    %ebp
 26b:	c3                   	ret    
    return -1;
 26c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 271:	eb f0                	jmp    263 <stat+0x38>

00000273 <atoi>:

int
atoi(const char *s)
{
 273:	f3 0f 1e fb          	endbr32 
 277:	55                   	push   %ebp
 278:	89 e5                	mov    %esp,%ebp
 27a:	53                   	push   %ebx
 27b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 27e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 283:	0f b6 01             	movzbl (%ecx),%eax
 286:	8d 58 d0             	lea    -0x30(%eax),%ebx
 289:	80 fb 09             	cmp    $0x9,%bl
 28c:	77 12                	ja     2a0 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 28e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 291:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 294:	83 c1 01             	add    $0x1,%ecx
 297:	0f be c0             	movsbl %al,%eax
 29a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 29e:	eb e3                	jmp    283 <atoi+0x10>
  return n;
}
 2a0:	89 d0                	mov    %edx,%eax
 2a2:	5b                   	pop    %ebx
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    

000002a5 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2a5:	f3 0f 1e fb          	endbr32 
 2a9:	55                   	push   %ebp
 2aa:	89 e5                	mov    %esp,%ebp
 2ac:	56                   	push   %esi
 2ad:	53                   	push   %ebx
 2ae:	8b 75 08             	mov    0x8(%ebp),%esi
 2b1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2b4:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2b7:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2b9:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2bc:	85 c0                	test   %eax,%eax
 2be:	7e 0f                	jle    2cf <memmove+0x2a>
    *dst++ = *src++;
 2c0:	0f b6 01             	movzbl (%ecx),%eax
 2c3:	88 02                	mov    %al,(%edx)
 2c5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2c8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2cb:	89 d8                	mov    %ebx,%eax
 2cd:	eb ea                	jmp    2b9 <memmove+0x14>
  return vdst;
}
 2cf:	89 f0                	mov    %esi,%eax
 2d1:	5b                   	pop    %ebx
 2d2:	5e                   	pop    %esi
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    

000002d5 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2d5:	f3 0f 1e fb          	endbr32 
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	53                   	push   %ebx
 2dd:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 2e0:	68 00 20 00 00       	push   $0x2000
 2e5:	e8 c7 04 00 00       	call   7b1 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 2ea:	83 c4 10             	add    $0x10,%esp
 2ed:	89 c2                	mov    %eax,%edx
 2ef:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 2f5:	74 22                	je     319 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 2f7:	b9 00 10 00 00       	mov    $0x1000,%ecx
 2fc:	29 d1                	sub    %edx,%ecx
 2fe:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 300:	ba 00 00 00 00       	mov    $0x0,%edx
 305:	83 fa 3f             	cmp    $0x3f,%edx
 308:	7f 13                	jg     31d <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 30a:	83 3c 95 00 0f 00 00 	cmpl   $0x1,0xf00(,%edx,4)
 311:	01 
 312:	75 09                	jne    31d <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 314:	83 c2 01             	add    $0x1,%edx
 317:	eb ec                	jmp    305 <thread_create+0x30>
  void *user_stack = curr_ptr;
 319:	89 c1                	mov    %eax,%ecx
 31b:	eb e3                	jmp    300 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 31d:	83 3c 95 00 0f 00 00 	cmpl   $0x1,0xf00(,%edx,4)
 324:	01 
 325:	74 34                	je     35b <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 327:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 32a:	c1 e3 02             	shl    $0x2,%ebx
 32d:	89 83 00 0c 00 00    	mov    %eax,0xc00(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 333:	89 8b 04 0c 00 00    	mov    %ecx,0xc04(%ebx)
  cell_full[i] = 1;
 339:	c7 04 95 00 0f 00 00 	movl   $0x1,0xf00(,%edx,4)
 340:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 344:	ff 75 10             	pushl  0x10(%ebp)
 347:	ff 75 0c             	pushl  0xc(%ebp)
 34a:	ff 75 08             	pushl  0x8(%ebp)
 34d:	51                   	push   %ecx
 34e:	e8 dc 00 00 00       	call   42f <clone>
 353:	83 c4 10             	add    $0x10,%esp
}
 356:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 359:	c9                   	leave  
 35a:	c3                   	ret    
    return -1;
 35b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 360:	eb f4                	jmp    356 <thread_create+0x81>

00000362 <thread_join>:

int thread_join(){
 362:	f3 0f 1e fb          	endbr32 
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	56                   	push   %esi
 36a:	53                   	push   %ebx
 36b:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 36e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 371:	50                   	push   %eax
 372:	e8 d0 00 00 00       	call   447 <join>
 377:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 379:	83 c4 10             	add    $0x10,%esp
 37c:	bb 00 00 00 00       	mov    $0x0,%ebx
 381:	83 fb 3f             	cmp    $0x3f,%ebx
 384:	7f 14                	jg     39a <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 386:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 389:	8b 55 f4             	mov    -0xc(%ebp),%edx
 38c:	39 14 85 04 0c 00 00 	cmp    %edx,0xc04(,%eax,4)
 393:	74 05                	je     39a <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 395:	83 c3 01             	add    $0x1,%ebx
 398:	eb e7                	jmp    381 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 39a:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 39d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3a0:	39 0c 85 04 0c 00 00 	cmp    %ecx,0xc04(,%eax,4)
 3a7:	75 26                	jne    3cf <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 3a9:	83 ec 0c             	sub    $0xc,%esp
 3ac:	ff 34 85 00 0c 00 00 	pushl  0xc00(,%eax,4)
 3b3:	e8 35 03 00 00       	call   6ed <free>
  cell_full[i] = 0;
 3b8:	c7 04 9d 00 0f 00 00 	movl   $0x0,0xf00(,%ebx,4)
 3bf:	00 00 00 00 

  return out;
 3c3:	83 c4 10             	add    $0x10,%esp
}
 3c6:	89 f0                	mov    %esi,%eax
 3c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3cb:	5b                   	pop    %ebx
 3cc:	5e                   	pop    %esi
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 3cf:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3d4:	eb f0                	jmp    3c6 <thread_join+0x64>

000003d6 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 3d6:	f3 0f 1e fb          	endbr32 
 3da:	55                   	push   %ebp
 3db:	89 e5                	mov    %esp,%ebp
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3e6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <lock_acquire>:

void lock_acquire(lock_t *lock) {
 3ef:	f3 0f 1e fb          	endbr32 
 3f3:	55                   	push   %ebp
 3f4:	89 e5                	mov    %esp,%ebp
 3f6:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 3f9:	b9 01 00 00 00       	mov    $0x1,%ecx
 3fe:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 402:	b8 00 00 00 00       	mov    $0x0,%eax
 407:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 40c:	39 c1                	cmp    %eax,%ecx
 40e:	75 f2                	jne    402 <lock_acquire+0x13>
      ; // spin
    }
}
 410:	5d                   	pop    %ebp
 411:	c3                   	ret    

00000412 <lock_release>:

void lock_release(lock_t *lock) {
 412:	f3 0f 1e fb          	endbr32 
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 41c:	8b 42 04             	mov    0x4(%edx),%eax
 41f:	83 c0 01             	add    $0x1,%eax
 422:	89 42 04             	mov    %eax,0x4(%edx)
}
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    

00000427 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 427:	b8 01 00 00 00       	mov    $0x1,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <clone>:
SYSCALL(clone)
 42f:	b8 16 00 00 00       	mov    $0x16,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <exit>:
SYSCALL(exit)
 437:	b8 02 00 00 00       	mov    $0x2,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <wait>:
SYSCALL(wait)
 43f:	b8 03 00 00 00       	mov    $0x3,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <join>:
SYSCALL(join)
 447:	b8 17 00 00 00       	mov    $0x17,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <pipe>:
SYSCALL(pipe)
 44f:	b8 04 00 00 00       	mov    $0x4,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <read>:
SYSCALL(read)
 457:	b8 05 00 00 00       	mov    $0x5,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <write>:
SYSCALL(write)
 45f:	b8 10 00 00 00       	mov    $0x10,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <close>:
SYSCALL(close)
 467:	b8 15 00 00 00       	mov    $0x15,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <kill>:
SYSCALL(kill)
 46f:	b8 06 00 00 00       	mov    $0x6,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <exec>:
SYSCALL(exec)
 477:	b8 07 00 00 00       	mov    $0x7,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <open>:
SYSCALL(open)
 47f:	b8 0f 00 00 00       	mov    $0xf,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <mknod>:
SYSCALL(mknod)
 487:	b8 11 00 00 00       	mov    $0x11,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <unlink>:
SYSCALL(unlink)
 48f:	b8 12 00 00 00       	mov    $0x12,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <fstat>:
SYSCALL(fstat)
 497:	b8 08 00 00 00       	mov    $0x8,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <link>:
SYSCALL(link)
 49f:	b8 13 00 00 00       	mov    $0x13,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <mkdir>:
SYSCALL(mkdir)
 4a7:	b8 14 00 00 00       	mov    $0x14,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <chdir>:
SYSCALL(chdir)
 4af:	b8 09 00 00 00       	mov    $0x9,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <dup>:
SYSCALL(dup)
 4b7:	b8 0a 00 00 00       	mov    $0xa,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <getpid>:
SYSCALL(getpid)
 4bf:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <sbrk>:
SYSCALL(sbrk)
 4c7:	b8 0c 00 00 00       	mov    $0xc,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <sleep>:
SYSCALL(sleep)
 4cf:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <uptime>:
SYSCALL(uptime)
 4d7:	b8 0e 00 00 00       	mov    $0xe,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4df:	55                   	push   %ebp
 4e0:	89 e5                	mov    %esp,%ebp
 4e2:	83 ec 1c             	sub    $0x1c,%esp
 4e5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4e8:	6a 01                	push   $0x1
 4ea:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4ed:	52                   	push   %edx
 4ee:	50                   	push   %eax
 4ef:	e8 6b ff ff ff       	call   45f <write>
}
 4f4:	83 c4 10             	add    $0x10,%esp
 4f7:	c9                   	leave  
 4f8:	c3                   	ret    

000004f9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f9:	55                   	push   %ebp
 4fa:	89 e5                	mov    %esp,%ebp
 4fc:	57                   	push   %edi
 4fd:	56                   	push   %esi
 4fe:	53                   	push   %ebx
 4ff:	83 ec 2c             	sub    $0x2c,%esp
 502:	89 45 d0             	mov    %eax,-0x30(%ebp)
 505:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 507:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 50b:	0f 95 c2             	setne  %dl
 50e:	89 f0                	mov    %esi,%eax
 510:	c1 e8 1f             	shr    $0x1f,%eax
 513:	84 c2                	test   %al,%dl
 515:	74 42                	je     559 <printint+0x60>
    neg = 1;
    x = -xx;
 517:	f7 de                	neg    %esi
    neg = 1;
 519:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 520:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 525:	89 f0                	mov    %esi,%eax
 527:	ba 00 00 00 00       	mov    $0x0,%edx
 52c:	f7 f1                	div    %ecx
 52e:	89 df                	mov    %ebx,%edi
 530:	83 c3 01             	add    $0x1,%ebx
 533:	0f b6 92 6c 08 00 00 	movzbl 0x86c(%edx),%edx
 53a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 53e:	89 f2                	mov    %esi,%edx
 540:	89 c6                	mov    %eax,%esi
 542:	39 d1                	cmp    %edx,%ecx
 544:	76 df                	jbe    525 <printint+0x2c>
  if(neg)
 546:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 54a:	74 2f                	je     57b <printint+0x82>
    buf[i++] = '-';
 54c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 551:	8d 5f 02             	lea    0x2(%edi),%ebx
 554:	8b 75 d0             	mov    -0x30(%ebp),%esi
 557:	eb 15                	jmp    56e <printint+0x75>
  neg = 0;
 559:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 560:	eb be                	jmp    520 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 562:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 567:	89 f0                	mov    %esi,%eax
 569:	e8 71 ff ff ff       	call   4df <putc>
  while(--i >= 0)
 56e:	83 eb 01             	sub    $0x1,%ebx
 571:	79 ef                	jns    562 <printint+0x69>
}
 573:	83 c4 2c             	add    $0x2c,%esp
 576:	5b                   	pop    %ebx
 577:	5e                   	pop    %esi
 578:	5f                   	pop    %edi
 579:	5d                   	pop    %ebp
 57a:	c3                   	ret    
 57b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 57e:	eb ee                	jmp    56e <printint+0x75>

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	57                   	push   %edi
 588:	56                   	push   %esi
 589:	53                   	push   %ebx
 58a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 58d:	8d 45 10             	lea    0x10(%ebp),%eax
 590:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 593:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 598:	bb 00 00 00 00       	mov    $0x0,%ebx
 59d:	eb 14                	jmp    5b3 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 59f:	89 fa                	mov    %edi,%edx
 5a1:	8b 45 08             	mov    0x8(%ebp),%eax
 5a4:	e8 36 ff ff ff       	call   4df <putc>
 5a9:	eb 05                	jmp    5b0 <printf+0x30>
      }
    } else if(state == '%'){
 5ab:	83 fe 25             	cmp    $0x25,%esi
 5ae:	74 25                	je     5d5 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 5b0:	83 c3 01             	add    $0x1,%ebx
 5b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b6:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5ba:	84 c0                	test   %al,%al
 5bc:	0f 84 23 01 00 00    	je     6e5 <printf+0x165>
    c = fmt[i] & 0xff;
 5c2:	0f be f8             	movsbl %al,%edi
 5c5:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5c8:	85 f6                	test   %esi,%esi
 5ca:	75 df                	jne    5ab <printf+0x2b>
      if(c == '%'){
 5cc:	83 f8 25             	cmp    $0x25,%eax
 5cf:	75 ce                	jne    59f <printf+0x1f>
        state = '%';
 5d1:	89 c6                	mov    %eax,%esi
 5d3:	eb db                	jmp    5b0 <printf+0x30>
      if(c == 'd'){
 5d5:	83 f8 64             	cmp    $0x64,%eax
 5d8:	74 49                	je     623 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5da:	83 f8 78             	cmp    $0x78,%eax
 5dd:	0f 94 c1             	sete   %cl
 5e0:	83 f8 70             	cmp    $0x70,%eax
 5e3:	0f 94 c2             	sete   %dl
 5e6:	08 d1                	or     %dl,%cl
 5e8:	75 63                	jne    64d <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5ea:	83 f8 73             	cmp    $0x73,%eax
 5ed:	0f 84 84 00 00 00    	je     677 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5f3:	83 f8 63             	cmp    $0x63,%eax
 5f6:	0f 84 b7 00 00 00    	je     6b3 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5fc:	83 f8 25             	cmp    $0x25,%eax
 5ff:	0f 84 cc 00 00 00    	je     6d1 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 605:	ba 25 00 00 00       	mov    $0x25,%edx
 60a:	8b 45 08             	mov    0x8(%ebp),%eax
 60d:	e8 cd fe ff ff       	call   4df <putc>
        putc(fd, c);
 612:	89 fa                	mov    %edi,%edx
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	e8 c3 fe ff ff       	call   4df <putc>
      }
      state = 0;
 61c:	be 00 00 00 00       	mov    $0x0,%esi
 621:	eb 8d                	jmp    5b0 <printf+0x30>
        printint(fd, *ap, 10, 1);
 623:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 626:	8b 17                	mov    (%edi),%edx
 628:	83 ec 0c             	sub    $0xc,%esp
 62b:	6a 01                	push   $0x1
 62d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 632:	8b 45 08             	mov    0x8(%ebp),%eax
 635:	e8 bf fe ff ff       	call   4f9 <printint>
        ap++;
 63a:	83 c7 04             	add    $0x4,%edi
 63d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 640:	83 c4 10             	add    $0x10,%esp
      state = 0;
 643:	be 00 00 00 00       	mov    $0x0,%esi
 648:	e9 63 ff ff ff       	jmp    5b0 <printf+0x30>
        printint(fd, *ap, 16, 0);
 64d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 650:	8b 17                	mov    (%edi),%edx
 652:	83 ec 0c             	sub    $0xc,%esp
 655:	6a 00                	push   $0x0
 657:	b9 10 00 00 00       	mov    $0x10,%ecx
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	e8 95 fe ff ff       	call   4f9 <printint>
        ap++;
 664:	83 c7 04             	add    $0x4,%edi
 667:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 66a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 66d:	be 00 00 00 00       	mov    $0x0,%esi
 672:	e9 39 ff ff ff       	jmp    5b0 <printf+0x30>
        s = (char*)*ap;
 677:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67a:	8b 30                	mov    (%eax),%esi
        ap++;
 67c:	83 c0 04             	add    $0x4,%eax
 67f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 682:	85 f6                	test   %esi,%esi
 684:	75 28                	jne    6ae <printf+0x12e>
          s = "(null)";
 686:	be 63 08 00 00       	mov    $0x863,%esi
 68b:	8b 7d 08             	mov    0x8(%ebp),%edi
 68e:	eb 0d                	jmp    69d <printf+0x11d>
          putc(fd, *s);
 690:	0f be d2             	movsbl %dl,%edx
 693:	89 f8                	mov    %edi,%eax
 695:	e8 45 fe ff ff       	call   4df <putc>
          s++;
 69a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 69d:	0f b6 16             	movzbl (%esi),%edx
 6a0:	84 d2                	test   %dl,%dl
 6a2:	75 ec                	jne    690 <printf+0x110>
      state = 0;
 6a4:	be 00 00 00 00       	mov    $0x0,%esi
 6a9:	e9 02 ff ff ff       	jmp    5b0 <printf+0x30>
 6ae:	8b 7d 08             	mov    0x8(%ebp),%edi
 6b1:	eb ea                	jmp    69d <printf+0x11d>
        putc(fd, *ap);
 6b3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6b6:	0f be 17             	movsbl (%edi),%edx
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
 6bc:	e8 1e fe ff ff       	call   4df <putc>
        ap++;
 6c1:	83 c7 04             	add    $0x4,%edi
 6c4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6c7:	be 00 00 00 00       	mov    $0x0,%esi
 6cc:	e9 df fe ff ff       	jmp    5b0 <printf+0x30>
        putc(fd, c);
 6d1:	89 fa                	mov    %edi,%edx
 6d3:	8b 45 08             	mov    0x8(%ebp),%eax
 6d6:	e8 04 fe ff ff       	call   4df <putc>
      state = 0;
 6db:	be 00 00 00 00       	mov    $0x0,%esi
 6e0:	e9 cb fe ff ff       	jmp    5b0 <printf+0x30>
    }
  }
}
 6e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6e8:	5b                   	pop    %ebx
 6e9:	5e                   	pop    %esi
 6ea:	5f                   	pop    %edi
 6eb:	5d                   	pop    %ebp
 6ec:	c3                   	ret    

000006ed <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ed:	f3 0f 1e fb          	endbr32 
 6f1:	55                   	push   %ebp
 6f2:	89 e5                	mov    %esp,%ebp
 6f4:	57                   	push   %edi
 6f5:	56                   	push   %esi
 6f6:	53                   	push   %ebx
 6f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6fa:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fd:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 702:	eb 02                	jmp    706 <free+0x19>
 704:	89 d0                	mov    %edx,%eax
 706:	39 c8                	cmp    %ecx,%eax
 708:	73 04                	jae    70e <free+0x21>
 70a:	39 08                	cmp    %ecx,(%eax)
 70c:	77 12                	ja     720 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 70e:	8b 10                	mov    (%eax),%edx
 710:	39 c2                	cmp    %eax,%edx
 712:	77 f0                	ja     704 <free+0x17>
 714:	39 c8                	cmp    %ecx,%eax
 716:	72 08                	jb     720 <free+0x33>
 718:	39 ca                	cmp    %ecx,%edx
 71a:	77 04                	ja     720 <free+0x33>
 71c:	89 d0                	mov    %edx,%eax
 71e:	eb e6                	jmp    706 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 720:	8b 73 fc             	mov    -0x4(%ebx),%esi
 723:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 726:	8b 10                	mov    (%eax),%edx
 728:	39 d7                	cmp    %edx,%edi
 72a:	74 19                	je     745 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 72c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 72f:	8b 50 04             	mov    0x4(%eax),%edx
 732:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 735:	39 ce                	cmp    %ecx,%esi
 737:	74 1b                	je     754 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 739:	89 08                	mov    %ecx,(%eax)
  freep = p;
 73b:	a3 e0 0b 00 00       	mov    %eax,0xbe0
}
 740:	5b                   	pop    %ebx
 741:	5e                   	pop    %esi
 742:	5f                   	pop    %edi
 743:	5d                   	pop    %ebp
 744:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 745:	03 72 04             	add    0x4(%edx),%esi
 748:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 74b:	8b 10                	mov    (%eax),%edx
 74d:	8b 12                	mov    (%edx),%edx
 74f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 752:	eb db                	jmp    72f <free+0x42>
    p->s.size += bp->s.size;
 754:	03 53 fc             	add    -0x4(%ebx),%edx
 757:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 75a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 75d:	89 10                	mov    %edx,(%eax)
 75f:	eb da                	jmp    73b <free+0x4e>

00000761 <morecore>:

static Header*
morecore(uint nu)
{
 761:	55                   	push   %ebp
 762:	89 e5                	mov    %esp,%ebp
 764:	53                   	push   %ebx
 765:	83 ec 04             	sub    $0x4,%esp
 768:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 76a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 76f:	77 05                	ja     776 <morecore+0x15>
    nu = 4096;
 771:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 776:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 77d:	83 ec 0c             	sub    $0xc,%esp
 780:	50                   	push   %eax
 781:	e8 41 fd ff ff       	call   4c7 <sbrk>
  if(p == (char*)-1)
 786:	83 c4 10             	add    $0x10,%esp
 789:	83 f8 ff             	cmp    $0xffffffff,%eax
 78c:	74 1c                	je     7aa <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 78e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 791:	83 c0 08             	add    $0x8,%eax
 794:	83 ec 0c             	sub    $0xc,%esp
 797:	50                   	push   %eax
 798:	e8 50 ff ff ff       	call   6ed <free>
  return freep;
 79d:	a1 e0 0b 00 00       	mov    0xbe0,%eax
 7a2:	83 c4 10             	add    $0x10,%esp
}
 7a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7a8:	c9                   	leave  
 7a9:	c3                   	ret    
    return 0;
 7aa:	b8 00 00 00 00       	mov    $0x0,%eax
 7af:	eb f4                	jmp    7a5 <morecore+0x44>

000007b1 <malloc>:

void*
malloc(uint nbytes)
{
 7b1:	f3 0f 1e fb          	endbr32 
 7b5:	55                   	push   %ebp
 7b6:	89 e5                	mov    %esp,%ebp
 7b8:	53                   	push   %ebx
 7b9:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7bc:	8b 45 08             	mov    0x8(%ebp),%eax
 7bf:	8d 58 07             	lea    0x7(%eax),%ebx
 7c2:	c1 eb 03             	shr    $0x3,%ebx
 7c5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7c8:	8b 0d e0 0b 00 00    	mov    0xbe0,%ecx
 7ce:	85 c9                	test   %ecx,%ecx
 7d0:	74 04                	je     7d6 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	8b 01                	mov    (%ecx),%eax
 7d4:	eb 4b                	jmp    821 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 7d6:	c7 05 e0 0b 00 00 e4 	movl   $0xbe4,0xbe0
 7dd:	0b 00 00 
 7e0:	c7 05 e4 0b 00 00 e4 	movl   $0xbe4,0xbe4
 7e7:	0b 00 00 
    base.s.size = 0;
 7ea:	c7 05 e8 0b 00 00 00 	movl   $0x0,0xbe8
 7f1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7f4:	b9 e4 0b 00 00       	mov    $0xbe4,%ecx
 7f9:	eb d7                	jmp    7d2 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7fb:	74 1a                	je     817 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7fd:	29 da                	sub    %ebx,%edx
 7ff:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 802:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 805:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 808:	89 0d e0 0b 00 00    	mov    %ecx,0xbe0
      return (void*)(p + 1);
 80e:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 811:	83 c4 04             	add    $0x4,%esp
 814:	5b                   	pop    %ebx
 815:	5d                   	pop    %ebp
 816:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 817:	8b 10                	mov    (%eax),%edx
 819:	89 11                	mov    %edx,(%ecx)
 81b:	eb eb                	jmp    808 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81d:	89 c1                	mov    %eax,%ecx
 81f:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 821:	8b 50 04             	mov    0x4(%eax),%edx
 824:	39 da                	cmp    %ebx,%edx
 826:	73 d3                	jae    7fb <malloc+0x4a>
    if(p == freep)
 828:	39 05 e0 0b 00 00    	cmp    %eax,0xbe0
 82e:	75 ed                	jne    81d <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 830:	89 d8                	mov    %ebx,%eax
 832:	e8 2a ff ff ff       	call   761 <morecore>
 837:	85 c0                	test   %eax,%eax
 839:	75 e2                	jne    81d <malloc+0x6c>
 83b:	eb d4                	jmp    811 <malloc+0x60>
