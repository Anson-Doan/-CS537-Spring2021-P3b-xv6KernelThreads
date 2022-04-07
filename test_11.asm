
_test_11:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 ec 08             	sub    $0x8,%esp
   assert(global == 1);
   a:	a1 ac 0d 00 00       	mov    0xdac,%eax
   f:	83 f8 01             	cmp    $0x1,%eax
  12:	74 49                	je     5d <worker+0x5d>
  14:	6a 2d                	push   $0x2d
  16:	68 50 09 00 00       	push   $0x950
  1b:	68 5a 09 00 00       	push   $0x95a
  20:	6a 01                	push   $0x1
  22:	e8 6a 06 00 00       	call   691 <printf>
  27:	83 c4 0c             	add    $0xc,%esp
  2a:	68 62 09 00 00       	push   $0x962
  2f:	68 6e 09 00 00       	push   $0x96e
  34:	6a 01                	push   $0x1
  36:	e8 56 06 00 00       	call   691 <printf>
  3b:	83 c4 08             	add    $0x8,%esp
  3e:	68 82 09 00 00       	push   $0x982
  43:	6a 01                	push   $0x1
  45:	e8 47 06 00 00       	call   691 <printf>
  4a:	83 c4 04             	add    $0x4,%esp
  4d:	ff 35 b0 0d 00 00    	pushl  0xdb0
  53:	e8 28 05 00 00       	call   580 <kill>
  58:	e8 eb 04 00 00       	call   548 <exit>
   global += 4;
  5d:	a1 ac 0d 00 00       	mov    0xdac,%eax
  62:	83 c0 04             	add    $0x4,%eax
  65:	a3 ac 0d 00 00       	mov    %eax,0xdac
   exit();
  6a:	e8 d9 04 00 00       	call   548 <exit>

0000006f <main>:
{
  6f:	f3 0f 1e fb          	endbr32 
  73:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  77:	83 e4 f0             	and    $0xfffffff0,%esp
  7a:	ff 71 fc             	pushl  -0x4(%ecx)
  7d:	55                   	push   %ebp
  7e:	89 e5                	mov    %esp,%ebp
  80:	56                   	push   %esi
  81:	53                   	push   %ebx
  82:	51                   	push   %ecx
  83:	83 ec 0c             	sub    $0xc,%esp
   ppid = getpid();
  86:	e8 45 05 00 00       	call   5d0 <getpid>
  8b:	a3 b0 0d 00 00       	mov    %eax,0xdb0
   for(i = 0; i < 2000; i++) {
  90:	be 00 00 00 00       	mov    $0x0,%esi
  95:	81 fe cf 07 00 00    	cmp    $0x7cf,%esi
  9b:	0f 8f 7c 01 00 00    	jg     21d <main+0x1ae>
      global = 1;
  a1:	c7 05 ac 0d 00 00 01 	movl   $0x1,0xdac
  a8:	00 00 00 
      thread_pid = thread_create(worker, 0, 0);
  ab:	83 ec 04             	sub    $0x4,%esp
  ae:	6a 00                	push   $0x0
  b0:	6a 00                	push   $0x0
  b2:	68 00 00 00 00       	push   $0x0
  b7:	e8 2a 03 00 00       	call   3e6 <thread_create>
  bc:	89 c3                	mov    %eax,%ebx
      assert(thread_pid > 0);
  be:	83 c4 10             	add    $0x10,%esp
  c1:	85 c0                	test   %eax,%eax
  c3:	7e 34                	jle    f9 <main+0x8a>
      join_pid = thread_join();
  c5:	e8 a9 03 00 00       	call   473 <thread_join>
      assert(join_pid == thread_pid);
  ca:	39 c3                	cmp    %eax,%ebx
  cc:	75 74                	jne    142 <main+0xd3>
      assert(global == 5);
  ce:	a1 ac 0d 00 00       	mov    0xdac,%eax
  d3:	83 f8 05             	cmp    $0x5,%eax
  d6:	0f 85 af 00 00 00    	jne    18b <main+0x11c>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
  dc:	83 ec 0c             	sub    $0xc,%esp
  df:	6a 00                	push   $0x0
  e1:	e8 f2 04 00 00       	call   5d8 <sbrk>
  e6:	83 c4 10             	add    $0x10,%esp
  e9:	3d ff 5f 09 00       	cmp    $0x95fff,%eax
  ee:	0f 87 e0 00 00 00    	ja     1d4 <main+0x165>
   for(i = 0; i < 2000; i++) {
  f4:	83 c6 01             	add    $0x1,%esi
  f7:	eb 9c                	jmp    95 <main+0x26>
      assert(thread_pid > 0);
  f9:	6a 20                	push   $0x20
  fb:	68 50 09 00 00       	push   $0x950
 100:	68 5a 09 00 00       	push   $0x95a
 105:	6a 01                	push   $0x1
 107:	e8 85 05 00 00       	call   691 <printf>
 10c:	83 c4 0c             	add    $0xc,%esp
 10f:	68 8f 09 00 00       	push   $0x98f
 114:	68 6e 09 00 00       	push   $0x96e
 119:	6a 01                	push   $0x1
 11b:	e8 71 05 00 00       	call   691 <printf>
 120:	83 c4 08             	add    $0x8,%esp
 123:	68 82 09 00 00       	push   $0x982
 128:	6a 01                	push   $0x1
 12a:	e8 62 05 00 00       	call   691 <printf>
 12f:	83 c4 04             	add    $0x4,%esp
 132:	ff 35 b0 0d 00 00    	pushl  0xdb0
 138:	e8 43 04 00 00       	call   580 <kill>
 13d:	e8 06 04 00 00       	call   548 <exit>
      assert(join_pid == thread_pid);
 142:	6a 22                	push   $0x22
 144:	68 50 09 00 00       	push   $0x950
 149:	68 5a 09 00 00       	push   $0x95a
 14e:	6a 01                	push   $0x1
 150:	e8 3c 05 00 00       	call   691 <printf>
 155:	83 c4 0c             	add    $0xc,%esp
 158:	68 9e 09 00 00       	push   $0x99e
 15d:	68 6e 09 00 00       	push   $0x96e
 162:	6a 01                	push   $0x1
 164:	e8 28 05 00 00       	call   691 <printf>
 169:	83 c4 08             	add    $0x8,%esp
 16c:	68 82 09 00 00       	push   $0x982
 171:	6a 01                	push   $0x1
 173:	e8 19 05 00 00       	call   691 <printf>
 178:	83 c4 04             	add    $0x4,%esp
 17b:	ff 35 b0 0d 00 00    	pushl  0xdb0
 181:	e8 fa 03 00 00       	call   580 <kill>
 186:	e8 bd 03 00 00       	call   548 <exit>
      assert(global == 5);
 18b:	6a 23                	push   $0x23
 18d:	68 50 09 00 00       	push   $0x950
 192:	68 5a 09 00 00       	push   $0x95a
 197:	6a 01                	push   $0x1
 199:	e8 f3 04 00 00       	call   691 <printf>
 19e:	83 c4 0c             	add    $0xc,%esp
 1a1:	68 b5 09 00 00       	push   $0x9b5
 1a6:	68 6e 09 00 00       	push   $0x96e
 1ab:	6a 01                	push   $0x1
 1ad:	e8 df 04 00 00       	call   691 <printf>
 1b2:	83 c4 08             	add    $0x8,%esp
 1b5:	68 82 09 00 00       	push   $0x982
 1ba:	6a 01                	push   $0x1
 1bc:	e8 d0 04 00 00       	call   691 <printf>
 1c1:	83 c4 04             	add    $0x4,%esp
 1c4:	ff 35 b0 0d 00 00    	pushl  0xdb0
 1ca:	e8 b1 03 00 00       	call   580 <kill>
 1cf:	e8 74 03 00 00       	call   548 <exit>
      assert((uint)sbrk(0) < (150 * 4096) && "shouldn't even come close");
 1d4:	6a 24                	push   $0x24
 1d6:	68 50 09 00 00       	push   $0x950
 1db:	68 5a 09 00 00       	push   $0x95a
 1e0:	6a 01                	push   $0x1
 1e2:	e8 aa 04 00 00       	call   691 <printf>
 1e7:	83 c4 0c             	add    $0xc,%esp
 1ea:	68 d0 09 00 00       	push   $0x9d0
 1ef:	68 6e 09 00 00       	push   $0x96e
 1f4:	6a 01                	push   $0x1
 1f6:	e8 96 04 00 00       	call   691 <printf>
 1fb:	83 c4 08             	add    $0x8,%esp
 1fe:	68 82 09 00 00       	push   $0x982
 203:	6a 01                	push   $0x1
 205:	e8 87 04 00 00       	call   691 <printf>
 20a:	83 c4 04             	add    $0x4,%esp
 20d:	ff 35 b0 0d 00 00    	pushl  0xdb0
 213:	e8 68 03 00 00       	call   580 <kill>
 218:	e8 2b 03 00 00       	call   548 <exit>
   printf(1, "TEST PASSED\n");
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	68 c1 09 00 00       	push   $0x9c1
 225:	6a 01                	push   $0x1
 227:	e8 65 04 00 00       	call   691 <printf>
   exit();
 22c:	e8 17 03 00 00       	call   548 <exit>

00000231 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 231:	f3 0f 1e fb          	endbr32 
 235:	55                   	push   %ebp
 236:	89 e5                	mov    %esp,%ebp
 238:	56                   	push   %esi
 239:	53                   	push   %ebx
 23a:	8b 75 08             	mov    0x8(%ebp),%esi
 23d:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 240:	89 f0                	mov    %esi,%eax
 242:	89 d1                	mov    %edx,%ecx
 244:	83 c2 01             	add    $0x1,%edx
 247:	89 c3                	mov    %eax,%ebx
 249:	83 c0 01             	add    $0x1,%eax
 24c:	0f b6 09             	movzbl (%ecx),%ecx
 24f:	88 0b                	mov    %cl,(%ebx)
 251:	84 c9                	test   %cl,%cl
 253:	75 ed                	jne    242 <strcpy+0x11>
    ;
  return os;
}
 255:	89 f0                	mov    %esi,%eax
 257:	5b                   	pop    %ebx
 258:	5e                   	pop    %esi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    

0000025b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 25b:	f3 0f 1e fb          	endbr32 
 25f:	55                   	push   %ebp
 260:	89 e5                	mov    %esp,%ebp
 262:	8b 4d 08             	mov    0x8(%ebp),%ecx
 265:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 268:	0f b6 01             	movzbl (%ecx),%eax
 26b:	84 c0                	test   %al,%al
 26d:	74 0c                	je     27b <strcmp+0x20>
 26f:	3a 02                	cmp    (%edx),%al
 271:	75 08                	jne    27b <strcmp+0x20>
    p++, q++;
 273:	83 c1 01             	add    $0x1,%ecx
 276:	83 c2 01             	add    $0x1,%edx
 279:	eb ed                	jmp    268 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 27b:	0f b6 c0             	movzbl %al,%eax
 27e:	0f b6 12             	movzbl (%edx),%edx
 281:	29 d0                	sub    %edx,%eax
}
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    

00000285 <strlen>:

uint
strlen(const char *s)
{
 285:	f3 0f 1e fb          	endbr32 
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 28f:	b8 00 00 00 00       	mov    $0x0,%eax
 294:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 298:	74 05                	je     29f <strlen+0x1a>
 29a:	83 c0 01             	add    $0x1,%eax
 29d:	eb f5                	jmp    294 <strlen+0xf>
    ;
  return n;
}
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    

000002a1 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a1:	f3 0f 1e fb          	endbr32 
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	57                   	push   %edi
 2a9:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2ac:	89 d7                	mov    %edx,%edi
 2ae:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b4:	fc                   	cld    
 2b5:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2b7:	89 d0                	mov    %edx,%eax
 2b9:	5f                   	pop    %edi
 2ba:	5d                   	pop    %ebp
 2bb:	c3                   	ret    

000002bc <strchr>:

char*
strchr(const char *s, char c)
{
 2bc:	f3 0f 1e fb          	endbr32 
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
 2c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2ca:	0f b6 10             	movzbl (%eax),%edx
 2cd:	84 d2                	test   %dl,%dl
 2cf:	74 09                	je     2da <strchr+0x1e>
    if(*s == c)
 2d1:	38 ca                	cmp    %cl,%dl
 2d3:	74 0a                	je     2df <strchr+0x23>
  for(; *s; s++)
 2d5:	83 c0 01             	add    $0x1,%eax
 2d8:	eb f0                	jmp    2ca <strchr+0xe>
      return (char*)s;
  return 0;
 2da:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2df:	5d                   	pop    %ebp
 2e0:	c3                   	ret    

000002e1 <gets>:

char*
gets(char *buf, int max)
{
 2e1:	f3 0f 1e fb          	endbr32 
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	57                   	push   %edi
 2e9:	56                   	push   %esi
 2ea:	53                   	push   %ebx
 2eb:	83 ec 1c             	sub    $0x1c,%esp
 2ee:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f6:	89 de                	mov    %ebx,%esi
 2f8:	83 c3 01             	add    $0x1,%ebx
 2fb:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2fe:	7d 2e                	jge    32e <gets+0x4d>
    cc = read(0, &c, 1);
 300:	83 ec 04             	sub    $0x4,%esp
 303:	6a 01                	push   $0x1
 305:	8d 45 e7             	lea    -0x19(%ebp),%eax
 308:	50                   	push   %eax
 309:	6a 00                	push   $0x0
 30b:	e8 58 02 00 00       	call   568 <read>
    if(cc < 1)
 310:	83 c4 10             	add    $0x10,%esp
 313:	85 c0                	test   %eax,%eax
 315:	7e 17                	jle    32e <gets+0x4d>
      break;
    buf[i++] = c;
 317:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 31b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 31e:	3c 0a                	cmp    $0xa,%al
 320:	0f 94 c2             	sete   %dl
 323:	3c 0d                	cmp    $0xd,%al
 325:	0f 94 c0             	sete   %al
 328:	08 c2                	or     %al,%dl
 32a:	74 ca                	je     2f6 <gets+0x15>
    buf[i++] = c;
 32c:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 32e:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 332:	89 f8                	mov    %edi,%eax
 334:	8d 65 f4             	lea    -0xc(%ebp),%esp
 337:	5b                   	pop    %ebx
 338:	5e                   	pop    %esi
 339:	5f                   	pop    %edi
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret    

0000033c <stat>:

int
stat(const char *n, struct stat *st)
{
 33c:	f3 0f 1e fb          	endbr32 
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	56                   	push   %esi
 344:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 345:	83 ec 08             	sub    $0x8,%esp
 348:	6a 00                	push   $0x0
 34a:	ff 75 08             	pushl  0x8(%ebp)
 34d:	e8 3e 02 00 00       	call   590 <open>
  if(fd < 0)
 352:	83 c4 10             	add    $0x10,%esp
 355:	85 c0                	test   %eax,%eax
 357:	78 24                	js     37d <stat+0x41>
 359:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 35b:	83 ec 08             	sub    $0x8,%esp
 35e:	ff 75 0c             	pushl  0xc(%ebp)
 361:	50                   	push   %eax
 362:	e8 41 02 00 00       	call   5a8 <fstat>
 367:	89 c6                	mov    %eax,%esi
  close(fd);
 369:	89 1c 24             	mov    %ebx,(%esp)
 36c:	e8 07 02 00 00       	call   578 <close>
  return r;
 371:	83 c4 10             	add    $0x10,%esp
}
 374:	89 f0                	mov    %esi,%eax
 376:	8d 65 f8             	lea    -0x8(%ebp),%esp
 379:	5b                   	pop    %ebx
 37a:	5e                   	pop    %esi
 37b:	5d                   	pop    %ebp
 37c:	c3                   	ret    
    return -1;
 37d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 382:	eb f0                	jmp    374 <stat+0x38>

00000384 <atoi>:

int
atoi(const char *s)
{
 384:	f3 0f 1e fb          	endbr32 
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	53                   	push   %ebx
 38c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 38f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 394:	0f b6 01             	movzbl (%ecx),%eax
 397:	8d 58 d0             	lea    -0x30(%eax),%ebx
 39a:	80 fb 09             	cmp    $0x9,%bl
 39d:	77 12                	ja     3b1 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 39f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3a2:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3a5:	83 c1 01             	add    $0x1,%ecx
 3a8:	0f be c0             	movsbl %al,%eax
 3ab:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 3af:	eb e3                	jmp    394 <atoi+0x10>
  return n;
}
 3b1:	89 d0                	mov    %edx,%eax
 3b3:	5b                   	pop    %ebx
 3b4:	5d                   	pop    %ebp
 3b5:	c3                   	ret    

000003b6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b6:	f3 0f 1e fb          	endbr32 
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	56                   	push   %esi
 3be:	53                   	push   %ebx
 3bf:	8b 75 08             	mov    0x8(%ebp),%esi
 3c2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3c5:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3c8:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3ca:	8d 58 ff             	lea    -0x1(%eax),%ebx
 3cd:	85 c0                	test   %eax,%eax
 3cf:	7e 0f                	jle    3e0 <memmove+0x2a>
    *dst++ = *src++;
 3d1:	0f b6 01             	movzbl (%ecx),%eax
 3d4:	88 02                	mov    %al,(%edx)
 3d6:	8d 49 01             	lea    0x1(%ecx),%ecx
 3d9:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 3dc:	89 d8                	mov    %ebx,%eax
 3de:	eb ea                	jmp    3ca <memmove+0x14>
  return vdst;
}
 3e0:	89 f0                	mov    %esi,%eax
 3e2:	5b                   	pop    %ebx
 3e3:	5e                   	pop    %esi
 3e4:	5d                   	pop    %ebp
 3e5:	c3                   	ret    

000003e6 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3e6:	f3 0f 1e fb          	endbr32 
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	53                   	push   %ebx
 3ee:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 3f1:	68 00 20 00 00       	push   $0x2000
 3f6:	e8 c7 04 00 00       	call   8c2 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 3fb:	83 c4 10             	add    $0x10,%esp
 3fe:	89 c2                	mov    %eax,%edx
 400:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 406:	74 22                	je     42a <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 408:	b9 00 10 00 00       	mov    $0x1000,%ecx
 40d:	29 d1                	sub    %edx,%ecx
 40f:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 411:	ba 00 00 00 00       	mov    $0x0,%edx
 416:	83 fa 3f             	cmp    $0x3f,%edx
 419:	7f 13                	jg     42e <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 41b:	83 3c 95 c0 10 00 00 	cmpl   $0x1,0x10c0(,%edx,4)
 422:	01 
 423:	75 09                	jne    42e <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 425:	83 c2 01             	add    $0x1,%edx
 428:	eb ec                	jmp    416 <thread_create+0x30>
  void *user_stack = curr_ptr;
 42a:	89 c1                	mov    %eax,%ecx
 42c:	eb e3                	jmp    411 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 42e:	83 3c 95 c0 10 00 00 	cmpl   $0x1,0x10c0(,%edx,4)
 435:	01 
 436:	74 34                	je     46c <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 438:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 43b:	c1 e3 02             	shl    $0x2,%ebx
 43e:	89 83 c0 0d 00 00    	mov    %eax,0xdc0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 444:	89 8b c4 0d 00 00    	mov    %ecx,0xdc4(%ebx)
  cell_full[i] = 1;
 44a:	c7 04 95 c0 10 00 00 	movl   $0x1,0x10c0(,%edx,4)
 451:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 455:	ff 75 10             	pushl  0x10(%ebp)
 458:	ff 75 0c             	pushl  0xc(%ebp)
 45b:	ff 75 08             	pushl  0x8(%ebp)
 45e:	51                   	push   %ecx
 45f:	e8 dc 00 00 00       	call   540 <clone>
 464:	83 c4 10             	add    $0x10,%esp
}
 467:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 46a:	c9                   	leave  
 46b:	c3                   	ret    
    return -1;
 46c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 471:	eb f4                	jmp    467 <thread_create+0x81>

00000473 <thread_join>:

int thread_join(){
 473:	f3 0f 1e fb          	endbr32 
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	56                   	push   %esi
 47b:	53                   	push   %ebx
 47c:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 47f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 482:	50                   	push   %eax
 483:	e8 d0 00 00 00       	call   558 <join>
 488:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	bb 00 00 00 00       	mov    $0x0,%ebx
 492:	83 fb 3f             	cmp    $0x3f,%ebx
 495:	7f 14                	jg     4ab <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 497:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 49a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 49d:	39 14 85 c4 0d 00 00 	cmp    %edx,0xdc4(,%eax,4)
 4a4:	74 05                	je     4ab <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 4a6:	83 c3 01             	add    $0x1,%ebx
 4a9:	eb e7                	jmp    492 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 4ab:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 4ae:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4b1:	39 0c 85 c4 0d 00 00 	cmp    %ecx,0xdc4(,%eax,4)
 4b8:	75 26                	jne    4e0 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 4ba:	83 ec 0c             	sub    $0xc,%esp
 4bd:	ff 34 85 c0 0d 00 00 	pushl  0xdc0(,%eax,4)
 4c4:	e8 35 03 00 00       	call   7fe <free>
  cell_full[i] = 0;
 4c9:	c7 04 9d c0 10 00 00 	movl   $0x0,0x10c0(,%ebx,4)
 4d0:	00 00 00 00 

  return out;
 4d4:	83 c4 10             	add    $0x10,%esp
}
 4d7:	89 f0                	mov    %esi,%eax
 4d9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4dc:	5b                   	pop    %ebx
 4dd:	5e                   	pop    %esi
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 4e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4e5:	eb f0                	jmp    4d7 <thread_join+0x64>

000004e7 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 4e7:	f3 0f 1e fb          	endbr32 
 4eb:	55                   	push   %ebp
 4ec:	89 e5                	mov    %esp,%ebp
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 4f1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 4f7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 4fe:	5d                   	pop    %ebp
 4ff:	c3                   	ret    

00000500 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 500:	f3 0f 1e fb          	endbr32 
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 50a:	b9 01 00 00 00       	mov    $0x1,%ecx
 50f:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 513:	b8 00 00 00 00       	mov    $0x0,%eax
 518:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 51d:	39 c1                	cmp    %eax,%ecx
 51f:	75 f2                	jne    513 <lock_acquire+0x13>
      ; // spin
    }
}
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    

00000523 <lock_release>:

void lock_release(lock_t *lock) {
 523:	f3 0f 1e fb          	endbr32 
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 52d:	8b 42 04             	mov    0x4(%edx),%eax
 530:	83 c0 01             	add    $0x1,%eax
 533:	89 42 04             	mov    %eax,0x4(%edx)
}
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    

00000538 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 538:	b8 01 00 00 00       	mov    $0x1,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <clone>:
SYSCALL(clone)
 540:	b8 16 00 00 00       	mov    $0x16,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <exit>:
SYSCALL(exit)
 548:	b8 02 00 00 00       	mov    $0x2,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <wait>:
SYSCALL(wait)
 550:	b8 03 00 00 00       	mov    $0x3,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <join>:
SYSCALL(join)
 558:	b8 17 00 00 00       	mov    $0x17,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <pipe>:
SYSCALL(pipe)
 560:	b8 04 00 00 00       	mov    $0x4,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <read>:
SYSCALL(read)
 568:	b8 05 00 00 00       	mov    $0x5,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <write>:
SYSCALL(write)
 570:	b8 10 00 00 00       	mov    $0x10,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <close>:
SYSCALL(close)
 578:	b8 15 00 00 00       	mov    $0x15,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <kill>:
SYSCALL(kill)
 580:	b8 06 00 00 00       	mov    $0x6,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <exec>:
SYSCALL(exec)
 588:	b8 07 00 00 00       	mov    $0x7,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <open>:
SYSCALL(open)
 590:	b8 0f 00 00 00       	mov    $0xf,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <mknod>:
SYSCALL(mknod)
 598:	b8 11 00 00 00       	mov    $0x11,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <unlink>:
SYSCALL(unlink)
 5a0:	b8 12 00 00 00       	mov    $0x12,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <fstat>:
SYSCALL(fstat)
 5a8:	b8 08 00 00 00       	mov    $0x8,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <link>:
SYSCALL(link)
 5b0:	b8 13 00 00 00       	mov    $0x13,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <mkdir>:
SYSCALL(mkdir)
 5b8:	b8 14 00 00 00       	mov    $0x14,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <chdir>:
SYSCALL(chdir)
 5c0:	b8 09 00 00 00       	mov    $0x9,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <dup>:
SYSCALL(dup)
 5c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <getpid>:
SYSCALL(getpid)
 5d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <sbrk>:
SYSCALL(sbrk)
 5d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <sleep>:
SYSCALL(sleep)
 5e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <uptime>:
SYSCALL(uptime)
 5e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	83 ec 1c             	sub    $0x1c,%esp
 5f6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5f9:	6a 01                	push   $0x1
 5fb:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5fe:	52                   	push   %edx
 5ff:	50                   	push   %eax
 600:	e8 6b ff ff ff       	call   570 <write>
}
 605:	83 c4 10             	add    $0x10,%esp
 608:	c9                   	leave  
 609:	c3                   	ret    

0000060a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 60a:	55                   	push   %ebp
 60b:	89 e5                	mov    %esp,%ebp
 60d:	57                   	push   %edi
 60e:	56                   	push   %esi
 60f:	53                   	push   %ebx
 610:	83 ec 2c             	sub    $0x2c,%esp
 613:	89 45 d0             	mov    %eax,-0x30(%ebp)
 616:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 618:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 61c:	0f 95 c2             	setne  %dl
 61f:	89 f0                	mov    %esi,%eax
 621:	c1 e8 1f             	shr    $0x1f,%eax
 624:	84 c2                	test   %al,%dl
 626:	74 42                	je     66a <printint+0x60>
    neg = 1;
    x = -xx;
 628:	f7 de                	neg    %esi
    neg = 1;
 62a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 631:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 636:	89 f0                	mov    %esi,%eax
 638:	ba 00 00 00 00       	mov    $0x0,%edx
 63d:	f7 f1                	div    %ecx
 63f:	89 df                	mov    %ebx,%edi
 641:	83 c3 01             	add    $0x1,%ebx
 644:	0f b6 92 14 0a 00 00 	movzbl 0xa14(%edx),%edx
 64b:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 64f:	89 f2                	mov    %esi,%edx
 651:	89 c6                	mov    %eax,%esi
 653:	39 d1                	cmp    %edx,%ecx
 655:	76 df                	jbe    636 <printint+0x2c>
  if(neg)
 657:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 65b:	74 2f                	je     68c <printint+0x82>
    buf[i++] = '-';
 65d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 662:	8d 5f 02             	lea    0x2(%edi),%ebx
 665:	8b 75 d0             	mov    -0x30(%ebp),%esi
 668:	eb 15                	jmp    67f <printint+0x75>
  neg = 0;
 66a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 671:	eb be                	jmp    631 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 673:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 678:	89 f0                	mov    %esi,%eax
 67a:	e8 71 ff ff ff       	call   5f0 <putc>
  while(--i >= 0)
 67f:	83 eb 01             	sub    $0x1,%ebx
 682:	79 ef                	jns    673 <printint+0x69>
}
 684:	83 c4 2c             	add    $0x2c,%esp
 687:	5b                   	pop    %ebx
 688:	5e                   	pop    %esi
 689:	5f                   	pop    %edi
 68a:	5d                   	pop    %ebp
 68b:	c3                   	ret    
 68c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 68f:	eb ee                	jmp    67f <printint+0x75>

00000691 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 691:	f3 0f 1e fb          	endbr32 
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	57                   	push   %edi
 699:	56                   	push   %esi
 69a:	53                   	push   %ebx
 69b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 69e:	8d 45 10             	lea    0x10(%ebp),%eax
 6a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6a4:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6a9:	bb 00 00 00 00       	mov    $0x0,%ebx
 6ae:	eb 14                	jmp    6c4 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6b0:	89 fa                	mov    %edi,%edx
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	e8 36 ff ff ff       	call   5f0 <putc>
 6ba:	eb 05                	jmp    6c1 <printf+0x30>
      }
    } else if(state == '%'){
 6bc:	83 fe 25             	cmp    $0x25,%esi
 6bf:	74 25                	je     6e6 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 6c1:	83 c3 01             	add    $0x1,%ebx
 6c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c7:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6cb:	84 c0                	test   %al,%al
 6cd:	0f 84 23 01 00 00    	je     7f6 <printf+0x165>
    c = fmt[i] & 0xff;
 6d3:	0f be f8             	movsbl %al,%edi
 6d6:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 6d9:	85 f6                	test   %esi,%esi
 6db:	75 df                	jne    6bc <printf+0x2b>
      if(c == '%'){
 6dd:	83 f8 25             	cmp    $0x25,%eax
 6e0:	75 ce                	jne    6b0 <printf+0x1f>
        state = '%';
 6e2:	89 c6                	mov    %eax,%esi
 6e4:	eb db                	jmp    6c1 <printf+0x30>
      if(c == 'd'){
 6e6:	83 f8 64             	cmp    $0x64,%eax
 6e9:	74 49                	je     734 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6eb:	83 f8 78             	cmp    $0x78,%eax
 6ee:	0f 94 c1             	sete   %cl
 6f1:	83 f8 70             	cmp    $0x70,%eax
 6f4:	0f 94 c2             	sete   %dl
 6f7:	08 d1                	or     %dl,%cl
 6f9:	75 63                	jne    75e <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6fb:	83 f8 73             	cmp    $0x73,%eax
 6fe:	0f 84 84 00 00 00    	je     788 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 704:	83 f8 63             	cmp    $0x63,%eax
 707:	0f 84 b7 00 00 00    	je     7c4 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 70d:	83 f8 25             	cmp    $0x25,%eax
 710:	0f 84 cc 00 00 00    	je     7e2 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 716:	ba 25 00 00 00       	mov    $0x25,%edx
 71b:	8b 45 08             	mov    0x8(%ebp),%eax
 71e:	e8 cd fe ff ff       	call   5f0 <putc>
        putc(fd, c);
 723:	89 fa                	mov    %edi,%edx
 725:	8b 45 08             	mov    0x8(%ebp),%eax
 728:	e8 c3 fe ff ff       	call   5f0 <putc>
      }
      state = 0;
 72d:	be 00 00 00 00       	mov    $0x0,%esi
 732:	eb 8d                	jmp    6c1 <printf+0x30>
        printint(fd, *ap, 10, 1);
 734:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 737:	8b 17                	mov    (%edi),%edx
 739:	83 ec 0c             	sub    $0xc,%esp
 73c:	6a 01                	push   $0x1
 73e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	e8 bf fe ff ff       	call   60a <printint>
        ap++;
 74b:	83 c7 04             	add    $0x4,%edi
 74e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 751:	83 c4 10             	add    $0x10,%esp
      state = 0;
 754:	be 00 00 00 00       	mov    $0x0,%esi
 759:	e9 63 ff ff ff       	jmp    6c1 <printf+0x30>
        printint(fd, *ap, 16, 0);
 75e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 761:	8b 17                	mov    (%edi),%edx
 763:	83 ec 0c             	sub    $0xc,%esp
 766:	6a 00                	push   $0x0
 768:	b9 10 00 00 00       	mov    $0x10,%ecx
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
 770:	e8 95 fe ff ff       	call   60a <printint>
        ap++;
 775:	83 c7 04             	add    $0x4,%edi
 778:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 77b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 77e:	be 00 00 00 00       	mov    $0x0,%esi
 783:	e9 39 ff ff ff       	jmp    6c1 <printf+0x30>
        s = (char*)*ap;
 788:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78b:	8b 30                	mov    (%eax),%esi
        ap++;
 78d:	83 c0 04             	add    $0x4,%eax
 790:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 793:	85 f6                	test   %esi,%esi
 795:	75 28                	jne    7bf <printf+0x12e>
          s = "(null)";
 797:	be 0c 0a 00 00       	mov    $0xa0c,%esi
 79c:	8b 7d 08             	mov    0x8(%ebp),%edi
 79f:	eb 0d                	jmp    7ae <printf+0x11d>
          putc(fd, *s);
 7a1:	0f be d2             	movsbl %dl,%edx
 7a4:	89 f8                	mov    %edi,%eax
 7a6:	e8 45 fe ff ff       	call   5f0 <putc>
          s++;
 7ab:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7ae:	0f b6 16             	movzbl (%esi),%edx
 7b1:	84 d2                	test   %dl,%dl
 7b3:	75 ec                	jne    7a1 <printf+0x110>
      state = 0;
 7b5:	be 00 00 00 00       	mov    $0x0,%esi
 7ba:	e9 02 ff ff ff       	jmp    6c1 <printf+0x30>
 7bf:	8b 7d 08             	mov    0x8(%ebp),%edi
 7c2:	eb ea                	jmp    7ae <printf+0x11d>
        putc(fd, *ap);
 7c4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7c7:	0f be 17             	movsbl (%edi),%edx
 7ca:	8b 45 08             	mov    0x8(%ebp),%eax
 7cd:	e8 1e fe ff ff       	call   5f0 <putc>
        ap++;
 7d2:	83 c7 04             	add    $0x4,%edi
 7d5:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 7d8:	be 00 00 00 00       	mov    $0x0,%esi
 7dd:	e9 df fe ff ff       	jmp    6c1 <printf+0x30>
        putc(fd, c);
 7e2:	89 fa                	mov    %edi,%edx
 7e4:	8b 45 08             	mov    0x8(%ebp),%eax
 7e7:	e8 04 fe ff ff       	call   5f0 <putc>
      state = 0;
 7ec:	be 00 00 00 00       	mov    $0x0,%esi
 7f1:	e9 cb fe ff ff       	jmp    6c1 <printf+0x30>
    }
  }
}
 7f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7f9:	5b                   	pop    %ebx
 7fa:	5e                   	pop    %esi
 7fb:	5f                   	pop    %edi
 7fc:	5d                   	pop    %ebp
 7fd:	c3                   	ret    

000007fe <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7fe:	f3 0f 1e fb          	endbr32 
 802:	55                   	push   %ebp
 803:	89 e5                	mov    %esp,%ebp
 805:	57                   	push   %edi
 806:	56                   	push   %esi
 807:	53                   	push   %ebx
 808:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 80b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 80e:	a1 a0 0d 00 00       	mov    0xda0,%eax
 813:	eb 02                	jmp    817 <free+0x19>
 815:	89 d0                	mov    %edx,%eax
 817:	39 c8                	cmp    %ecx,%eax
 819:	73 04                	jae    81f <free+0x21>
 81b:	39 08                	cmp    %ecx,(%eax)
 81d:	77 12                	ja     831 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81f:	8b 10                	mov    (%eax),%edx
 821:	39 c2                	cmp    %eax,%edx
 823:	77 f0                	ja     815 <free+0x17>
 825:	39 c8                	cmp    %ecx,%eax
 827:	72 08                	jb     831 <free+0x33>
 829:	39 ca                	cmp    %ecx,%edx
 82b:	77 04                	ja     831 <free+0x33>
 82d:	89 d0                	mov    %edx,%eax
 82f:	eb e6                	jmp    817 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 831:	8b 73 fc             	mov    -0x4(%ebx),%esi
 834:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 837:	8b 10                	mov    (%eax),%edx
 839:	39 d7                	cmp    %edx,%edi
 83b:	74 19                	je     856 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 83d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 840:	8b 50 04             	mov    0x4(%eax),%edx
 843:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 846:	39 ce                	cmp    %ecx,%esi
 848:	74 1b                	je     865 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 84a:	89 08                	mov    %ecx,(%eax)
  freep = p;
 84c:	a3 a0 0d 00 00       	mov    %eax,0xda0
}
 851:	5b                   	pop    %ebx
 852:	5e                   	pop    %esi
 853:	5f                   	pop    %edi
 854:	5d                   	pop    %ebp
 855:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 856:	03 72 04             	add    0x4(%edx),%esi
 859:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 85c:	8b 10                	mov    (%eax),%edx
 85e:	8b 12                	mov    (%edx),%edx
 860:	89 53 f8             	mov    %edx,-0x8(%ebx)
 863:	eb db                	jmp    840 <free+0x42>
    p->s.size += bp->s.size;
 865:	03 53 fc             	add    -0x4(%ebx),%edx
 868:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 86e:	89 10                	mov    %edx,(%eax)
 870:	eb da                	jmp    84c <free+0x4e>

00000872 <morecore>:

static Header*
morecore(uint nu)
{
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
 875:	53                   	push   %ebx
 876:	83 ec 04             	sub    $0x4,%esp
 879:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 87b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 880:	77 05                	ja     887 <morecore+0x15>
    nu = 4096;
 882:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 887:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 88e:	83 ec 0c             	sub    $0xc,%esp
 891:	50                   	push   %eax
 892:	e8 41 fd ff ff       	call   5d8 <sbrk>
  if(p == (char*)-1)
 897:	83 c4 10             	add    $0x10,%esp
 89a:	83 f8 ff             	cmp    $0xffffffff,%eax
 89d:	74 1c                	je     8bb <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 89f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8a2:	83 c0 08             	add    $0x8,%eax
 8a5:	83 ec 0c             	sub    $0xc,%esp
 8a8:	50                   	push   %eax
 8a9:	e8 50 ff ff ff       	call   7fe <free>
  return freep;
 8ae:	a1 a0 0d 00 00       	mov    0xda0,%eax
 8b3:	83 c4 10             	add    $0x10,%esp
}
 8b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8b9:	c9                   	leave  
 8ba:	c3                   	ret    
    return 0;
 8bb:	b8 00 00 00 00       	mov    $0x0,%eax
 8c0:	eb f4                	jmp    8b6 <morecore+0x44>

000008c2 <malloc>:

void*
malloc(uint nbytes)
{
 8c2:	f3 0f 1e fb          	endbr32 
 8c6:	55                   	push   %ebp
 8c7:	89 e5                	mov    %esp,%ebp
 8c9:	53                   	push   %ebx
 8ca:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	8d 58 07             	lea    0x7(%eax),%ebx
 8d3:	c1 eb 03             	shr    $0x3,%ebx
 8d6:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 8d9:	8b 0d a0 0d 00 00    	mov    0xda0,%ecx
 8df:	85 c9                	test   %ecx,%ecx
 8e1:	74 04                	je     8e7 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e3:	8b 01                	mov    (%ecx),%eax
 8e5:	eb 4b                	jmp    932 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 8e7:	c7 05 a0 0d 00 00 a4 	movl   $0xda4,0xda0
 8ee:	0d 00 00 
 8f1:	c7 05 a4 0d 00 00 a4 	movl   $0xda4,0xda4
 8f8:	0d 00 00 
    base.s.size = 0;
 8fb:	c7 05 a8 0d 00 00 00 	movl   $0x0,0xda8
 902:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 905:	b9 a4 0d 00 00       	mov    $0xda4,%ecx
 90a:	eb d7                	jmp    8e3 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 90c:	74 1a                	je     928 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 90e:	29 da                	sub    %ebx,%edx
 910:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 913:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 916:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 919:	89 0d a0 0d 00 00    	mov    %ecx,0xda0
      return (void*)(p + 1);
 91f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 922:	83 c4 04             	add    $0x4,%esp
 925:	5b                   	pop    %ebx
 926:	5d                   	pop    %ebp
 927:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 928:	8b 10                	mov    (%eax),%edx
 92a:	89 11                	mov    %edx,(%ecx)
 92c:	eb eb                	jmp    919 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92e:	89 c1                	mov    %eax,%ecx
 930:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 932:	8b 50 04             	mov    0x4(%eax),%edx
 935:	39 da                	cmp    %ebx,%edx
 937:	73 d3                	jae    90c <malloc+0x4a>
    if(p == freep)
 939:	39 05 a0 0d 00 00    	cmp    %eax,0xda0
 93f:	75 ed                	jne    92e <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 941:	89 d8                	mov    %ebx,%eax
 943:	e8 2a ff ff ff       	call   872 <morecore>
 948:	85 c0                	test   %eax,%eax
 94a:	75 e2                	jne    92e <malloc+0x6c>
 94c:	eb d4                	jmp    922 <malloc+0x60>
