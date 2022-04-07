
_test_10:     file format elf32-i386


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
   int arg1_int = *(int*)arg1;
   int arg2_int = *(int*)arg2;
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   d:	8b 10                	mov    (%eax),%edx
   assert(arg1_int == 35);
   f:	8b 45 08             	mov    0x8(%ebp),%eax
  12:	83 38 23             	cmpl   $0x23,(%eax)
  15:	75 60                	jne    77 <worker+0x77>
   assert(arg2_int == 42);
  17:	83 fa 2a             	cmp    $0x2a,%edx
  1a:	0f 85 a0 00 00 00    	jne    c0 <worker+0xc0>
   assert(global == 1);
  20:	a1 a0 0d 00 00       	mov    0xda0,%eax
  25:	83 f8 01             	cmp    $0x1,%eax
  28:	0f 84 db 00 00 00    	je     109 <worker+0x109>
  2e:	6a 2f                	push   $0x2f
  30:	68 88 09 00 00       	push   $0x988
  35:	68 92 09 00 00       	push   $0x992
  3a:	6a 01                	push   $0x1
  3c:	e8 8a 06 00 00       	call   6cb <printf>
  41:	83 c4 0c             	add    $0xc,%esp
  44:	68 d9 09 00 00       	push   $0x9d9
  49:	68 a9 09 00 00       	push   $0x9a9
  4e:	6a 01                	push   $0x1
  50:	e8 76 06 00 00       	call   6cb <printf>
  55:	83 c4 08             	add    $0x8,%esp
  58:	68 bd 09 00 00       	push   $0x9bd
  5d:	6a 01                	push   $0x1
  5f:	e8 67 06 00 00       	call   6cb <printf>
  64:	83 c4 04             	add    $0x4,%esp
  67:	ff 35 cc 0d 00 00    	pushl  0xdcc
  6d:	e8 48 05 00 00       	call   5ba <kill>
  72:	e8 0b 05 00 00       	call   582 <exit>
   assert(arg1_int == 35);
  77:	6a 2d                	push   $0x2d
  79:	68 88 09 00 00       	push   $0x988
  7e:	68 92 09 00 00       	push   $0x992
  83:	6a 01                	push   $0x1
  85:	e8 41 06 00 00       	call   6cb <printf>
  8a:	83 c4 0c             	add    $0xc,%esp
  8d:	68 9a 09 00 00       	push   $0x99a
  92:	68 a9 09 00 00       	push   $0x9a9
  97:	6a 01                	push   $0x1
  99:	e8 2d 06 00 00       	call   6cb <printf>
  9e:	83 c4 08             	add    $0x8,%esp
  a1:	68 bd 09 00 00       	push   $0x9bd
  a6:	6a 01                	push   $0x1
  a8:	e8 1e 06 00 00       	call   6cb <printf>
  ad:	83 c4 04             	add    $0x4,%esp
  b0:	ff 35 cc 0d 00 00    	pushl  0xdcc
  b6:	e8 ff 04 00 00       	call   5ba <kill>
  bb:	e8 c2 04 00 00       	call   582 <exit>
   assert(arg2_int == 42);
  c0:	6a 2e                	push   $0x2e
  c2:	68 88 09 00 00       	push   $0x988
  c7:	68 92 09 00 00       	push   $0x992
  cc:	6a 01                	push   $0x1
  ce:	e8 f8 05 00 00       	call   6cb <printf>
  d3:	83 c4 0c             	add    $0xc,%esp
  d6:	68 ca 09 00 00       	push   $0x9ca
  db:	68 a9 09 00 00       	push   $0x9a9
  e0:	6a 01                	push   $0x1
  e2:	e8 e4 05 00 00       	call   6cb <printf>
  e7:	83 c4 08             	add    $0x8,%esp
  ea:	68 bd 09 00 00       	push   $0x9bd
  ef:	6a 01                	push   $0x1
  f1:	e8 d5 05 00 00       	call   6cb <printf>
  f6:	83 c4 04             	add    $0x4,%esp
  f9:	ff 35 cc 0d 00 00    	pushl  0xdcc
  ff:	e8 b6 04 00 00       	call   5ba <kill>
 104:	e8 79 04 00 00       	call   582 <exit>
   global++;
 109:	83 c0 01             	add    $0x1,%eax
 10c:	a3 a0 0d 00 00       	mov    %eax,0xda0
   exit();
 111:	e8 6c 04 00 00       	call   582 <exit>

00000116 <main>:
{
 116:	f3 0f 1e fb          	endbr32 
 11a:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 11e:	83 e4 f0             	and    $0xfffffff0,%esp
 121:	ff 71 fc             	pushl  -0x4(%ecx)
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	53                   	push   %ebx
 128:	51                   	push   %ecx
 129:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 12c:	e8 d9 04 00 00       	call   60a <getpid>
 131:	a3 cc 0d 00 00       	mov    %eax,0xdcc
   int arg1 = 35;
 136:	c7 45 f4 23 00 00 00 	movl   $0x23,-0xc(%ebp)
   int arg2 = 42;
 13d:	c7 45 f0 2a 00 00 00 	movl   $0x2a,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 144:	83 ec 04             	sub    $0x4,%esp
 147:	8d 45 f0             	lea    -0x10(%ebp),%eax
 14a:	50                   	push   %eax
 14b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 14e:	50                   	push   %eax
 14f:	68 00 00 00 00       	push   $0x0
 154:	e8 c7 02 00 00       	call   420 <thread_create>
   assert(thread_pid > 0);
 159:	83 c4 10             	add    $0x10,%esp
 15c:	85 c0                	test   %eax,%eax
 15e:	7e 65                	jle    1c5 <main+0xaf>
 160:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 162:	e8 46 03 00 00       	call   4ad <thread_join>
   assert(join_pid == thread_pid);
 167:	39 c3                	cmp    %eax,%ebx
 169:	0f 85 9f 00 00 00    	jne    20e <main+0xf8>
   assert(global == 2);
 16f:	83 3d a0 0d 00 00 02 	cmpl   $0x2,0xda0
 176:	0f 84 db 00 00 00    	je     257 <main+0x141>
 17c:	6a 23                	push   $0x23
 17e:	68 88 09 00 00       	push   $0x988
 183:	68 92 09 00 00       	push   $0x992
 188:	6a 01                	push   $0x1
 18a:	e8 3c 05 00 00       	call   6cb <printf>
 18f:	83 c4 0c             	add    $0xc,%esp
 192:	68 0b 0a 00 00       	push   $0xa0b
 197:	68 a9 09 00 00       	push   $0x9a9
 19c:	6a 01                	push   $0x1
 19e:	e8 28 05 00 00       	call   6cb <printf>
 1a3:	83 c4 08             	add    $0x8,%esp
 1a6:	68 bd 09 00 00       	push   $0x9bd
 1ab:	6a 01                	push   $0x1
 1ad:	e8 19 05 00 00       	call   6cb <printf>
 1b2:	83 c4 04             	add    $0x4,%esp
 1b5:	ff 35 cc 0d 00 00    	pushl  0xdcc
 1bb:	e8 fa 03 00 00       	call   5ba <kill>
 1c0:	e8 bd 03 00 00       	call   582 <exit>
   assert(thread_pid > 0);
 1c5:	6a 1f                	push   $0x1f
 1c7:	68 88 09 00 00       	push   $0x988
 1cc:	68 92 09 00 00       	push   $0x992
 1d1:	6a 01                	push   $0x1
 1d3:	e8 f3 04 00 00       	call   6cb <printf>
 1d8:	83 c4 0c             	add    $0xc,%esp
 1db:	68 e5 09 00 00       	push   $0x9e5
 1e0:	68 a9 09 00 00       	push   $0x9a9
 1e5:	6a 01                	push   $0x1
 1e7:	e8 df 04 00 00       	call   6cb <printf>
 1ec:	83 c4 08             	add    $0x8,%esp
 1ef:	68 bd 09 00 00       	push   $0x9bd
 1f4:	6a 01                	push   $0x1
 1f6:	e8 d0 04 00 00       	call   6cb <printf>
 1fb:	83 c4 04             	add    $0x4,%esp
 1fe:	ff 35 cc 0d 00 00    	pushl  0xdcc
 204:	e8 b1 03 00 00       	call   5ba <kill>
 209:	e8 74 03 00 00       	call   582 <exit>
   assert(join_pid == thread_pid);
 20e:	6a 22                	push   $0x22
 210:	68 88 09 00 00       	push   $0x988
 215:	68 92 09 00 00       	push   $0x992
 21a:	6a 01                	push   $0x1
 21c:	e8 aa 04 00 00       	call   6cb <printf>
 221:	83 c4 0c             	add    $0xc,%esp
 224:	68 f4 09 00 00       	push   $0x9f4
 229:	68 a9 09 00 00       	push   $0x9a9
 22e:	6a 01                	push   $0x1
 230:	e8 96 04 00 00       	call   6cb <printf>
 235:	83 c4 08             	add    $0x8,%esp
 238:	68 bd 09 00 00       	push   $0x9bd
 23d:	6a 01                	push   $0x1
 23f:	e8 87 04 00 00       	call   6cb <printf>
 244:	83 c4 04             	add    $0x4,%esp
 247:	ff 35 cc 0d 00 00    	pushl  0xdcc
 24d:	e8 68 03 00 00       	call   5ba <kill>
 252:	e8 2b 03 00 00       	call   582 <exit>
   printf(1, "TEST PASSED\n");
 257:	83 ec 08             	sub    $0x8,%esp
 25a:	68 17 0a 00 00       	push   $0xa17
 25f:	6a 01                	push   $0x1
 261:	e8 65 04 00 00       	call   6cb <printf>
   exit();
 266:	e8 17 03 00 00       	call   582 <exit>

0000026b <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 26b:	f3 0f 1e fb          	endbr32 
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	56                   	push   %esi
 273:	53                   	push   %ebx
 274:	8b 75 08             	mov    0x8(%ebp),%esi
 277:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 27a:	89 f0                	mov    %esi,%eax
 27c:	89 d1                	mov    %edx,%ecx
 27e:	83 c2 01             	add    $0x1,%edx
 281:	89 c3                	mov    %eax,%ebx
 283:	83 c0 01             	add    $0x1,%eax
 286:	0f b6 09             	movzbl (%ecx),%ecx
 289:	88 0b                	mov    %cl,(%ebx)
 28b:	84 c9                	test   %cl,%cl
 28d:	75 ed                	jne    27c <strcpy+0x11>
    ;
  return os;
}
 28f:	89 f0                	mov    %esi,%eax
 291:	5b                   	pop    %ebx
 292:	5e                   	pop    %esi
 293:	5d                   	pop    %ebp
 294:	c3                   	ret    

00000295 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 295:	f3 0f 1e fb          	endbr32 
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
 29c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 29f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2a2:	0f b6 01             	movzbl (%ecx),%eax
 2a5:	84 c0                	test   %al,%al
 2a7:	74 0c                	je     2b5 <strcmp+0x20>
 2a9:	3a 02                	cmp    (%edx),%al
 2ab:	75 08                	jne    2b5 <strcmp+0x20>
    p++, q++;
 2ad:	83 c1 01             	add    $0x1,%ecx
 2b0:	83 c2 01             	add    $0x1,%edx
 2b3:	eb ed                	jmp    2a2 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 2b5:	0f b6 c0             	movzbl %al,%eax
 2b8:	0f b6 12             	movzbl (%edx),%edx
 2bb:	29 d0                	sub    %edx,%eax
}
 2bd:	5d                   	pop    %ebp
 2be:	c3                   	ret    

000002bf <strlen>:

uint
strlen(const char *s)
{
 2bf:	f3 0f 1e fb          	endbr32 
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2c9:	b8 00 00 00 00       	mov    $0x0,%eax
 2ce:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2d2:	74 05                	je     2d9 <strlen+0x1a>
 2d4:	83 c0 01             	add    $0x1,%eax
 2d7:	eb f5                	jmp    2ce <strlen+0xf>
    ;
  return n;
}
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <memset>:

void*
memset(void *dst, int c, uint n)
{
 2db:	f3 0f 1e fb          	endbr32 
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	57                   	push   %edi
 2e3:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2e6:	89 d7                	mov    %edx,%edi
 2e8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ee:	fc                   	cld    
 2ef:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2f1:	89 d0                	mov    %edx,%eax
 2f3:	5f                   	pop    %edi
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret    

000002f6 <strchr>:

char*
strchr(const char *s, char c)
{
 2f6:	f3 0f 1e fb          	endbr32 
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	8b 45 08             	mov    0x8(%ebp),%eax
 300:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 304:	0f b6 10             	movzbl (%eax),%edx
 307:	84 d2                	test   %dl,%dl
 309:	74 09                	je     314 <strchr+0x1e>
    if(*s == c)
 30b:	38 ca                	cmp    %cl,%dl
 30d:	74 0a                	je     319 <strchr+0x23>
  for(; *s; s++)
 30f:	83 c0 01             	add    $0x1,%eax
 312:	eb f0                	jmp    304 <strchr+0xe>
      return (char*)s;
  return 0;
 314:	b8 00 00 00 00       	mov    $0x0,%eax
}
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    

0000031b <gets>:

char*
gets(char *buf, int max)
{
 31b:	f3 0f 1e fb          	endbr32 
 31f:	55                   	push   %ebp
 320:	89 e5                	mov    %esp,%ebp
 322:	57                   	push   %edi
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	83 ec 1c             	sub    $0x1c,%esp
 328:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32b:	bb 00 00 00 00       	mov    $0x0,%ebx
 330:	89 de                	mov    %ebx,%esi
 332:	83 c3 01             	add    $0x1,%ebx
 335:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 338:	7d 2e                	jge    368 <gets+0x4d>
    cc = read(0, &c, 1);
 33a:	83 ec 04             	sub    $0x4,%esp
 33d:	6a 01                	push   $0x1
 33f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 342:	50                   	push   %eax
 343:	6a 00                	push   $0x0
 345:	e8 58 02 00 00       	call   5a2 <read>
    if(cc < 1)
 34a:	83 c4 10             	add    $0x10,%esp
 34d:	85 c0                	test   %eax,%eax
 34f:	7e 17                	jle    368 <gets+0x4d>
      break;
    buf[i++] = c;
 351:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 355:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 358:	3c 0a                	cmp    $0xa,%al
 35a:	0f 94 c2             	sete   %dl
 35d:	3c 0d                	cmp    $0xd,%al
 35f:	0f 94 c0             	sete   %al
 362:	08 c2                	or     %al,%dl
 364:	74 ca                	je     330 <gets+0x15>
    buf[i++] = c;
 366:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 368:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 36c:	89 f8                	mov    %edi,%eax
 36e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 371:	5b                   	pop    %ebx
 372:	5e                   	pop    %esi
 373:	5f                   	pop    %edi
 374:	5d                   	pop    %ebp
 375:	c3                   	ret    

00000376 <stat>:

int
stat(const char *n, struct stat *st)
{
 376:	f3 0f 1e fb          	endbr32 
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	56                   	push   %esi
 37e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 37f:	83 ec 08             	sub    $0x8,%esp
 382:	6a 00                	push   $0x0
 384:	ff 75 08             	pushl  0x8(%ebp)
 387:	e8 3e 02 00 00       	call   5ca <open>
  if(fd < 0)
 38c:	83 c4 10             	add    $0x10,%esp
 38f:	85 c0                	test   %eax,%eax
 391:	78 24                	js     3b7 <stat+0x41>
 393:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 395:	83 ec 08             	sub    $0x8,%esp
 398:	ff 75 0c             	pushl  0xc(%ebp)
 39b:	50                   	push   %eax
 39c:	e8 41 02 00 00       	call   5e2 <fstat>
 3a1:	89 c6                	mov    %eax,%esi
  close(fd);
 3a3:	89 1c 24             	mov    %ebx,(%esp)
 3a6:	e8 07 02 00 00       	call   5b2 <close>
  return r;
 3ab:	83 c4 10             	add    $0x10,%esp
}
 3ae:	89 f0                	mov    %esi,%eax
 3b0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3b3:	5b                   	pop    %ebx
 3b4:	5e                   	pop    %esi
 3b5:	5d                   	pop    %ebp
 3b6:	c3                   	ret    
    return -1;
 3b7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3bc:	eb f0                	jmp    3ae <stat+0x38>

000003be <atoi>:

int
atoi(const char *s)
{
 3be:	f3 0f 1e fb          	endbr32 
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	53                   	push   %ebx
 3c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3c9:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3ce:	0f b6 01             	movzbl (%ecx),%eax
 3d1:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3d4:	80 fb 09             	cmp    $0x9,%bl
 3d7:	77 12                	ja     3eb <atoi+0x2d>
    n = n*10 + *s++ - '0';
 3d9:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3dc:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3df:	83 c1 01             	add    $0x1,%ecx
 3e2:	0f be c0             	movsbl %al,%eax
 3e5:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 3e9:	eb e3                	jmp    3ce <atoi+0x10>
  return n;
}
 3eb:	89 d0                	mov    %edx,%eax
 3ed:	5b                   	pop    %ebx
 3ee:	5d                   	pop    %ebp
 3ef:	c3                   	ret    

000003f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f0:	f3 0f 1e fb          	endbr32 
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	56                   	push   %esi
 3f8:	53                   	push   %ebx
 3f9:	8b 75 08             	mov    0x8(%ebp),%esi
 3fc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3ff:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 402:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 404:	8d 58 ff             	lea    -0x1(%eax),%ebx
 407:	85 c0                	test   %eax,%eax
 409:	7e 0f                	jle    41a <memmove+0x2a>
    *dst++ = *src++;
 40b:	0f b6 01             	movzbl (%ecx),%eax
 40e:	88 02                	mov    %al,(%edx)
 410:	8d 49 01             	lea    0x1(%ecx),%ecx
 413:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 416:	89 d8                	mov    %ebx,%eax
 418:	eb ea                	jmp    404 <memmove+0x14>
  return vdst;
}
 41a:	89 f0                	mov    %esi,%eax
 41c:	5b                   	pop    %ebx
 41d:	5e                   	pop    %esi
 41e:	5d                   	pop    %ebp
 41f:	c3                   	ret    

00000420 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	53                   	push   %ebx
 428:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 42b:	68 00 20 00 00       	push   $0x2000
 430:	e8 c7 04 00 00       	call   8fc <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 435:	83 c4 10             	add    $0x10,%esp
 438:	89 c2                	mov    %eax,%edx
 43a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 440:	74 22                	je     464 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 442:	b9 00 10 00 00       	mov    $0x1000,%ecx
 447:	29 d1                	sub    %edx,%ecx
 449:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 44b:	ba 00 00 00 00       	mov    $0x0,%edx
 450:	83 fa 3f             	cmp    $0x3f,%edx
 453:	7f 13                	jg     468 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 455:	83 3c 95 e0 10 00 00 	cmpl   $0x1,0x10e0(,%edx,4)
 45c:	01 
 45d:	75 09                	jne    468 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 45f:	83 c2 01             	add    $0x1,%edx
 462:	eb ec                	jmp    450 <thread_create+0x30>
  void *user_stack = curr_ptr;
 464:	89 c1                	mov    %eax,%ecx
 466:	eb e3                	jmp    44b <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 468:	83 3c 95 e0 10 00 00 	cmpl   $0x1,0x10e0(,%edx,4)
 46f:	01 
 470:	74 34                	je     4a6 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 472:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 475:	c1 e3 02             	shl    $0x2,%ebx
 478:	89 83 e0 0d 00 00    	mov    %eax,0xde0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 47e:	89 8b e4 0d 00 00    	mov    %ecx,0xde4(%ebx)
  cell_full[i] = 1;
 484:	c7 04 95 e0 10 00 00 	movl   $0x1,0x10e0(,%edx,4)
 48b:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 48f:	ff 75 10             	pushl  0x10(%ebp)
 492:	ff 75 0c             	pushl  0xc(%ebp)
 495:	ff 75 08             	pushl  0x8(%ebp)
 498:	51                   	push   %ecx
 499:	e8 dc 00 00 00       	call   57a <clone>
 49e:	83 c4 10             	add    $0x10,%esp
}
 4a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4a4:	c9                   	leave  
 4a5:	c3                   	ret    
    return -1;
 4a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4ab:	eb f4                	jmp    4a1 <thread_create+0x81>

000004ad <thread_join>:

int thread_join(){
 4ad:	f3 0f 1e fb          	endbr32 
 4b1:	55                   	push   %ebp
 4b2:	89 e5                	mov    %esp,%ebp
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 4b9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bc:	50                   	push   %eax
 4bd:	e8 d0 00 00 00       	call   592 <join>
 4c2:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 4c4:	83 c4 10             	add    $0x10,%esp
 4c7:	bb 00 00 00 00       	mov    $0x0,%ebx
 4cc:	83 fb 3f             	cmp    $0x3f,%ebx
 4cf:	7f 14                	jg     4e5 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 4d1:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 4d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d7:	39 14 85 e4 0d 00 00 	cmp    %edx,0xde4(,%eax,4)
 4de:	74 05                	je     4e5 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 4e0:	83 c3 01             	add    $0x1,%ebx
 4e3:	eb e7                	jmp    4cc <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 4e5:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 4e8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4eb:	39 0c 85 e4 0d 00 00 	cmp    %ecx,0xde4(,%eax,4)
 4f2:	75 26                	jne    51a <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 4f4:	83 ec 0c             	sub    $0xc,%esp
 4f7:	ff 34 85 e0 0d 00 00 	pushl  0xde0(,%eax,4)
 4fe:	e8 35 03 00 00       	call   838 <free>
  cell_full[i] = 0;
 503:	c7 04 9d e0 10 00 00 	movl   $0x0,0x10e0(,%ebx,4)
 50a:	00 00 00 00 

  return out;
 50e:	83 c4 10             	add    $0x10,%esp
}
 511:	89 f0                	mov    %esi,%eax
 513:	8d 65 f8             	lea    -0x8(%ebp),%esp
 516:	5b                   	pop    %ebx
 517:	5e                   	pop    %esi
 518:	5d                   	pop    %ebp
 519:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 51a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 51f:	eb f0                	jmp    511 <thread_join+0x64>

00000521 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 521:	f3 0f 1e fb          	endbr32 
 525:	55                   	push   %ebp
 526:	89 e5                	mov    %esp,%ebp
 528:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 52b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 531:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 538:	5d                   	pop    %ebp
 539:	c3                   	ret    

0000053a <lock_acquire>:

void lock_acquire(lock_t *lock) {
 53a:	f3 0f 1e fb          	endbr32 
 53e:	55                   	push   %ebp
 53f:	89 e5                	mov    %esp,%ebp
 541:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 544:	b9 01 00 00 00       	mov    $0x1,%ecx
 549:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 54d:	b8 00 00 00 00       	mov    $0x0,%eax
 552:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 557:	39 c1                	cmp    %eax,%ecx
 559:	75 f2                	jne    54d <lock_acquire+0x13>
      ; // spin
    }
}
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    

0000055d <lock_release>:

void lock_release(lock_t *lock) {
 55d:	f3 0f 1e fb          	endbr32 
 561:	55                   	push   %ebp
 562:	89 e5                	mov    %esp,%ebp
 564:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 567:	8b 42 04             	mov    0x4(%edx),%eax
 56a:	83 c0 01             	add    $0x1,%eax
 56d:	89 42 04             	mov    %eax,0x4(%edx)
}
 570:	5d                   	pop    %ebp
 571:	c3                   	ret    

00000572 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 572:	b8 01 00 00 00       	mov    $0x1,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <clone>:
SYSCALL(clone)
 57a:	b8 16 00 00 00       	mov    $0x16,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <exit>:
SYSCALL(exit)
 582:	b8 02 00 00 00       	mov    $0x2,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <wait>:
SYSCALL(wait)
 58a:	b8 03 00 00 00       	mov    $0x3,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <join>:
SYSCALL(join)
 592:	b8 17 00 00 00       	mov    $0x17,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <pipe>:
SYSCALL(pipe)
 59a:	b8 04 00 00 00       	mov    $0x4,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <read>:
SYSCALL(read)
 5a2:	b8 05 00 00 00       	mov    $0x5,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <write>:
SYSCALL(write)
 5aa:	b8 10 00 00 00       	mov    $0x10,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <close>:
SYSCALL(close)
 5b2:	b8 15 00 00 00       	mov    $0x15,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <kill>:
SYSCALL(kill)
 5ba:	b8 06 00 00 00       	mov    $0x6,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <exec>:
SYSCALL(exec)
 5c2:	b8 07 00 00 00       	mov    $0x7,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <open>:
SYSCALL(open)
 5ca:	b8 0f 00 00 00       	mov    $0xf,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <mknod>:
SYSCALL(mknod)
 5d2:	b8 11 00 00 00       	mov    $0x11,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <unlink>:
SYSCALL(unlink)
 5da:	b8 12 00 00 00       	mov    $0x12,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <fstat>:
SYSCALL(fstat)
 5e2:	b8 08 00 00 00       	mov    $0x8,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <link>:
SYSCALL(link)
 5ea:	b8 13 00 00 00       	mov    $0x13,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <mkdir>:
SYSCALL(mkdir)
 5f2:	b8 14 00 00 00       	mov    $0x14,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <chdir>:
SYSCALL(chdir)
 5fa:	b8 09 00 00 00       	mov    $0x9,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <dup>:
SYSCALL(dup)
 602:	b8 0a 00 00 00       	mov    $0xa,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <getpid>:
SYSCALL(getpid)
 60a:	b8 0b 00 00 00       	mov    $0xb,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <sbrk>:
SYSCALL(sbrk)
 612:	b8 0c 00 00 00       	mov    $0xc,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <sleep>:
SYSCALL(sleep)
 61a:	b8 0d 00 00 00       	mov    $0xd,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <uptime>:
SYSCALL(uptime)
 622:	b8 0e 00 00 00       	mov    $0xe,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	83 ec 1c             	sub    $0x1c,%esp
 630:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 633:	6a 01                	push   $0x1
 635:	8d 55 f4             	lea    -0xc(%ebp),%edx
 638:	52                   	push   %edx
 639:	50                   	push   %eax
 63a:	e8 6b ff ff ff       	call   5aa <write>
}
 63f:	83 c4 10             	add    $0x10,%esp
 642:	c9                   	leave  
 643:	c3                   	ret    

00000644 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 2c             	sub    $0x2c,%esp
 64d:	89 45 d0             	mov    %eax,-0x30(%ebp)
 650:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 652:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 656:	0f 95 c2             	setne  %dl
 659:	89 f0                	mov    %esi,%eax
 65b:	c1 e8 1f             	shr    $0x1f,%eax
 65e:	84 c2                	test   %al,%dl
 660:	74 42                	je     6a4 <printint+0x60>
    neg = 1;
    x = -xx;
 662:	f7 de                	neg    %esi
    neg = 1;
 664:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 66b:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 670:	89 f0                	mov    %esi,%eax
 672:	ba 00 00 00 00       	mov    $0x0,%edx
 677:	f7 f1                	div    %ecx
 679:	89 df                	mov    %ebx,%edi
 67b:	83 c3 01             	add    $0x1,%ebx
 67e:	0f b6 92 2c 0a 00 00 	movzbl 0xa2c(%edx),%edx
 685:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 689:	89 f2                	mov    %esi,%edx
 68b:	89 c6                	mov    %eax,%esi
 68d:	39 d1                	cmp    %edx,%ecx
 68f:	76 df                	jbe    670 <printint+0x2c>
  if(neg)
 691:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 695:	74 2f                	je     6c6 <printint+0x82>
    buf[i++] = '-';
 697:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 69c:	8d 5f 02             	lea    0x2(%edi),%ebx
 69f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6a2:	eb 15                	jmp    6b9 <printint+0x75>
  neg = 0;
 6a4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6ab:	eb be                	jmp    66b <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 6ad:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6b2:	89 f0                	mov    %esi,%eax
 6b4:	e8 71 ff ff ff       	call   62a <putc>
  while(--i >= 0)
 6b9:	83 eb 01             	sub    $0x1,%ebx
 6bc:	79 ef                	jns    6ad <printint+0x69>
}
 6be:	83 c4 2c             	add    $0x2c,%esp
 6c1:	5b                   	pop    %ebx
 6c2:	5e                   	pop    %esi
 6c3:	5f                   	pop    %edi
 6c4:	5d                   	pop    %ebp
 6c5:	c3                   	ret    
 6c6:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6c9:	eb ee                	jmp    6b9 <printint+0x75>

000006cb <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6cb:	f3 0f 1e fb          	endbr32 
 6cf:	55                   	push   %ebp
 6d0:	89 e5                	mov    %esp,%ebp
 6d2:	57                   	push   %edi
 6d3:	56                   	push   %esi
 6d4:	53                   	push   %ebx
 6d5:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6d8:	8d 45 10             	lea    0x10(%ebp),%eax
 6db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6de:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6e3:	bb 00 00 00 00       	mov    $0x0,%ebx
 6e8:	eb 14                	jmp    6fe <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6ea:	89 fa                	mov    %edi,%edx
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	e8 36 ff ff ff       	call   62a <putc>
 6f4:	eb 05                	jmp    6fb <printf+0x30>
      }
    } else if(state == '%'){
 6f6:	83 fe 25             	cmp    $0x25,%esi
 6f9:	74 25                	je     720 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 6fb:	83 c3 01             	add    $0x1,%ebx
 6fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 701:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 705:	84 c0                	test   %al,%al
 707:	0f 84 23 01 00 00    	je     830 <printf+0x165>
    c = fmt[i] & 0xff;
 70d:	0f be f8             	movsbl %al,%edi
 710:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 713:	85 f6                	test   %esi,%esi
 715:	75 df                	jne    6f6 <printf+0x2b>
      if(c == '%'){
 717:	83 f8 25             	cmp    $0x25,%eax
 71a:	75 ce                	jne    6ea <printf+0x1f>
        state = '%';
 71c:	89 c6                	mov    %eax,%esi
 71e:	eb db                	jmp    6fb <printf+0x30>
      if(c == 'd'){
 720:	83 f8 64             	cmp    $0x64,%eax
 723:	74 49                	je     76e <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 725:	83 f8 78             	cmp    $0x78,%eax
 728:	0f 94 c1             	sete   %cl
 72b:	83 f8 70             	cmp    $0x70,%eax
 72e:	0f 94 c2             	sete   %dl
 731:	08 d1                	or     %dl,%cl
 733:	75 63                	jne    798 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 735:	83 f8 73             	cmp    $0x73,%eax
 738:	0f 84 84 00 00 00    	je     7c2 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 73e:	83 f8 63             	cmp    $0x63,%eax
 741:	0f 84 b7 00 00 00    	je     7fe <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 747:	83 f8 25             	cmp    $0x25,%eax
 74a:	0f 84 cc 00 00 00    	je     81c <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 750:	ba 25 00 00 00       	mov    $0x25,%edx
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	e8 cd fe ff ff       	call   62a <putc>
        putc(fd, c);
 75d:	89 fa                	mov    %edi,%edx
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	e8 c3 fe ff ff       	call   62a <putc>
      }
      state = 0;
 767:	be 00 00 00 00       	mov    $0x0,%esi
 76c:	eb 8d                	jmp    6fb <printf+0x30>
        printint(fd, *ap, 10, 1);
 76e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 771:	8b 17                	mov    (%edi),%edx
 773:	83 ec 0c             	sub    $0xc,%esp
 776:	6a 01                	push   $0x1
 778:	b9 0a 00 00 00       	mov    $0xa,%ecx
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	e8 bf fe ff ff       	call   644 <printint>
        ap++;
 785:	83 c7 04             	add    $0x4,%edi
 788:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 78b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 78e:	be 00 00 00 00       	mov    $0x0,%esi
 793:	e9 63 ff ff ff       	jmp    6fb <printf+0x30>
        printint(fd, *ap, 16, 0);
 798:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 79b:	8b 17                	mov    (%edi),%edx
 79d:	83 ec 0c             	sub    $0xc,%esp
 7a0:	6a 00                	push   $0x0
 7a2:	b9 10 00 00 00       	mov    $0x10,%ecx
 7a7:	8b 45 08             	mov    0x8(%ebp),%eax
 7aa:	e8 95 fe ff ff       	call   644 <printint>
        ap++;
 7af:	83 c7 04             	add    $0x4,%edi
 7b2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7b5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b8:	be 00 00 00 00       	mov    $0x0,%esi
 7bd:	e9 39 ff ff ff       	jmp    6fb <printf+0x30>
        s = (char*)*ap;
 7c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7c5:	8b 30                	mov    (%eax),%esi
        ap++;
 7c7:	83 c0 04             	add    $0x4,%eax
 7ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7cd:	85 f6                	test   %esi,%esi
 7cf:	75 28                	jne    7f9 <printf+0x12e>
          s = "(null)";
 7d1:	be 24 0a 00 00       	mov    $0xa24,%esi
 7d6:	8b 7d 08             	mov    0x8(%ebp),%edi
 7d9:	eb 0d                	jmp    7e8 <printf+0x11d>
          putc(fd, *s);
 7db:	0f be d2             	movsbl %dl,%edx
 7de:	89 f8                	mov    %edi,%eax
 7e0:	e8 45 fe ff ff       	call   62a <putc>
          s++;
 7e5:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7e8:	0f b6 16             	movzbl (%esi),%edx
 7eb:	84 d2                	test   %dl,%dl
 7ed:	75 ec                	jne    7db <printf+0x110>
      state = 0;
 7ef:	be 00 00 00 00       	mov    $0x0,%esi
 7f4:	e9 02 ff ff ff       	jmp    6fb <printf+0x30>
 7f9:	8b 7d 08             	mov    0x8(%ebp),%edi
 7fc:	eb ea                	jmp    7e8 <printf+0x11d>
        putc(fd, *ap);
 7fe:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 801:	0f be 17             	movsbl (%edi),%edx
 804:	8b 45 08             	mov    0x8(%ebp),%eax
 807:	e8 1e fe ff ff       	call   62a <putc>
        ap++;
 80c:	83 c7 04             	add    $0x4,%edi
 80f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 812:	be 00 00 00 00       	mov    $0x0,%esi
 817:	e9 df fe ff ff       	jmp    6fb <printf+0x30>
        putc(fd, c);
 81c:	89 fa                	mov    %edi,%edx
 81e:	8b 45 08             	mov    0x8(%ebp),%eax
 821:	e8 04 fe ff ff       	call   62a <putc>
      state = 0;
 826:	be 00 00 00 00       	mov    $0x0,%esi
 82b:	e9 cb fe ff ff       	jmp    6fb <printf+0x30>
    }
  }
}
 830:	8d 65 f4             	lea    -0xc(%ebp),%esp
 833:	5b                   	pop    %ebx
 834:	5e                   	pop    %esi
 835:	5f                   	pop    %edi
 836:	5d                   	pop    %ebp
 837:	c3                   	ret    

00000838 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 838:	f3 0f 1e fb          	endbr32 
 83c:	55                   	push   %ebp
 83d:	89 e5                	mov    %esp,%ebp
 83f:	57                   	push   %edi
 840:	56                   	push   %esi
 841:	53                   	push   %ebx
 842:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 845:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 848:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 84d:	eb 02                	jmp    851 <free+0x19>
 84f:	89 d0                	mov    %edx,%eax
 851:	39 c8                	cmp    %ecx,%eax
 853:	73 04                	jae    859 <free+0x21>
 855:	39 08                	cmp    %ecx,(%eax)
 857:	77 12                	ja     86b <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 859:	8b 10                	mov    (%eax),%edx
 85b:	39 c2                	cmp    %eax,%edx
 85d:	77 f0                	ja     84f <free+0x17>
 85f:	39 c8                	cmp    %ecx,%eax
 861:	72 08                	jb     86b <free+0x33>
 863:	39 ca                	cmp    %ecx,%edx
 865:	77 04                	ja     86b <free+0x33>
 867:	89 d0                	mov    %edx,%eax
 869:	eb e6                	jmp    851 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 86b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 86e:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 871:	8b 10                	mov    (%eax),%edx
 873:	39 d7                	cmp    %edx,%edi
 875:	74 19                	je     890 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 877:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 87a:	8b 50 04             	mov    0x4(%eax),%edx
 87d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 880:	39 ce                	cmp    %ecx,%esi
 882:	74 1b                	je     89f <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 884:	89 08                	mov    %ecx,(%eax)
  freep = p;
 886:	a3 c0 0d 00 00       	mov    %eax,0xdc0
}
 88b:	5b                   	pop    %ebx
 88c:	5e                   	pop    %esi
 88d:	5f                   	pop    %edi
 88e:	5d                   	pop    %ebp
 88f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 890:	03 72 04             	add    0x4(%edx),%esi
 893:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 896:	8b 10                	mov    (%eax),%edx
 898:	8b 12                	mov    (%edx),%edx
 89a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 89d:	eb db                	jmp    87a <free+0x42>
    p->s.size += bp->s.size;
 89f:	03 53 fc             	add    -0x4(%ebx),%edx
 8a2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8a5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a8:	89 10                	mov    %edx,(%eax)
 8aa:	eb da                	jmp    886 <free+0x4e>

000008ac <morecore>:

static Header*
morecore(uint nu)
{
 8ac:	55                   	push   %ebp
 8ad:	89 e5                	mov    %esp,%ebp
 8af:	53                   	push   %ebx
 8b0:	83 ec 04             	sub    $0x4,%esp
 8b3:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8b5:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8ba:	77 05                	ja     8c1 <morecore+0x15>
    nu = 4096;
 8bc:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8c1:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8c8:	83 ec 0c             	sub    $0xc,%esp
 8cb:	50                   	push   %eax
 8cc:	e8 41 fd ff ff       	call   612 <sbrk>
  if(p == (char*)-1)
 8d1:	83 c4 10             	add    $0x10,%esp
 8d4:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d7:	74 1c                	je     8f5 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8d9:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8dc:	83 c0 08             	add    $0x8,%eax
 8df:	83 ec 0c             	sub    $0xc,%esp
 8e2:	50                   	push   %eax
 8e3:	e8 50 ff ff ff       	call   838 <free>
  return freep;
 8e8:	a1 c0 0d 00 00       	mov    0xdc0,%eax
 8ed:	83 c4 10             	add    $0x10,%esp
}
 8f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8f3:	c9                   	leave  
 8f4:	c3                   	ret    
    return 0;
 8f5:	b8 00 00 00 00       	mov    $0x0,%eax
 8fa:	eb f4                	jmp    8f0 <morecore+0x44>

000008fc <malloc>:

void*
malloc(uint nbytes)
{
 8fc:	f3 0f 1e fb          	endbr32 
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	53                   	push   %ebx
 904:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 907:	8b 45 08             	mov    0x8(%ebp),%eax
 90a:	8d 58 07             	lea    0x7(%eax),%ebx
 90d:	c1 eb 03             	shr    $0x3,%ebx
 910:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 913:	8b 0d c0 0d 00 00    	mov    0xdc0,%ecx
 919:	85 c9                	test   %ecx,%ecx
 91b:	74 04                	je     921 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91d:	8b 01                	mov    (%ecx),%eax
 91f:	eb 4b                	jmp    96c <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 921:	c7 05 c0 0d 00 00 c4 	movl   $0xdc4,0xdc0
 928:	0d 00 00 
 92b:	c7 05 c4 0d 00 00 c4 	movl   $0xdc4,0xdc4
 932:	0d 00 00 
    base.s.size = 0;
 935:	c7 05 c8 0d 00 00 00 	movl   $0x0,0xdc8
 93c:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 93f:	b9 c4 0d 00 00       	mov    $0xdc4,%ecx
 944:	eb d7                	jmp    91d <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 946:	74 1a                	je     962 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 948:	29 da                	sub    %ebx,%edx
 94a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 94d:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 950:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 953:	89 0d c0 0d 00 00    	mov    %ecx,0xdc0
      return (void*)(p + 1);
 959:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 95c:	83 c4 04             	add    $0x4,%esp
 95f:	5b                   	pop    %ebx
 960:	5d                   	pop    %ebp
 961:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 962:	8b 10                	mov    (%eax),%edx
 964:	89 11                	mov    %edx,(%ecx)
 966:	eb eb                	jmp    953 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 968:	89 c1                	mov    %eax,%ecx
 96a:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 96c:	8b 50 04             	mov    0x4(%eax),%edx
 96f:	39 da                	cmp    %ebx,%edx
 971:	73 d3                	jae    946 <malloc+0x4a>
    if(p == freep)
 973:	39 05 c0 0d 00 00    	cmp    %eax,0xdc0
 979:	75 ed                	jne    968 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 97b:	89 d8                	mov    %ebx,%eax
 97d:	e8 2a ff ff ff       	call   8ac <morecore>
 982:	85 c0                	test   %eax,%eax
 984:	75 e2                	jne    968 <malloc+0x6c>
 986:	eb d4                	jmp    95c <malloc+0x60>
