
_test_15:     file format elf32-i386


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
   7:	53                   	push   %ebx
   8:	83 ec 04             	sub    $0x4,%esp
   int i, j, tmp;
   for (i = 0; i < loops; i++) {
   b:	bb 00 00 00 00       	mov    $0x0,%ebx
  10:	eb 1b                	jmp    2d <worker+0x2d>
      lock_acquire(&lock);
      tmp = global;
      for(j = 0; j < 50; j++); // take some time
      global = tmp + 1;
  12:	8d 42 01             	lea    0x1(%edx),%eax
  15:	a3 00 0d 00 00       	mov    %eax,0xd00
      lock_release(&lock);
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	68 10 0d 00 00       	push   $0xd10
  22:	e8 9b 04 00 00       	call   4c2 <lock_release>
   for (i = 0; i < loops; i++) {
  27:	83 c3 01             	add    $0x1,%ebx
  2a:	83 c4 10             	add    $0x10,%esp
  2d:	39 1d e8 0c 00 00    	cmp    %ebx,0xce8
  33:	7e 25                	jle    5a <worker+0x5a>
      lock_acquire(&lock);
  35:	83 ec 0c             	sub    $0xc,%esp
  38:	68 10 0d 00 00       	push   $0xd10
  3d:	e8 5d 04 00 00       	call   49f <lock_acquire>
      tmp = global;
  42:	8b 15 00 0d 00 00    	mov    0xd00,%edx
      for(j = 0; j < 50; j++); // take some time
  48:	83 c4 10             	add    $0x10,%esp
  4b:	b8 00 00 00 00       	mov    $0x0,%eax
  50:	83 f8 31             	cmp    $0x31,%eax
  53:	7f bd                	jg     12 <worker+0x12>
  55:	83 c0 01             	add    $0x1,%eax
  58:	eb f6                	jmp    50 <worker+0x50>
   }
   exit();
  5a:	e8 88 04 00 00       	call   4e7 <exit>

0000005f <main>:
{
  5f:	f3 0f 1e fb          	endbr32 
  63:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  67:	83 e4 f0             	and    $0xfffffff0,%esp
  6a:	ff 71 fc             	pushl  -0x4(%ecx)
  6d:	55                   	push   %ebp
  6e:	89 e5                	mov    %esp,%ebp
  70:	53                   	push   %ebx
  71:	51                   	push   %ecx
   ppid = getpid();
  72:	e8 f8 04 00 00       	call   56f <getpid>
  77:	a3 18 0d 00 00       	mov    %eax,0xd18
   lock_init(&lock);
  7c:	83 ec 0c             	sub    $0xc,%esp
  7f:	68 10 0d 00 00       	push   $0xd10
  84:	e8 fd 03 00 00       	call   486 <lock_init>
   for (i = 0; i < num_threads; i++) {
  89:	83 c4 10             	add    $0x10,%esp
  8c:	bb 00 00 00 00       	mov    $0x0,%ebx
  91:	39 1d ec 0c 00 00    	cmp    %ebx,0xcec
  97:	7e 66                	jle    ff <main+0xa0>
      int thread_pid = thread_create(worker, 0, 0);
  99:	83 ec 04             	sub    $0x4,%esp
  9c:	6a 00                	push   $0x0
  9e:	6a 00                	push   $0x0
  a0:	68 00 00 00 00       	push   $0x0
  a5:	e8 db 02 00 00       	call   385 <thread_create>
      assert(thread_pid > 0);
  aa:	83 c4 10             	add    $0x10,%esp
  ad:	85 c0                	test   %eax,%eax
  af:	7e 05                	jle    b6 <main+0x57>
   for (i = 0; i < num_threads; i++) {
  b1:	83 c3 01             	add    $0x1,%ebx
  b4:	eb db                	jmp    91 <main+0x32>
      assert(thread_pid > 0);
  b6:	6a 25                	push   $0x25
  b8:	68 f0 08 00 00       	push   $0x8f0
  bd:	68 fa 08 00 00       	push   $0x8fa
  c2:	6a 01                	push   $0x1
  c4:	e8 67 05 00 00       	call   630 <printf>
  c9:	83 c4 0c             	add    $0xc,%esp
  cc:	68 02 09 00 00       	push   $0x902
  d1:	68 11 09 00 00       	push   $0x911
  d6:	6a 01                	push   $0x1
  d8:	e8 53 05 00 00       	call   630 <printf>
  dd:	83 c4 08             	add    $0x8,%esp
  e0:	68 25 09 00 00       	push   $0x925
  e5:	6a 01                	push   $0x1
  e7:	e8 44 05 00 00       	call   630 <printf>
  ec:	83 c4 04             	add    $0x4,%esp
  ef:	ff 35 18 0d 00 00    	pushl  0xd18
  f5:	e8 25 04 00 00       	call   51f <kill>
  fa:	e8 e8 03 00 00       	call   4e7 <exit>
   for (i = 0; i < num_threads; i++) {
  ff:	bb 00 00 00 00       	mov    $0x0,%ebx
 104:	a1 ec 0c 00 00       	mov    0xcec,%eax
 109:	39 d8                	cmp    %ebx,%eax
 10b:	7e 57                	jle    164 <main+0x105>
      int join_pid = thread_join();
 10d:	e8 00 03 00 00       	call   412 <thread_join>
      assert(join_pid > 0);
 112:	85 c0                	test   %eax,%eax
 114:	7e 05                	jle    11b <main+0xbc>
   for (i = 0; i < num_threads; i++) {
 116:	83 c3 01             	add    $0x1,%ebx
 119:	eb e9                	jmp    104 <main+0xa5>
      assert(join_pid > 0);
 11b:	6a 2a                	push   $0x2a
 11d:	68 f0 08 00 00       	push   $0x8f0
 122:	68 fa 08 00 00       	push   $0x8fa
 127:	6a 01                	push   $0x1
 129:	e8 02 05 00 00       	call   630 <printf>
 12e:	83 c4 0c             	add    $0xc,%esp
 131:	68 32 09 00 00       	push   $0x932
 136:	68 11 09 00 00       	push   $0x911
 13b:	6a 01                	push   $0x1
 13d:	e8 ee 04 00 00       	call   630 <printf>
 142:	83 c4 08             	add    $0x8,%esp
 145:	68 25 09 00 00       	push   $0x925
 14a:	6a 01                	push   $0x1
 14c:	e8 df 04 00 00       	call   630 <printf>
 151:	83 c4 04             	add    $0x4,%esp
 154:	ff 35 18 0d 00 00    	pushl  0xd18
 15a:	e8 c0 03 00 00       	call   51f <kill>
 15f:	e8 83 03 00 00       	call   4e7 <exit>
   assert(global == num_threads * loops);
 164:	0f af 05 e8 0c 00 00 	imul   0xce8,%eax
 16b:	3b 05 00 0d 00 00    	cmp    0xd00,%eax
 171:	74 49                	je     1bc <main+0x15d>
 173:	6a 2d                	push   $0x2d
 175:	68 f0 08 00 00       	push   $0x8f0
 17a:	68 fa 08 00 00       	push   $0x8fa
 17f:	6a 01                	push   $0x1
 181:	e8 aa 04 00 00       	call   630 <printf>
 186:	83 c4 0c             	add    $0xc,%esp
 189:	68 3f 09 00 00       	push   $0x93f
 18e:	68 11 09 00 00       	push   $0x911
 193:	6a 01                	push   $0x1
 195:	e8 96 04 00 00       	call   630 <printf>
 19a:	83 c4 08             	add    $0x8,%esp
 19d:	68 25 09 00 00       	push   $0x925
 1a2:	6a 01                	push   $0x1
 1a4:	e8 87 04 00 00       	call   630 <printf>
 1a9:	83 c4 04             	add    $0x4,%esp
 1ac:	ff 35 18 0d 00 00    	pushl  0xd18
 1b2:	e8 68 03 00 00       	call   51f <kill>
 1b7:	e8 2b 03 00 00       	call   4e7 <exit>
   printf(1, "TEST PASSED\n");
 1bc:	83 ec 08             	sub    $0x8,%esp
 1bf:	68 5d 09 00 00       	push   $0x95d
 1c4:	6a 01                	push   $0x1
 1c6:	e8 65 04 00 00       	call   630 <printf>
   exit();
 1cb:	e8 17 03 00 00       	call   4e7 <exit>

000001d0 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 1d0:	f3 0f 1e fb          	endbr32 
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	56                   	push   %esi
 1d8:	53                   	push   %ebx
 1d9:	8b 75 08             	mov    0x8(%ebp),%esi
 1dc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1df:	89 f0                	mov    %esi,%eax
 1e1:	89 d1                	mov    %edx,%ecx
 1e3:	83 c2 01             	add    $0x1,%edx
 1e6:	89 c3                	mov    %eax,%ebx
 1e8:	83 c0 01             	add    $0x1,%eax
 1eb:	0f b6 09             	movzbl (%ecx),%ecx
 1ee:	88 0b                	mov    %cl,(%ebx)
 1f0:	84 c9                	test   %cl,%cl
 1f2:	75 ed                	jne    1e1 <strcpy+0x11>
    ;
  return os;
}
 1f4:	89 f0                	mov    %esi,%eax
 1f6:	5b                   	pop    %ebx
 1f7:	5e                   	pop    %esi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1fa:	f3 0f 1e fb          	endbr32 
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	8b 4d 08             	mov    0x8(%ebp),%ecx
 204:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 207:	0f b6 01             	movzbl (%ecx),%eax
 20a:	84 c0                	test   %al,%al
 20c:	74 0c                	je     21a <strcmp+0x20>
 20e:	3a 02                	cmp    (%edx),%al
 210:	75 08                	jne    21a <strcmp+0x20>
    p++, q++;
 212:	83 c1 01             	add    $0x1,%ecx
 215:	83 c2 01             	add    $0x1,%edx
 218:	eb ed                	jmp    207 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 21a:	0f b6 c0             	movzbl %al,%eax
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	29 d0                	sub    %edx,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <strlen>:

uint
strlen(const char *s)
{
 224:	f3 0f 1e fb          	endbr32 
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 22e:	b8 00 00 00 00       	mov    $0x0,%eax
 233:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 237:	74 05                	je     23e <strlen+0x1a>
 239:	83 c0 01             	add    $0x1,%eax
 23c:	eb f5                	jmp    233 <strlen+0xf>
    ;
  return n;
}
 23e:	5d                   	pop    %ebp
 23f:	c3                   	ret    

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	f3 0f 1e fb          	endbr32 
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
 247:	57                   	push   %edi
 248:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 24b:	89 d7                	mov    %edx,%edi
 24d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 250:	8b 45 0c             	mov    0xc(%ebp),%eax
 253:	fc                   	cld    
 254:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 256:	89 d0                	mov    %edx,%eax
 258:	5f                   	pop    %edi
 259:	5d                   	pop    %ebp
 25a:	c3                   	ret    

0000025b <strchr>:

char*
strchr(const char *s, char c)
{
 25b:	f3 0f 1e fb          	endbr32 
 25f:	55                   	push   %ebp
 260:	89 e5                	mov    %esp,%ebp
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 269:	0f b6 10             	movzbl (%eax),%edx
 26c:	84 d2                	test   %dl,%dl
 26e:	74 09                	je     279 <strchr+0x1e>
    if(*s == c)
 270:	38 ca                	cmp    %cl,%dl
 272:	74 0a                	je     27e <strchr+0x23>
  for(; *s; s++)
 274:	83 c0 01             	add    $0x1,%eax
 277:	eb f0                	jmp    269 <strchr+0xe>
      return (char*)s;
  return 0;
 279:	b8 00 00 00 00       	mov    $0x0,%eax
}
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <gets>:

char*
gets(char *buf, int max)
{
 280:	f3 0f 1e fb          	endbr32 
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	57                   	push   %edi
 288:	56                   	push   %esi
 289:	53                   	push   %ebx
 28a:	83 ec 1c             	sub    $0x1c,%esp
 28d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 290:	bb 00 00 00 00       	mov    $0x0,%ebx
 295:	89 de                	mov    %ebx,%esi
 297:	83 c3 01             	add    $0x1,%ebx
 29a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29d:	7d 2e                	jge    2cd <gets+0x4d>
    cc = read(0, &c, 1);
 29f:	83 ec 04             	sub    $0x4,%esp
 2a2:	6a 01                	push   $0x1
 2a4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 2a7:	50                   	push   %eax
 2a8:	6a 00                	push   $0x0
 2aa:	e8 58 02 00 00       	call   507 <read>
    if(cc < 1)
 2af:	83 c4 10             	add    $0x10,%esp
 2b2:	85 c0                	test   %eax,%eax
 2b4:	7e 17                	jle    2cd <gets+0x4d>
      break;
    buf[i++] = c;
 2b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2ba:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 2bd:	3c 0a                	cmp    $0xa,%al
 2bf:	0f 94 c2             	sete   %dl
 2c2:	3c 0d                	cmp    $0xd,%al
 2c4:	0f 94 c0             	sete   %al
 2c7:	08 c2                	or     %al,%dl
 2c9:	74 ca                	je     295 <gets+0x15>
    buf[i++] = c;
 2cb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 2cd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 2d1:	89 f8                	mov    %edi,%eax
 2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5f                   	pop    %edi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <stat>:

int
stat(const char *n, struct stat *st)
{
 2db:	f3 0f 1e fb          	endbr32 
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	56                   	push   %esi
 2e3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e4:	83 ec 08             	sub    $0x8,%esp
 2e7:	6a 00                	push   $0x0
 2e9:	ff 75 08             	pushl  0x8(%ebp)
 2ec:	e8 3e 02 00 00       	call   52f <open>
  if(fd < 0)
 2f1:	83 c4 10             	add    $0x10,%esp
 2f4:	85 c0                	test   %eax,%eax
 2f6:	78 24                	js     31c <stat+0x41>
 2f8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 2fa:	83 ec 08             	sub    $0x8,%esp
 2fd:	ff 75 0c             	pushl  0xc(%ebp)
 300:	50                   	push   %eax
 301:	e8 41 02 00 00       	call   547 <fstat>
 306:	89 c6                	mov    %eax,%esi
  close(fd);
 308:	89 1c 24             	mov    %ebx,(%esp)
 30b:	e8 07 02 00 00       	call   517 <close>
  return r;
 310:	83 c4 10             	add    $0x10,%esp
}
 313:	89 f0                	mov    %esi,%eax
 315:	8d 65 f8             	lea    -0x8(%ebp),%esp
 318:	5b                   	pop    %ebx
 319:	5e                   	pop    %esi
 31a:	5d                   	pop    %ebp
 31b:	c3                   	ret    
    return -1;
 31c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 321:	eb f0                	jmp    313 <stat+0x38>

00000323 <atoi>:

int
atoi(const char *s)
{
 323:	f3 0f 1e fb          	endbr32 
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	53                   	push   %ebx
 32b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 32e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 333:	0f b6 01             	movzbl (%ecx),%eax
 336:	8d 58 d0             	lea    -0x30(%eax),%ebx
 339:	80 fb 09             	cmp    $0x9,%bl
 33c:	77 12                	ja     350 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 33e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 341:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 344:	83 c1 01             	add    $0x1,%ecx
 347:	0f be c0             	movsbl %al,%eax
 34a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 34e:	eb e3                	jmp    333 <atoi+0x10>
  return n;
}
 350:	89 d0                	mov    %edx,%eax
 352:	5b                   	pop    %ebx
 353:	5d                   	pop    %ebp
 354:	c3                   	ret    

00000355 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 355:	f3 0f 1e fb          	endbr32 
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	56                   	push   %esi
 35d:	53                   	push   %ebx
 35e:	8b 75 08             	mov    0x8(%ebp),%esi
 361:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 364:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 367:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 369:	8d 58 ff             	lea    -0x1(%eax),%ebx
 36c:	85 c0                	test   %eax,%eax
 36e:	7e 0f                	jle    37f <memmove+0x2a>
    *dst++ = *src++;
 370:	0f b6 01             	movzbl (%ecx),%eax
 373:	88 02                	mov    %al,(%edx)
 375:	8d 49 01             	lea    0x1(%ecx),%ecx
 378:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 37b:	89 d8                	mov    %ebx,%eax
 37d:	eb ea                	jmp    369 <memmove+0x14>
  return vdst;
}
 37f:	89 f0                	mov    %esi,%eax
 381:	5b                   	pop    %ebx
 382:	5e                   	pop    %esi
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 385:	f3 0f 1e fb          	endbr32 
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	53                   	push   %ebx
 38d:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 390:	68 00 20 00 00       	push   $0x2000
 395:	e8 c7 04 00 00       	call   861 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 39a:	83 c4 10             	add    $0x10,%esp
 39d:	89 c2                	mov    %eax,%edx
 39f:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 3a5:	74 22                	je     3c9 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 3a7:	b9 00 10 00 00       	mov    $0x1000,%ecx
 3ac:	29 d1                	sub    %edx,%ecx
 3ae:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 3b0:	ba 00 00 00 00       	mov    $0x0,%edx
 3b5:	83 fa 3f             	cmp    $0x3f,%edx
 3b8:	7f 13                	jg     3cd <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 3ba:	83 3c 95 20 10 00 00 	cmpl   $0x1,0x1020(,%edx,4)
 3c1:	01 
 3c2:	75 09                	jne    3cd <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 3c4:	83 c2 01             	add    $0x1,%edx
 3c7:	eb ec                	jmp    3b5 <thread_create+0x30>
  void *user_stack = curr_ptr;
 3c9:	89 c1                	mov    %eax,%ecx
 3cb:	eb e3                	jmp    3b0 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 3cd:	83 3c 95 20 10 00 00 	cmpl   $0x1,0x1020(,%edx,4)
 3d4:	01 
 3d5:	74 34                	je     40b <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 3d7:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 3da:	c1 e3 02             	shl    $0x2,%ebx
 3dd:	89 83 20 0d 00 00    	mov    %eax,0xd20(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 3e3:	89 8b 24 0d 00 00    	mov    %ecx,0xd24(%ebx)
  cell_full[i] = 1;
 3e9:	c7 04 95 20 10 00 00 	movl   $0x1,0x1020(,%edx,4)
 3f0:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 3f4:	ff 75 10             	pushl  0x10(%ebp)
 3f7:	ff 75 0c             	pushl  0xc(%ebp)
 3fa:	ff 75 08             	pushl  0x8(%ebp)
 3fd:	51                   	push   %ecx
 3fe:	e8 dc 00 00 00       	call   4df <clone>
 403:	83 c4 10             	add    $0x10,%esp
}
 406:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 409:	c9                   	leave  
 40a:	c3                   	ret    
    return -1;
 40b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 410:	eb f4                	jmp    406 <thread_create+0x81>

00000412 <thread_join>:

int thread_join(){
 412:	f3 0f 1e fb          	endbr32 
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	56                   	push   %esi
 41a:	53                   	push   %ebx
 41b:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 41e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 421:	50                   	push   %eax
 422:	e8 d0 00 00 00       	call   4f7 <join>
 427:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 429:	83 c4 10             	add    $0x10,%esp
 42c:	bb 00 00 00 00       	mov    $0x0,%ebx
 431:	83 fb 3f             	cmp    $0x3f,%ebx
 434:	7f 14                	jg     44a <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 436:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 439:	8b 55 f4             	mov    -0xc(%ebp),%edx
 43c:	39 14 85 24 0d 00 00 	cmp    %edx,0xd24(,%eax,4)
 443:	74 05                	je     44a <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 445:	83 c3 01             	add    $0x1,%ebx
 448:	eb e7                	jmp    431 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 44a:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 44d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 450:	39 0c 85 24 0d 00 00 	cmp    %ecx,0xd24(,%eax,4)
 457:	75 26                	jne    47f <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 459:	83 ec 0c             	sub    $0xc,%esp
 45c:	ff 34 85 20 0d 00 00 	pushl  0xd20(,%eax,4)
 463:	e8 35 03 00 00       	call   79d <free>
  cell_full[i] = 0;
 468:	c7 04 9d 20 10 00 00 	movl   $0x0,0x1020(,%ebx,4)
 46f:	00 00 00 00 

  return out;
 473:	83 c4 10             	add    $0x10,%esp
}
 476:	89 f0                	mov    %esi,%eax
 478:	8d 65 f8             	lea    -0x8(%ebp),%esp
 47b:	5b                   	pop    %ebx
 47c:	5e                   	pop    %esi
 47d:	5d                   	pop    %ebp
 47e:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 47f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 484:	eb f0                	jmp    476 <thread_join+0x64>

00000486 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 486:	f3 0f 1e fb          	endbr32 
 48a:	55                   	push   %ebp
 48b:	89 e5                	mov    %esp,%ebp
 48d:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 490:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 496:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    

0000049f <lock_acquire>:

void lock_acquire(lock_t *lock) {
 49f:	f3 0f 1e fb          	endbr32 
 4a3:	55                   	push   %ebp
 4a4:	89 e5                	mov    %esp,%ebp
 4a6:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 4a9:	b9 01 00 00 00       	mov    $0x1,%ecx
 4ae:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 4b2:	b8 00 00 00 00       	mov    $0x0,%eax
 4b7:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 4bc:	39 c1                	cmp    %eax,%ecx
 4be:	75 f2                	jne    4b2 <lock_acquire+0x13>
      ; // spin
    }
}
 4c0:	5d                   	pop    %ebp
 4c1:	c3                   	ret    

000004c2 <lock_release>:

void lock_release(lock_t *lock) {
 4c2:	f3 0f 1e fb          	endbr32 
 4c6:	55                   	push   %ebp
 4c7:	89 e5                	mov    %esp,%ebp
 4c9:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 4cc:	8b 42 04             	mov    0x4(%edx),%eax
 4cf:	83 c0 01             	add    $0x1,%eax
 4d2:	89 42 04             	mov    %eax,0x4(%edx)
}
 4d5:	5d                   	pop    %ebp
 4d6:	c3                   	ret    

000004d7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d7:	b8 01 00 00 00       	mov    $0x1,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <clone>:
SYSCALL(clone)
 4df:	b8 16 00 00 00       	mov    $0x16,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <exit>:
SYSCALL(exit)
 4e7:	b8 02 00 00 00       	mov    $0x2,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <wait>:
SYSCALL(wait)
 4ef:	b8 03 00 00 00       	mov    $0x3,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <join>:
SYSCALL(join)
 4f7:	b8 17 00 00 00       	mov    $0x17,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <pipe>:
SYSCALL(pipe)
 4ff:	b8 04 00 00 00       	mov    $0x4,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <read>:
SYSCALL(read)
 507:	b8 05 00 00 00       	mov    $0x5,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <write>:
SYSCALL(write)
 50f:	b8 10 00 00 00       	mov    $0x10,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <close>:
SYSCALL(close)
 517:	b8 15 00 00 00       	mov    $0x15,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <kill>:
SYSCALL(kill)
 51f:	b8 06 00 00 00       	mov    $0x6,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <exec>:
SYSCALL(exec)
 527:	b8 07 00 00 00       	mov    $0x7,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <open>:
SYSCALL(open)
 52f:	b8 0f 00 00 00       	mov    $0xf,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <mknod>:
SYSCALL(mknod)
 537:	b8 11 00 00 00       	mov    $0x11,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <unlink>:
SYSCALL(unlink)
 53f:	b8 12 00 00 00       	mov    $0x12,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <fstat>:
SYSCALL(fstat)
 547:	b8 08 00 00 00       	mov    $0x8,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <link>:
SYSCALL(link)
 54f:	b8 13 00 00 00       	mov    $0x13,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <mkdir>:
SYSCALL(mkdir)
 557:	b8 14 00 00 00       	mov    $0x14,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <chdir>:
SYSCALL(chdir)
 55f:	b8 09 00 00 00       	mov    $0x9,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <dup>:
SYSCALL(dup)
 567:	b8 0a 00 00 00       	mov    $0xa,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <getpid>:
SYSCALL(getpid)
 56f:	b8 0b 00 00 00       	mov    $0xb,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <sbrk>:
SYSCALL(sbrk)
 577:	b8 0c 00 00 00       	mov    $0xc,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <sleep>:
SYSCALL(sleep)
 57f:	b8 0d 00 00 00       	mov    $0xd,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <uptime>:
SYSCALL(uptime)
 587:	b8 0e 00 00 00       	mov    $0xe,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 58f:	55                   	push   %ebp
 590:	89 e5                	mov    %esp,%ebp
 592:	83 ec 1c             	sub    $0x1c,%esp
 595:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 598:	6a 01                	push   $0x1
 59a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 59d:	52                   	push   %edx
 59e:	50                   	push   %eax
 59f:	e8 6b ff ff ff       	call   50f <write>
}
 5a4:	83 c4 10             	add    $0x10,%esp
 5a7:	c9                   	leave  
 5a8:	c3                   	ret    

000005a9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5a9:	55                   	push   %ebp
 5aa:	89 e5                	mov    %esp,%ebp
 5ac:	57                   	push   %edi
 5ad:	56                   	push   %esi
 5ae:	53                   	push   %ebx
 5af:	83 ec 2c             	sub    $0x2c,%esp
 5b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5b5:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5b7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 5bb:	0f 95 c2             	setne  %dl
 5be:	89 f0                	mov    %esi,%eax
 5c0:	c1 e8 1f             	shr    $0x1f,%eax
 5c3:	84 c2                	test   %al,%dl
 5c5:	74 42                	je     609 <printint+0x60>
    neg = 1;
    x = -xx;
 5c7:	f7 de                	neg    %esi
    neg = 1;
 5c9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 5d0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 5d5:	89 f0                	mov    %esi,%eax
 5d7:	ba 00 00 00 00       	mov    $0x0,%edx
 5dc:	f7 f1                	div    %ecx
 5de:	89 df                	mov    %ebx,%edi
 5e0:	83 c3 01             	add    $0x1,%ebx
 5e3:	0f b6 92 74 09 00 00 	movzbl 0x974(%edx),%edx
 5ea:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 5ee:	89 f2                	mov    %esi,%edx
 5f0:	89 c6                	mov    %eax,%esi
 5f2:	39 d1                	cmp    %edx,%ecx
 5f4:	76 df                	jbe    5d5 <printint+0x2c>
  if(neg)
 5f6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 5fa:	74 2f                	je     62b <printint+0x82>
    buf[i++] = '-';
 5fc:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 601:	8d 5f 02             	lea    0x2(%edi),%ebx
 604:	8b 75 d0             	mov    -0x30(%ebp),%esi
 607:	eb 15                	jmp    61e <printint+0x75>
  neg = 0;
 609:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 610:	eb be                	jmp    5d0 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 612:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 617:	89 f0                	mov    %esi,%eax
 619:	e8 71 ff ff ff       	call   58f <putc>
  while(--i >= 0)
 61e:	83 eb 01             	sub    $0x1,%ebx
 621:	79 ef                	jns    612 <printint+0x69>
}
 623:	83 c4 2c             	add    $0x2c,%esp
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    
 62b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 62e:	eb ee                	jmp    61e <printint+0x75>

00000630 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	57                   	push   %edi
 638:	56                   	push   %esi
 639:	53                   	push   %ebx
 63a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 63d:	8d 45 10             	lea    0x10(%ebp),%eax
 640:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 643:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 648:	bb 00 00 00 00       	mov    $0x0,%ebx
 64d:	eb 14                	jmp    663 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 64f:	89 fa                	mov    %edi,%edx
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	e8 36 ff ff ff       	call   58f <putc>
 659:	eb 05                	jmp    660 <printf+0x30>
      }
    } else if(state == '%'){
 65b:	83 fe 25             	cmp    $0x25,%esi
 65e:	74 25                	je     685 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 660:	83 c3 01             	add    $0x1,%ebx
 663:	8b 45 0c             	mov    0xc(%ebp),%eax
 666:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 66a:	84 c0                	test   %al,%al
 66c:	0f 84 23 01 00 00    	je     795 <printf+0x165>
    c = fmt[i] & 0xff;
 672:	0f be f8             	movsbl %al,%edi
 675:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 678:	85 f6                	test   %esi,%esi
 67a:	75 df                	jne    65b <printf+0x2b>
      if(c == '%'){
 67c:	83 f8 25             	cmp    $0x25,%eax
 67f:	75 ce                	jne    64f <printf+0x1f>
        state = '%';
 681:	89 c6                	mov    %eax,%esi
 683:	eb db                	jmp    660 <printf+0x30>
      if(c == 'd'){
 685:	83 f8 64             	cmp    $0x64,%eax
 688:	74 49                	je     6d3 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 68a:	83 f8 78             	cmp    $0x78,%eax
 68d:	0f 94 c1             	sete   %cl
 690:	83 f8 70             	cmp    $0x70,%eax
 693:	0f 94 c2             	sete   %dl
 696:	08 d1                	or     %dl,%cl
 698:	75 63                	jne    6fd <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 69a:	83 f8 73             	cmp    $0x73,%eax
 69d:	0f 84 84 00 00 00    	je     727 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6a3:	83 f8 63             	cmp    $0x63,%eax
 6a6:	0f 84 b7 00 00 00    	je     763 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 6ac:	83 f8 25             	cmp    $0x25,%eax
 6af:	0f 84 cc 00 00 00    	je     781 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6b5:	ba 25 00 00 00       	mov    $0x25,%edx
 6ba:	8b 45 08             	mov    0x8(%ebp),%eax
 6bd:	e8 cd fe ff ff       	call   58f <putc>
        putc(fd, c);
 6c2:	89 fa                	mov    %edi,%edx
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	e8 c3 fe ff ff       	call   58f <putc>
      }
      state = 0;
 6cc:	be 00 00 00 00       	mov    $0x0,%esi
 6d1:	eb 8d                	jmp    660 <printf+0x30>
        printint(fd, *ap, 10, 1);
 6d3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6d6:	8b 17                	mov    (%edi),%edx
 6d8:	83 ec 0c             	sub    $0xc,%esp
 6db:	6a 01                	push   $0x1
 6dd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6e2:	8b 45 08             	mov    0x8(%ebp),%eax
 6e5:	e8 bf fe ff ff       	call   5a9 <printint>
        ap++;
 6ea:	83 c7 04             	add    $0x4,%edi
 6ed:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6f0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f3:	be 00 00 00 00       	mov    $0x0,%esi
 6f8:	e9 63 ff ff ff       	jmp    660 <printf+0x30>
        printint(fd, *ap, 16, 0);
 6fd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 700:	8b 17                	mov    (%edi),%edx
 702:	83 ec 0c             	sub    $0xc,%esp
 705:	6a 00                	push   $0x0
 707:	b9 10 00 00 00       	mov    $0x10,%ecx
 70c:	8b 45 08             	mov    0x8(%ebp),%eax
 70f:	e8 95 fe ff ff       	call   5a9 <printint>
        ap++;
 714:	83 c7 04             	add    $0x4,%edi
 717:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 71a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 71d:	be 00 00 00 00       	mov    $0x0,%esi
 722:	e9 39 ff ff ff       	jmp    660 <printf+0x30>
        s = (char*)*ap;
 727:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72a:	8b 30                	mov    (%eax),%esi
        ap++;
 72c:	83 c0 04             	add    $0x4,%eax
 72f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 732:	85 f6                	test   %esi,%esi
 734:	75 28                	jne    75e <printf+0x12e>
          s = "(null)";
 736:	be 6a 09 00 00       	mov    $0x96a,%esi
 73b:	8b 7d 08             	mov    0x8(%ebp),%edi
 73e:	eb 0d                	jmp    74d <printf+0x11d>
          putc(fd, *s);
 740:	0f be d2             	movsbl %dl,%edx
 743:	89 f8                	mov    %edi,%eax
 745:	e8 45 fe ff ff       	call   58f <putc>
          s++;
 74a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 74d:	0f b6 16             	movzbl (%esi),%edx
 750:	84 d2                	test   %dl,%dl
 752:	75 ec                	jne    740 <printf+0x110>
      state = 0;
 754:	be 00 00 00 00       	mov    $0x0,%esi
 759:	e9 02 ff ff ff       	jmp    660 <printf+0x30>
 75e:	8b 7d 08             	mov    0x8(%ebp),%edi
 761:	eb ea                	jmp    74d <printf+0x11d>
        putc(fd, *ap);
 763:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 766:	0f be 17             	movsbl (%edi),%edx
 769:	8b 45 08             	mov    0x8(%ebp),%eax
 76c:	e8 1e fe ff ff       	call   58f <putc>
        ap++;
 771:	83 c7 04             	add    $0x4,%edi
 774:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 777:	be 00 00 00 00       	mov    $0x0,%esi
 77c:	e9 df fe ff ff       	jmp    660 <printf+0x30>
        putc(fd, c);
 781:	89 fa                	mov    %edi,%edx
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	e8 04 fe ff ff       	call   58f <putc>
      state = 0;
 78b:	be 00 00 00 00       	mov    $0x0,%esi
 790:	e9 cb fe ff ff       	jmp    660 <printf+0x30>
    }
  }
}
 795:	8d 65 f4             	lea    -0xc(%ebp),%esp
 798:	5b                   	pop    %ebx
 799:	5e                   	pop    %esi
 79a:	5f                   	pop    %edi
 79b:	5d                   	pop    %ebp
 79c:	c3                   	ret    

0000079d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79d:	f3 0f 1e fb          	endbr32 
 7a1:	55                   	push   %ebp
 7a2:	89 e5                	mov    %esp,%ebp
 7a4:	57                   	push   %edi
 7a5:	56                   	push   %esi
 7a6:	53                   	push   %ebx
 7a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7aa:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ad:	a1 04 0d 00 00       	mov    0xd04,%eax
 7b2:	eb 02                	jmp    7b6 <free+0x19>
 7b4:	89 d0                	mov    %edx,%eax
 7b6:	39 c8                	cmp    %ecx,%eax
 7b8:	73 04                	jae    7be <free+0x21>
 7ba:	39 08                	cmp    %ecx,(%eax)
 7bc:	77 12                	ja     7d0 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7be:	8b 10                	mov    (%eax),%edx
 7c0:	39 c2                	cmp    %eax,%edx
 7c2:	77 f0                	ja     7b4 <free+0x17>
 7c4:	39 c8                	cmp    %ecx,%eax
 7c6:	72 08                	jb     7d0 <free+0x33>
 7c8:	39 ca                	cmp    %ecx,%edx
 7ca:	77 04                	ja     7d0 <free+0x33>
 7cc:	89 d0                	mov    %edx,%eax
 7ce:	eb e6                	jmp    7b6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	39 d7                	cmp    %edx,%edi
 7da:	74 19                	je     7f5 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7dc:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7df:	8b 50 04             	mov    0x4(%eax),%edx
 7e2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7e5:	39 ce                	cmp    %ecx,%esi
 7e7:	74 1b                	je     804 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7e9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 7eb:	a3 04 0d 00 00       	mov    %eax,0xd04
}
 7f0:	5b                   	pop    %ebx
 7f1:	5e                   	pop    %esi
 7f2:	5f                   	pop    %edi
 7f3:	5d                   	pop    %ebp
 7f4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 7f5:	03 72 04             	add    0x4(%edx),%esi
 7f8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7fb:	8b 10                	mov    (%eax),%edx
 7fd:	8b 12                	mov    (%edx),%edx
 7ff:	89 53 f8             	mov    %edx,-0x8(%ebx)
 802:	eb db                	jmp    7df <free+0x42>
    p->s.size += bp->s.size;
 804:	03 53 fc             	add    -0x4(%ebx),%edx
 807:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 80a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 80d:	89 10                	mov    %edx,(%eax)
 80f:	eb da                	jmp    7eb <free+0x4e>

00000811 <morecore>:

static Header*
morecore(uint nu)
{
 811:	55                   	push   %ebp
 812:	89 e5                	mov    %esp,%ebp
 814:	53                   	push   %ebx
 815:	83 ec 04             	sub    $0x4,%esp
 818:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 81a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 81f:	77 05                	ja     826 <morecore+0x15>
    nu = 4096;
 821:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 826:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82d:	83 ec 0c             	sub    $0xc,%esp
 830:	50                   	push   %eax
 831:	e8 41 fd ff ff       	call   577 <sbrk>
  if(p == (char*)-1)
 836:	83 c4 10             	add    $0x10,%esp
 839:	83 f8 ff             	cmp    $0xffffffff,%eax
 83c:	74 1c                	je     85a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 83e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 841:	83 c0 08             	add    $0x8,%eax
 844:	83 ec 0c             	sub    $0xc,%esp
 847:	50                   	push   %eax
 848:	e8 50 ff ff ff       	call   79d <free>
  return freep;
 84d:	a1 04 0d 00 00       	mov    0xd04,%eax
 852:	83 c4 10             	add    $0x10,%esp
}
 855:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 858:	c9                   	leave  
 859:	c3                   	ret    
    return 0;
 85a:	b8 00 00 00 00       	mov    $0x0,%eax
 85f:	eb f4                	jmp    855 <morecore+0x44>

00000861 <malloc>:

void*
malloc(uint nbytes)
{
 861:	f3 0f 1e fb          	endbr32 
 865:	55                   	push   %ebp
 866:	89 e5                	mov    %esp,%ebp
 868:	53                   	push   %ebx
 869:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86c:	8b 45 08             	mov    0x8(%ebp),%eax
 86f:	8d 58 07             	lea    0x7(%eax),%ebx
 872:	c1 eb 03             	shr    $0x3,%ebx
 875:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 878:	8b 0d 04 0d 00 00    	mov    0xd04,%ecx
 87e:	85 c9                	test   %ecx,%ecx
 880:	74 04                	je     886 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 882:	8b 01                	mov    (%ecx),%eax
 884:	eb 4b                	jmp    8d1 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 886:	c7 05 04 0d 00 00 08 	movl   $0xd08,0xd04
 88d:	0d 00 00 
 890:	c7 05 08 0d 00 00 08 	movl   $0xd08,0xd08
 897:	0d 00 00 
    base.s.size = 0;
 89a:	c7 05 0c 0d 00 00 00 	movl   $0x0,0xd0c
 8a1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 8a4:	b9 08 0d 00 00       	mov    $0xd08,%ecx
 8a9:	eb d7                	jmp    882 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 8ab:	74 1a                	je     8c7 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 8ad:	29 da                	sub    %ebx,%edx
 8af:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8b2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 8b5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 8b8:	89 0d 04 0d 00 00    	mov    %ecx,0xd04
      return (void*)(p + 1);
 8be:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 8c1:	83 c4 04             	add    $0x4,%esp
 8c4:	5b                   	pop    %ebx
 8c5:	5d                   	pop    %ebp
 8c6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 8c7:	8b 10                	mov    (%eax),%edx
 8c9:	89 11                	mov    %edx,(%ecx)
 8cb:	eb eb                	jmp    8b8 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8cd:	89 c1                	mov    %eax,%ecx
 8cf:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 8d1:	8b 50 04             	mov    0x4(%eax),%edx
 8d4:	39 da                	cmp    %ebx,%edx
 8d6:	73 d3                	jae    8ab <malloc+0x4a>
    if(p == freep)
 8d8:	39 05 04 0d 00 00    	cmp    %eax,0xd04
 8de:	75 ed                	jne    8cd <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 8e0:	89 d8                	mov    %ebx,%eax
 8e2:	e8 2a ff ff ff       	call   811 <morecore>
 8e7:	85 c0                	test   %eax,%eax
 8e9:	75 e2                	jne    8cd <malloc+0x6c>
 8eb:	eb d4                	jmp    8c1 <malloc+0x60>
