
_test_2:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:
   free(p);
   exit();
}

void
worker(void *arg1, void *arg2) {
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	53                   	push   %ebx
   8:	83 ec 04             	sub    $0x4,%esp
   b:	8b 55 08             	mov    0x8(%ebp),%edx
   e:	8b 45 0c             	mov    0xc(%ebp),%eax
   int tmp1 = *(int*)arg1;
  11:	8b 0a                	mov    (%edx),%ecx
   int tmp2 = *(int*)arg2;
  13:	8b 18                	mov    (%eax),%ebx
   *(int*)arg1 = 44;
  15:	c7 02 2c 00 00 00    	movl   $0x2c,(%edx)
   *(int*)arg2 = 55;
  1b:	c7 00 37 00 00 00    	movl   $0x37,(%eax)
   assert(global == 1);
  21:	a1 e0 0d 00 00       	mov    0xde0,%eax
  26:	83 f8 01             	cmp    $0x1,%eax
  29:	74 49                	je     74 <worker+0x74>
  2b:	6a 38                	push   $0x38
  2d:	68 d0 09 00 00       	push   $0x9d0
  32:	68 d9 09 00 00       	push   $0x9d9
  37:	6a 01                	push   $0x1
  39:	e8 d5 06 00 00       	call   713 <printf>
  3e:	83 c4 0c             	add    $0xc,%esp
  41:	68 e1 09 00 00       	push   $0x9e1
  46:	68 ed 09 00 00       	push   $0x9ed
  4b:	6a 01                	push   $0x1
  4d:	e8 c1 06 00 00       	call   713 <printf>
  52:	83 c4 08             	add    $0x8,%esp
  55:	68 01 0a 00 00       	push   $0xa01
  5a:	6a 01                	push   $0x1
  5c:	e8 b2 06 00 00       	call   713 <printf>
  61:	83 c4 04             	add    $0x4,%esp
  64:	ff 35 0c 0e 00 00    	pushl  0xe0c
  6a:	e8 93 05 00 00       	call   602 <kill>
  6f:	e8 56 05 00 00       	call   5ca <exit>
   global = tmp1 + tmp2;
  74:	01 d9                	add    %ebx,%ecx
  76:	89 0d e0 0d 00 00    	mov    %ecx,0xde0
   exit();
  7c:	e8 49 05 00 00       	call   5ca <exit>

00000081 <main>:
{
  81:	f3 0f 1e fb          	endbr32 
  85:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	ff 71 fc             	pushl  -0x4(%ecx)
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	56                   	push   %esi
  93:	53                   	push   %ebx
  94:	51                   	push   %ecx
  95:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  98:	e8 b5 05 00 00       	call   652 <getpid>
  9d:	a3 0c 0e 00 00       	mov    %eax,0xe0c
   void *stack, *p = malloc(PGSIZE * 2);
  a2:	83 ec 0c             	sub    $0xc,%esp
  a5:	68 00 20 00 00       	push   $0x2000
  aa:	e8 95 08 00 00       	call   944 <malloc>
   assert(p != NULL);
  af:	83 c4 10             	add    $0x10,%esp
  b2:	85 c0                	test   %eax,%eax
  b4:	0f 84 a6 00 00 00    	je     160 <main+0xdf>
  ba:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  bc:	89 c2                	mov    %eax,%edx
  be:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  c4:	74 09                	je     cf <main+0x4e>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c6:	b8 00 10 00 00       	mov    $0x1000,%eax
  cb:	29 d0                	sub    %edx,%eax
  cd:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, (void*)&arg1, (void*)&arg2, stack);
  cf:	50                   	push   %eax
  d0:	68 e4 0d 00 00       	push   $0xde4
  d5:	68 e8 0d 00 00       	push   $0xde8
  da:	68 00 00 00 00       	push   $0x0
  df:	e8 de 04 00 00       	call   5c2 <clone>
  e4:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  e6:	83 c4 10             	add    $0x10,%esp
  e9:	85 c0                	test   %eax,%eax
  eb:	0f 8e b8 00 00 00    	jle    1a9 <main+0x128>
   while(global != 33);
  f1:	a1 e0 0d 00 00       	mov    0xde0,%eax
  f6:	83 f8 21             	cmp    $0x21,%eax
  f9:	75 f6                	jne    f1 <main+0x70>
   assert(arg1 == 44);
  fb:	a1 e8 0d 00 00       	mov    0xde8,%eax
 100:	83 f8 2c             	cmp    $0x2c,%eax
 103:	0f 85 e9 00 00 00    	jne    1f2 <main+0x171>
   assert(arg2 == 55);
 109:	a1 e4 0d 00 00       	mov    0xde4,%eax
 10e:	83 f8 37             	cmp    $0x37,%eax
 111:	0f 84 24 01 00 00    	je     23b <main+0x1ba>
 117:	6a 28                	push   $0x28
 119:	68 d0 09 00 00       	push   $0x9d0
 11e:	68 d9 09 00 00       	push   $0x9d9
 123:	6a 01                	push   $0x1
 125:	e8 e9 05 00 00       	call   713 <printf>
 12a:	83 c4 0c             	add    $0xc,%esp
 12d:	68 31 0a 00 00       	push   $0xa31
 132:	68 ed 09 00 00       	push   $0x9ed
 137:	6a 01                	push   $0x1
 139:	e8 d5 05 00 00       	call   713 <printf>
 13e:	83 c4 08             	add    $0x8,%esp
 141:	68 01 0a 00 00       	push   $0xa01
 146:	6a 01                	push   $0x1
 148:	e8 c6 05 00 00       	call   713 <printf>
 14d:	83 c4 04             	add    $0x4,%esp
 150:	ff 35 0c 0e 00 00    	pushl  0xe0c
 156:	e8 a7 04 00 00       	call   602 <kill>
 15b:	e8 6a 04 00 00       	call   5ca <exit>
   assert(p != NULL);
 160:	6a 1e                	push   $0x1e
 162:	68 d0 09 00 00       	push   $0x9d0
 167:	68 d9 09 00 00       	push   $0x9d9
 16c:	6a 01                	push   $0x1
 16e:	e8 a0 05 00 00       	call   713 <printf>
 173:	83 c4 0c             	add    $0xc,%esp
 176:	68 0e 0a 00 00       	push   $0xa0e
 17b:	68 ed 09 00 00       	push   $0x9ed
 180:	6a 01                	push   $0x1
 182:	e8 8c 05 00 00       	call   713 <printf>
 187:	83 c4 08             	add    $0x8,%esp
 18a:	68 01 0a 00 00       	push   $0xa01
 18f:	6a 01                	push   $0x1
 191:	e8 7d 05 00 00       	call   713 <printf>
 196:	83 c4 04             	add    $0x4,%esp
 199:	ff 35 0c 0e 00 00    	pushl  0xe0c
 19f:	e8 5e 04 00 00       	call   602 <kill>
 1a4:	e8 21 04 00 00       	call   5ca <exit>
   assert(clone_pid > 0);
 1a9:	6a 25                	push   $0x25
 1ab:	68 d0 09 00 00       	push   $0x9d0
 1b0:	68 d9 09 00 00       	push   $0x9d9
 1b5:	6a 01                	push   $0x1
 1b7:	e8 57 05 00 00       	call   713 <printf>
 1bc:	83 c4 0c             	add    $0xc,%esp
 1bf:	68 18 0a 00 00       	push   $0xa18
 1c4:	68 ed 09 00 00       	push   $0x9ed
 1c9:	6a 01                	push   $0x1
 1cb:	e8 43 05 00 00       	call   713 <printf>
 1d0:	83 c4 08             	add    $0x8,%esp
 1d3:	68 01 0a 00 00       	push   $0xa01
 1d8:	6a 01                	push   $0x1
 1da:	e8 34 05 00 00       	call   713 <printf>
 1df:	83 c4 04             	add    $0x4,%esp
 1e2:	ff 35 0c 0e 00 00    	pushl  0xe0c
 1e8:	e8 15 04 00 00       	call   602 <kill>
 1ed:	e8 d8 03 00 00       	call   5ca <exit>
   assert(arg1 == 44);
 1f2:	6a 27                	push   $0x27
 1f4:	68 d0 09 00 00       	push   $0x9d0
 1f9:	68 d9 09 00 00       	push   $0x9d9
 1fe:	6a 01                	push   $0x1
 200:	e8 0e 05 00 00       	call   713 <printf>
 205:	83 c4 0c             	add    $0xc,%esp
 208:	68 26 0a 00 00       	push   $0xa26
 20d:	68 ed 09 00 00       	push   $0x9ed
 212:	6a 01                	push   $0x1
 214:	e8 fa 04 00 00       	call   713 <printf>
 219:	83 c4 08             	add    $0x8,%esp
 21c:	68 01 0a 00 00       	push   $0xa01
 221:	6a 01                	push   $0x1
 223:	e8 eb 04 00 00       	call   713 <printf>
 228:	83 c4 04             	add    $0x4,%esp
 22b:	ff 35 0c 0e 00 00    	pushl  0xe0c
 231:	e8 cc 03 00 00       	call   602 <kill>
 236:	e8 8f 03 00 00       	call   5ca <exit>
   printf(1, "TEST PASSED\n");
 23b:	83 ec 08             	sub    $0x8,%esp
 23e:	68 3c 0a 00 00       	push   $0xa3c
 243:	6a 01                	push   $0x1
 245:	e8 c9 04 00 00       	call   713 <printf>
   int join_pid = join(&join_stack);
 24a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 24d:	89 04 24             	mov    %eax,(%esp)
 250:	e8 85 03 00 00       	call   5da <join>
   assert(join_pid == clone_pid);
 255:	83 c4 10             	add    $0x10,%esp
 258:	39 c6                	cmp    %eax,%esi
 25a:	74 49                	je     2a5 <main+0x224>
 25c:	6a 2d                	push   $0x2d
 25e:	68 d0 09 00 00       	push   $0x9d0
 263:	68 d9 09 00 00       	push   $0x9d9
 268:	6a 01                	push   $0x1
 26a:	e8 a4 04 00 00       	call   713 <printf>
 26f:	83 c4 0c             	add    $0xc,%esp
 272:	68 49 0a 00 00       	push   $0xa49
 277:	68 ed 09 00 00       	push   $0x9ed
 27c:	6a 01                	push   $0x1
 27e:	e8 90 04 00 00       	call   713 <printf>
 283:	83 c4 08             	add    $0x8,%esp
 286:	68 01 0a 00 00       	push   $0xa01
 28b:	6a 01                	push   $0x1
 28d:	e8 81 04 00 00       	call   713 <printf>
 292:	83 c4 04             	add    $0x4,%esp
 295:	ff 35 0c 0e 00 00    	pushl  0xe0c
 29b:	e8 62 03 00 00       	call   602 <kill>
 2a0:	e8 25 03 00 00       	call   5ca <exit>
   free(p);
 2a5:	83 ec 0c             	sub    $0xc,%esp
 2a8:	53                   	push   %ebx
 2a9:	e8 d2 05 00 00       	call   880 <free>
   exit();
 2ae:	e8 17 03 00 00       	call   5ca <exit>

000002b3 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 2b3:	f3 0f 1e fb          	endbr32 
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	56                   	push   %esi
 2bb:	53                   	push   %ebx
 2bc:	8b 75 08             	mov    0x8(%ebp),%esi
 2bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c2:	89 f0                	mov    %esi,%eax
 2c4:	89 d1                	mov    %edx,%ecx
 2c6:	83 c2 01             	add    $0x1,%edx
 2c9:	89 c3                	mov    %eax,%ebx
 2cb:	83 c0 01             	add    $0x1,%eax
 2ce:	0f b6 09             	movzbl (%ecx),%ecx
 2d1:	88 0b                	mov    %cl,(%ebx)
 2d3:	84 c9                	test   %cl,%cl
 2d5:	75 ed                	jne    2c4 <strcpy+0x11>
    ;
  return os;
}
 2d7:	89 f0                	mov    %esi,%eax
 2d9:	5b                   	pop    %ebx
 2da:	5e                   	pop    %esi
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    

000002dd <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2dd:	f3 0f 1e fb          	endbr32 
 2e1:	55                   	push   %ebp
 2e2:	89 e5                	mov    %esp,%ebp
 2e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2ea:	0f b6 01             	movzbl (%ecx),%eax
 2ed:	84 c0                	test   %al,%al
 2ef:	74 0c                	je     2fd <strcmp+0x20>
 2f1:	3a 02                	cmp    (%edx),%al
 2f3:	75 08                	jne    2fd <strcmp+0x20>
    p++, q++;
 2f5:	83 c1 01             	add    $0x1,%ecx
 2f8:	83 c2 01             	add    $0x1,%edx
 2fb:	eb ed                	jmp    2ea <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 2fd:	0f b6 c0             	movzbl %al,%eax
 300:	0f b6 12             	movzbl (%edx),%edx
 303:	29 d0                	sub    %edx,%eax
}
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    

00000307 <strlen>:

uint
strlen(const char *s)
{
 307:	f3 0f 1e fb          	endbr32 
 30b:	55                   	push   %ebp
 30c:	89 e5                	mov    %esp,%ebp
 30e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 311:	b8 00 00 00 00       	mov    $0x0,%eax
 316:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 31a:	74 05                	je     321 <strlen+0x1a>
 31c:	83 c0 01             	add    $0x1,%eax
 31f:	eb f5                	jmp    316 <strlen+0xf>
    ;
  return n;
}
 321:	5d                   	pop    %ebp
 322:	c3                   	ret    

00000323 <memset>:

void*
memset(void *dst, int c, uint n)
{
 323:	f3 0f 1e fb          	endbr32 
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	57                   	push   %edi
 32b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 32e:	89 d7                	mov    %edx,%edi
 330:	8b 4d 10             	mov    0x10(%ebp),%ecx
 333:	8b 45 0c             	mov    0xc(%ebp),%eax
 336:	fc                   	cld    
 337:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 339:	89 d0                	mov    %edx,%eax
 33b:	5f                   	pop    %edi
 33c:	5d                   	pop    %ebp
 33d:	c3                   	ret    

0000033e <strchr>:

char*
strchr(const char *s, char c)
{
 33e:	f3 0f 1e fb          	endbr32 
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 34c:	0f b6 10             	movzbl (%eax),%edx
 34f:	84 d2                	test   %dl,%dl
 351:	74 09                	je     35c <strchr+0x1e>
    if(*s == c)
 353:	38 ca                	cmp    %cl,%dl
 355:	74 0a                	je     361 <strchr+0x23>
  for(; *s; s++)
 357:	83 c0 01             	add    $0x1,%eax
 35a:	eb f0                	jmp    34c <strchr+0xe>
      return (char*)s;
  return 0;
 35c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    

00000363 <gets>:

char*
gets(char *buf, int max)
{
 363:	f3 0f 1e fb          	endbr32 
 367:	55                   	push   %ebp
 368:	89 e5                	mov    %esp,%ebp
 36a:	57                   	push   %edi
 36b:	56                   	push   %esi
 36c:	53                   	push   %ebx
 36d:	83 ec 1c             	sub    $0x1c,%esp
 370:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 373:	bb 00 00 00 00       	mov    $0x0,%ebx
 378:	89 de                	mov    %ebx,%esi
 37a:	83 c3 01             	add    $0x1,%ebx
 37d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 380:	7d 2e                	jge    3b0 <gets+0x4d>
    cc = read(0, &c, 1);
 382:	83 ec 04             	sub    $0x4,%esp
 385:	6a 01                	push   $0x1
 387:	8d 45 e7             	lea    -0x19(%ebp),%eax
 38a:	50                   	push   %eax
 38b:	6a 00                	push   $0x0
 38d:	e8 58 02 00 00       	call   5ea <read>
    if(cc < 1)
 392:	83 c4 10             	add    $0x10,%esp
 395:	85 c0                	test   %eax,%eax
 397:	7e 17                	jle    3b0 <gets+0x4d>
      break;
    buf[i++] = c;
 399:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 39d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3a0:	3c 0a                	cmp    $0xa,%al
 3a2:	0f 94 c2             	sete   %dl
 3a5:	3c 0d                	cmp    $0xd,%al
 3a7:	0f 94 c0             	sete   %al
 3aa:	08 c2                	or     %al,%dl
 3ac:	74 ca                	je     378 <gets+0x15>
    buf[i++] = c;
 3ae:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3b0:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3b4:	89 f8                	mov    %edi,%eax
 3b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b9:	5b                   	pop    %ebx
 3ba:	5e                   	pop    %esi
 3bb:	5f                   	pop    %edi
 3bc:	5d                   	pop    %ebp
 3bd:	c3                   	ret    

000003be <stat>:

int
stat(const char *n, struct stat *st)
{
 3be:	f3 0f 1e fb          	endbr32 
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
 3c5:	56                   	push   %esi
 3c6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c7:	83 ec 08             	sub    $0x8,%esp
 3ca:	6a 00                	push   $0x0
 3cc:	ff 75 08             	pushl  0x8(%ebp)
 3cf:	e8 3e 02 00 00       	call   612 <open>
  if(fd < 0)
 3d4:	83 c4 10             	add    $0x10,%esp
 3d7:	85 c0                	test   %eax,%eax
 3d9:	78 24                	js     3ff <stat+0x41>
 3db:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3dd:	83 ec 08             	sub    $0x8,%esp
 3e0:	ff 75 0c             	pushl  0xc(%ebp)
 3e3:	50                   	push   %eax
 3e4:	e8 41 02 00 00       	call   62a <fstat>
 3e9:	89 c6                	mov    %eax,%esi
  close(fd);
 3eb:	89 1c 24             	mov    %ebx,(%esp)
 3ee:	e8 07 02 00 00       	call   5fa <close>
  return r;
 3f3:	83 c4 10             	add    $0x10,%esp
}
 3f6:	89 f0                	mov    %esi,%eax
 3f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3fb:	5b                   	pop    %ebx
 3fc:	5e                   	pop    %esi
 3fd:	5d                   	pop    %ebp
 3fe:	c3                   	ret    
    return -1;
 3ff:	be ff ff ff ff       	mov    $0xffffffff,%esi
 404:	eb f0                	jmp    3f6 <stat+0x38>

00000406 <atoi>:

int
atoi(const char *s)
{
 406:	f3 0f 1e fb          	endbr32 
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	53                   	push   %ebx
 40e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 411:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 416:	0f b6 01             	movzbl (%ecx),%eax
 419:	8d 58 d0             	lea    -0x30(%eax),%ebx
 41c:	80 fb 09             	cmp    $0x9,%bl
 41f:	77 12                	ja     433 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 421:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 424:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 427:	83 c1 01             	add    $0x1,%ecx
 42a:	0f be c0             	movsbl %al,%eax
 42d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 431:	eb e3                	jmp    416 <atoi+0x10>
  return n;
}
 433:	89 d0                	mov    %edx,%eax
 435:	5b                   	pop    %ebx
 436:	5d                   	pop    %ebp
 437:	c3                   	ret    

00000438 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 438:	f3 0f 1e fb          	endbr32 
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	56                   	push   %esi
 440:	53                   	push   %ebx
 441:	8b 75 08             	mov    0x8(%ebp),%esi
 444:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 447:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 44a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 44c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 44f:	85 c0                	test   %eax,%eax
 451:	7e 0f                	jle    462 <memmove+0x2a>
    *dst++ = *src++;
 453:	0f b6 01             	movzbl (%ecx),%eax
 456:	88 02                	mov    %al,(%edx)
 458:	8d 49 01             	lea    0x1(%ecx),%ecx
 45b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 45e:	89 d8                	mov    %ebx,%eax
 460:	eb ea                	jmp    44c <memmove+0x14>
  return vdst;
}
 462:	89 f0                	mov    %esi,%eax
 464:	5b                   	pop    %ebx
 465:	5e                   	pop    %esi
 466:	5d                   	pop    %ebp
 467:	c3                   	ret    

00000468 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 468:	f3 0f 1e fb          	endbr32 
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	53                   	push   %ebx
 470:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 473:	68 00 20 00 00       	push   $0x2000
 478:	e8 c7 04 00 00       	call   944 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 47d:	83 c4 10             	add    $0x10,%esp
 480:	89 c2                	mov    %eax,%edx
 482:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 488:	74 22                	je     4ac <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 48a:	b9 00 10 00 00       	mov    $0x1000,%ecx
 48f:	29 d1                	sub    %edx,%ecx
 491:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 493:	ba 00 00 00 00       	mov    $0x0,%edx
 498:	83 fa 3f             	cmp    $0x3f,%edx
 49b:	7f 13                	jg     4b0 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 49d:	83 3c 95 20 11 00 00 	cmpl   $0x1,0x1120(,%edx,4)
 4a4:	01 
 4a5:	75 09                	jne    4b0 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 4a7:	83 c2 01             	add    $0x1,%edx
 4aa:	eb ec                	jmp    498 <thread_create+0x30>
  void *user_stack = curr_ptr;
 4ac:	89 c1                	mov    %eax,%ecx
 4ae:	eb e3                	jmp    493 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 4b0:	83 3c 95 20 11 00 00 	cmpl   $0x1,0x1120(,%edx,4)
 4b7:	01 
 4b8:	74 34                	je     4ee <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 4ba:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 4bd:	c1 e3 02             	shl    $0x2,%ebx
 4c0:	89 83 20 0e 00 00    	mov    %eax,0xe20(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 4c6:	89 8b 24 0e 00 00    	mov    %ecx,0xe24(%ebx)
  cell_full[i] = 1;
 4cc:	c7 04 95 20 11 00 00 	movl   $0x1,0x1120(,%edx,4)
 4d3:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 4d7:	ff 75 10             	pushl  0x10(%ebp)
 4da:	ff 75 0c             	pushl  0xc(%ebp)
 4dd:	ff 75 08             	pushl  0x8(%ebp)
 4e0:	51                   	push   %ecx
 4e1:	e8 dc 00 00 00       	call   5c2 <clone>
 4e6:	83 c4 10             	add    $0x10,%esp
}
 4e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ec:	c9                   	leave  
 4ed:	c3                   	ret    
    return -1;
 4ee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4f3:	eb f4                	jmp    4e9 <thread_create+0x81>

000004f5 <thread_join>:

int thread_join(){
 4f5:	f3 0f 1e fb          	endbr32 
 4f9:	55                   	push   %ebp
 4fa:	89 e5                	mov    %esp,%ebp
 4fc:	56                   	push   %esi
 4fd:	53                   	push   %ebx
 4fe:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 501:	8d 45 f4             	lea    -0xc(%ebp),%eax
 504:	50                   	push   %eax
 505:	e8 d0 00 00 00       	call   5da <join>
 50a:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 50c:	83 c4 10             	add    $0x10,%esp
 50f:	bb 00 00 00 00       	mov    $0x0,%ebx
 514:	83 fb 3f             	cmp    $0x3f,%ebx
 517:	7f 14                	jg     52d <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 519:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 51c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 51f:	39 14 85 24 0e 00 00 	cmp    %edx,0xe24(,%eax,4)
 526:	74 05                	je     52d <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 528:	83 c3 01             	add    $0x1,%ebx
 52b:	eb e7                	jmp    514 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 52d:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 530:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 533:	39 0c 85 24 0e 00 00 	cmp    %ecx,0xe24(,%eax,4)
 53a:	75 26                	jne    562 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 53c:	83 ec 0c             	sub    $0xc,%esp
 53f:	ff 34 85 20 0e 00 00 	pushl  0xe20(,%eax,4)
 546:	e8 35 03 00 00       	call   880 <free>
  cell_full[i] = 0;
 54b:	c7 04 9d 20 11 00 00 	movl   $0x0,0x1120(,%ebx,4)
 552:	00 00 00 00 

  return out;
 556:	83 c4 10             	add    $0x10,%esp
}
 559:	89 f0                	mov    %esi,%eax
 55b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55e:	5b                   	pop    %ebx
 55f:	5e                   	pop    %esi
 560:	5d                   	pop    %ebp
 561:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 562:	be ff ff ff ff       	mov    $0xffffffff,%esi
 567:	eb f0                	jmp    559 <thread_join+0x64>

00000569 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 569:	f3 0f 1e fb          	endbr32 
 56d:	55                   	push   %ebp
 56e:	89 e5                	mov    %esp,%ebp
 570:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 573:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 579:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 580:	5d                   	pop    %ebp
 581:	c3                   	ret    

00000582 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 582:	f3 0f 1e fb          	endbr32 
 586:	55                   	push   %ebp
 587:	89 e5                	mov    %esp,%ebp
 589:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 58c:	b9 01 00 00 00       	mov    $0x1,%ecx
 591:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 595:	b8 00 00 00 00       	mov    $0x0,%eax
 59a:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 59f:	39 c1                	cmp    %eax,%ecx
 5a1:	75 f2                	jne    595 <lock_acquire+0x13>
      ; // spin
    }
}
 5a3:	5d                   	pop    %ebp
 5a4:	c3                   	ret    

000005a5 <lock_release>:

void lock_release(lock_t *lock) {
 5a5:	f3 0f 1e fb          	endbr32 
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 5af:	8b 42 04             	mov    0x4(%edx),%eax
 5b2:	83 c0 01             	add    $0x1,%eax
 5b5:	89 42 04             	mov    %eax,0x4(%edx)
}
 5b8:	5d                   	pop    %ebp
 5b9:	c3                   	ret    

000005ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ba:	b8 01 00 00 00       	mov    $0x1,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <clone>:
SYSCALL(clone)
 5c2:	b8 16 00 00 00       	mov    $0x16,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <exit>:
SYSCALL(exit)
 5ca:	b8 02 00 00 00       	mov    $0x2,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <wait>:
SYSCALL(wait)
 5d2:	b8 03 00 00 00       	mov    $0x3,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <join>:
SYSCALL(join)
 5da:	b8 17 00 00 00       	mov    $0x17,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <pipe>:
SYSCALL(pipe)
 5e2:	b8 04 00 00 00       	mov    $0x4,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <read>:
SYSCALL(read)
 5ea:	b8 05 00 00 00       	mov    $0x5,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <write>:
SYSCALL(write)
 5f2:	b8 10 00 00 00       	mov    $0x10,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <close>:
SYSCALL(close)
 5fa:	b8 15 00 00 00       	mov    $0x15,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <kill>:
SYSCALL(kill)
 602:	b8 06 00 00 00       	mov    $0x6,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <exec>:
SYSCALL(exec)
 60a:	b8 07 00 00 00       	mov    $0x7,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <open>:
SYSCALL(open)
 612:	b8 0f 00 00 00       	mov    $0xf,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <mknod>:
SYSCALL(mknod)
 61a:	b8 11 00 00 00       	mov    $0x11,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <unlink>:
SYSCALL(unlink)
 622:	b8 12 00 00 00       	mov    $0x12,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <fstat>:
SYSCALL(fstat)
 62a:	b8 08 00 00 00       	mov    $0x8,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <link>:
SYSCALL(link)
 632:	b8 13 00 00 00       	mov    $0x13,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <mkdir>:
SYSCALL(mkdir)
 63a:	b8 14 00 00 00       	mov    $0x14,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <chdir>:
SYSCALL(chdir)
 642:	b8 09 00 00 00       	mov    $0x9,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <dup>:
SYSCALL(dup)
 64a:	b8 0a 00 00 00       	mov    $0xa,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <getpid>:
SYSCALL(getpid)
 652:	b8 0b 00 00 00       	mov    $0xb,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <sbrk>:
SYSCALL(sbrk)
 65a:	b8 0c 00 00 00       	mov    $0xc,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <sleep>:
SYSCALL(sleep)
 662:	b8 0d 00 00 00       	mov    $0xd,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <uptime>:
SYSCALL(uptime)
 66a:	b8 0e 00 00 00       	mov    $0xe,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 672:	55                   	push   %ebp
 673:	89 e5                	mov    %esp,%ebp
 675:	83 ec 1c             	sub    $0x1c,%esp
 678:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 67b:	6a 01                	push   $0x1
 67d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 680:	52                   	push   %edx
 681:	50                   	push   %eax
 682:	e8 6b ff ff ff       	call   5f2 <write>
}
 687:	83 c4 10             	add    $0x10,%esp
 68a:	c9                   	leave  
 68b:	c3                   	ret    

0000068c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	57                   	push   %edi
 690:	56                   	push   %esi
 691:	53                   	push   %ebx
 692:	83 ec 2c             	sub    $0x2c,%esp
 695:	89 45 d0             	mov    %eax,-0x30(%ebp)
 698:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 69a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 69e:	0f 95 c2             	setne  %dl
 6a1:	89 f0                	mov    %esi,%eax
 6a3:	c1 e8 1f             	shr    $0x1f,%eax
 6a6:	84 c2                	test   %al,%dl
 6a8:	74 42                	je     6ec <printint+0x60>
    neg = 1;
    x = -xx;
 6aa:	f7 de                	neg    %esi
    neg = 1;
 6ac:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6b3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6b8:	89 f0                	mov    %esi,%eax
 6ba:	ba 00 00 00 00       	mov    $0x0,%edx
 6bf:	f7 f1                	div    %ecx
 6c1:	89 df                	mov    %ebx,%edi
 6c3:	83 c3 01             	add    $0x1,%ebx
 6c6:	0f b6 92 68 0a 00 00 	movzbl 0xa68(%edx),%edx
 6cd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6d1:	89 f2                	mov    %esi,%edx
 6d3:	89 c6                	mov    %eax,%esi
 6d5:	39 d1                	cmp    %edx,%ecx
 6d7:	76 df                	jbe    6b8 <printint+0x2c>
  if(neg)
 6d9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6dd:	74 2f                	je     70e <printint+0x82>
    buf[i++] = '-';
 6df:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6e4:	8d 5f 02             	lea    0x2(%edi),%ebx
 6e7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6ea:	eb 15                	jmp    701 <printint+0x75>
  neg = 0;
 6ec:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6f3:	eb be                	jmp    6b3 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 6f5:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6fa:	89 f0                	mov    %esi,%eax
 6fc:	e8 71 ff ff ff       	call   672 <putc>
  while(--i >= 0)
 701:	83 eb 01             	sub    $0x1,%ebx
 704:	79 ef                	jns    6f5 <printint+0x69>
}
 706:	83 c4 2c             	add    $0x2c,%esp
 709:	5b                   	pop    %ebx
 70a:	5e                   	pop    %esi
 70b:	5f                   	pop    %edi
 70c:	5d                   	pop    %ebp
 70d:	c3                   	ret    
 70e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 711:	eb ee                	jmp    701 <printint+0x75>

00000713 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 713:	f3 0f 1e fb          	endbr32 
 717:	55                   	push   %ebp
 718:	89 e5                	mov    %esp,%ebp
 71a:	57                   	push   %edi
 71b:	56                   	push   %esi
 71c:	53                   	push   %ebx
 71d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 720:	8d 45 10             	lea    0x10(%ebp),%eax
 723:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 726:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 72b:	bb 00 00 00 00       	mov    $0x0,%ebx
 730:	eb 14                	jmp    746 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 732:	89 fa                	mov    %edi,%edx
 734:	8b 45 08             	mov    0x8(%ebp),%eax
 737:	e8 36 ff ff ff       	call   672 <putc>
 73c:	eb 05                	jmp    743 <printf+0x30>
      }
    } else if(state == '%'){
 73e:	83 fe 25             	cmp    $0x25,%esi
 741:	74 25                	je     768 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 743:	83 c3 01             	add    $0x1,%ebx
 746:	8b 45 0c             	mov    0xc(%ebp),%eax
 749:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 74d:	84 c0                	test   %al,%al
 74f:	0f 84 23 01 00 00    	je     878 <printf+0x165>
    c = fmt[i] & 0xff;
 755:	0f be f8             	movsbl %al,%edi
 758:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 75b:	85 f6                	test   %esi,%esi
 75d:	75 df                	jne    73e <printf+0x2b>
      if(c == '%'){
 75f:	83 f8 25             	cmp    $0x25,%eax
 762:	75 ce                	jne    732 <printf+0x1f>
        state = '%';
 764:	89 c6                	mov    %eax,%esi
 766:	eb db                	jmp    743 <printf+0x30>
      if(c == 'd'){
 768:	83 f8 64             	cmp    $0x64,%eax
 76b:	74 49                	je     7b6 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 76d:	83 f8 78             	cmp    $0x78,%eax
 770:	0f 94 c1             	sete   %cl
 773:	83 f8 70             	cmp    $0x70,%eax
 776:	0f 94 c2             	sete   %dl
 779:	08 d1                	or     %dl,%cl
 77b:	75 63                	jne    7e0 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 77d:	83 f8 73             	cmp    $0x73,%eax
 780:	0f 84 84 00 00 00    	je     80a <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 786:	83 f8 63             	cmp    $0x63,%eax
 789:	0f 84 b7 00 00 00    	je     846 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 78f:	83 f8 25             	cmp    $0x25,%eax
 792:	0f 84 cc 00 00 00    	je     864 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 798:	ba 25 00 00 00       	mov    $0x25,%edx
 79d:	8b 45 08             	mov    0x8(%ebp),%eax
 7a0:	e8 cd fe ff ff       	call   672 <putc>
        putc(fd, c);
 7a5:	89 fa                	mov    %edi,%edx
 7a7:	8b 45 08             	mov    0x8(%ebp),%eax
 7aa:	e8 c3 fe ff ff       	call   672 <putc>
      }
      state = 0;
 7af:	be 00 00 00 00       	mov    $0x0,%esi
 7b4:	eb 8d                	jmp    743 <printf+0x30>
        printint(fd, *ap, 10, 1);
 7b6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b9:	8b 17                	mov    (%edi),%edx
 7bb:	83 ec 0c             	sub    $0xc,%esp
 7be:	6a 01                	push   $0x1
 7c0:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c5:	8b 45 08             	mov    0x8(%ebp),%eax
 7c8:	e8 bf fe ff ff       	call   68c <printint>
        ap++;
 7cd:	83 c7 04             	add    $0x4,%edi
 7d0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7d3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7d6:	be 00 00 00 00       	mov    $0x0,%esi
 7db:	e9 63 ff ff ff       	jmp    743 <printf+0x30>
        printint(fd, *ap, 16, 0);
 7e0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e3:	8b 17                	mov    (%edi),%edx
 7e5:	83 ec 0c             	sub    $0xc,%esp
 7e8:	6a 00                	push   $0x0
 7ea:	b9 10 00 00 00       	mov    $0x10,%ecx
 7ef:	8b 45 08             	mov    0x8(%ebp),%eax
 7f2:	e8 95 fe ff ff       	call   68c <printint>
        ap++;
 7f7:	83 c7 04             	add    $0x4,%edi
 7fa:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7fd:	83 c4 10             	add    $0x10,%esp
      state = 0;
 800:	be 00 00 00 00       	mov    $0x0,%esi
 805:	e9 39 ff ff ff       	jmp    743 <printf+0x30>
        s = (char*)*ap;
 80a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80d:	8b 30                	mov    (%eax),%esi
        ap++;
 80f:	83 c0 04             	add    $0x4,%eax
 812:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 815:	85 f6                	test   %esi,%esi
 817:	75 28                	jne    841 <printf+0x12e>
          s = "(null)";
 819:	be 5f 0a 00 00       	mov    $0xa5f,%esi
 81e:	8b 7d 08             	mov    0x8(%ebp),%edi
 821:	eb 0d                	jmp    830 <printf+0x11d>
          putc(fd, *s);
 823:	0f be d2             	movsbl %dl,%edx
 826:	89 f8                	mov    %edi,%eax
 828:	e8 45 fe ff ff       	call   672 <putc>
          s++;
 82d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 830:	0f b6 16             	movzbl (%esi),%edx
 833:	84 d2                	test   %dl,%dl
 835:	75 ec                	jne    823 <printf+0x110>
      state = 0;
 837:	be 00 00 00 00       	mov    $0x0,%esi
 83c:	e9 02 ff ff ff       	jmp    743 <printf+0x30>
 841:	8b 7d 08             	mov    0x8(%ebp),%edi
 844:	eb ea                	jmp    830 <printf+0x11d>
        putc(fd, *ap);
 846:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 849:	0f be 17             	movsbl (%edi),%edx
 84c:	8b 45 08             	mov    0x8(%ebp),%eax
 84f:	e8 1e fe ff ff       	call   672 <putc>
        ap++;
 854:	83 c7 04             	add    $0x4,%edi
 857:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 85a:	be 00 00 00 00       	mov    $0x0,%esi
 85f:	e9 df fe ff ff       	jmp    743 <printf+0x30>
        putc(fd, c);
 864:	89 fa                	mov    %edi,%edx
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	e8 04 fe ff ff       	call   672 <putc>
      state = 0;
 86e:	be 00 00 00 00       	mov    $0x0,%esi
 873:	e9 cb fe ff ff       	jmp    743 <printf+0x30>
    }
  }
}
 878:	8d 65 f4             	lea    -0xc(%ebp),%esp
 87b:	5b                   	pop    %ebx
 87c:	5e                   	pop    %esi
 87d:	5f                   	pop    %edi
 87e:	5d                   	pop    %ebp
 87f:	c3                   	ret    

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	f3 0f 1e fb          	endbr32 
 884:	55                   	push   %ebp
 885:	89 e5                	mov    %esp,%ebp
 887:	57                   	push   %edi
 888:	56                   	push   %esi
 889:	53                   	push   %ebx
 88a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 88d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 890:	a1 00 0e 00 00       	mov    0xe00,%eax
 895:	eb 02                	jmp    899 <free+0x19>
 897:	89 d0                	mov    %edx,%eax
 899:	39 c8                	cmp    %ecx,%eax
 89b:	73 04                	jae    8a1 <free+0x21>
 89d:	39 08                	cmp    %ecx,(%eax)
 89f:	77 12                	ja     8b3 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a1:	8b 10                	mov    (%eax),%edx
 8a3:	39 c2                	cmp    %eax,%edx
 8a5:	77 f0                	ja     897 <free+0x17>
 8a7:	39 c8                	cmp    %ecx,%eax
 8a9:	72 08                	jb     8b3 <free+0x33>
 8ab:	39 ca                	cmp    %ecx,%edx
 8ad:	77 04                	ja     8b3 <free+0x33>
 8af:	89 d0                	mov    %edx,%eax
 8b1:	eb e6                	jmp    899 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8b9:	8b 10                	mov    (%eax),%edx
 8bb:	39 d7                	cmp    %edx,%edi
 8bd:	74 19                	je     8d8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8bf:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8c2:	8b 50 04             	mov    0x4(%eax),%edx
 8c5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c8:	39 ce                	cmp    %ecx,%esi
 8ca:	74 1b                	je     8e7 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8cc:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8ce:	a3 00 0e 00 00       	mov    %eax,0xe00
}
 8d3:	5b                   	pop    %ebx
 8d4:	5e                   	pop    %esi
 8d5:	5f                   	pop    %edi
 8d6:	5d                   	pop    %ebp
 8d7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8d8:	03 72 04             	add    0x4(%edx),%esi
 8db:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8de:	8b 10                	mov    (%eax),%edx
 8e0:	8b 12                	mov    (%edx),%edx
 8e2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8e5:	eb db                	jmp    8c2 <free+0x42>
    p->s.size += bp->s.size;
 8e7:	03 53 fc             	add    -0x4(%ebx),%edx
 8ea:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ed:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8f0:	89 10                	mov    %edx,(%eax)
 8f2:	eb da                	jmp    8ce <free+0x4e>

000008f4 <morecore>:

static Header*
morecore(uint nu)
{
 8f4:	55                   	push   %ebp
 8f5:	89 e5                	mov    %esp,%ebp
 8f7:	53                   	push   %ebx
 8f8:	83 ec 04             	sub    $0x4,%esp
 8fb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8fd:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 902:	77 05                	ja     909 <morecore+0x15>
    nu = 4096;
 904:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 909:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 910:	83 ec 0c             	sub    $0xc,%esp
 913:	50                   	push   %eax
 914:	e8 41 fd ff ff       	call   65a <sbrk>
  if(p == (char*)-1)
 919:	83 c4 10             	add    $0x10,%esp
 91c:	83 f8 ff             	cmp    $0xffffffff,%eax
 91f:	74 1c                	je     93d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 921:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 924:	83 c0 08             	add    $0x8,%eax
 927:	83 ec 0c             	sub    $0xc,%esp
 92a:	50                   	push   %eax
 92b:	e8 50 ff ff ff       	call   880 <free>
  return freep;
 930:	a1 00 0e 00 00       	mov    0xe00,%eax
 935:	83 c4 10             	add    $0x10,%esp
}
 938:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 93b:	c9                   	leave  
 93c:	c3                   	ret    
    return 0;
 93d:	b8 00 00 00 00       	mov    $0x0,%eax
 942:	eb f4                	jmp    938 <morecore+0x44>

00000944 <malloc>:

void*
malloc(uint nbytes)
{
 944:	f3 0f 1e fb          	endbr32 
 948:	55                   	push   %ebp
 949:	89 e5                	mov    %esp,%ebp
 94b:	53                   	push   %ebx
 94c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 94f:	8b 45 08             	mov    0x8(%ebp),%eax
 952:	8d 58 07             	lea    0x7(%eax),%ebx
 955:	c1 eb 03             	shr    $0x3,%ebx
 958:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 95b:	8b 0d 00 0e 00 00    	mov    0xe00,%ecx
 961:	85 c9                	test   %ecx,%ecx
 963:	74 04                	je     969 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 965:	8b 01                	mov    (%ecx),%eax
 967:	eb 4b                	jmp    9b4 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 969:	c7 05 00 0e 00 00 04 	movl   $0xe04,0xe00
 970:	0e 00 00 
 973:	c7 05 04 0e 00 00 04 	movl   $0xe04,0xe04
 97a:	0e 00 00 
    base.s.size = 0;
 97d:	c7 05 08 0e 00 00 00 	movl   $0x0,0xe08
 984:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 987:	b9 04 0e 00 00       	mov    $0xe04,%ecx
 98c:	eb d7                	jmp    965 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 98e:	74 1a                	je     9aa <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 990:	29 da                	sub    %ebx,%edx
 992:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 995:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 998:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 99b:	89 0d 00 0e 00 00    	mov    %ecx,0xe00
      return (void*)(p + 1);
 9a1:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9a4:	83 c4 04             	add    $0x4,%esp
 9a7:	5b                   	pop    %ebx
 9a8:	5d                   	pop    %ebp
 9a9:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9aa:	8b 10                	mov    (%eax),%edx
 9ac:	89 11                	mov    %edx,(%ecx)
 9ae:	eb eb                	jmp    99b <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b0:	89 c1                	mov    %eax,%ecx
 9b2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9b4:	8b 50 04             	mov    0x4(%eax),%edx
 9b7:	39 da                	cmp    %ebx,%edx
 9b9:	73 d3                	jae    98e <malloc+0x4a>
    if(p == freep)
 9bb:	39 05 00 0e 00 00    	cmp    %eax,0xe00
 9c1:	75 ed                	jne    9b0 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 9c3:	89 d8                	mov    %ebx,%eax
 9c5:	e8 2a ff ff ff       	call   8f4 <morecore>
 9ca:	85 c0                	test   %eax,%eax
 9cc:	75 e2                	jne    9b0 <malloc+0x6c>
 9ce:	eb d4                	jmp    9a4 <malloc+0x60>
