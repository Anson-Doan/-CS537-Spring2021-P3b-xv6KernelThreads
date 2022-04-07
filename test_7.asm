
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   exit(); \
}

int
main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	51                   	push   %ecx
  12:	83 ec 14             	sub    $0x14,%esp
   ppid = getpid();
  15:	e8 c4 04 00 00       	call   4de <getpid>
  1a:	a3 4c 0c 00 00       	mov    %eax,0xc4c

   int fork_pid = fork();
  1f:	e8 22 04 00 00       	call   446 <fork>
   if(fork_pid == 0) {
  24:	85 c0                	test   %eax,%eax
  26:	74 63                	je     8b <main+0x8b>
     exit();
   }
   assert(fork_pid > 0);
  28:	7e 66                	jle    90 <main+0x90>

   void *join_stack;
   int join_pid = join(&join_stack);
  2a:	83 ec 0c             	sub    $0xc,%esp
  2d:	8d 45 f4             	lea    -0xc(%ebp),%eax
  30:	50                   	push   %eax
  31:	e8 30 04 00 00       	call   466 <join>
   assert(join_pid == -1);
  36:	83 c4 10             	add    $0x10,%esp
  39:	83 f8 ff             	cmp    $0xffffffff,%eax
  3c:	0f 84 97 00 00 00    	je     d9 <main+0xd9>
  42:	6a 22                	push   $0x22
  44:	68 5c 08 00 00       	push   $0x85c
  49:	68 65 08 00 00       	push   $0x865
  4e:	6a 01                	push   $0x1
  50:	e8 4a 05 00 00       	call   59f <printf>
  55:	83 c4 0c             	add    $0xc,%esp
  58:	68 9b 08 00 00       	push   $0x89b
  5d:	68 7a 08 00 00       	push   $0x87a
  62:	6a 01                	push   $0x1
  64:	e8 36 05 00 00       	call   59f <printf>
  69:	83 c4 08             	add    $0x8,%esp
  6c:	68 8e 08 00 00       	push   $0x88e
  71:	6a 01                	push   $0x1
  73:	e8 27 05 00 00       	call   59f <printf>
  78:	83 c4 04             	add    $0x4,%esp
  7b:	ff 35 4c 0c 00 00    	pushl  0xc4c
  81:	e8 08 04 00 00       	call   48e <kill>
  86:	e8 cb 03 00 00       	call   456 <exit>
     exit();
  8b:	e8 c6 03 00 00       	call   456 <exit>
   assert(fork_pid > 0);
  90:	6a 1e                	push   $0x1e
  92:	68 5c 08 00 00       	push   $0x85c
  97:	68 65 08 00 00       	push   $0x865
  9c:	6a 01                	push   $0x1
  9e:	e8 fc 04 00 00       	call   59f <printf>
  a3:	83 c4 0c             	add    $0xc,%esp
  a6:	68 6d 08 00 00       	push   $0x86d
  ab:	68 7a 08 00 00       	push   $0x87a
  b0:	6a 01                	push   $0x1
  b2:	e8 e8 04 00 00       	call   59f <printf>
  b7:	83 c4 08             	add    $0x8,%esp
  ba:	68 8e 08 00 00       	push   $0x88e
  bf:	6a 01                	push   $0x1
  c1:	e8 d9 04 00 00       	call   59f <printf>
  c6:	83 c4 04             	add    $0x4,%esp
  c9:	ff 35 4c 0c 00 00    	pushl  0xc4c
  cf:	e8 ba 03 00 00       	call   48e <kill>
  d4:	e8 7d 03 00 00       	call   456 <exit>

   assert(wait() > 0);
  d9:	e8 80 03 00 00       	call   45e <wait>
  de:	85 c0                	test   %eax,%eax
  e0:	7e 14                	jle    f6 <main+0xf6>
   printf(1, "TEST PASSED\n");
  e2:	83 ec 08             	sub    $0x8,%esp
  e5:	68 b5 08 00 00       	push   $0x8b5
  ea:	6a 01                	push   $0x1
  ec:	e8 ae 04 00 00       	call   59f <printf>
   exit();
  f1:	e8 60 03 00 00       	call   456 <exit>
   assert(wait() > 0);
  f6:	6a 24                	push   $0x24
  f8:	68 5c 08 00 00       	push   $0x85c
  fd:	68 65 08 00 00       	push   $0x865
 102:	6a 01                	push   $0x1
 104:	e8 96 04 00 00       	call   59f <printf>
 109:	83 c4 0c             	add    $0xc,%esp
 10c:	68 aa 08 00 00       	push   $0x8aa
 111:	68 7a 08 00 00       	push   $0x87a
 116:	6a 01                	push   $0x1
 118:	e8 82 04 00 00       	call   59f <printf>
 11d:	83 c4 08             	add    $0x8,%esp
 120:	68 8e 08 00 00       	push   $0x88e
 125:	6a 01                	push   $0x1
 127:	e8 73 04 00 00       	call   59f <printf>
 12c:	83 c4 04             	add    $0x4,%esp
 12f:	ff 35 4c 0c 00 00    	pushl  0xc4c
 135:	e8 54 03 00 00       	call   48e <kill>
 13a:	e8 17 03 00 00       	call   456 <exit>

0000013f <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 13f:	f3 0f 1e fb          	endbr32 
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
 146:	56                   	push   %esi
 147:	53                   	push   %ebx
 148:	8b 75 08             	mov    0x8(%ebp),%esi
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 14e:	89 f0                	mov    %esi,%eax
 150:	89 d1                	mov    %edx,%ecx
 152:	83 c2 01             	add    $0x1,%edx
 155:	89 c3                	mov    %eax,%ebx
 157:	83 c0 01             	add    $0x1,%eax
 15a:	0f b6 09             	movzbl (%ecx),%ecx
 15d:	88 0b                	mov    %cl,(%ebx)
 15f:	84 c9                	test   %cl,%cl
 161:	75 ed                	jne    150 <strcpy+0x11>
    ;
  return os;
}
 163:	89 f0                	mov    %esi,%eax
 165:	5b                   	pop    %ebx
 166:	5e                   	pop    %esi
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    

00000169 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 169:	f3 0f 1e fb          	endbr32 
 16d:	55                   	push   %ebp
 16e:	89 e5                	mov    %esp,%ebp
 170:	8b 4d 08             	mov    0x8(%ebp),%ecx
 173:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 176:	0f b6 01             	movzbl (%ecx),%eax
 179:	84 c0                	test   %al,%al
 17b:	74 0c                	je     189 <strcmp+0x20>
 17d:	3a 02                	cmp    (%edx),%al
 17f:	75 08                	jne    189 <strcmp+0x20>
    p++, q++;
 181:	83 c1 01             	add    $0x1,%ecx
 184:	83 c2 01             	add    $0x1,%edx
 187:	eb ed                	jmp    176 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 189:	0f b6 c0             	movzbl %al,%eax
 18c:	0f b6 12             	movzbl (%edx),%edx
 18f:	29 d0                	sub    %edx,%eax
}
 191:	5d                   	pop    %ebp
 192:	c3                   	ret    

00000193 <strlen>:

uint
strlen(const char *s)
{
 193:	f3 0f 1e fb          	endbr32 
 197:	55                   	push   %ebp
 198:	89 e5                	mov    %esp,%ebp
 19a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 19d:	b8 00 00 00 00       	mov    $0x0,%eax
 1a2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1a6:	74 05                	je     1ad <strlen+0x1a>
 1a8:	83 c0 01             	add    $0x1,%eax
 1ab:	eb f5                	jmp    1a2 <strlen+0xf>
    ;
  return n;
}
 1ad:	5d                   	pop    %ebp
 1ae:	c3                   	ret    

000001af <memset>:

void*
memset(void *dst, int c, uint n)
{
 1af:	f3 0f 1e fb          	endbr32 
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	57                   	push   %edi
 1b7:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1ba:	89 d7                	mov    %edx,%edi
 1bc:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c2:	fc                   	cld    
 1c3:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	5f                   	pop    %edi
 1c8:	5d                   	pop    %ebp
 1c9:	c3                   	ret    

000001ca <strchr>:

char*
strchr(const char *s, char c)
{
 1ca:	f3 0f 1e fb          	endbr32 
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1d8:	0f b6 10             	movzbl (%eax),%edx
 1db:	84 d2                	test   %dl,%dl
 1dd:	74 09                	je     1e8 <strchr+0x1e>
    if(*s == c)
 1df:	38 ca                	cmp    %cl,%dl
 1e1:	74 0a                	je     1ed <strchr+0x23>
  for(; *s; s++)
 1e3:	83 c0 01             	add    $0x1,%eax
 1e6:	eb f0                	jmp    1d8 <strchr+0xe>
      return (char*)s;
  return 0;
 1e8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    

000001ef <gets>:

char*
gets(char *buf, int max)
{
 1ef:	f3 0f 1e fb          	endbr32 
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	57                   	push   %edi
 1f7:	56                   	push   %esi
 1f8:	53                   	push   %ebx
 1f9:	83 ec 1c             	sub    $0x1c,%esp
 1fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ff:	bb 00 00 00 00       	mov    $0x0,%ebx
 204:	89 de                	mov    %ebx,%esi
 206:	83 c3 01             	add    $0x1,%ebx
 209:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20c:	7d 2e                	jge    23c <gets+0x4d>
    cc = read(0, &c, 1);
 20e:	83 ec 04             	sub    $0x4,%esp
 211:	6a 01                	push   $0x1
 213:	8d 45 e7             	lea    -0x19(%ebp),%eax
 216:	50                   	push   %eax
 217:	6a 00                	push   $0x0
 219:	e8 58 02 00 00       	call   476 <read>
    if(cc < 1)
 21e:	83 c4 10             	add    $0x10,%esp
 221:	85 c0                	test   %eax,%eax
 223:	7e 17                	jle    23c <gets+0x4d>
      break;
    buf[i++] = c;
 225:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 229:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 22c:	3c 0a                	cmp    $0xa,%al
 22e:	0f 94 c2             	sete   %dl
 231:	3c 0d                	cmp    $0xd,%al
 233:	0f 94 c0             	sete   %al
 236:	08 c2                	or     %al,%dl
 238:	74 ca                	je     204 <gets+0x15>
    buf[i++] = c;
 23a:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 23c:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 240:	89 f8                	mov    %edi,%eax
 242:	8d 65 f4             	lea    -0xc(%ebp),%esp
 245:	5b                   	pop    %ebx
 246:	5e                   	pop    %esi
 247:	5f                   	pop    %edi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <stat>:

int
stat(const char *n, struct stat *st)
{
 24a:	f3 0f 1e fb          	endbr32 
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
 251:	56                   	push   %esi
 252:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 253:	83 ec 08             	sub    $0x8,%esp
 256:	6a 00                	push   $0x0
 258:	ff 75 08             	pushl  0x8(%ebp)
 25b:	e8 3e 02 00 00       	call   49e <open>
  if(fd < 0)
 260:	83 c4 10             	add    $0x10,%esp
 263:	85 c0                	test   %eax,%eax
 265:	78 24                	js     28b <stat+0x41>
 267:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	ff 75 0c             	pushl  0xc(%ebp)
 26f:	50                   	push   %eax
 270:	e8 41 02 00 00       	call   4b6 <fstat>
 275:	89 c6                	mov    %eax,%esi
  close(fd);
 277:	89 1c 24             	mov    %ebx,(%esp)
 27a:	e8 07 02 00 00       	call   486 <close>
  return r;
 27f:	83 c4 10             	add    $0x10,%esp
}
 282:	89 f0                	mov    %esi,%eax
 284:	8d 65 f8             	lea    -0x8(%ebp),%esp
 287:	5b                   	pop    %ebx
 288:	5e                   	pop    %esi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret    
    return -1;
 28b:	be ff ff ff ff       	mov    $0xffffffff,%esi
 290:	eb f0                	jmp    282 <stat+0x38>

00000292 <atoi>:

int
atoi(const char *s)
{
 292:	f3 0f 1e fb          	endbr32 
 296:	55                   	push   %ebp
 297:	89 e5                	mov    %esp,%ebp
 299:	53                   	push   %ebx
 29a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 29d:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2a2:	0f b6 01             	movzbl (%ecx),%eax
 2a5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2a8:	80 fb 09             	cmp    $0x9,%bl
 2ab:	77 12                	ja     2bf <atoi+0x2d>
    n = n*10 + *s++ - '0';
 2ad:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2b0:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2b3:	83 c1 01             	add    $0x1,%ecx
 2b6:	0f be c0             	movsbl %al,%eax
 2b9:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 2bd:	eb e3                	jmp    2a2 <atoi+0x10>
  return n;
}
 2bf:	89 d0                	mov    %edx,%eax
 2c1:	5b                   	pop    %ebx
 2c2:	5d                   	pop    %ebp
 2c3:	c3                   	ret    

000002c4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2c4:	f3 0f 1e fb          	endbr32 
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	8b 75 08             	mov    0x8(%ebp),%esi
 2d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2d3:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2d6:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2d8:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2db:	85 c0                	test   %eax,%eax
 2dd:	7e 0f                	jle    2ee <memmove+0x2a>
    *dst++ = *src++;
 2df:	0f b6 01             	movzbl (%ecx),%eax
 2e2:	88 02                	mov    %al,(%edx)
 2e4:	8d 49 01             	lea    0x1(%ecx),%ecx
 2e7:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2ea:	89 d8                	mov    %ebx,%eax
 2ec:	eb ea                	jmp    2d8 <memmove+0x14>
  return vdst;
}
 2ee:	89 f0                	mov    %esi,%eax
 2f0:	5b                   	pop    %ebx
 2f1:	5e                   	pop    %esi
 2f2:	5d                   	pop    %ebp
 2f3:	c3                   	ret    

000002f4 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2f4:	f3 0f 1e fb          	endbr32 
 2f8:	55                   	push   %ebp
 2f9:	89 e5                	mov    %esp,%ebp
 2fb:	53                   	push   %ebx
 2fc:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 2ff:	68 00 20 00 00       	push   $0x2000
 304:	e8 c7 04 00 00       	call   7d0 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 309:	83 c4 10             	add    $0x10,%esp
 30c:	89 c2                	mov    %eax,%edx
 30e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 314:	74 22                	je     338 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 316:	b9 00 10 00 00       	mov    $0x1000,%ecx
 31b:	29 d1                	sub    %edx,%ecx
 31d:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 31f:	ba 00 00 00 00       	mov    $0x0,%edx
 324:	83 fa 3f             	cmp    $0x3f,%edx
 327:	7f 13                	jg     33c <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 329:	83 3c 95 60 0f 00 00 	cmpl   $0x1,0xf60(,%edx,4)
 330:	01 
 331:	75 09                	jne    33c <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 333:	83 c2 01             	add    $0x1,%edx
 336:	eb ec                	jmp    324 <thread_create+0x30>
  void *user_stack = curr_ptr;
 338:	89 c1                	mov    %eax,%ecx
 33a:	eb e3                	jmp    31f <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 33c:	83 3c 95 60 0f 00 00 	cmpl   $0x1,0xf60(,%edx,4)
 343:	01 
 344:	74 34                	je     37a <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 346:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 349:	c1 e3 02             	shl    $0x2,%ebx
 34c:	89 83 60 0c 00 00    	mov    %eax,0xc60(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 352:	89 8b 64 0c 00 00    	mov    %ecx,0xc64(%ebx)
  cell_full[i] = 1;
 358:	c7 04 95 60 0f 00 00 	movl   $0x1,0xf60(,%edx,4)
 35f:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 363:	ff 75 10             	pushl  0x10(%ebp)
 366:	ff 75 0c             	pushl  0xc(%ebp)
 369:	ff 75 08             	pushl  0x8(%ebp)
 36c:	51                   	push   %ecx
 36d:	e8 dc 00 00 00       	call   44e <clone>
 372:	83 c4 10             	add    $0x10,%esp
}
 375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 378:	c9                   	leave  
 379:	c3                   	ret    
    return -1;
 37a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 37f:	eb f4                	jmp    375 <thread_create+0x81>

00000381 <thread_join>:

int thread_join(){
 381:	f3 0f 1e fb          	endbr32 
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	56                   	push   %esi
 389:	53                   	push   %ebx
 38a:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 38d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 390:	50                   	push   %eax
 391:	e8 d0 00 00 00       	call   466 <join>
 396:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 398:	83 c4 10             	add    $0x10,%esp
 39b:	bb 00 00 00 00       	mov    $0x0,%ebx
 3a0:	83 fb 3f             	cmp    $0x3f,%ebx
 3a3:	7f 14                	jg     3b9 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 3a5:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 3a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3ab:	39 14 85 64 0c 00 00 	cmp    %edx,0xc64(,%eax,4)
 3b2:	74 05                	je     3b9 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 3b4:	83 c3 01             	add    $0x1,%ebx
 3b7:	eb e7                	jmp    3a0 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 3b9:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 3bc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3bf:	39 0c 85 64 0c 00 00 	cmp    %ecx,0xc64(,%eax,4)
 3c6:	75 26                	jne    3ee <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 3c8:	83 ec 0c             	sub    $0xc,%esp
 3cb:	ff 34 85 60 0c 00 00 	pushl  0xc60(,%eax,4)
 3d2:	e8 35 03 00 00       	call   70c <free>
  cell_full[i] = 0;
 3d7:	c7 04 9d 60 0f 00 00 	movl   $0x0,0xf60(,%ebx,4)
 3de:	00 00 00 00 

  return out;
 3e2:	83 c4 10             	add    $0x10,%esp
}
 3e5:	89 f0                	mov    %esi,%eax
 3e7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3ea:	5b                   	pop    %ebx
 3eb:	5e                   	pop    %esi
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 3ee:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3f3:	eb f0                	jmp    3e5 <thread_join+0x64>

000003f5 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 3f5:	f3 0f 1e fb          	endbr32 
 3f9:	55                   	push   %ebp
 3fa:	89 e5                	mov    %esp,%ebp
 3fc:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3ff:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 405:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 40c:	5d                   	pop    %ebp
 40d:	c3                   	ret    

0000040e <lock_acquire>:

void lock_acquire(lock_t *lock) {
 40e:	f3 0f 1e fb          	endbr32 
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
 415:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 418:	b9 01 00 00 00       	mov    $0x1,%ecx
 41d:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 421:	b8 00 00 00 00       	mov    $0x0,%eax
 426:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 42b:	39 c1                	cmp    %eax,%ecx
 42d:	75 f2                	jne    421 <lock_acquire+0x13>
      ; // spin
    }
}
 42f:	5d                   	pop    %ebp
 430:	c3                   	ret    

00000431 <lock_release>:

void lock_release(lock_t *lock) {
 431:	f3 0f 1e fb          	endbr32 
 435:	55                   	push   %ebp
 436:	89 e5                	mov    %esp,%ebp
 438:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 43b:	8b 42 04             	mov    0x4(%edx),%eax
 43e:	83 c0 01             	add    $0x1,%eax
 441:	89 42 04             	mov    %eax,0x4(%edx)
}
 444:	5d                   	pop    %ebp
 445:	c3                   	ret    

00000446 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 446:	b8 01 00 00 00       	mov    $0x1,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <clone>:
SYSCALL(clone)
 44e:	b8 16 00 00 00       	mov    $0x16,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <exit>:
SYSCALL(exit)
 456:	b8 02 00 00 00       	mov    $0x2,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <wait>:
SYSCALL(wait)
 45e:	b8 03 00 00 00       	mov    $0x3,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <join>:
SYSCALL(join)
 466:	b8 17 00 00 00       	mov    $0x17,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <pipe>:
SYSCALL(pipe)
 46e:	b8 04 00 00 00       	mov    $0x4,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <read>:
SYSCALL(read)
 476:	b8 05 00 00 00       	mov    $0x5,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <write>:
SYSCALL(write)
 47e:	b8 10 00 00 00       	mov    $0x10,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <close>:
SYSCALL(close)
 486:	b8 15 00 00 00       	mov    $0x15,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <kill>:
SYSCALL(kill)
 48e:	b8 06 00 00 00       	mov    $0x6,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <exec>:
SYSCALL(exec)
 496:	b8 07 00 00 00       	mov    $0x7,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <open>:
SYSCALL(open)
 49e:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <mknod>:
SYSCALL(mknod)
 4a6:	b8 11 00 00 00       	mov    $0x11,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <unlink>:
SYSCALL(unlink)
 4ae:	b8 12 00 00 00       	mov    $0x12,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <fstat>:
SYSCALL(fstat)
 4b6:	b8 08 00 00 00       	mov    $0x8,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <link>:
SYSCALL(link)
 4be:	b8 13 00 00 00       	mov    $0x13,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <mkdir>:
SYSCALL(mkdir)
 4c6:	b8 14 00 00 00       	mov    $0x14,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <chdir>:
SYSCALL(chdir)
 4ce:	b8 09 00 00 00       	mov    $0x9,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <dup>:
SYSCALL(dup)
 4d6:	b8 0a 00 00 00       	mov    $0xa,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <getpid>:
SYSCALL(getpid)
 4de:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <sbrk>:
SYSCALL(sbrk)
 4e6:	b8 0c 00 00 00       	mov    $0xc,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <sleep>:
SYSCALL(sleep)
 4ee:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <uptime>:
SYSCALL(uptime)
 4f6:	b8 0e 00 00 00       	mov    $0xe,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4fe:	55                   	push   %ebp
 4ff:	89 e5                	mov    %esp,%ebp
 501:	83 ec 1c             	sub    $0x1c,%esp
 504:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 507:	6a 01                	push   $0x1
 509:	8d 55 f4             	lea    -0xc(%ebp),%edx
 50c:	52                   	push   %edx
 50d:	50                   	push   %eax
 50e:	e8 6b ff ff ff       	call   47e <write>
}
 513:	83 c4 10             	add    $0x10,%esp
 516:	c9                   	leave  
 517:	c3                   	ret    

00000518 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
 51b:	57                   	push   %edi
 51c:	56                   	push   %esi
 51d:	53                   	push   %ebx
 51e:	83 ec 2c             	sub    $0x2c,%esp
 521:	89 45 d0             	mov    %eax,-0x30(%ebp)
 524:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 526:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 52a:	0f 95 c2             	setne  %dl
 52d:	89 f0                	mov    %esi,%eax
 52f:	c1 e8 1f             	shr    $0x1f,%eax
 532:	84 c2                	test   %al,%dl
 534:	74 42                	je     578 <printint+0x60>
    neg = 1;
    x = -xx;
 536:	f7 de                	neg    %esi
    neg = 1;
 538:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 53f:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 544:	89 f0                	mov    %esi,%eax
 546:	ba 00 00 00 00       	mov    $0x0,%edx
 54b:	f7 f1                	div    %ecx
 54d:	89 df                	mov    %ebx,%edi
 54f:	83 c3 01             	add    $0x1,%ebx
 552:	0f b6 92 cc 08 00 00 	movzbl 0x8cc(%edx),%edx
 559:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 55d:	89 f2                	mov    %esi,%edx
 55f:	89 c6                	mov    %eax,%esi
 561:	39 d1                	cmp    %edx,%ecx
 563:	76 df                	jbe    544 <printint+0x2c>
  if(neg)
 565:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 569:	74 2f                	je     59a <printint+0x82>
    buf[i++] = '-';
 56b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 570:	8d 5f 02             	lea    0x2(%edi),%ebx
 573:	8b 75 d0             	mov    -0x30(%ebp),%esi
 576:	eb 15                	jmp    58d <printint+0x75>
  neg = 0;
 578:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 57f:	eb be                	jmp    53f <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 581:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 586:	89 f0                	mov    %esi,%eax
 588:	e8 71 ff ff ff       	call   4fe <putc>
  while(--i >= 0)
 58d:	83 eb 01             	sub    $0x1,%ebx
 590:	79 ef                	jns    581 <printint+0x69>
}
 592:	83 c4 2c             	add    $0x2c,%esp
 595:	5b                   	pop    %ebx
 596:	5e                   	pop    %esi
 597:	5f                   	pop    %edi
 598:	5d                   	pop    %ebp
 599:	c3                   	ret    
 59a:	8b 75 d0             	mov    -0x30(%ebp),%esi
 59d:	eb ee                	jmp    58d <printint+0x75>

0000059f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 59f:	f3 0f 1e fb          	endbr32 
 5a3:	55                   	push   %ebp
 5a4:	89 e5                	mov    %esp,%ebp
 5a6:	57                   	push   %edi
 5a7:	56                   	push   %esi
 5a8:	53                   	push   %ebx
 5a9:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5ac:	8d 45 10             	lea    0x10(%ebp),%eax
 5af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5b2:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5b7:	bb 00 00 00 00       	mov    $0x0,%ebx
 5bc:	eb 14                	jmp    5d2 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5be:	89 fa                	mov    %edi,%edx
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	e8 36 ff ff ff       	call   4fe <putc>
 5c8:	eb 05                	jmp    5cf <printf+0x30>
      }
    } else if(state == '%'){
 5ca:	83 fe 25             	cmp    $0x25,%esi
 5cd:	74 25                	je     5f4 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 5cf:	83 c3 01             	add    $0x1,%ebx
 5d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d5:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5d9:	84 c0                	test   %al,%al
 5db:	0f 84 23 01 00 00    	je     704 <printf+0x165>
    c = fmt[i] & 0xff;
 5e1:	0f be f8             	movsbl %al,%edi
 5e4:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5e7:	85 f6                	test   %esi,%esi
 5e9:	75 df                	jne    5ca <printf+0x2b>
      if(c == '%'){
 5eb:	83 f8 25             	cmp    $0x25,%eax
 5ee:	75 ce                	jne    5be <printf+0x1f>
        state = '%';
 5f0:	89 c6                	mov    %eax,%esi
 5f2:	eb db                	jmp    5cf <printf+0x30>
      if(c == 'd'){
 5f4:	83 f8 64             	cmp    $0x64,%eax
 5f7:	74 49                	je     642 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5f9:	83 f8 78             	cmp    $0x78,%eax
 5fc:	0f 94 c1             	sete   %cl
 5ff:	83 f8 70             	cmp    $0x70,%eax
 602:	0f 94 c2             	sete   %dl
 605:	08 d1                	or     %dl,%cl
 607:	75 63                	jne    66c <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 609:	83 f8 73             	cmp    $0x73,%eax
 60c:	0f 84 84 00 00 00    	je     696 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 612:	83 f8 63             	cmp    $0x63,%eax
 615:	0f 84 b7 00 00 00    	je     6d2 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 61b:	83 f8 25             	cmp    $0x25,%eax
 61e:	0f 84 cc 00 00 00    	je     6f0 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 624:	ba 25 00 00 00       	mov    $0x25,%edx
 629:	8b 45 08             	mov    0x8(%ebp),%eax
 62c:	e8 cd fe ff ff       	call   4fe <putc>
        putc(fd, c);
 631:	89 fa                	mov    %edi,%edx
 633:	8b 45 08             	mov    0x8(%ebp),%eax
 636:	e8 c3 fe ff ff       	call   4fe <putc>
      }
      state = 0;
 63b:	be 00 00 00 00       	mov    $0x0,%esi
 640:	eb 8d                	jmp    5cf <printf+0x30>
        printint(fd, *ap, 10, 1);
 642:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 645:	8b 17                	mov    (%edi),%edx
 647:	83 ec 0c             	sub    $0xc,%esp
 64a:	6a 01                	push   $0x1
 64c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	e8 bf fe ff ff       	call   518 <printint>
        ap++;
 659:	83 c7 04             	add    $0x4,%edi
 65c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 65f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
 667:	e9 63 ff ff ff       	jmp    5cf <printf+0x30>
        printint(fd, *ap, 16, 0);
 66c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 66f:	8b 17                	mov    (%edi),%edx
 671:	83 ec 0c             	sub    $0xc,%esp
 674:	6a 00                	push   $0x0
 676:	b9 10 00 00 00       	mov    $0x10,%ecx
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	e8 95 fe ff ff       	call   518 <printint>
        ap++;
 683:	83 c7 04             	add    $0x4,%edi
 686:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 689:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68c:	be 00 00 00 00       	mov    $0x0,%esi
 691:	e9 39 ff ff ff       	jmp    5cf <printf+0x30>
        s = (char*)*ap;
 696:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 699:	8b 30                	mov    (%eax),%esi
        ap++;
 69b:	83 c0 04             	add    $0x4,%eax
 69e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6a1:	85 f6                	test   %esi,%esi
 6a3:	75 28                	jne    6cd <printf+0x12e>
          s = "(null)";
 6a5:	be c2 08 00 00       	mov    $0x8c2,%esi
 6aa:	8b 7d 08             	mov    0x8(%ebp),%edi
 6ad:	eb 0d                	jmp    6bc <printf+0x11d>
          putc(fd, *s);
 6af:	0f be d2             	movsbl %dl,%edx
 6b2:	89 f8                	mov    %edi,%eax
 6b4:	e8 45 fe ff ff       	call   4fe <putc>
          s++;
 6b9:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6bc:	0f b6 16             	movzbl (%esi),%edx
 6bf:	84 d2                	test   %dl,%dl
 6c1:	75 ec                	jne    6af <printf+0x110>
      state = 0;
 6c3:	be 00 00 00 00       	mov    $0x0,%esi
 6c8:	e9 02 ff ff ff       	jmp    5cf <printf+0x30>
 6cd:	8b 7d 08             	mov    0x8(%ebp),%edi
 6d0:	eb ea                	jmp    6bc <printf+0x11d>
        putc(fd, *ap);
 6d2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d5:	0f be 17             	movsbl (%edi),%edx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	e8 1e fe ff ff       	call   4fe <putc>
        ap++;
 6e0:	83 c7 04             	add    $0x4,%edi
 6e3:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6e6:	be 00 00 00 00       	mov    $0x0,%esi
 6eb:	e9 df fe ff ff       	jmp    5cf <printf+0x30>
        putc(fd, c);
 6f0:	89 fa                	mov    %edi,%edx
 6f2:	8b 45 08             	mov    0x8(%ebp),%eax
 6f5:	e8 04 fe ff ff       	call   4fe <putc>
      state = 0;
 6fa:	be 00 00 00 00       	mov    $0x0,%esi
 6ff:	e9 cb fe ff ff       	jmp    5cf <printf+0x30>
    }
  }
}
 704:	8d 65 f4             	lea    -0xc(%ebp),%esp
 707:	5b                   	pop    %ebx
 708:	5e                   	pop    %esi
 709:	5f                   	pop    %edi
 70a:	5d                   	pop    %ebp
 70b:	c3                   	ret    

0000070c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 70c:	f3 0f 1e fb          	endbr32 
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	57                   	push   %edi
 714:	56                   	push   %esi
 715:	53                   	push   %ebx
 716:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 719:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 71c:	a1 40 0c 00 00       	mov    0xc40,%eax
 721:	eb 02                	jmp    725 <free+0x19>
 723:	89 d0                	mov    %edx,%eax
 725:	39 c8                	cmp    %ecx,%eax
 727:	73 04                	jae    72d <free+0x21>
 729:	39 08                	cmp    %ecx,(%eax)
 72b:	77 12                	ja     73f <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72d:	8b 10                	mov    (%eax),%edx
 72f:	39 c2                	cmp    %eax,%edx
 731:	77 f0                	ja     723 <free+0x17>
 733:	39 c8                	cmp    %ecx,%eax
 735:	72 08                	jb     73f <free+0x33>
 737:	39 ca                	cmp    %ecx,%edx
 739:	77 04                	ja     73f <free+0x33>
 73b:	89 d0                	mov    %edx,%eax
 73d:	eb e6                	jmp    725 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 73f:	8b 73 fc             	mov    -0x4(%ebx),%esi
 742:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 745:	8b 10                	mov    (%eax),%edx
 747:	39 d7                	cmp    %edx,%edi
 749:	74 19                	je     764 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 74b:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 74e:	8b 50 04             	mov    0x4(%eax),%edx
 751:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 754:	39 ce                	cmp    %ecx,%esi
 756:	74 1b                	je     773 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 758:	89 08                	mov    %ecx,(%eax)
  freep = p;
 75a:	a3 40 0c 00 00       	mov    %eax,0xc40
}
 75f:	5b                   	pop    %ebx
 760:	5e                   	pop    %esi
 761:	5f                   	pop    %edi
 762:	5d                   	pop    %ebp
 763:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 764:	03 72 04             	add    0x4(%edx),%esi
 767:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 76a:	8b 10                	mov    (%eax),%edx
 76c:	8b 12                	mov    (%edx),%edx
 76e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 771:	eb db                	jmp    74e <free+0x42>
    p->s.size += bp->s.size;
 773:	03 53 fc             	add    -0x4(%ebx),%edx
 776:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 779:	8b 53 f8             	mov    -0x8(%ebx),%edx
 77c:	89 10                	mov    %edx,(%eax)
 77e:	eb da                	jmp    75a <free+0x4e>

00000780 <morecore>:

static Header*
morecore(uint nu)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	53                   	push   %ebx
 784:	83 ec 04             	sub    $0x4,%esp
 787:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 789:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 78e:	77 05                	ja     795 <morecore+0x15>
    nu = 4096;
 790:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 795:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 79c:	83 ec 0c             	sub    $0xc,%esp
 79f:	50                   	push   %eax
 7a0:	e8 41 fd ff ff       	call   4e6 <sbrk>
  if(p == (char*)-1)
 7a5:	83 c4 10             	add    $0x10,%esp
 7a8:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ab:	74 1c                	je     7c9 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7ad:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7b0:	83 c0 08             	add    $0x8,%eax
 7b3:	83 ec 0c             	sub    $0xc,%esp
 7b6:	50                   	push   %eax
 7b7:	e8 50 ff ff ff       	call   70c <free>
  return freep;
 7bc:	a1 40 0c 00 00       	mov    0xc40,%eax
 7c1:	83 c4 10             	add    $0x10,%esp
}
 7c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7c7:	c9                   	leave  
 7c8:	c3                   	ret    
    return 0;
 7c9:	b8 00 00 00 00       	mov    $0x0,%eax
 7ce:	eb f4                	jmp    7c4 <morecore+0x44>

000007d0 <malloc>:

void*
malloc(uint nbytes)
{
 7d0:	f3 0f 1e fb          	endbr32 
 7d4:	55                   	push   %ebp
 7d5:	89 e5                	mov    %esp,%ebp
 7d7:	53                   	push   %ebx
 7d8:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7db:	8b 45 08             	mov    0x8(%ebp),%eax
 7de:	8d 58 07             	lea    0x7(%eax),%ebx
 7e1:	c1 eb 03             	shr    $0x3,%ebx
 7e4:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7e7:	8b 0d 40 0c 00 00    	mov    0xc40,%ecx
 7ed:	85 c9                	test   %ecx,%ecx
 7ef:	74 04                	je     7f5 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f1:	8b 01                	mov    (%ecx),%eax
 7f3:	eb 4b                	jmp    840 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 7f5:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 7fc:	0c 00 00 
 7ff:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 806:	0c 00 00 
    base.s.size = 0;
 809:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 810:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 813:	b9 44 0c 00 00       	mov    $0xc44,%ecx
 818:	eb d7                	jmp    7f1 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 81a:	74 1a                	je     836 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 81c:	29 da                	sub    %ebx,%edx
 81e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 821:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 824:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 827:	89 0d 40 0c 00 00    	mov    %ecx,0xc40
      return (void*)(p + 1);
 82d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 830:	83 c4 04             	add    $0x4,%esp
 833:	5b                   	pop    %ebx
 834:	5d                   	pop    %ebp
 835:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 836:	8b 10                	mov    (%eax),%edx
 838:	89 11                	mov    %edx,(%ecx)
 83a:	eb eb                	jmp    827 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83c:	89 c1                	mov    %eax,%ecx
 83e:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 840:	8b 50 04             	mov    0x4(%eax),%edx
 843:	39 da                	cmp    %ebx,%edx
 845:	73 d3                	jae    81a <malloc+0x4a>
    if(p == freep)
 847:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 84d:	75 ed                	jne    83c <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 84f:	89 d8                	mov    %ebx,%eax
 851:	e8 2a ff ff ff       	call   780 <morecore>
 856:	85 c0                	test   %eax,%eax
 858:	75 e2                	jne    83c <malloc+0x6c>
 85a:	eb d4                	jmp    830 <malloc+0x60>
