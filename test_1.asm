
_test_1:     file format elf32-i386


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
   assert(global == 1);
   a:	a1 04 0d 00 00       	mov    0xd04,%eax
   f:	83 f8 01             	cmp    $0x1,%eax
  12:	74 49                	je     5d <worker+0x5d>
  14:	6a 30                	push   $0x30
  16:	68 0c 09 00 00       	push   $0x90c
  1b:	68 15 09 00 00       	push   $0x915
  20:	6a 01                	push   $0x1
  22:	e8 27 06 00 00       	call   64e <printf>
  27:	83 c4 0c             	add    $0xc,%esp
  2a:	68 1d 09 00 00       	push   $0x91d
  2f:	68 29 09 00 00       	push   $0x929
  34:	6a 01                	push   $0x1
  36:	e8 13 06 00 00       	call   64e <printf>
  3b:	83 c4 08             	add    $0x8,%esp
  3e:	68 3d 09 00 00       	push   $0x93d
  43:	6a 01                	push   $0x1
  45:	e8 04 06 00 00       	call   64e <printf>
  4a:	83 c4 04             	add    $0x4,%esp
  4d:	ff 35 2c 0d 00 00    	pushl  0xd2c
  53:	e8 e5 04 00 00       	call   53d <kill>
  58:	e8 a8 04 00 00       	call   505 <exit>
   global = 5;
  5d:	c7 05 04 0d 00 00 05 	movl   $0x5,0xd04
  64:	00 00 00 
   exit();
  67:	e8 99 04 00 00       	call   505 <exit>

0000006c <main>:
{
  6c:	f3 0f 1e fb          	endbr32 
  70:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  74:	83 e4 f0             	and    $0xfffffff0,%esp
  77:	ff 71 fc             	pushl  -0x4(%ecx)
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  7d:	56                   	push   %esi
  7e:	53                   	push   %ebx
  7f:	51                   	push   %ecx
  80:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  83:	e8 05 05 00 00       	call   58d <getpid>
  88:	a3 2c 0d 00 00       	mov    %eax,0xd2c
   void *stack, *p = malloc(PGSIZE*2);
  8d:	83 ec 0c             	sub    $0xc,%esp
  90:	68 00 20 00 00       	push   $0x2000
  95:	e8 e5 07 00 00       	call   87f <malloc>
   assert(p != NULL);
  9a:	83 c4 10             	add    $0x10,%esp
  9d:	85 c0                	test   %eax,%eax
  9f:	0f 84 a9 00 00 00    	je     14e <main+0xe2>
  a5:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  a7:	89 c2                	mov    %eax,%edx
  a9:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  af:	74 09                	je     ba <main+0x4e>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  b1:	b8 00 10 00 00       	mov    $0x1000,%eax
  b6:	29 d0                	sub    %edx,%eax
  b8:	01 d8                	add    %ebx,%eax
   int clone_pid = clone(worker, 0, 0, stack);
  ba:	50                   	push   %eax
  bb:	6a 00                	push   $0x0
  bd:	6a 00                	push   $0x0
  bf:	68 00 00 00 00       	push   $0x0
  c4:	e8 34 04 00 00       	call   4fd <clone>
  c9:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
  cb:	83 c4 10             	add    $0x10,%esp
  ce:	85 c0                	test   %eax,%eax
  d0:	0f 8e c1 00 00 00    	jle    197 <main+0x12b>
   while(global != 5);
  d6:	a1 04 0d 00 00       	mov    0xd04,%eax
  db:	83 f8 05             	cmp    $0x5,%eax
  de:	75 f6                	jne    d6 <main+0x6a>
   printf(1, "TEST PASSED\n");
  e0:	83 ec 08             	sub    $0x8,%esp
  e3:	68 62 09 00 00       	push   $0x962
  e8:	6a 01                	push   $0x1
  ea:	e8 5f 05 00 00       	call   64e <printf>
   int join_pid = join(&join_stack);
  ef:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  f2:	89 04 24             	mov    %eax,(%esp)
  f5:	e8 1b 04 00 00       	call   515 <join>
   assert(join_pid == clone_pid);
  fa:	83 c4 10             	add    $0x10,%esp
  fd:	39 c6                	cmp    %eax,%esi
  ff:	0f 84 db 00 00 00    	je     1e0 <main+0x174>
 105:	6a 29                	push   $0x29
 107:	68 0c 09 00 00       	push   $0x90c
 10c:	68 15 09 00 00       	push   $0x915
 111:	6a 01                	push   $0x1
 113:	e8 36 05 00 00       	call   64e <printf>
 118:	83 c4 0c             	add    $0xc,%esp
 11b:	68 6f 09 00 00       	push   $0x96f
 120:	68 29 09 00 00       	push   $0x929
 125:	6a 01                	push   $0x1
 127:	e8 22 05 00 00       	call   64e <printf>
 12c:	83 c4 08             	add    $0x8,%esp
 12f:	68 3d 09 00 00       	push   $0x93d
 134:	6a 01                	push   $0x1
 136:	e8 13 05 00 00       	call   64e <printf>
 13b:	83 c4 04             	add    $0x4,%esp
 13e:	ff 35 2c 0d 00 00    	pushl  0xd2c
 144:	e8 f4 03 00 00       	call   53d <kill>
 149:	e8 b7 03 00 00       	call   505 <exit>
   assert(p != NULL);
 14e:	6a 1c                	push   $0x1c
 150:	68 0c 09 00 00       	push   $0x90c
 155:	68 15 09 00 00       	push   $0x915
 15a:	6a 01                	push   $0x1
 15c:	e8 ed 04 00 00       	call   64e <printf>
 161:	83 c4 0c             	add    $0xc,%esp
 164:	68 4a 09 00 00       	push   $0x94a
 169:	68 29 09 00 00       	push   $0x929
 16e:	6a 01                	push   $0x1
 170:	e8 d9 04 00 00       	call   64e <printf>
 175:	83 c4 08             	add    $0x8,%esp
 178:	68 3d 09 00 00       	push   $0x93d
 17d:	6a 01                	push   $0x1
 17f:	e8 ca 04 00 00       	call   64e <printf>
 184:	83 c4 04             	add    $0x4,%esp
 187:	ff 35 2c 0d 00 00    	pushl  0xd2c
 18d:	e8 ab 03 00 00       	call   53d <kill>
 192:	e8 6e 03 00 00       	call   505 <exit>
   assert(clone_pid > 0);
 197:	6a 23                	push   $0x23
 199:	68 0c 09 00 00       	push   $0x90c
 19e:	68 15 09 00 00       	push   $0x915
 1a3:	6a 01                	push   $0x1
 1a5:	e8 a4 04 00 00       	call   64e <printf>
 1aa:	83 c4 0c             	add    $0xc,%esp
 1ad:	68 54 09 00 00       	push   $0x954
 1b2:	68 29 09 00 00       	push   $0x929
 1b7:	6a 01                	push   $0x1
 1b9:	e8 90 04 00 00       	call   64e <printf>
 1be:	83 c4 08             	add    $0x8,%esp
 1c1:	68 3d 09 00 00       	push   $0x93d
 1c6:	6a 01                	push   $0x1
 1c8:	e8 81 04 00 00       	call   64e <printf>
 1cd:	83 c4 04             	add    $0x4,%esp
 1d0:	ff 35 2c 0d 00 00    	pushl  0xd2c
 1d6:	e8 62 03 00 00       	call   53d <kill>
 1db:	e8 25 03 00 00       	call   505 <exit>
   free(p);
 1e0:	83 ec 0c             	sub    $0xc,%esp
 1e3:	53                   	push   %ebx
 1e4:	e8 d2 05 00 00       	call   7bb <free>
   exit();
 1e9:	e8 17 03 00 00       	call   505 <exit>

000001ee <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 1ee:	f3 0f 1e fb          	endbr32 
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	56                   	push   %esi
 1f6:	53                   	push   %ebx
 1f7:	8b 75 08             	mov    0x8(%ebp),%esi
 1fa:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1fd:	89 f0                	mov    %esi,%eax
 1ff:	89 d1                	mov    %edx,%ecx
 201:	83 c2 01             	add    $0x1,%edx
 204:	89 c3                	mov    %eax,%ebx
 206:	83 c0 01             	add    $0x1,%eax
 209:	0f b6 09             	movzbl (%ecx),%ecx
 20c:	88 0b                	mov    %cl,(%ebx)
 20e:	84 c9                	test   %cl,%cl
 210:	75 ed                	jne    1ff <strcpy+0x11>
    ;
  return os;
}
 212:	89 f0                	mov    %esi,%eax
 214:	5b                   	pop    %ebx
 215:	5e                   	pop    %esi
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    

00000218 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 218:	f3 0f 1e fb          	endbr32 
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
 21f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 222:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 225:	0f b6 01             	movzbl (%ecx),%eax
 228:	84 c0                	test   %al,%al
 22a:	74 0c                	je     238 <strcmp+0x20>
 22c:	3a 02                	cmp    (%edx),%al
 22e:	75 08                	jne    238 <strcmp+0x20>
    p++, q++;
 230:	83 c1 01             	add    $0x1,%ecx
 233:	83 c2 01             	add    $0x1,%edx
 236:	eb ed                	jmp    225 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 238:	0f b6 c0             	movzbl %al,%eax
 23b:	0f b6 12             	movzbl (%edx),%edx
 23e:	29 d0                	sub    %edx,%eax
}
 240:	5d                   	pop    %ebp
 241:	c3                   	ret    

00000242 <strlen>:

uint
strlen(const char *s)
{
 242:	f3 0f 1e fb          	endbr32 
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 24c:	b8 00 00 00 00       	mov    $0x0,%eax
 251:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 255:	74 05                	je     25c <strlen+0x1a>
 257:	83 c0 01             	add    $0x1,%eax
 25a:	eb f5                	jmp    251 <strlen+0xf>
    ;
  return n;
}
 25c:	5d                   	pop    %ebp
 25d:	c3                   	ret    

0000025e <memset>:

void*
memset(void *dst, int c, uint n)
{
 25e:	f3 0f 1e fb          	endbr32 
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	57                   	push   %edi
 266:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 269:	89 d7                	mov    %edx,%edi
 26b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26e:	8b 45 0c             	mov    0xc(%ebp),%eax
 271:	fc                   	cld    
 272:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 274:	89 d0                	mov    %edx,%eax
 276:	5f                   	pop    %edi
 277:	5d                   	pop    %ebp
 278:	c3                   	ret    

00000279 <strchr>:

char*
strchr(const char *s, char c)
{
 279:	f3 0f 1e fb          	endbr32 
 27d:	55                   	push   %ebp
 27e:	89 e5                	mov    %esp,%ebp
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 287:	0f b6 10             	movzbl (%eax),%edx
 28a:	84 d2                	test   %dl,%dl
 28c:	74 09                	je     297 <strchr+0x1e>
    if(*s == c)
 28e:	38 ca                	cmp    %cl,%dl
 290:	74 0a                	je     29c <strchr+0x23>
  for(; *s; s++)
 292:	83 c0 01             	add    $0x1,%eax
 295:	eb f0                	jmp    287 <strchr+0xe>
      return (char*)s;
  return 0;
 297:	b8 00 00 00 00       	mov    $0x0,%eax
}
 29c:	5d                   	pop    %ebp
 29d:	c3                   	ret    

0000029e <gets>:

char*
gets(char *buf, int max)
{
 29e:	f3 0f 1e fb          	endbr32 
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	57                   	push   %edi
 2a6:	56                   	push   %esi
 2a7:	53                   	push   %ebx
 2a8:	83 ec 1c             	sub    $0x1c,%esp
 2ab:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ae:	bb 00 00 00 00       	mov    $0x0,%ebx
 2b3:	89 de                	mov    %ebx,%esi
 2b5:	83 c3 01             	add    $0x1,%ebx
 2b8:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2bb:	7d 2e                	jge    2eb <gets+0x4d>
    cc = read(0, &c, 1);
 2bd:	83 ec 04             	sub    $0x4,%esp
 2c0:	6a 01                	push   $0x1
 2c2:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2c5:	50                   	push   %eax
 2c6:	6a 00                	push   $0x0
 2c8:	e8 58 02 00 00       	call   525 <read>
    if(cc < 1)
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 17                	jle    2eb <gets+0x4d>
      break;
    buf[i++] = c;
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2db:	3c 0a                	cmp    $0xa,%al
 2dd:	0f 94 c2             	sete   %dl
 2e0:	3c 0d                	cmp    $0xd,%al
 2e2:	0f 94 c0             	sete   %al
 2e5:	08 c2                	or     %al,%dl
 2e7:	74 ca                	je     2b3 <gets+0x15>
    buf[i++] = c;
 2e9:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2eb:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2ef:	89 f8                	mov    %edi,%eax
 2f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2f4:	5b                   	pop    %ebx
 2f5:	5e                   	pop    %esi
 2f6:	5f                   	pop    %edi
 2f7:	5d                   	pop    %ebp
 2f8:	c3                   	ret    

000002f9 <stat>:

int
stat(const char *n, struct stat *st)
{
 2f9:	f3 0f 1e fb          	endbr32 
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
 300:	56                   	push   %esi
 301:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 302:	83 ec 08             	sub    $0x8,%esp
 305:	6a 00                	push   $0x0
 307:	ff 75 08             	pushl  0x8(%ebp)
 30a:	e8 3e 02 00 00       	call   54d <open>
  if(fd < 0)
 30f:	83 c4 10             	add    $0x10,%esp
 312:	85 c0                	test   %eax,%eax
 314:	78 24                	js     33a <stat+0x41>
 316:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 318:	83 ec 08             	sub    $0x8,%esp
 31b:	ff 75 0c             	pushl  0xc(%ebp)
 31e:	50                   	push   %eax
 31f:	e8 41 02 00 00       	call   565 <fstat>
 324:	89 c6                	mov    %eax,%esi
  close(fd);
 326:	89 1c 24             	mov    %ebx,(%esp)
 329:	e8 07 02 00 00       	call   535 <close>
  return r;
 32e:	83 c4 10             	add    $0x10,%esp
}
 331:	89 f0                	mov    %esi,%eax
 333:	8d 65 f8             	lea    -0x8(%ebp),%esp
 336:	5b                   	pop    %ebx
 337:	5e                   	pop    %esi
 338:	5d                   	pop    %ebp
 339:	c3                   	ret    
    return -1;
 33a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 33f:	eb f0                	jmp    331 <stat+0x38>

00000341 <atoi>:

int
atoi(const char *s)
{
 341:	f3 0f 1e fb          	endbr32 
 345:	55                   	push   %ebp
 346:	89 e5                	mov    %esp,%ebp
 348:	53                   	push   %ebx
 349:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 34c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 351:	0f b6 01             	movzbl (%ecx),%eax
 354:	8d 58 d0             	lea    -0x30(%eax),%ebx
 357:	80 fb 09             	cmp    $0x9,%bl
 35a:	77 12                	ja     36e <atoi+0x2d>
    n = n*10 + *s++ - '0';
 35c:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 35f:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 362:	83 c1 01             	add    $0x1,%ecx
 365:	0f be c0             	movsbl %al,%eax
 368:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 36c:	eb e3                	jmp    351 <atoi+0x10>
  return n;
}
 36e:	89 d0                	mov    %edx,%eax
 370:	5b                   	pop    %ebx
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    

00000373 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 373:	f3 0f 1e fb          	endbr32 
 377:	55                   	push   %ebp
 378:	89 e5                	mov    %esp,%ebp
 37a:	56                   	push   %esi
 37b:	53                   	push   %ebx
 37c:	8b 75 08             	mov    0x8(%ebp),%esi
 37f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 382:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 385:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 387:	8d 58 ff             	lea    -0x1(%eax),%ebx
 38a:	85 c0                	test   %eax,%eax
 38c:	7e 0f                	jle    39d <memmove+0x2a>
    *dst++ = *src++;
 38e:	0f b6 01             	movzbl (%ecx),%eax
 391:	88 02                	mov    %al,(%edx)
 393:	8d 49 01             	lea    0x1(%ecx),%ecx
 396:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 399:	89 d8                	mov    %ebx,%eax
 39b:	eb ea                	jmp    387 <memmove+0x14>
  return vdst;
}
 39d:	89 f0                	mov    %esi,%eax
 39f:	5b                   	pop    %ebx
 3a0:	5e                   	pop    %esi
 3a1:	5d                   	pop    %ebp
 3a2:	c3                   	ret    

000003a3 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 3a3:	f3 0f 1e fb          	endbr32 
 3a7:	55                   	push   %ebp
 3a8:	89 e5                	mov    %esp,%ebp
 3aa:	53                   	push   %ebx
 3ab:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 3ae:	68 00 20 00 00       	push   $0x2000
 3b3:	e8 c7 04 00 00       	call   87f <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 3b8:	83 c4 10             	add    $0x10,%esp
 3bb:	89 c2                	mov    %eax,%edx
 3bd:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3c3:	74 22                	je     3e7 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 3c5:	b9 00 10 00 00       	mov    $0x1000,%ecx
 3ca:	29 d1                	sub    %edx,%ecx
 3cc:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 3ce:	ba 00 00 00 00       	mov    $0x0,%edx
 3d3:	83 fa 3f             	cmp    $0x3f,%edx
 3d6:	7f 13                	jg     3eb <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 3d8:	83 3c 95 40 10 00 00 	cmpl   $0x1,0x1040(,%edx,4)
 3df:	01 
 3e0:	75 09                	jne    3eb <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 3e2:	83 c2 01             	add    $0x1,%edx
 3e5:	eb ec                	jmp    3d3 <thread_create+0x30>
  void *user_stack = curr_ptr;
 3e7:	89 c1                	mov    %eax,%ecx
 3e9:	eb e3                	jmp    3ce <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 3eb:	83 3c 95 40 10 00 00 	cmpl   $0x1,0x1040(,%edx,4)
 3f2:	01 
 3f3:	74 34                	je     429 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 3f5:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 3f8:	c1 e3 02             	shl    $0x2,%ebx
 3fb:	89 83 40 0d 00 00    	mov    %eax,0xd40(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 401:	89 8b 44 0d 00 00    	mov    %ecx,0xd44(%ebx)
  cell_full[i] = 1;
 407:	c7 04 95 40 10 00 00 	movl   $0x1,0x1040(,%edx,4)
 40e:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 412:	ff 75 10             	pushl  0x10(%ebp)
 415:	ff 75 0c             	pushl  0xc(%ebp)
 418:	ff 75 08             	pushl  0x8(%ebp)
 41b:	51                   	push   %ecx
 41c:	e8 dc 00 00 00       	call   4fd <clone>
 421:	83 c4 10             	add    $0x10,%esp
}
 424:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 427:	c9                   	leave  
 428:	c3                   	ret    
    return -1;
 429:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 42e:	eb f4                	jmp    424 <thread_create+0x81>

00000430 <thread_join>:

int thread_join(){
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	56                   	push   %esi
 438:	53                   	push   %ebx
 439:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 43c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 43f:	50                   	push   %eax
 440:	e8 d0 00 00 00       	call   515 <join>
 445:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 447:	83 c4 10             	add    $0x10,%esp
 44a:	bb 00 00 00 00       	mov    $0x0,%ebx
 44f:	83 fb 3f             	cmp    $0x3f,%ebx
 452:	7f 14                	jg     468 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 454:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 457:	8b 55 f4             	mov    -0xc(%ebp),%edx
 45a:	39 14 85 44 0d 00 00 	cmp    %edx,0xd44(,%eax,4)
 461:	74 05                	je     468 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 463:	83 c3 01             	add    $0x1,%ebx
 466:	eb e7                	jmp    44f <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 468:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 46b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 46e:	39 0c 85 44 0d 00 00 	cmp    %ecx,0xd44(,%eax,4)
 475:	75 26                	jne    49d <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 477:	83 ec 0c             	sub    $0xc,%esp
 47a:	ff 34 85 40 0d 00 00 	pushl  0xd40(,%eax,4)
 481:	e8 35 03 00 00       	call   7bb <free>
  cell_full[i] = 0;
 486:	c7 04 9d 40 10 00 00 	movl   $0x0,0x1040(,%ebx,4)
 48d:	00 00 00 00 

  return out;
 491:	83 c4 10             	add    $0x10,%esp
}
 494:	89 f0                	mov    %esi,%eax
 496:	8d 65 f8             	lea    -0x8(%ebp),%esp
 499:	5b                   	pop    %ebx
 49a:	5e                   	pop    %esi
 49b:	5d                   	pop    %ebp
 49c:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 49d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4a2:	eb f0                	jmp    494 <thread_join+0x64>

000004a4 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 4a4:	f3 0f 1e fb          	endbr32 
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 4ae:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 4b4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <lock_acquire>:

void lock_acquire(lock_t *lock) {
 4bd:	f3 0f 1e fb          	endbr32 
 4c1:	55                   	push   %ebp
 4c2:	89 e5                	mov    %esp,%ebp
 4c4:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 4c7:	b9 01 00 00 00       	mov    $0x1,%ecx
 4cc:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 4d0:	b8 00 00 00 00       	mov    $0x0,%eax
 4d5:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 4da:	39 c1                	cmp    %eax,%ecx
 4dc:	75 f2                	jne    4d0 <lock_acquire+0x13>
      ; // spin
    }
}
 4de:	5d                   	pop    %ebp
 4df:	c3                   	ret    

000004e0 <lock_release>:

void lock_release(lock_t *lock) {
 4e0:	f3 0f 1e fb          	endbr32 
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 4ea:	8b 42 04             	mov    0x4(%edx),%eax
 4ed:	83 c0 01             	add    $0x1,%eax
 4f0:	89 42 04             	mov    %eax,0x4(%edx)
}
 4f3:	5d                   	pop    %ebp
 4f4:	c3                   	ret    

000004f5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4f5:	b8 01 00 00 00       	mov    $0x1,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <clone>:
SYSCALL(clone)
 4fd:	b8 16 00 00 00       	mov    $0x16,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <exit>:
SYSCALL(exit)
 505:	b8 02 00 00 00       	mov    $0x2,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <wait>:
SYSCALL(wait)
 50d:	b8 03 00 00 00       	mov    $0x3,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <join>:
SYSCALL(join)
 515:	b8 17 00 00 00       	mov    $0x17,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <pipe>:
SYSCALL(pipe)
 51d:	b8 04 00 00 00       	mov    $0x4,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <read>:
SYSCALL(read)
 525:	b8 05 00 00 00       	mov    $0x5,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <write>:
SYSCALL(write)
 52d:	b8 10 00 00 00       	mov    $0x10,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <close>:
SYSCALL(close)
 535:	b8 15 00 00 00       	mov    $0x15,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <kill>:
SYSCALL(kill)
 53d:	b8 06 00 00 00       	mov    $0x6,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <exec>:
SYSCALL(exec)
 545:	b8 07 00 00 00       	mov    $0x7,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <open>:
SYSCALL(open)
 54d:	b8 0f 00 00 00       	mov    $0xf,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <mknod>:
SYSCALL(mknod)
 555:	b8 11 00 00 00       	mov    $0x11,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <unlink>:
SYSCALL(unlink)
 55d:	b8 12 00 00 00       	mov    $0x12,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <fstat>:
SYSCALL(fstat)
 565:	b8 08 00 00 00       	mov    $0x8,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <link>:
SYSCALL(link)
 56d:	b8 13 00 00 00       	mov    $0x13,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <mkdir>:
SYSCALL(mkdir)
 575:	b8 14 00 00 00       	mov    $0x14,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <chdir>:
SYSCALL(chdir)
 57d:	b8 09 00 00 00       	mov    $0x9,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <dup>:
SYSCALL(dup)
 585:	b8 0a 00 00 00       	mov    $0xa,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <getpid>:
SYSCALL(getpid)
 58d:	b8 0b 00 00 00       	mov    $0xb,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <sbrk>:
SYSCALL(sbrk)
 595:	b8 0c 00 00 00       	mov    $0xc,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <sleep>:
SYSCALL(sleep)
 59d:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <uptime>:
SYSCALL(uptime)
 5a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	83 ec 1c             	sub    $0x1c,%esp
 5b3:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 5b6:	6a 01                	push   $0x1
 5b8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 5bb:	52                   	push   %edx
 5bc:	50                   	push   %eax
 5bd:	e8 6b ff ff ff       	call   52d <write>
}
 5c2:	83 c4 10             	add    $0x10,%esp
 5c5:	c9                   	leave  
 5c6:	c3                   	ret    

000005c7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5c7:	55                   	push   %ebp
 5c8:	89 e5                	mov    %esp,%ebp
 5ca:	57                   	push   %edi
 5cb:	56                   	push   %esi
 5cc:	53                   	push   %ebx
 5cd:	83 ec 2c             	sub    $0x2c,%esp
 5d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d3:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5d9:	0f 95 c2             	setne  %dl
 5dc:	89 f0                	mov    %esi,%eax
 5de:	c1 e8 1f             	shr    $0x1f,%eax
 5e1:	84 c2                	test   %al,%dl
 5e3:	74 42                	je     627 <printint+0x60>
    neg = 1;
    x = -xx;
 5e5:	f7 de                	neg    %esi
    neg = 1;
 5e7:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5ee:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5f3:	89 f0                	mov    %esi,%eax
 5f5:	ba 00 00 00 00       	mov    $0x0,%edx
 5fa:	f7 f1                	div    %ecx
 5fc:	89 df                	mov    %ebx,%edi
 5fe:	83 c3 01             	add    $0x1,%ebx
 601:	0f b6 92 8c 09 00 00 	movzbl 0x98c(%edx),%edx
 608:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 60c:	89 f2                	mov    %esi,%edx
 60e:	89 c6                	mov    %eax,%esi
 610:	39 d1                	cmp    %edx,%ecx
 612:	76 df                	jbe    5f3 <printint+0x2c>
  if(neg)
 614:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 618:	74 2f                	je     649 <printint+0x82>
    buf[i++] = '-';
 61a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 61f:	8d 5f 02             	lea    0x2(%edi),%ebx
 622:	8b 75 d0             	mov    -0x30(%ebp),%esi
 625:	eb 15                	jmp    63c <printint+0x75>
  neg = 0;
 627:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 62e:	eb be                	jmp    5ee <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 630:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 635:	89 f0                	mov    %esi,%eax
 637:	e8 71 ff ff ff       	call   5ad <putc>
  while(--i >= 0)
 63c:	83 eb 01             	sub    $0x1,%ebx
 63f:	79 ef                	jns    630 <printint+0x69>
}
 641:	83 c4 2c             	add    $0x2c,%esp
 644:	5b                   	pop    %ebx
 645:	5e                   	pop    %esi
 646:	5f                   	pop    %edi
 647:	5d                   	pop    %ebp
 648:	c3                   	ret    
 649:	8b 75 d0             	mov    -0x30(%ebp),%esi
 64c:	eb ee                	jmp    63c <printint+0x75>

0000064e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 64e:	f3 0f 1e fb          	endbr32 
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	57                   	push   %edi
 656:	56                   	push   %esi
 657:	53                   	push   %ebx
 658:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 65b:	8d 45 10             	lea    0x10(%ebp),%eax
 65e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 661:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 666:	bb 00 00 00 00       	mov    $0x0,%ebx
 66b:	eb 14                	jmp    681 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 66d:	89 fa                	mov    %edi,%edx
 66f:	8b 45 08             	mov    0x8(%ebp),%eax
 672:	e8 36 ff ff ff       	call   5ad <putc>
 677:	eb 05                	jmp    67e <printf+0x30>
      }
    } else if(state == '%'){
 679:	83 fe 25             	cmp    $0x25,%esi
 67c:	74 25                	je     6a3 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 67e:	83 c3 01             	add    $0x1,%ebx
 681:	8b 45 0c             	mov    0xc(%ebp),%eax
 684:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 688:	84 c0                	test   %al,%al
 68a:	0f 84 23 01 00 00    	je     7b3 <printf+0x165>
    c = fmt[i] & 0xff;
 690:	0f be f8             	movsbl %al,%edi
 693:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 696:	85 f6                	test   %esi,%esi
 698:	75 df                	jne    679 <printf+0x2b>
      if(c == '%'){
 69a:	83 f8 25             	cmp    $0x25,%eax
 69d:	75 ce                	jne    66d <printf+0x1f>
        state = '%';
 69f:	89 c6                	mov    %eax,%esi
 6a1:	eb db                	jmp    67e <printf+0x30>
      if(c == 'd'){
 6a3:	83 f8 64             	cmp    $0x64,%eax
 6a6:	74 49                	je     6f1 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6a8:	83 f8 78             	cmp    $0x78,%eax
 6ab:	0f 94 c1             	sete   %cl
 6ae:	83 f8 70             	cmp    $0x70,%eax
 6b1:	0f 94 c2             	sete   %dl
 6b4:	08 d1                	or     %dl,%cl
 6b6:	75 63                	jne    71b <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6b8:	83 f8 73             	cmp    $0x73,%eax
 6bb:	0f 84 84 00 00 00    	je     745 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6c1:	83 f8 63             	cmp    $0x63,%eax
 6c4:	0f 84 b7 00 00 00    	je     781 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6ca:	83 f8 25             	cmp    $0x25,%eax
 6cd:	0f 84 cc 00 00 00    	je     79f <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6d3:	ba 25 00 00 00       	mov    $0x25,%edx
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	e8 cd fe ff ff       	call   5ad <putc>
        putc(fd, c);
 6e0:	89 fa                	mov    %edi,%edx
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	e8 c3 fe ff ff       	call   5ad <putc>
      }
      state = 0;
 6ea:	be 00 00 00 00       	mov    $0x0,%esi
 6ef:	eb 8d                	jmp    67e <printf+0x30>
        printint(fd, *ap, 10, 1);
 6f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6f4:	8b 17                	mov    (%edi),%edx
 6f6:	83 ec 0c             	sub    $0xc,%esp
 6f9:	6a 01                	push   $0x1
 6fb:	b9 0a 00 00 00       	mov    $0xa,%ecx
 700:	8b 45 08             	mov    0x8(%ebp),%eax
 703:	e8 bf fe ff ff       	call   5c7 <printint>
        ap++;
 708:	83 c7 04             	add    $0x4,%edi
 70b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 70e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 711:	be 00 00 00 00       	mov    $0x0,%esi
 716:	e9 63 ff ff ff       	jmp    67e <printf+0x30>
        printint(fd, *ap, 16, 0);
 71b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 71e:	8b 17                	mov    (%edi),%edx
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	6a 00                	push   $0x0
 725:	b9 10 00 00 00       	mov    $0x10,%ecx
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	e8 95 fe ff ff       	call   5c7 <printint>
        ap++;
 732:	83 c7 04             	add    $0x4,%edi
 735:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 738:	83 c4 10             	add    $0x10,%esp
      state = 0;
 73b:	be 00 00 00 00       	mov    $0x0,%esi
 740:	e9 39 ff ff ff       	jmp    67e <printf+0x30>
        s = (char*)*ap;
 745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 748:	8b 30                	mov    (%eax),%esi
        ap++;
 74a:	83 c0 04             	add    $0x4,%eax
 74d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 750:	85 f6                	test   %esi,%esi
 752:	75 28                	jne    77c <printf+0x12e>
          s = "(null)";
 754:	be 85 09 00 00       	mov    $0x985,%esi
 759:	8b 7d 08             	mov    0x8(%ebp),%edi
 75c:	eb 0d                	jmp    76b <printf+0x11d>
          putc(fd, *s);
 75e:	0f be d2             	movsbl %dl,%edx
 761:	89 f8                	mov    %edi,%eax
 763:	e8 45 fe ff ff       	call   5ad <putc>
          s++;
 768:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 76b:	0f b6 16             	movzbl (%esi),%edx
 76e:	84 d2                	test   %dl,%dl
 770:	75 ec                	jne    75e <printf+0x110>
      state = 0;
 772:	be 00 00 00 00       	mov    $0x0,%esi
 777:	e9 02 ff ff ff       	jmp    67e <printf+0x30>
 77c:	8b 7d 08             	mov    0x8(%ebp),%edi
 77f:	eb ea                	jmp    76b <printf+0x11d>
        putc(fd, *ap);
 781:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 784:	0f be 17             	movsbl (%edi),%edx
 787:	8b 45 08             	mov    0x8(%ebp),%eax
 78a:	e8 1e fe ff ff       	call   5ad <putc>
        ap++;
 78f:	83 c7 04             	add    $0x4,%edi
 792:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 795:	be 00 00 00 00       	mov    $0x0,%esi
 79a:	e9 df fe ff ff       	jmp    67e <printf+0x30>
        putc(fd, c);
 79f:	89 fa                	mov    %edi,%edx
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	e8 04 fe ff ff       	call   5ad <putc>
      state = 0;
 7a9:	be 00 00 00 00       	mov    $0x0,%esi
 7ae:	e9 cb fe ff ff       	jmp    67e <printf+0x30>
    }
  }
}
 7b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7b6:	5b                   	pop    %ebx
 7b7:	5e                   	pop    %esi
 7b8:	5f                   	pop    %edi
 7b9:	5d                   	pop    %ebp
 7ba:	c3                   	ret    

000007bb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7bb:	f3 0f 1e fb          	endbr32 
 7bf:	55                   	push   %ebp
 7c0:	89 e5                	mov    %esp,%ebp
 7c2:	57                   	push   %edi
 7c3:	56                   	push   %esi
 7c4:	53                   	push   %ebx
 7c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c8:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7cb:	a1 20 0d 00 00       	mov    0xd20,%eax
 7d0:	eb 02                	jmp    7d4 <free+0x19>
 7d2:	89 d0                	mov    %edx,%eax
 7d4:	39 c8                	cmp    %ecx,%eax
 7d6:	73 04                	jae    7dc <free+0x21>
 7d8:	39 08                	cmp    %ecx,(%eax)
 7da:	77 12                	ja     7ee <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7dc:	8b 10                	mov    (%eax),%edx
 7de:	39 c2                	cmp    %eax,%edx
 7e0:	77 f0                	ja     7d2 <free+0x17>
 7e2:	39 c8                	cmp    %ecx,%eax
 7e4:	72 08                	jb     7ee <free+0x33>
 7e6:	39 ca                	cmp    %ecx,%edx
 7e8:	77 04                	ja     7ee <free+0x33>
 7ea:	89 d0                	mov    %edx,%eax
 7ec:	eb e6                	jmp    7d4 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ee:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7f1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7f4:	8b 10                	mov    (%eax),%edx
 7f6:	39 d7                	cmp    %edx,%edi
 7f8:	74 19                	je     813 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 803:	39 ce                	cmp    %ecx,%esi
 805:	74 1b                	je     822 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 807:	89 08                	mov    %ecx,(%eax)
  freep = p;
 809:	a3 20 0d 00 00       	mov    %eax,0xd20
}
 80e:	5b                   	pop    %ebx
 80f:	5e                   	pop    %esi
 810:	5f                   	pop    %edi
 811:	5d                   	pop    %ebp
 812:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 813:	03 72 04             	add    0x4(%edx),%esi
 816:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 819:	8b 10                	mov    (%eax),%edx
 81b:	8b 12                	mov    (%edx),%edx
 81d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 820:	eb db                	jmp    7fd <free+0x42>
    p->s.size += bp->s.size;
 822:	03 53 fc             	add    -0x4(%ebx),%edx
 825:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 828:	8b 53 f8             	mov    -0x8(%ebx),%edx
 82b:	89 10                	mov    %edx,(%eax)
 82d:	eb da                	jmp    809 <free+0x4e>

0000082f <morecore>:

static Header*
morecore(uint nu)
{
 82f:	55                   	push   %ebp
 830:	89 e5                	mov    %esp,%ebp
 832:	53                   	push   %ebx
 833:	83 ec 04             	sub    $0x4,%esp
 836:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 838:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 83d:	77 05                	ja     844 <morecore+0x15>
    nu = 4096;
 83f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 844:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 84b:	83 ec 0c             	sub    $0xc,%esp
 84e:	50                   	push   %eax
 84f:	e8 41 fd ff ff       	call   595 <sbrk>
  if(p == (char*)-1)
 854:	83 c4 10             	add    $0x10,%esp
 857:	83 f8 ff             	cmp    $0xffffffff,%eax
 85a:	74 1c                	je     878 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 85c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 85f:	83 c0 08             	add    $0x8,%eax
 862:	83 ec 0c             	sub    $0xc,%esp
 865:	50                   	push   %eax
 866:	e8 50 ff ff ff       	call   7bb <free>
  return freep;
 86b:	a1 20 0d 00 00       	mov    0xd20,%eax
 870:	83 c4 10             	add    $0x10,%esp
}
 873:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 876:	c9                   	leave  
 877:	c3                   	ret    
    return 0;
 878:	b8 00 00 00 00       	mov    $0x0,%eax
 87d:	eb f4                	jmp    873 <morecore+0x44>

0000087f <malloc>:

void*
malloc(uint nbytes)
{
 87f:	f3 0f 1e fb          	endbr32 
 883:	55                   	push   %ebp
 884:	89 e5                	mov    %esp,%ebp
 886:	53                   	push   %ebx
 887:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88a:	8b 45 08             	mov    0x8(%ebp),%eax
 88d:	8d 58 07             	lea    0x7(%eax),%ebx
 890:	c1 eb 03             	shr    $0x3,%ebx
 893:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 896:	8b 0d 20 0d 00 00    	mov    0xd20,%ecx
 89c:	85 c9                	test   %ecx,%ecx
 89e:	74 04                	je     8a4 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a0:	8b 01                	mov    (%ecx),%eax
 8a2:	eb 4b                	jmp    8ef <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 8a4:	c7 05 20 0d 00 00 24 	movl   $0xd24,0xd20
 8ab:	0d 00 00 
 8ae:	c7 05 24 0d 00 00 24 	movl   $0xd24,0xd24
 8b5:	0d 00 00 
    base.s.size = 0;
 8b8:	c7 05 28 0d 00 00 00 	movl   $0x0,0xd28
 8bf:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8c2:	b9 24 0d 00 00       	mov    $0xd24,%ecx
 8c7:	eb d7                	jmp    8a0 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8c9:	74 1a                	je     8e5 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8cb:	29 da                	sub    %ebx,%edx
 8cd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d0:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8d3:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8d6:	89 0d 20 0d 00 00    	mov    %ecx,0xd20
      return (void*)(p + 1);
 8dc:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8df:	83 c4 04             	add    $0x4,%esp
 8e2:	5b                   	pop    %ebx
 8e3:	5d                   	pop    %ebp
 8e4:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8e5:	8b 10                	mov    (%eax),%edx
 8e7:	89 11                	mov    %edx,(%ecx)
 8e9:	eb eb                	jmp    8d6 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8eb:	89 c1                	mov    %eax,%ecx
 8ed:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8ef:	8b 50 04             	mov    0x4(%eax),%edx
 8f2:	39 da                	cmp    %ebx,%edx
 8f4:	73 d3                	jae    8c9 <malloc+0x4a>
    if(p == freep)
 8f6:	39 05 20 0d 00 00    	cmp    %eax,0xd20
 8fc:	75 ed                	jne    8eb <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 8fe:	89 d8                	mov    %ebx,%eax
 900:	e8 2a ff ff ff       	call   82f <morecore>
 905:	85 c0                	test   %eax,%eax
 907:	75 e2                	jne    8eb <malloc+0x6c>
 909:	eb d4                	jmp    8df <malloc+0x60>
