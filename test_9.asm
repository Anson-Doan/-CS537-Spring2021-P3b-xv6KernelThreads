
_test_9:     file format elf32-i386


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
   7:	83 ec 08             	sub    $0x8,%esp
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
   a:	8d 4d 0c             	lea    0xc(%ebp),%ecx
   d:	8b 45 08             	mov    0x8(%ebp),%eax
  10:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  16:	39 d1                	cmp    %edx,%ecx
  18:	75 67                	jne    81 <worker+0x81>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  1a:	8d 90 f8 0f 00 00    	lea    0xff8(%eax),%edx
  20:	8d 4d 08             	lea    0x8(%ebp),%ecx
  23:	39 d1                	cmp    %edx,%ecx
  25:	0f 85 9f 00 00 00    	jne    ca <worker+0xca>
   assert(*((uint*) (arg1 + PGSIZE - 12)) == 0xffffffff);
  2b:	83 b8 f4 0f 00 00 ff 	cmpl   $0xffffffff,0xff4(%eax)
  32:	0f 84 db 00 00 00    	je     113 <worker+0x113>
  38:	6a 32                	push   $0x32
  3a:	68 c0 09 00 00       	push   $0x9c0
  3f:	68 c9 09 00 00       	push   $0x9c9
  44:	6a 01                	push   $0x1
  46:	e8 b8 06 00 00       	call   703 <printf>
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 88 0a 00 00       	push   $0xa88
  53:	68 d1 09 00 00       	push   $0x9d1
  58:	6a 01                	push   $0x1
  5a:	e8 a4 06 00 00       	call   703 <printf>
  5f:	83 c4 08             	add    $0x8,%esp
  62:	68 e5 09 00 00       	push   $0x9e5
  67:	6a 01                	push   $0x1
  69:	e8 95 06 00 00       	call   703 <printf>
  6e:	83 c4 04             	add    $0x4,%esp
  71:	ff 35 4c 0e 00 00    	pushl  0xe4c
  77:	e8 76 05 00 00       	call   5f2 <kill>
  7c:	e8 39 05 00 00       	call   5ba <exit>
   assert((uint)&arg2 == ((uint)arg1 + PGSIZE - 4));
  81:	6a 30                	push   $0x30
  83:	68 c0 09 00 00       	push   $0x9c0
  88:	68 c9 09 00 00       	push   $0x9c9
  8d:	6a 01                	push   $0x1
  8f:	e8 6f 06 00 00       	call   703 <printf>
  94:	83 c4 0c             	add    $0xc,%esp
  97:	68 30 0a 00 00       	push   $0xa30
  9c:	68 d1 09 00 00       	push   $0x9d1
  a1:	6a 01                	push   $0x1
  a3:	e8 5b 06 00 00       	call   703 <printf>
  a8:	83 c4 08             	add    $0x8,%esp
  ab:	68 e5 09 00 00       	push   $0x9e5
  b0:	6a 01                	push   $0x1
  b2:	e8 4c 06 00 00       	call   703 <printf>
  b7:	83 c4 04             	add    $0x4,%esp
  ba:	ff 35 4c 0e 00 00    	pushl  0xe4c
  c0:	e8 2d 05 00 00       	call   5f2 <kill>
  c5:	e8 f0 04 00 00       	call   5ba <exit>
   assert((uint)&arg1 == ((uint)arg1 + PGSIZE - 8));
  ca:	6a 31                	push   $0x31
  cc:	68 c0 09 00 00       	push   $0x9c0
  d1:	68 c9 09 00 00       	push   $0x9c9
  d6:	6a 01                	push   $0x1
  d8:	e8 26 06 00 00       	call   703 <printf>
  dd:	83 c4 0c             	add    $0xc,%esp
  e0:	68 5c 0a 00 00       	push   $0xa5c
  e5:	68 d1 09 00 00       	push   $0x9d1
  ea:	6a 01                	push   $0x1
  ec:	e8 12 06 00 00       	call   703 <printf>
  f1:	83 c4 08             	add    $0x8,%esp
  f4:	68 e5 09 00 00       	push   $0x9e5
  f9:	6a 01                	push   $0x1
  fb:	e8 03 06 00 00       	call   703 <printf>
 100:	83 c4 04             	add    $0x4,%esp
 103:	ff 35 4c 0e 00 00    	pushl  0xe4c
 109:	e8 e4 04 00 00       	call   5f2 <kill>
 10e:	e8 a7 04 00 00       	call   5ba <exit>
   global = 5;
 113:	c7 05 38 0e 00 00 05 	movl   $0x5,0xe38
 11a:	00 00 00 
   exit();
 11d:	e8 98 04 00 00       	call   5ba <exit>

00000122 <main>:
{
 122:	f3 0f 1e fb          	endbr32 
 126:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 12a:	83 e4 f0             	and    $0xfffffff0,%esp
 12d:	ff 71 fc             	pushl  -0x4(%ecx)
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	56                   	push   %esi
 134:	53                   	push   %ebx
 135:	51                   	push   %ecx
 136:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
 139:	e8 04 05 00 00       	call   642 <getpid>
 13e:	a3 4c 0e 00 00       	mov    %eax,0xe4c
   void *stack, *p = malloc(PGSIZE * 2);
 143:	83 ec 0c             	sub    $0xc,%esp
 146:	68 00 20 00 00       	push   $0x2000
 14b:	e8 e4 07 00 00       	call   934 <malloc>
   assert(p != NULL);
 150:	83 c4 10             	add    $0x10,%esp
 153:	85 c0                	test   %eax,%eax
 155:	0f 84 a8 00 00 00    	je     203 <main+0xe1>
 15b:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 15d:	89 c2                	mov    %eax,%edx
 15f:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 165:	74 09                	je     170 <main+0x4e>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 167:	b8 00 10 00 00       	mov    $0x1000,%eax
 16c:	29 d0                	sub    %edx,%eax
 16e:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, stack, 0, stack);
 170:	50                   	push   %eax
 171:	6a 00                	push   $0x0
 173:	50                   	push   %eax
 174:	68 00 00 00 00       	push   $0x0
 179:	e8 34 04 00 00       	call   5b2 <clone>
 17e:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	0f 8e c1 00 00 00    	jle    24c <main+0x12a>
   while(global != 5);
 18b:	a1 38 0e 00 00       	mov    0xe38,%eax
 190:	83 f8 05             	cmp    $0x5,%eax
 193:	75 f6                	jne    18b <main+0x69>
   printf(1, "TEST PASSED\n");
 195:	83 ec 08             	sub    $0x8,%esp
 198:	68 0a 0a 00 00       	push   $0xa0a
 19d:	6a 01                	push   $0x1
 19f:	e8 5f 05 00 00       	call   703 <printf>
   int join_pid = join(&join_stack);
 1a4:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1a7:	89 04 24             	mov    %eax,(%esp)
 1aa:	e8 1b 04 00 00       	call   5ca <join>
   assert(join_pid == clone_pid);
 1af:	83 c4 10             	add    $0x10,%esp
 1b2:	39 c6                	cmp    %eax,%esi
 1b4:	0f 84 db 00 00 00    	je     295 <main+0x173>
 1ba:	6a 29                	push   $0x29
 1bc:	68 c0 09 00 00       	push   $0x9c0
 1c1:	68 c9 09 00 00       	push   $0x9c9
 1c6:	6a 01                	push   $0x1
 1c8:	e8 36 05 00 00       	call   703 <printf>
 1cd:	83 c4 0c             	add    $0xc,%esp
 1d0:	68 17 0a 00 00       	push   $0xa17
 1d5:	68 d1 09 00 00       	push   $0x9d1
 1da:	6a 01                	push   $0x1
 1dc:	e8 22 05 00 00       	call   703 <printf>
 1e1:	83 c4 08             	add    $0x8,%esp
 1e4:	68 e5 09 00 00       	push   $0x9e5
 1e9:	6a 01                	push   $0x1
 1eb:	e8 13 05 00 00       	call   703 <printf>
 1f0:	83 c4 04             	add    $0x4,%esp
 1f3:	ff 35 4c 0e 00 00    	pushl  0xe4c
 1f9:	e8 f4 03 00 00       	call   5f2 <kill>
 1fe:	e8 b7 03 00 00       	call   5ba <exit>
   assert(p != NULL);
 203:	6a 1c                	push   $0x1c
 205:	68 c0 09 00 00       	push   $0x9c0
 20a:	68 c9 09 00 00       	push   $0x9c9
 20f:	6a 01                	push   $0x1
 211:	e8 ed 04 00 00       	call   703 <printf>
 216:	83 c4 0c             	add    $0xc,%esp
 219:	68 f2 09 00 00       	push   $0x9f2
 21e:	68 d1 09 00 00       	push   $0x9d1
 223:	6a 01                	push   $0x1
 225:	e8 d9 04 00 00       	call   703 <printf>
 22a:	83 c4 08             	add    $0x8,%esp
 22d:	68 e5 09 00 00       	push   $0x9e5
 232:	6a 01                	push   $0x1
 234:	e8 ca 04 00 00       	call   703 <printf>
 239:	83 c4 04             	add    $0x4,%esp
 23c:	ff 35 4c 0e 00 00    	pushl  0xe4c
 242:	e8 ab 03 00 00       	call   5f2 <kill>
 247:	e8 6e 03 00 00       	call   5ba <exit>
   assert(clone_pid > 0);
 24c:	6a 23                	push   $0x23
 24e:	68 c0 09 00 00       	push   $0x9c0
 253:	68 c9 09 00 00       	push   $0x9c9
 258:	6a 01                	push   $0x1
 25a:	e8 a4 04 00 00       	call   703 <printf>
 25f:	83 c4 0c             	add    $0xc,%esp
 262:	68 fc 09 00 00       	push   $0x9fc
 267:	68 d1 09 00 00       	push   $0x9d1
 26c:	6a 01                	push   $0x1
 26e:	e8 90 04 00 00       	call   703 <printf>
 273:	83 c4 08             	add    $0x8,%esp
 276:	68 e5 09 00 00       	push   $0x9e5
 27b:	6a 01                	push   $0x1
 27d:	e8 81 04 00 00       	call   703 <printf>
 282:	83 c4 04             	add    $0x4,%esp
 285:	ff 35 4c 0e 00 00    	pushl  0xe4c
 28b:	e8 62 03 00 00       	call   5f2 <kill>
 290:	e8 25 03 00 00       	call   5ba <exit>
   free(p);
 295:	83 ec 0c             	sub    $0xc,%esp
 298:	53                   	push   %ebx
 299:	e8 d2 05 00 00       	call   870 <free>
   exit();
 29e:	e8 17 03 00 00       	call   5ba <exit>

000002a3 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 2a3:	f3 0f 1e fb          	endbr32 
 2a7:	55                   	push   %ebp
 2a8:	89 e5                	mov    %esp,%ebp
 2aa:	56                   	push   %esi
 2ab:	53                   	push   %ebx
 2ac:	8b 75 08             	mov    0x8(%ebp),%esi
 2af:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2b2:	89 f0                	mov    %esi,%eax
 2b4:	89 d1                	mov    %edx,%ecx
 2b6:	83 c2 01             	add    $0x1,%edx
 2b9:	89 c3                	mov    %eax,%ebx
 2bb:	83 c0 01             	add    $0x1,%eax
 2be:	0f b6 09             	movzbl (%ecx),%ecx
 2c1:	88 0b                	mov    %cl,(%ebx)
 2c3:	84 c9                	test   %cl,%cl
 2c5:	75 ed                	jne    2b4 <strcpy+0x11>
    ;
  return os;
}
 2c7:	89 f0                	mov    %esi,%eax
 2c9:	5b                   	pop    %ebx
 2ca:	5e                   	pop    %esi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    

000002cd <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2cd:	f3 0f 1e fb          	endbr32 
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
 2d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2da:	0f b6 01             	movzbl (%ecx),%eax
 2dd:	84 c0                	test   %al,%al
 2df:	74 0c                	je     2ed <strcmp+0x20>
 2e1:	3a 02                	cmp    (%edx),%al
 2e3:	75 08                	jne    2ed <strcmp+0x20>
    p++, q++;
 2e5:	83 c1 01             	add    $0x1,%ecx
 2e8:	83 c2 01             	add    $0x1,%edx
 2eb:	eb ed                	jmp    2da <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 2ed:	0f b6 c0             	movzbl %al,%eax
 2f0:	0f b6 12             	movzbl (%edx),%edx
 2f3:	29 d0                	sub    %edx,%eax
}
 2f5:	5d                   	pop    %ebp
 2f6:	c3                   	ret    

000002f7 <strlen>:

uint
strlen(const char *s)
{
 2f7:	f3 0f 1e fb          	endbr32 
 2fb:	55                   	push   %ebp
 2fc:	89 e5                	mov    %esp,%ebp
 2fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 301:	b8 00 00 00 00       	mov    $0x0,%eax
 306:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 30a:	74 05                	je     311 <strlen+0x1a>
 30c:	83 c0 01             	add    $0x1,%eax
 30f:	eb f5                	jmp    306 <strlen+0xf>
    ;
  return n;
}
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    

00000313 <memset>:

void*
memset(void *dst, int c, uint n)
{
 313:	f3 0f 1e fb          	endbr32 
 317:	55                   	push   %ebp
 318:	89 e5                	mov    %esp,%ebp
 31a:	57                   	push   %edi
 31b:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 31e:	89 d7                	mov    %edx,%edi
 320:	8b 4d 10             	mov    0x10(%ebp),%ecx
 323:	8b 45 0c             	mov    0xc(%ebp),%eax
 326:	fc                   	cld    
 327:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 329:	89 d0                	mov    %edx,%eax
 32b:	5f                   	pop    %edi
 32c:	5d                   	pop    %ebp
 32d:	c3                   	ret    

0000032e <strchr>:

char*
strchr(const char *s, char c)
{
 32e:	f3 0f 1e fb          	endbr32 
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	8b 45 08             	mov    0x8(%ebp),%eax
 338:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 33c:	0f b6 10             	movzbl (%eax),%edx
 33f:	84 d2                	test   %dl,%dl
 341:	74 09                	je     34c <strchr+0x1e>
    if(*s == c)
 343:	38 ca                	cmp    %cl,%dl
 345:	74 0a                	je     351 <strchr+0x23>
  for(; *s; s++)
 347:	83 c0 01             	add    $0x1,%eax
 34a:	eb f0                	jmp    33c <strchr+0xe>
      return (char*)s;
  return 0;
 34c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    

00000353 <gets>:

char*
gets(char *buf, int max)
{
 353:	f3 0f 1e fb          	endbr32 
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	57                   	push   %edi
 35b:	56                   	push   %esi
 35c:	53                   	push   %ebx
 35d:	83 ec 1c             	sub    $0x1c,%esp
 360:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 363:	bb 00 00 00 00       	mov    $0x0,%ebx
 368:	89 de                	mov    %ebx,%esi
 36a:	83 c3 01             	add    $0x1,%ebx
 36d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 370:	7d 2e                	jge    3a0 <gets+0x4d>
    cc = read(0, &c, 1);
 372:	83 ec 04             	sub    $0x4,%esp
 375:	6a 01                	push   $0x1
 377:	8d 45 e7             	lea    -0x19(%ebp),%eax
 37a:	50                   	push   %eax
 37b:	6a 00                	push   $0x0
 37d:	e8 58 02 00 00       	call   5da <read>
    if(cc < 1)
 382:	83 c4 10             	add    $0x10,%esp
 385:	85 c0                	test   %eax,%eax
 387:	7e 17                	jle    3a0 <gets+0x4d>
      break;
    buf[i++] = c;
 389:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 38d:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 390:	3c 0a                	cmp    $0xa,%al
 392:	0f 94 c2             	sete   %dl
 395:	3c 0d                	cmp    $0xd,%al
 397:	0f 94 c0             	sete   %al
 39a:	08 c2                	or     %al,%dl
 39c:	74 ca                	je     368 <gets+0x15>
    buf[i++] = c;
 39e:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3a0:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3a4:	89 f8                	mov    %edi,%eax
 3a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3a9:	5b                   	pop    %ebx
 3aa:	5e                   	pop    %esi
 3ab:	5f                   	pop    %edi
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <stat>:

int
stat(const char *n, struct stat *st)
{
 3ae:	f3 0f 1e fb          	endbr32 
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	56                   	push   %esi
 3b6:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3b7:	83 ec 08             	sub    $0x8,%esp
 3ba:	6a 00                	push   $0x0
 3bc:	ff 75 08             	pushl  0x8(%ebp)
 3bf:	e8 3e 02 00 00       	call   602 <open>
  if(fd < 0)
 3c4:	83 c4 10             	add    $0x10,%esp
 3c7:	85 c0                	test   %eax,%eax
 3c9:	78 24                	js     3ef <stat+0x41>
 3cb:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3cd:	83 ec 08             	sub    $0x8,%esp
 3d0:	ff 75 0c             	pushl  0xc(%ebp)
 3d3:	50                   	push   %eax
 3d4:	e8 41 02 00 00       	call   61a <fstat>
 3d9:	89 c6                	mov    %eax,%esi
  close(fd);
 3db:	89 1c 24             	mov    %ebx,(%esp)
 3de:	e8 07 02 00 00       	call   5ea <close>
  return r;
 3e3:	83 c4 10             	add    $0x10,%esp
}
 3e6:	89 f0                	mov    %esi,%eax
 3e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3eb:	5b                   	pop    %ebx
 3ec:	5e                   	pop    %esi
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    
    return -1;
 3ef:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3f4:	eb f0                	jmp    3e6 <stat+0x38>

000003f6 <atoi>:

int
atoi(const char *s)
{
 3f6:	f3 0f 1e fb          	endbr32 
 3fa:	55                   	push   %ebp
 3fb:	89 e5                	mov    %esp,%ebp
 3fd:	53                   	push   %ebx
 3fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 401:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 406:	0f b6 01             	movzbl (%ecx),%eax
 409:	8d 58 d0             	lea    -0x30(%eax),%ebx
 40c:	80 fb 09             	cmp    $0x9,%bl
 40f:	77 12                	ja     423 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 411:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 414:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 417:	83 c1 01             	add    $0x1,%ecx
 41a:	0f be c0             	movsbl %al,%eax
 41d:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 421:	eb e3                	jmp    406 <atoi+0x10>
  return n;
}
 423:	89 d0                	mov    %edx,%eax
 425:	5b                   	pop    %ebx
 426:	5d                   	pop    %ebp
 427:	c3                   	ret    

00000428 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 428:	f3 0f 1e fb          	endbr32 
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	56                   	push   %esi
 430:	53                   	push   %ebx
 431:	8b 75 08             	mov    0x8(%ebp),%esi
 434:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 437:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 43a:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 43c:	8d 58 ff             	lea    -0x1(%eax),%ebx
 43f:	85 c0                	test   %eax,%eax
 441:	7e 0f                	jle    452 <memmove+0x2a>
    *dst++ = *src++;
 443:	0f b6 01             	movzbl (%ecx),%eax
 446:	88 02                	mov    %al,(%edx)
 448:	8d 49 01             	lea    0x1(%ecx),%ecx
 44b:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 44e:	89 d8                	mov    %ebx,%eax
 450:	eb ea                	jmp    43c <memmove+0x14>
  return vdst;
}
 452:	89 f0                	mov    %esi,%eax
 454:	5b                   	pop    %ebx
 455:	5e                   	pop    %esi
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    

00000458 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 458:	f3 0f 1e fb          	endbr32 
 45c:	55                   	push   %ebp
 45d:	89 e5                	mov    %esp,%ebp
 45f:	53                   	push   %ebx
 460:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 463:	68 00 20 00 00       	push   $0x2000
 468:	e8 c7 04 00 00       	call   934 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 46d:	83 c4 10             	add    $0x10,%esp
 470:	89 c2                	mov    %eax,%edx
 472:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 478:	74 22                	je     49c <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 47a:	b9 00 10 00 00       	mov    $0x1000,%ecx
 47f:	29 d1                	sub    %edx,%ecx
 481:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 483:	ba 00 00 00 00       	mov    $0x0,%edx
 488:	83 fa 3f             	cmp    $0x3f,%edx
 48b:	7f 13                	jg     4a0 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 48d:	83 3c 95 60 11 00 00 	cmpl   $0x1,0x1160(,%edx,4)
 494:	01 
 495:	75 09                	jne    4a0 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 497:	83 c2 01             	add    $0x1,%edx
 49a:	eb ec                	jmp    488 <thread_create+0x30>
  void *user_stack = curr_ptr;
 49c:	89 c1                	mov    %eax,%ecx
 49e:	eb e3                	jmp    483 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 4a0:	83 3c 95 60 11 00 00 	cmpl   $0x1,0x1160(,%edx,4)
 4a7:	01 
 4a8:	74 34                	je     4de <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 4aa:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 4ad:	c1 e3 02             	shl    $0x2,%ebx
 4b0:	89 83 60 0e 00 00    	mov    %eax,0xe60(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 4b6:	89 8b 64 0e 00 00    	mov    %ecx,0xe64(%ebx)
  cell_full[i] = 1;
 4bc:	c7 04 95 60 11 00 00 	movl   $0x1,0x1160(,%edx,4)
 4c3:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 4c7:	ff 75 10             	pushl  0x10(%ebp)
 4ca:	ff 75 0c             	pushl  0xc(%ebp)
 4cd:	ff 75 08             	pushl  0x8(%ebp)
 4d0:	51                   	push   %ecx
 4d1:	e8 dc 00 00 00       	call   5b2 <clone>
 4d6:	83 c4 10             	add    $0x10,%esp
}
 4d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4dc:	c9                   	leave  
 4dd:	c3                   	ret    
    return -1;
 4de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4e3:	eb f4                	jmp    4d9 <thread_create+0x81>

000004e5 <thread_join>:

int thread_join(){
 4e5:	f3 0f 1e fb          	endbr32 
 4e9:	55                   	push   %ebp
 4ea:	89 e5                	mov    %esp,%ebp
 4ec:	56                   	push   %esi
 4ed:	53                   	push   %ebx
 4ee:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 4f1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f4:	50                   	push   %eax
 4f5:	e8 d0 00 00 00       	call   5ca <join>
 4fa:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 4fc:	83 c4 10             	add    $0x10,%esp
 4ff:	bb 00 00 00 00       	mov    $0x0,%ebx
 504:	83 fb 3f             	cmp    $0x3f,%ebx
 507:	7f 14                	jg     51d <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 509:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 50c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 50f:	39 14 85 64 0e 00 00 	cmp    %edx,0xe64(,%eax,4)
 516:	74 05                	je     51d <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 518:	83 c3 01             	add    $0x1,%ebx
 51b:	eb e7                	jmp    504 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 51d:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 520:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 523:	39 0c 85 64 0e 00 00 	cmp    %ecx,0xe64(,%eax,4)
 52a:	75 26                	jne    552 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 52c:	83 ec 0c             	sub    $0xc,%esp
 52f:	ff 34 85 60 0e 00 00 	pushl  0xe60(,%eax,4)
 536:	e8 35 03 00 00       	call   870 <free>
  cell_full[i] = 0;
 53b:	c7 04 9d 60 11 00 00 	movl   $0x0,0x1160(,%ebx,4)
 542:	00 00 00 00 

  return out;
 546:	83 c4 10             	add    $0x10,%esp
}
 549:	89 f0                	mov    %esi,%eax
 54b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 54e:	5b                   	pop    %ebx
 54f:	5e                   	pop    %esi
 550:	5d                   	pop    %ebp
 551:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 552:	be ff ff ff ff       	mov    $0xffffffff,%esi
 557:	eb f0                	jmp    549 <thread_join+0x64>

00000559 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 559:	f3 0f 1e fb          	endbr32 
 55d:	55                   	push   %ebp
 55e:	89 e5                	mov    %esp,%ebp
 560:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 563:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 569:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 570:	5d                   	pop    %ebp
 571:	c3                   	ret    

00000572 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 572:	f3 0f 1e fb          	endbr32 
 576:	55                   	push   %ebp
 577:	89 e5                	mov    %esp,%ebp
 579:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 57c:	b9 01 00 00 00       	mov    $0x1,%ecx
 581:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 585:	b8 00 00 00 00       	mov    $0x0,%eax
 58a:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 58f:	39 c1                	cmp    %eax,%ecx
 591:	75 f2                	jne    585 <lock_acquire+0x13>
      ; // spin
    }
}
 593:	5d                   	pop    %ebp
 594:	c3                   	ret    

00000595 <lock_release>:

void lock_release(lock_t *lock) {
 595:	f3 0f 1e fb          	endbr32 
 599:	55                   	push   %ebp
 59a:	89 e5                	mov    %esp,%ebp
 59c:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 59f:	8b 42 04             	mov    0x4(%edx),%eax
 5a2:	83 c0 01             	add    $0x1,%eax
 5a5:	89 42 04             	mov    %eax,0x4(%edx)
}
 5a8:	5d                   	pop    %ebp
 5a9:	c3                   	ret    

000005aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5aa:	b8 01 00 00 00       	mov    $0x1,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <clone>:
SYSCALL(clone)
 5b2:	b8 16 00 00 00       	mov    $0x16,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <exit>:
SYSCALL(exit)
 5ba:	b8 02 00 00 00       	mov    $0x2,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <wait>:
SYSCALL(wait)
 5c2:	b8 03 00 00 00       	mov    $0x3,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <join>:
SYSCALL(join)
 5ca:	b8 17 00 00 00       	mov    $0x17,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <pipe>:
SYSCALL(pipe)
 5d2:	b8 04 00 00 00       	mov    $0x4,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <read>:
SYSCALL(read)
 5da:	b8 05 00 00 00       	mov    $0x5,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <write>:
SYSCALL(write)
 5e2:	b8 10 00 00 00       	mov    $0x10,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <close>:
SYSCALL(close)
 5ea:	b8 15 00 00 00       	mov    $0x15,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <kill>:
SYSCALL(kill)
 5f2:	b8 06 00 00 00       	mov    $0x6,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <exec>:
SYSCALL(exec)
 5fa:	b8 07 00 00 00       	mov    $0x7,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <open>:
SYSCALL(open)
 602:	b8 0f 00 00 00       	mov    $0xf,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <mknod>:
SYSCALL(mknod)
 60a:	b8 11 00 00 00       	mov    $0x11,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <unlink>:
SYSCALL(unlink)
 612:	b8 12 00 00 00       	mov    $0x12,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <fstat>:
SYSCALL(fstat)
 61a:	b8 08 00 00 00       	mov    $0x8,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <link>:
SYSCALL(link)
 622:	b8 13 00 00 00       	mov    $0x13,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <mkdir>:
SYSCALL(mkdir)
 62a:	b8 14 00 00 00       	mov    $0x14,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <chdir>:
SYSCALL(chdir)
 632:	b8 09 00 00 00       	mov    $0x9,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <dup>:
SYSCALL(dup)
 63a:	b8 0a 00 00 00       	mov    $0xa,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <getpid>:
SYSCALL(getpid)
 642:	b8 0b 00 00 00       	mov    $0xb,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <sbrk>:
SYSCALL(sbrk)
 64a:	b8 0c 00 00 00       	mov    $0xc,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    

00000652 <sleep>:
SYSCALL(sleep)
 652:	b8 0d 00 00 00       	mov    $0xd,%eax
 657:	cd 40                	int    $0x40
 659:	c3                   	ret    

0000065a <uptime>:
SYSCALL(uptime)
 65a:	b8 0e 00 00 00       	mov    $0xe,%eax
 65f:	cd 40                	int    $0x40
 661:	c3                   	ret    

00000662 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 662:	55                   	push   %ebp
 663:	89 e5                	mov    %esp,%ebp
 665:	83 ec 1c             	sub    $0x1c,%esp
 668:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 66b:	6a 01                	push   $0x1
 66d:	8d 55 f4             	lea    -0xc(%ebp),%edx
 670:	52                   	push   %edx
 671:	50                   	push   %eax
 672:	e8 6b ff ff ff       	call   5e2 <write>
}
 677:	83 c4 10             	add    $0x10,%esp
 67a:	c9                   	leave  
 67b:	c3                   	ret    

0000067c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 67c:	55                   	push   %ebp
 67d:	89 e5                	mov    %esp,%ebp
 67f:	57                   	push   %edi
 680:	56                   	push   %esi
 681:	53                   	push   %ebx
 682:	83 ec 2c             	sub    $0x2c,%esp
 685:	89 45 d0             	mov    %eax,-0x30(%ebp)
 688:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 68a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 68e:	0f 95 c2             	setne  %dl
 691:	89 f0                	mov    %esi,%eax
 693:	c1 e8 1f             	shr    $0x1f,%eax
 696:	84 c2                	test   %al,%dl
 698:	74 42                	je     6dc <printint+0x60>
    neg = 1;
    x = -xx;
 69a:	f7 de                	neg    %esi
    neg = 1;
 69c:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6a3:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6a8:	89 f0                	mov    %esi,%eax
 6aa:	ba 00 00 00 00       	mov    $0x0,%edx
 6af:	f7 f1                	div    %ecx
 6b1:	89 df                	mov    %ebx,%edi
 6b3:	83 c3 01             	add    $0x1,%ebx
 6b6:	0f b6 92 c0 0a 00 00 	movzbl 0xac0(%edx),%edx
 6bd:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6c1:	89 f2                	mov    %esi,%edx
 6c3:	89 c6                	mov    %eax,%esi
 6c5:	39 d1                	cmp    %edx,%ecx
 6c7:	76 df                	jbe    6a8 <printint+0x2c>
  if(neg)
 6c9:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6cd:	74 2f                	je     6fe <printint+0x82>
    buf[i++] = '-';
 6cf:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6d4:	8d 5f 02             	lea    0x2(%edi),%ebx
 6d7:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6da:	eb 15                	jmp    6f1 <printint+0x75>
  neg = 0;
 6dc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6e3:	eb be                	jmp    6a3 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 6e5:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6ea:	89 f0                	mov    %esi,%eax
 6ec:	e8 71 ff ff ff       	call   662 <putc>
  while(--i >= 0)
 6f1:	83 eb 01             	sub    $0x1,%ebx
 6f4:	79 ef                	jns    6e5 <printint+0x69>
}
 6f6:	83 c4 2c             	add    $0x2c,%esp
 6f9:	5b                   	pop    %ebx
 6fa:	5e                   	pop    %esi
 6fb:	5f                   	pop    %edi
 6fc:	5d                   	pop    %ebp
 6fd:	c3                   	ret    
 6fe:	8b 75 d0             	mov    -0x30(%ebp),%esi
 701:	eb ee                	jmp    6f1 <printint+0x75>

00000703 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 703:	f3 0f 1e fb          	endbr32 
 707:	55                   	push   %ebp
 708:	89 e5                	mov    %esp,%ebp
 70a:	57                   	push   %edi
 70b:	56                   	push   %esi
 70c:	53                   	push   %ebx
 70d:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 710:	8d 45 10             	lea    0x10(%ebp),%eax
 713:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 716:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 71b:	bb 00 00 00 00       	mov    $0x0,%ebx
 720:	eb 14                	jmp    736 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 722:	89 fa                	mov    %edi,%edx
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	e8 36 ff ff ff       	call   662 <putc>
 72c:	eb 05                	jmp    733 <printf+0x30>
      }
    } else if(state == '%'){
 72e:	83 fe 25             	cmp    $0x25,%esi
 731:	74 25                	je     758 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 733:	83 c3 01             	add    $0x1,%ebx
 736:	8b 45 0c             	mov    0xc(%ebp),%eax
 739:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 73d:	84 c0                	test   %al,%al
 73f:	0f 84 23 01 00 00    	je     868 <printf+0x165>
    c = fmt[i] & 0xff;
 745:	0f be f8             	movsbl %al,%edi
 748:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 74b:	85 f6                	test   %esi,%esi
 74d:	75 df                	jne    72e <printf+0x2b>
      if(c == '%'){
 74f:	83 f8 25             	cmp    $0x25,%eax
 752:	75 ce                	jne    722 <printf+0x1f>
        state = '%';
 754:	89 c6                	mov    %eax,%esi
 756:	eb db                	jmp    733 <printf+0x30>
      if(c == 'd'){
 758:	83 f8 64             	cmp    $0x64,%eax
 75b:	74 49                	je     7a6 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 75d:	83 f8 78             	cmp    $0x78,%eax
 760:	0f 94 c1             	sete   %cl
 763:	83 f8 70             	cmp    $0x70,%eax
 766:	0f 94 c2             	sete   %dl
 769:	08 d1                	or     %dl,%cl
 76b:	75 63                	jne    7d0 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 76d:	83 f8 73             	cmp    $0x73,%eax
 770:	0f 84 84 00 00 00    	je     7fa <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 776:	83 f8 63             	cmp    $0x63,%eax
 779:	0f 84 b7 00 00 00    	je     836 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 77f:	83 f8 25             	cmp    $0x25,%eax
 782:	0f 84 cc 00 00 00    	je     854 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 788:	ba 25 00 00 00       	mov    $0x25,%edx
 78d:	8b 45 08             	mov    0x8(%ebp),%eax
 790:	e8 cd fe ff ff       	call   662 <putc>
        putc(fd, c);
 795:	89 fa                	mov    %edi,%edx
 797:	8b 45 08             	mov    0x8(%ebp),%eax
 79a:	e8 c3 fe ff ff       	call   662 <putc>
      }
      state = 0;
 79f:	be 00 00 00 00       	mov    $0x0,%esi
 7a4:	eb 8d                	jmp    733 <printf+0x30>
        printint(fd, *ap, 10, 1);
 7a6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7a9:	8b 17                	mov    (%edi),%edx
 7ab:	83 ec 0c             	sub    $0xc,%esp
 7ae:	6a 01                	push   $0x1
 7b0:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7b5:	8b 45 08             	mov    0x8(%ebp),%eax
 7b8:	e8 bf fe ff ff       	call   67c <printint>
        ap++;
 7bd:	83 c7 04             	add    $0x4,%edi
 7c0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7c3:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7c6:	be 00 00 00 00       	mov    $0x0,%esi
 7cb:	e9 63 ff ff ff       	jmp    733 <printf+0x30>
        printint(fd, *ap, 16, 0);
 7d0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7d3:	8b 17                	mov    (%edi),%edx
 7d5:	83 ec 0c             	sub    $0xc,%esp
 7d8:	6a 00                	push   $0x0
 7da:	b9 10 00 00 00       	mov    $0x10,%ecx
 7df:	8b 45 08             	mov    0x8(%ebp),%eax
 7e2:	e8 95 fe ff ff       	call   67c <printint>
        ap++;
 7e7:	83 c7 04             	add    $0x4,%edi
 7ea:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ed:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7f0:	be 00 00 00 00       	mov    $0x0,%esi
 7f5:	e9 39 ff ff ff       	jmp    733 <printf+0x30>
        s = (char*)*ap;
 7fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7fd:	8b 30                	mov    (%eax),%esi
        ap++;
 7ff:	83 c0 04             	add    $0x4,%eax
 802:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 805:	85 f6                	test   %esi,%esi
 807:	75 28                	jne    831 <printf+0x12e>
          s = "(null)";
 809:	be b6 0a 00 00       	mov    $0xab6,%esi
 80e:	8b 7d 08             	mov    0x8(%ebp),%edi
 811:	eb 0d                	jmp    820 <printf+0x11d>
          putc(fd, *s);
 813:	0f be d2             	movsbl %dl,%edx
 816:	89 f8                	mov    %edi,%eax
 818:	e8 45 fe ff ff       	call   662 <putc>
          s++;
 81d:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 820:	0f b6 16             	movzbl (%esi),%edx
 823:	84 d2                	test   %dl,%dl
 825:	75 ec                	jne    813 <printf+0x110>
      state = 0;
 827:	be 00 00 00 00       	mov    $0x0,%esi
 82c:	e9 02 ff ff ff       	jmp    733 <printf+0x30>
 831:	8b 7d 08             	mov    0x8(%ebp),%edi
 834:	eb ea                	jmp    820 <printf+0x11d>
        putc(fd, *ap);
 836:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 839:	0f be 17             	movsbl (%edi),%edx
 83c:	8b 45 08             	mov    0x8(%ebp),%eax
 83f:	e8 1e fe ff ff       	call   662 <putc>
        ap++;
 844:	83 c7 04             	add    $0x4,%edi
 847:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 84a:	be 00 00 00 00       	mov    $0x0,%esi
 84f:	e9 df fe ff ff       	jmp    733 <printf+0x30>
        putc(fd, c);
 854:	89 fa                	mov    %edi,%edx
 856:	8b 45 08             	mov    0x8(%ebp),%eax
 859:	e8 04 fe ff ff       	call   662 <putc>
      state = 0;
 85e:	be 00 00 00 00       	mov    $0x0,%esi
 863:	e9 cb fe ff ff       	jmp    733 <printf+0x30>
    }
  }
}
 868:	8d 65 f4             	lea    -0xc(%ebp),%esp
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5f                   	pop    %edi
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret    

00000870 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 870:	f3 0f 1e fb          	endbr32 
 874:	55                   	push   %ebp
 875:	89 e5                	mov    %esp,%ebp
 877:	57                   	push   %edi
 878:	56                   	push   %esi
 879:	53                   	push   %ebx
 87a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 87d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 880:	a1 40 0e 00 00       	mov    0xe40,%eax
 885:	eb 02                	jmp    889 <free+0x19>
 887:	89 d0                	mov    %edx,%eax
 889:	39 c8                	cmp    %ecx,%eax
 88b:	73 04                	jae    891 <free+0x21>
 88d:	39 08                	cmp    %ecx,(%eax)
 88f:	77 12                	ja     8a3 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 891:	8b 10                	mov    (%eax),%edx
 893:	39 c2                	cmp    %eax,%edx
 895:	77 f0                	ja     887 <free+0x17>
 897:	39 c8                	cmp    %ecx,%eax
 899:	72 08                	jb     8a3 <free+0x33>
 89b:	39 ca                	cmp    %ecx,%edx
 89d:	77 04                	ja     8a3 <free+0x33>
 89f:	89 d0                	mov    %edx,%eax
 8a1:	eb e6                	jmp    889 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8a3:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8a6:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8a9:	8b 10                	mov    (%eax),%edx
 8ab:	39 d7                	cmp    %edx,%edi
 8ad:	74 19                	je     8c8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8af:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8b2:	8b 50 04             	mov    0x4(%eax),%edx
 8b5:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8b8:	39 ce                	cmp    %ecx,%esi
 8ba:	74 1b                	je     8d7 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8bc:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8be:	a3 40 0e 00 00       	mov    %eax,0xe40
}
 8c3:	5b                   	pop    %ebx
 8c4:	5e                   	pop    %esi
 8c5:	5f                   	pop    %edi
 8c6:	5d                   	pop    %ebp
 8c7:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8c8:	03 72 04             	add    0x4(%edx),%esi
 8cb:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8ce:	8b 10                	mov    (%eax),%edx
 8d0:	8b 12                	mov    (%edx),%edx
 8d2:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8d5:	eb db                	jmp    8b2 <free+0x42>
    p->s.size += bp->s.size;
 8d7:	03 53 fc             	add    -0x4(%ebx),%edx
 8da:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8dd:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8e0:	89 10                	mov    %edx,(%eax)
 8e2:	eb da                	jmp    8be <free+0x4e>

000008e4 <morecore>:

static Header*
morecore(uint nu)
{
 8e4:	55                   	push   %ebp
 8e5:	89 e5                	mov    %esp,%ebp
 8e7:	53                   	push   %ebx
 8e8:	83 ec 04             	sub    $0x4,%esp
 8eb:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8ed:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8f2:	77 05                	ja     8f9 <morecore+0x15>
    nu = 4096;
 8f4:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8f9:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 900:	83 ec 0c             	sub    $0xc,%esp
 903:	50                   	push   %eax
 904:	e8 41 fd ff ff       	call   64a <sbrk>
  if(p == (char*)-1)
 909:	83 c4 10             	add    $0x10,%esp
 90c:	83 f8 ff             	cmp    $0xffffffff,%eax
 90f:	74 1c                	je     92d <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 911:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 914:	83 c0 08             	add    $0x8,%eax
 917:	83 ec 0c             	sub    $0xc,%esp
 91a:	50                   	push   %eax
 91b:	e8 50 ff ff ff       	call   870 <free>
  return freep;
 920:	a1 40 0e 00 00       	mov    0xe40,%eax
 925:	83 c4 10             	add    $0x10,%esp
}
 928:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 92b:	c9                   	leave  
 92c:	c3                   	ret    
    return 0;
 92d:	b8 00 00 00 00       	mov    $0x0,%eax
 932:	eb f4                	jmp    928 <morecore+0x44>

00000934 <malloc>:

void*
malloc(uint nbytes)
{
 934:	f3 0f 1e fb          	endbr32 
 938:	55                   	push   %ebp
 939:	89 e5                	mov    %esp,%ebp
 93b:	53                   	push   %ebx
 93c:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 93f:	8b 45 08             	mov    0x8(%ebp),%eax
 942:	8d 58 07             	lea    0x7(%eax),%ebx
 945:	c1 eb 03             	shr    $0x3,%ebx
 948:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 94b:	8b 0d 40 0e 00 00    	mov    0xe40,%ecx
 951:	85 c9                	test   %ecx,%ecx
 953:	74 04                	je     959 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 955:	8b 01                	mov    (%ecx),%eax
 957:	eb 4b                	jmp    9a4 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 959:	c7 05 40 0e 00 00 44 	movl   $0xe44,0xe40
 960:	0e 00 00 
 963:	c7 05 44 0e 00 00 44 	movl   $0xe44,0xe44
 96a:	0e 00 00 
    base.s.size = 0;
 96d:	c7 05 48 0e 00 00 00 	movl   $0x0,0xe48
 974:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 977:	b9 44 0e 00 00       	mov    $0xe44,%ecx
 97c:	eb d7                	jmp    955 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 97e:	74 1a                	je     99a <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 980:	29 da                	sub    %ebx,%edx
 982:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 985:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 988:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 98b:	89 0d 40 0e 00 00    	mov    %ecx,0xe40
      return (void*)(p + 1);
 991:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 994:	83 c4 04             	add    $0x4,%esp
 997:	5b                   	pop    %ebx
 998:	5d                   	pop    %ebp
 999:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 99a:	8b 10                	mov    (%eax),%edx
 99c:	89 11                	mov    %edx,(%ecx)
 99e:	eb eb                	jmp    98b <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a0:	89 c1                	mov    %eax,%ecx
 9a2:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9a4:	8b 50 04             	mov    0x4(%eax),%edx
 9a7:	39 da                	cmp    %ebx,%edx
 9a9:	73 d3                	jae    97e <malloc+0x4a>
    if(p == freep)
 9ab:	39 05 40 0e 00 00    	cmp    %eax,0xe40
 9b1:	75 ed                	jne    9a0 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 9b3:	89 d8                	mov    %ebx,%eax
 9b5:	e8 2a ff ff ff       	call   8e4 <morecore>
 9ba:	85 c0                	test   %eax,%eax
 9bc:	75 e2                	jne    9a0 <malloc+0x6c>
 9be:	eb d4                	jmp    994 <malloc+0x60>
