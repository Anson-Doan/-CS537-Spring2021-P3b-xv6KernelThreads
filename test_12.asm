
_test_12:     file format elf32-i386


Disassembly of section .text:

00000000 <worker>:

   printf(1, "TEST PASSED\n");
   exit();
}

void worker(void *arg1, void *arg2) {
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	83 ec 14             	sub    $0x14,%esp
   lock_acquire(&lock);
   a:	68 54 0e 00 00       	push   $0xe54
   f:	e8 e0 05 00 00       	call   5f4 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  14:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1b:	e8 ac 06 00 00       	call   6cc <sbrk>
  20:	83 c4 10             	add    $0x10,%esp
  23:	3b 05 40 0e 00 00    	cmp    0xe40,%eax
  29:	74 49                	je     74 <worker+0x74>
  2b:	6a 4a                	push   $0x4a
  2d:	68 44 0a 00 00       	push   $0xa44
  32:	68 4e 0a 00 00       	push   $0xa4e
  37:	6a 01                	push   $0x1
  39:	e8 47 07 00 00       	call   785 <printf>
  3e:	83 c4 0c             	add    $0xc,%esp
  41:	68 56 0a 00 00       	push   $0xa56
  46:	68 74 0a 00 00       	push   $0xa74
  4b:	6a 01                	push   $0x1
  4d:	e8 33 07 00 00       	call   785 <printf>
  52:	83 c4 08             	add    $0x8,%esp
  55:	68 88 0a 00 00       	push   $0xa88
  5a:	6a 01                	push   $0x1
  5c:	e8 24 07 00 00       	call   785 <printf>
  61:	83 c4 04             	add    $0x4,%esp
  64:	ff 35 64 0e 00 00    	pushl  0xe64
  6a:	e8 05 06 00 00       	call   674 <kill>
  6f:	e8 c8 05 00 00       	call   63c <exit>
   global++;
  74:	83 05 44 0e 00 00 01 	addl   $0x1,0xe44
   lock_release(&lock);
  7b:	83 ec 0c             	sub    $0xc,%esp
  7e:	68 54 0e 00 00       	push   $0xe54
  83:	e8 8f 05 00 00       	call   617 <lock_release>

   lock_acquire(&lock2);
  88:	c7 04 24 5c 0e 00 00 	movl   $0xe5c,(%esp)
  8f:	e8 60 05 00 00       	call   5f4 <lock_acquire>
   assert((unsigned int)sbrk(0) == size);
  94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9b:	e8 2c 06 00 00       	call   6cc <sbrk>
  a0:	83 c4 10             	add    $0x10,%esp
  a3:	3b 05 40 0e 00 00    	cmp    0xe40,%eax
  a9:	74 49                	je     f4 <worker+0xf4>
  ab:	6a 4f                	push   $0x4f
  ad:	68 44 0a 00 00       	push   $0xa44
  b2:	68 4e 0a 00 00       	push   $0xa4e
  b7:	6a 01                	push   $0x1
  b9:	e8 c7 06 00 00       	call   785 <printf>
  be:	83 c4 0c             	add    $0xc,%esp
  c1:	68 56 0a 00 00       	push   $0xa56
  c6:	68 74 0a 00 00       	push   $0xa74
  cb:	6a 01                	push   $0x1
  cd:	e8 b3 06 00 00       	call   785 <printf>
  d2:	83 c4 08             	add    $0x8,%esp
  d5:	68 88 0a 00 00       	push   $0xa88
  da:	6a 01                	push   $0x1
  dc:	e8 a4 06 00 00       	call   785 <printf>
  e1:	83 c4 04             	add    $0x4,%esp
  e4:	ff 35 64 0e 00 00    	pushl  0xe64
  ea:	e8 85 05 00 00       	call   674 <kill>
  ef:	e8 48 05 00 00       	call   63c <exit>
   global++;
  f4:	83 05 44 0e 00 00 01 	addl   $0x1,0xe44
   lock_release(&lock2);
  fb:	83 ec 0c             	sub    $0xc,%esp
  fe:	68 5c 0e 00 00       	push   $0xe5c
 103:	e8 0f 05 00 00       	call   617 <lock_release>

   exit();
 108:	e8 2f 05 00 00       	call   63c <exit>

0000010d <main>:
{
 10d:	f3 0f 1e fb          	endbr32 
 111:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 115:	83 e4 f0             	and    $0xfffffff0,%esp
 118:	ff 71 fc             	pushl  -0x4(%ecx)
 11b:	55                   	push   %ebp
 11c:	89 e5                	mov    %esp,%ebp
 11e:	53                   	push   %ebx
 11f:	51                   	push   %ecx
 120:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 123:	e8 9c 05 00 00       	call   6c4 <getpid>
 128:	a3 64 0e 00 00       	mov    %eax,0xe64
   int arg1 = 11, arg2 = 22;
 12d:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 134:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   lock_init(&lock);
 13b:	83 ec 0c             	sub    $0xc,%esp
 13e:	68 54 0e 00 00       	push   $0xe54
 143:	e8 93 04 00 00       	call   5db <lock_init>
   lock_init(&lock2);
 148:	c7 04 24 5c 0e 00 00 	movl   $0xe5c,(%esp)
 14f:	e8 87 04 00 00       	call   5db <lock_init>
   lock_acquire(&lock);
 154:	c7 04 24 54 0e 00 00 	movl   $0xe54,(%esp)
 15b:	e8 94 04 00 00       	call   5f4 <lock_acquire>
   lock_acquire(&lock2);
 160:	c7 04 24 5c 0e 00 00 	movl   $0xe5c,(%esp)
 167:	e8 88 04 00 00       	call   5f4 <lock_acquire>
   for (int i = 0; i < num_threads; i++) {
 16c:	83 c4 10             	add    $0x10,%esp
 16f:	bb 00 00 00 00       	mov    $0x0,%ebx
 174:	39 1d 3c 0e 00 00    	cmp    %ebx,0xe3c
 17a:	7e 6a                	jle    1e6 <main+0xd9>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 17c:	83 ec 04             	sub    $0x4,%esp
 17f:	8d 45 f0             	lea    -0x10(%ebp),%eax
 182:	50                   	push   %eax
 183:	8d 45 f4             	lea    -0xc(%ebp),%eax
 186:	50                   	push   %eax
 187:	68 00 00 00 00       	push   $0x0
 18c:	e8 49 03 00 00       	call   4da <thread_create>
      assert(thread_pid > 0);
 191:	83 c4 10             	add    $0x10,%esp
 194:	85 c0                	test   %eax,%eax
 196:	7e 05                	jle    19d <main+0x90>
   for (int i = 0; i < num_threads; i++) {
 198:	83 c3 01             	add    $0x1,%ebx
 19b:	eb d7                	jmp    174 <main+0x67>
      assert(thread_pid > 0);
 19d:	6a 28                	push   $0x28
 19f:	68 44 0a 00 00       	push   $0xa44
 1a4:	68 4e 0a 00 00       	push   $0xa4e
 1a9:	6a 01                	push   $0x1
 1ab:	e8 d5 05 00 00       	call   785 <printf>
 1b0:	83 c4 0c             	add    $0xc,%esp
 1b3:	68 95 0a 00 00       	push   $0xa95
 1b8:	68 74 0a 00 00       	push   $0xa74
 1bd:	6a 01                	push   $0x1
 1bf:	e8 c1 05 00 00       	call   785 <printf>
 1c4:	83 c4 08             	add    $0x8,%esp
 1c7:	68 88 0a 00 00       	push   $0xa88
 1cc:	6a 01                	push   $0x1
 1ce:	e8 b2 05 00 00       	call   785 <printf>
 1d3:	83 c4 04             	add    $0x4,%esp
 1d6:	ff 35 64 0e 00 00    	pushl  0xe64
 1dc:	e8 93 04 00 00       	call   674 <kill>
 1e1:	e8 56 04 00 00       	call   63c <exit>
   size = (unsigned int)sbrk(0);
 1e6:	83 ec 0c             	sub    $0xc,%esp
 1e9:	6a 00                	push   $0x0
 1eb:	e8 dc 04 00 00       	call   6cc <sbrk>
 1f0:	a3 40 0e 00 00       	mov    %eax,0xe40
   while (global < num_threads) {
 1f5:	83 c4 10             	add    $0x10,%esp
 1f8:	a1 3c 0e 00 00       	mov    0xe3c,%eax
 1fd:	39 05 44 0e 00 00    	cmp    %eax,0xe44
 203:	7d 2a                	jge    22f <main+0x122>
      lock_release(&lock);
 205:	83 ec 0c             	sub    $0xc,%esp
 208:	68 54 0e 00 00       	push   $0xe54
 20d:	e8 05 04 00 00       	call   617 <lock_release>
      sleep(100);
 212:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 219:	e8 b6 04 00 00       	call   6d4 <sleep>
      lock_acquire(&lock);
 21e:	c7 04 24 54 0e 00 00 	movl   $0xe54,(%esp)
 225:	e8 ca 03 00 00       	call   5f4 <lock_acquire>
 22a:	83 c4 10             	add    $0x10,%esp
 22d:	eb c9                	jmp    1f8 <main+0xeb>
   global = 0;
 22f:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
 236:	00 00 00 
   sbrk(10000);
 239:	83 ec 0c             	sub    $0xc,%esp
 23c:	68 10 27 00 00       	push   $0x2710
 241:	e8 86 04 00 00       	call   6cc <sbrk>
   size = (unsigned int)sbrk(0);
 246:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 24d:	e8 7a 04 00 00       	call   6cc <sbrk>
 252:	a3 40 0e 00 00       	mov    %eax,0xe40
   lock_release(&lock);
 257:	c7 04 24 54 0e 00 00 	movl   $0xe54,(%esp)
 25e:	e8 b4 03 00 00       	call   617 <lock_release>
   while (global < num_threads) {
 263:	83 c4 10             	add    $0x10,%esp
 266:	a1 3c 0e 00 00       	mov    0xe3c,%eax
 26b:	39 05 44 0e 00 00    	cmp    %eax,0xe44
 271:	7d 2a                	jge    29d <main+0x190>
      lock_release(&lock2);
 273:	83 ec 0c             	sub    $0xc,%esp
 276:	68 5c 0e 00 00       	push   $0xe5c
 27b:	e8 97 03 00 00       	call   617 <lock_release>
      sleep(100);
 280:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 287:	e8 48 04 00 00       	call   6d4 <sleep>
      lock_acquire(&lock2);
 28c:	c7 04 24 5c 0e 00 00 	movl   $0xe5c,(%esp)
 293:	e8 5c 03 00 00       	call   5f4 <lock_acquire>
 298:	83 c4 10             	add    $0x10,%esp
 29b:	eb c9                	jmp    266 <main+0x159>
   lock_release(&lock2);
 29d:	83 ec 0c             	sub    $0xc,%esp
 2a0:	68 5c 0e 00 00       	push   $0xe5c
 2a5:	e8 6d 03 00 00       	call   617 <lock_release>
   for (int i = 0; i < num_threads; i++) {
 2aa:	83 c4 10             	add    $0x10,%esp
 2ad:	bb 00 00 00 00       	mov    $0x0,%ebx
 2b2:	39 1d 3c 0e 00 00    	cmp    %ebx,0xe3c
 2b8:	7e 57                	jle    311 <main+0x204>
      int join_pid = thread_join();
 2ba:	e8 a8 02 00 00       	call   567 <thread_join>
      assert(join_pid > 0);
 2bf:	85 c0                	test   %eax,%eax
 2c1:	7e 05                	jle    2c8 <main+0x1bb>
   for (int i = 0; i < num_threads; i++) {
 2c3:	83 c3 01             	add    $0x1,%ebx
 2c6:	eb ea                	jmp    2b2 <main+0x1a5>
      assert(join_pid > 0);
 2c8:	6a 41                	push   $0x41
 2ca:	68 44 0a 00 00       	push   $0xa44
 2cf:	68 4e 0a 00 00       	push   $0xa4e
 2d4:	6a 01                	push   $0x1
 2d6:	e8 aa 04 00 00       	call   785 <printf>
 2db:	83 c4 0c             	add    $0xc,%esp
 2de:	68 a4 0a 00 00       	push   $0xaa4
 2e3:	68 74 0a 00 00       	push   $0xa74
 2e8:	6a 01                	push   $0x1
 2ea:	e8 96 04 00 00       	call   785 <printf>
 2ef:	83 c4 08             	add    $0x8,%esp
 2f2:	68 88 0a 00 00       	push   $0xa88
 2f7:	6a 01                	push   $0x1
 2f9:	e8 87 04 00 00       	call   785 <printf>
 2fe:	83 c4 04             	add    $0x4,%esp
 301:	ff 35 64 0e 00 00    	pushl  0xe64
 307:	e8 68 03 00 00       	call   674 <kill>
 30c:	e8 2b 03 00 00       	call   63c <exit>
   printf(1, "TEST PASSED\n");
 311:	83 ec 08             	sub    $0x8,%esp
 314:	68 b1 0a 00 00       	push   $0xab1
 319:	6a 01                	push   $0x1
 31b:	e8 65 04 00 00       	call   785 <printf>
   exit();
 320:	e8 17 03 00 00       	call   63c <exit>

00000325 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 325:	f3 0f 1e fb          	endbr32 
 329:	55                   	push   %ebp
 32a:	89 e5                	mov    %esp,%ebp
 32c:	56                   	push   %esi
 32d:	53                   	push   %ebx
 32e:	8b 75 08             	mov    0x8(%ebp),%esi
 331:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 334:	89 f0                	mov    %esi,%eax
 336:	89 d1                	mov    %edx,%ecx
 338:	83 c2 01             	add    $0x1,%edx
 33b:	89 c3                	mov    %eax,%ebx
 33d:	83 c0 01             	add    $0x1,%eax
 340:	0f b6 09             	movzbl (%ecx),%ecx
 343:	88 0b                	mov    %cl,(%ebx)
 345:	84 c9                	test   %cl,%cl
 347:	75 ed                	jne    336 <strcpy+0x11>
    ;
  return os;
}
 349:	89 f0                	mov    %esi,%eax
 34b:	5b                   	pop    %ebx
 34c:	5e                   	pop    %esi
 34d:	5d                   	pop    %ebp
 34e:	c3                   	ret    

0000034f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 34f:	f3 0f 1e fb          	endbr32 
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	8b 4d 08             	mov    0x8(%ebp),%ecx
 359:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 35c:	0f b6 01             	movzbl (%ecx),%eax
 35f:	84 c0                	test   %al,%al
 361:	74 0c                	je     36f <strcmp+0x20>
 363:	3a 02                	cmp    (%edx),%al
 365:	75 08                	jne    36f <strcmp+0x20>
    p++, q++;
 367:	83 c1 01             	add    $0x1,%ecx
 36a:	83 c2 01             	add    $0x1,%edx
 36d:	eb ed                	jmp    35c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 36f:	0f b6 c0             	movzbl %al,%eax
 372:	0f b6 12             	movzbl (%edx),%edx
 375:	29 d0                	sub    %edx,%eax
}
 377:	5d                   	pop    %ebp
 378:	c3                   	ret    

00000379 <strlen>:

uint
strlen(const char *s)
{
 379:	f3 0f 1e fb          	endbr32 
 37d:	55                   	push   %ebp
 37e:	89 e5                	mov    %esp,%ebp
 380:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 383:	b8 00 00 00 00       	mov    $0x0,%eax
 388:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 38c:	74 05                	je     393 <strlen+0x1a>
 38e:	83 c0 01             	add    $0x1,%eax
 391:	eb f5                	jmp    388 <strlen+0xf>
    ;
  return n;
}
 393:	5d                   	pop    %ebp
 394:	c3                   	ret    

00000395 <memset>:

void*
memset(void *dst, int c, uint n)
{
 395:	f3 0f 1e fb          	endbr32 
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	57                   	push   %edi
 39d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3a0:	89 d7                	mov    %edx,%edi
 3a2:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a8:	fc                   	cld    
 3a9:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3ab:	89 d0                	mov    %edx,%eax
 3ad:	5f                   	pop    %edi
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    

000003b0 <strchr>:

char*
strchr(const char *s, char c)
{
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ba:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3be:	0f b6 10             	movzbl (%eax),%edx
 3c1:	84 d2                	test   %dl,%dl
 3c3:	74 09                	je     3ce <strchr+0x1e>
    if(*s == c)
 3c5:	38 ca                	cmp    %cl,%dl
 3c7:	74 0a                	je     3d3 <strchr+0x23>
  for(; *s; s++)
 3c9:	83 c0 01             	add    $0x1,%eax
 3cc:	eb f0                	jmp    3be <strchr+0xe>
      return (char*)s;
  return 0;
 3ce:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    

000003d5 <gets>:

char*
gets(char *buf, int max)
{
 3d5:	f3 0f 1e fb          	endbr32 
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	57                   	push   %edi
 3dd:	56                   	push   %esi
 3de:	53                   	push   %ebx
 3df:	83 ec 1c             	sub    $0x1c,%esp
 3e2:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e5:	bb 00 00 00 00       	mov    $0x0,%ebx
 3ea:	89 de                	mov    %ebx,%esi
 3ec:	83 c3 01             	add    $0x1,%ebx
 3ef:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3f2:	7d 2e                	jge    422 <gets+0x4d>
    cc = read(0, &c, 1);
 3f4:	83 ec 04             	sub    $0x4,%esp
 3f7:	6a 01                	push   $0x1
 3f9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3fc:	50                   	push   %eax
 3fd:	6a 00                	push   $0x0
 3ff:	e8 58 02 00 00       	call   65c <read>
    if(cc < 1)
 404:	83 c4 10             	add    $0x10,%esp
 407:	85 c0                	test   %eax,%eax
 409:	7e 17                	jle    422 <gets+0x4d>
      break;
    buf[i++] = c;
 40b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 40f:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 412:	3c 0a                	cmp    $0xa,%al
 414:	0f 94 c2             	sete   %dl
 417:	3c 0d                	cmp    $0xd,%al
 419:	0f 94 c0             	sete   %al
 41c:	08 c2                	or     %al,%dl
 41e:	74 ca                	je     3ea <gets+0x15>
    buf[i++] = c;
 420:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 422:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 426:	89 f8                	mov    %edi,%eax
 428:	8d 65 f4             	lea    -0xc(%ebp),%esp
 42b:	5b                   	pop    %ebx
 42c:	5e                   	pop    %esi
 42d:	5f                   	pop    %edi
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    

00000430 <stat>:

int
stat(const char *n, struct stat *st)
{
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	56                   	push   %esi
 438:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 439:	83 ec 08             	sub    $0x8,%esp
 43c:	6a 00                	push   $0x0
 43e:	ff 75 08             	pushl  0x8(%ebp)
 441:	e8 3e 02 00 00       	call   684 <open>
  if(fd < 0)
 446:	83 c4 10             	add    $0x10,%esp
 449:	85 c0                	test   %eax,%eax
 44b:	78 24                	js     471 <stat+0x41>
 44d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 44f:	83 ec 08             	sub    $0x8,%esp
 452:	ff 75 0c             	pushl  0xc(%ebp)
 455:	50                   	push   %eax
 456:	e8 41 02 00 00       	call   69c <fstat>
 45b:	89 c6                	mov    %eax,%esi
  close(fd);
 45d:	89 1c 24             	mov    %ebx,(%esp)
 460:	e8 07 02 00 00       	call   66c <close>
  return r;
 465:	83 c4 10             	add    $0x10,%esp
}
 468:	89 f0                	mov    %esi,%eax
 46a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 46d:	5b                   	pop    %ebx
 46e:	5e                   	pop    %esi
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    
    return -1;
 471:	be ff ff ff ff       	mov    $0xffffffff,%esi
 476:	eb f0                	jmp    468 <stat+0x38>

00000478 <atoi>:

int
atoi(const char *s)
{
 478:	f3 0f 1e fb          	endbr32 
 47c:	55                   	push   %ebp
 47d:	89 e5                	mov    %esp,%ebp
 47f:	53                   	push   %ebx
 480:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 483:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 488:	0f b6 01             	movzbl (%ecx),%eax
 48b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 48e:	80 fb 09             	cmp    $0x9,%bl
 491:	77 12                	ja     4a5 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 493:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 496:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 499:	83 c1 01             	add    $0x1,%ecx
 49c:	0f be c0             	movsbl %al,%eax
 49f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 4a3:	eb e3                	jmp    488 <atoi+0x10>
  return n;
}
 4a5:	89 d0                	mov    %edx,%eax
 4a7:	5b                   	pop    %ebx
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    

000004aa <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4aa:	f3 0f 1e fb          	endbr32 
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	56                   	push   %esi
 4b2:	53                   	push   %ebx
 4b3:	8b 75 08             	mov    0x8(%ebp),%esi
 4b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4b9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4bc:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4be:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4c1:	85 c0                	test   %eax,%eax
 4c3:	7e 0f                	jle    4d4 <memmove+0x2a>
    *dst++ = *src++;
 4c5:	0f b6 01             	movzbl (%ecx),%eax
 4c8:	88 02                	mov    %al,(%edx)
 4ca:	8d 49 01             	lea    0x1(%ecx),%ecx
 4cd:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4d0:	89 d8                	mov    %ebx,%eax
 4d2:	eb ea                	jmp    4be <memmove+0x14>
  return vdst;
}
 4d4:	89 f0                	mov    %esi,%eax
 4d6:	5b                   	pop    %ebx
 4d7:	5e                   	pop    %esi
 4d8:	5d                   	pop    %ebp
 4d9:	c3                   	ret    

000004da <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 4da:	f3 0f 1e fb          	endbr32 
 4de:	55                   	push   %ebp
 4df:	89 e5                	mov    %esp,%ebp
 4e1:	53                   	push   %ebx
 4e2:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 4e5:	68 00 20 00 00       	push   $0x2000
 4ea:	e8 c7 04 00 00       	call   9b6 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 4ef:	83 c4 10             	add    $0x10,%esp
 4f2:	89 c2                	mov    %eax,%edx
 4f4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 4fa:	74 22                	je     51e <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 4fc:	b9 00 10 00 00       	mov    $0x1000,%ecx
 501:	29 d1                	sub    %edx,%ecx
 503:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 505:	ba 00 00 00 00       	mov    $0x0,%edx
 50a:	83 fa 3f             	cmp    $0x3f,%edx
 50d:	7f 13                	jg     522 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 50f:	83 3c 95 80 11 00 00 	cmpl   $0x1,0x1180(,%edx,4)
 516:	01 
 517:	75 09                	jne    522 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 519:	83 c2 01             	add    $0x1,%edx
 51c:	eb ec                	jmp    50a <thread_create+0x30>
  void *user_stack = curr_ptr;
 51e:	89 c1                	mov    %eax,%ecx
 520:	eb e3                	jmp    505 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 522:	83 3c 95 80 11 00 00 	cmpl   $0x1,0x1180(,%edx,4)
 529:	01 
 52a:	74 34                	je     560 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 52c:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 52f:	c1 e3 02             	shl    $0x2,%ebx
 532:	89 83 80 0e 00 00    	mov    %eax,0xe80(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 538:	89 8b 84 0e 00 00    	mov    %ecx,0xe84(%ebx)
  cell_full[i] = 1;
 53e:	c7 04 95 80 11 00 00 	movl   $0x1,0x1180(,%edx,4)
 545:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 549:	ff 75 10             	pushl  0x10(%ebp)
 54c:	ff 75 0c             	pushl  0xc(%ebp)
 54f:	ff 75 08             	pushl  0x8(%ebp)
 552:	51                   	push   %ecx
 553:	e8 dc 00 00 00       	call   634 <clone>
 558:	83 c4 10             	add    $0x10,%esp
}
 55b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 55e:	c9                   	leave  
 55f:	c3                   	ret    
    return -1;
 560:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 565:	eb f4                	jmp    55b <thread_create+0x81>

00000567 <thread_join>:

int thread_join(){
 567:	f3 0f 1e fb          	endbr32 
 56b:	55                   	push   %ebp
 56c:	89 e5                	mov    %esp,%ebp
 56e:	56                   	push   %esi
 56f:	53                   	push   %ebx
 570:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 573:	8d 45 f4             	lea    -0xc(%ebp),%eax
 576:	50                   	push   %eax
 577:	e8 d0 00 00 00       	call   64c <join>
 57c:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 57e:	83 c4 10             	add    $0x10,%esp
 581:	bb 00 00 00 00       	mov    $0x0,%ebx
 586:	83 fb 3f             	cmp    $0x3f,%ebx
 589:	7f 14                	jg     59f <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 58b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 58e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 591:	39 14 85 84 0e 00 00 	cmp    %edx,0xe84(,%eax,4)
 598:	74 05                	je     59f <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 59a:	83 c3 01             	add    $0x1,%ebx
 59d:	eb e7                	jmp    586 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 59f:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 5a2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5a5:	39 0c 85 84 0e 00 00 	cmp    %ecx,0xe84(,%eax,4)
 5ac:	75 26                	jne    5d4 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 5ae:	83 ec 0c             	sub    $0xc,%esp
 5b1:	ff 34 85 80 0e 00 00 	pushl  0xe80(,%eax,4)
 5b8:	e8 35 03 00 00       	call   8f2 <free>
  cell_full[i] = 0;
 5bd:	c7 04 9d 80 11 00 00 	movl   $0x0,0x1180(,%ebx,4)
 5c4:	00 00 00 00 

  return out;
 5c8:	83 c4 10             	add    $0x10,%esp
}
 5cb:	89 f0                	mov    %esi,%eax
 5cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5d0:	5b                   	pop    %ebx
 5d1:	5e                   	pop    %esi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 5d4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5d9:	eb f0                	jmp    5cb <thread_join+0x64>

000005db <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 5db:	f3 0f 1e fb          	endbr32 
 5df:	55                   	push   %ebp
 5e0:	89 e5                	mov    %esp,%ebp
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 5e5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 5eb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    

000005f4 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 5f4:	f3 0f 1e fb          	endbr32 
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 5fe:	b9 01 00 00 00       	mov    $0x1,%ecx
 603:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 607:	b8 00 00 00 00       	mov    $0x0,%eax
 60c:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 611:	39 c1                	cmp    %eax,%ecx
 613:	75 f2                	jne    607 <lock_acquire+0x13>
      ; // spin
    }
}
 615:	5d                   	pop    %ebp
 616:	c3                   	ret    

00000617 <lock_release>:

void lock_release(lock_t *lock) {
 617:	f3 0f 1e fb          	endbr32 
 61b:	55                   	push   %ebp
 61c:	89 e5                	mov    %esp,%ebp
 61e:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 621:	8b 42 04             	mov    0x4(%edx),%eax
 624:	83 c0 01             	add    $0x1,%eax
 627:	89 42 04             	mov    %eax,0x4(%edx)
}
 62a:	5d                   	pop    %ebp
 62b:	c3                   	ret    

0000062c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 62c:	b8 01 00 00 00       	mov    $0x1,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <clone>:
SYSCALL(clone)
 634:	b8 16 00 00 00       	mov    $0x16,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <exit>:
SYSCALL(exit)
 63c:	b8 02 00 00 00       	mov    $0x2,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <wait>:
SYSCALL(wait)
 644:	b8 03 00 00 00       	mov    $0x3,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <join>:
SYSCALL(join)
 64c:	b8 17 00 00 00       	mov    $0x17,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <pipe>:
SYSCALL(pipe)
 654:	b8 04 00 00 00       	mov    $0x4,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <read>:
SYSCALL(read)
 65c:	b8 05 00 00 00       	mov    $0x5,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <write>:
SYSCALL(write)
 664:	b8 10 00 00 00       	mov    $0x10,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <close>:
SYSCALL(close)
 66c:	b8 15 00 00 00       	mov    $0x15,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <kill>:
SYSCALL(kill)
 674:	b8 06 00 00 00       	mov    $0x6,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <exec>:
SYSCALL(exec)
 67c:	b8 07 00 00 00       	mov    $0x7,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <open>:
SYSCALL(open)
 684:	b8 0f 00 00 00       	mov    $0xf,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <mknod>:
SYSCALL(mknod)
 68c:	b8 11 00 00 00       	mov    $0x11,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <unlink>:
SYSCALL(unlink)
 694:	b8 12 00 00 00       	mov    $0x12,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <fstat>:
SYSCALL(fstat)
 69c:	b8 08 00 00 00       	mov    $0x8,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <link>:
SYSCALL(link)
 6a4:	b8 13 00 00 00       	mov    $0x13,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <mkdir>:
SYSCALL(mkdir)
 6ac:	b8 14 00 00 00       	mov    $0x14,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <chdir>:
SYSCALL(chdir)
 6b4:	b8 09 00 00 00       	mov    $0x9,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <dup>:
SYSCALL(dup)
 6bc:	b8 0a 00 00 00       	mov    $0xa,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <getpid>:
SYSCALL(getpid)
 6c4:	b8 0b 00 00 00       	mov    $0xb,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <sbrk>:
SYSCALL(sbrk)
 6cc:	b8 0c 00 00 00       	mov    $0xc,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <sleep>:
SYSCALL(sleep)
 6d4:	b8 0d 00 00 00       	mov    $0xd,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <uptime>:
SYSCALL(uptime)
 6dc:	b8 0e 00 00 00       	mov    $0xe,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6e4:	55                   	push   %ebp
 6e5:	89 e5                	mov    %esp,%ebp
 6e7:	83 ec 1c             	sub    $0x1c,%esp
 6ea:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6ed:	6a 01                	push   $0x1
 6ef:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6f2:	52                   	push   %edx
 6f3:	50                   	push   %eax
 6f4:	e8 6b ff ff ff       	call   664 <write>
}
 6f9:	83 c4 10             	add    $0x10,%esp
 6fc:	c9                   	leave  
 6fd:	c3                   	ret    

000006fe <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6fe:	55                   	push   %ebp
 6ff:	89 e5                	mov    %esp,%ebp
 701:	57                   	push   %edi
 702:	56                   	push   %esi
 703:	53                   	push   %ebx
 704:	83 ec 2c             	sub    $0x2c,%esp
 707:	89 45 d0             	mov    %eax,-0x30(%ebp)
 70a:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 70c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 710:	0f 95 c2             	setne  %dl
 713:	89 f0                	mov    %esi,%eax
 715:	c1 e8 1f             	shr    $0x1f,%eax
 718:	84 c2                	test   %al,%dl
 71a:	74 42                	je     75e <printint+0x60>
    neg = 1;
    x = -xx;
 71c:	f7 de                	neg    %esi
    neg = 1;
 71e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 725:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 72a:	89 f0                	mov    %esi,%eax
 72c:	ba 00 00 00 00       	mov    $0x0,%edx
 731:	f7 f1                	div    %ecx
 733:	89 df                	mov    %ebx,%edi
 735:	83 c3 01             	add    $0x1,%ebx
 738:	0f b6 92 c8 0a 00 00 	movzbl 0xac8(%edx),%edx
 73f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 743:	89 f2                	mov    %esi,%edx
 745:	89 c6                	mov    %eax,%esi
 747:	39 d1                	cmp    %edx,%ecx
 749:	76 df                	jbe    72a <printint+0x2c>
  if(neg)
 74b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 74f:	74 2f                	je     780 <printint+0x82>
    buf[i++] = '-';
 751:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 756:	8d 5f 02             	lea    0x2(%edi),%ebx
 759:	8b 75 d0             	mov    -0x30(%ebp),%esi
 75c:	eb 15                	jmp    773 <printint+0x75>
  neg = 0;
 75e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 765:	eb be                	jmp    725 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 767:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 76c:	89 f0                	mov    %esi,%eax
 76e:	e8 71 ff ff ff       	call   6e4 <putc>
  while(--i >= 0)
 773:	83 eb 01             	sub    $0x1,%ebx
 776:	79 ef                	jns    767 <printint+0x69>
}
 778:	83 c4 2c             	add    $0x2c,%esp
 77b:	5b                   	pop    %ebx
 77c:	5e                   	pop    %esi
 77d:	5f                   	pop    %edi
 77e:	5d                   	pop    %ebp
 77f:	c3                   	ret    
 780:	8b 75 d0             	mov    -0x30(%ebp),%esi
 783:	eb ee                	jmp    773 <printint+0x75>

00000785 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 785:	f3 0f 1e fb          	endbr32 
 789:	55                   	push   %ebp
 78a:	89 e5                	mov    %esp,%ebp
 78c:	57                   	push   %edi
 78d:	56                   	push   %esi
 78e:	53                   	push   %ebx
 78f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 792:	8d 45 10             	lea    0x10(%ebp),%eax
 795:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 798:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 79d:	bb 00 00 00 00       	mov    $0x0,%ebx
 7a2:	eb 14                	jmp    7b8 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7a4:	89 fa                	mov    %edi,%edx
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	e8 36 ff ff ff       	call   6e4 <putc>
 7ae:	eb 05                	jmp    7b5 <printf+0x30>
      }
    } else if(state == '%'){
 7b0:	83 fe 25             	cmp    $0x25,%esi
 7b3:	74 25                	je     7da <printf+0x55>
  for(i = 0; fmt[i]; i++){
 7b5:	83 c3 01             	add    $0x1,%ebx
 7b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 7bb:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7bf:	84 c0                	test   %al,%al
 7c1:	0f 84 23 01 00 00    	je     8ea <printf+0x165>
    c = fmt[i] & 0xff;
 7c7:	0f be f8             	movsbl %al,%edi
 7ca:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7cd:	85 f6                	test   %esi,%esi
 7cf:	75 df                	jne    7b0 <printf+0x2b>
      if(c == '%'){
 7d1:	83 f8 25             	cmp    $0x25,%eax
 7d4:	75 ce                	jne    7a4 <printf+0x1f>
        state = '%';
 7d6:	89 c6                	mov    %eax,%esi
 7d8:	eb db                	jmp    7b5 <printf+0x30>
      if(c == 'd'){
 7da:	83 f8 64             	cmp    $0x64,%eax
 7dd:	74 49                	je     828 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7df:	83 f8 78             	cmp    $0x78,%eax
 7e2:	0f 94 c1             	sete   %cl
 7e5:	83 f8 70             	cmp    $0x70,%eax
 7e8:	0f 94 c2             	sete   %dl
 7eb:	08 d1                	or     %dl,%cl
 7ed:	75 63                	jne    852 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7ef:	83 f8 73             	cmp    $0x73,%eax
 7f2:	0f 84 84 00 00 00    	je     87c <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7f8:	83 f8 63             	cmp    $0x63,%eax
 7fb:	0f 84 b7 00 00 00    	je     8b8 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 801:	83 f8 25             	cmp    $0x25,%eax
 804:	0f 84 cc 00 00 00    	je     8d6 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 80a:	ba 25 00 00 00       	mov    $0x25,%edx
 80f:	8b 45 08             	mov    0x8(%ebp),%eax
 812:	e8 cd fe ff ff       	call   6e4 <putc>
        putc(fd, c);
 817:	89 fa                	mov    %edi,%edx
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	e8 c3 fe ff ff       	call   6e4 <putc>
      }
      state = 0;
 821:	be 00 00 00 00       	mov    $0x0,%esi
 826:	eb 8d                	jmp    7b5 <printf+0x30>
        printint(fd, *ap, 10, 1);
 828:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 82b:	8b 17                	mov    (%edi),%edx
 82d:	83 ec 0c             	sub    $0xc,%esp
 830:	6a 01                	push   $0x1
 832:	b9 0a 00 00 00       	mov    $0xa,%ecx
 837:	8b 45 08             	mov    0x8(%ebp),%eax
 83a:	e8 bf fe ff ff       	call   6fe <printint>
        ap++;
 83f:	83 c7 04             	add    $0x4,%edi
 842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 845:	83 c4 10             	add    $0x10,%esp
      state = 0;
 848:	be 00 00 00 00       	mov    $0x0,%esi
 84d:	e9 63 ff ff ff       	jmp    7b5 <printf+0x30>
        printint(fd, *ap, 16, 0);
 852:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 855:	8b 17                	mov    (%edi),%edx
 857:	83 ec 0c             	sub    $0xc,%esp
 85a:	6a 00                	push   $0x0
 85c:	b9 10 00 00 00       	mov    $0x10,%ecx
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	e8 95 fe ff ff       	call   6fe <printint>
        ap++;
 869:	83 c7 04             	add    $0x4,%edi
 86c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 86f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 872:	be 00 00 00 00       	mov    $0x0,%esi
 877:	e9 39 ff ff ff       	jmp    7b5 <printf+0x30>
        s = (char*)*ap;
 87c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 87f:	8b 30                	mov    (%eax),%esi
        ap++;
 881:	83 c0 04             	add    $0x4,%eax
 884:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 887:	85 f6                	test   %esi,%esi
 889:	75 28                	jne    8b3 <printf+0x12e>
          s = "(null)";
 88b:	be be 0a 00 00       	mov    $0xabe,%esi
 890:	8b 7d 08             	mov    0x8(%ebp),%edi
 893:	eb 0d                	jmp    8a2 <printf+0x11d>
          putc(fd, *s);
 895:	0f be d2             	movsbl %dl,%edx
 898:	89 f8                	mov    %edi,%eax
 89a:	e8 45 fe ff ff       	call   6e4 <putc>
          s++;
 89f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8a2:	0f b6 16             	movzbl (%esi),%edx
 8a5:	84 d2                	test   %dl,%dl
 8a7:	75 ec                	jne    895 <printf+0x110>
      state = 0;
 8a9:	be 00 00 00 00       	mov    $0x0,%esi
 8ae:	e9 02 ff ff ff       	jmp    7b5 <printf+0x30>
 8b3:	8b 7d 08             	mov    0x8(%ebp),%edi
 8b6:	eb ea                	jmp    8a2 <printf+0x11d>
        putc(fd, *ap);
 8b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8bb:	0f be 17             	movsbl (%edi),%edx
 8be:	8b 45 08             	mov    0x8(%ebp),%eax
 8c1:	e8 1e fe ff ff       	call   6e4 <putc>
        ap++;
 8c6:	83 c7 04             	add    $0x4,%edi
 8c9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8cc:	be 00 00 00 00       	mov    $0x0,%esi
 8d1:	e9 df fe ff ff       	jmp    7b5 <printf+0x30>
        putc(fd, c);
 8d6:	89 fa                	mov    %edi,%edx
 8d8:	8b 45 08             	mov    0x8(%ebp),%eax
 8db:	e8 04 fe ff ff       	call   6e4 <putc>
      state = 0;
 8e0:	be 00 00 00 00       	mov    $0x0,%esi
 8e5:	e9 cb fe ff ff       	jmp    7b5 <printf+0x30>
    }
  }
}
 8ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8ed:	5b                   	pop    %ebx
 8ee:	5e                   	pop    %esi
 8ef:	5f                   	pop    %edi
 8f0:	5d                   	pop    %ebp
 8f1:	c3                   	ret    

000008f2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f2:	f3 0f 1e fb          	endbr32 
 8f6:	55                   	push   %ebp
 8f7:	89 e5                	mov    %esp,%ebp
 8f9:	57                   	push   %edi
 8fa:	56                   	push   %esi
 8fb:	53                   	push   %ebx
 8fc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8ff:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 902:	a1 48 0e 00 00       	mov    0xe48,%eax
 907:	eb 02                	jmp    90b <free+0x19>
 909:	89 d0                	mov    %edx,%eax
 90b:	39 c8                	cmp    %ecx,%eax
 90d:	73 04                	jae    913 <free+0x21>
 90f:	39 08                	cmp    %ecx,(%eax)
 911:	77 12                	ja     925 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 913:	8b 10                	mov    (%eax),%edx
 915:	39 c2                	cmp    %eax,%edx
 917:	77 f0                	ja     909 <free+0x17>
 919:	39 c8                	cmp    %ecx,%eax
 91b:	72 08                	jb     925 <free+0x33>
 91d:	39 ca                	cmp    %ecx,%edx
 91f:	77 04                	ja     925 <free+0x33>
 921:	89 d0                	mov    %edx,%eax
 923:	eb e6                	jmp    90b <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 925:	8b 73 fc             	mov    -0x4(%ebx),%esi
 928:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 92b:	8b 10                	mov    (%eax),%edx
 92d:	39 d7                	cmp    %edx,%edi
 92f:	74 19                	je     94a <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 931:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 934:	8b 50 04             	mov    0x4(%eax),%edx
 937:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 93a:	39 ce                	cmp    %ecx,%esi
 93c:	74 1b                	je     959 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 93e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 940:	a3 48 0e 00 00       	mov    %eax,0xe48
}
 945:	5b                   	pop    %ebx
 946:	5e                   	pop    %esi
 947:	5f                   	pop    %edi
 948:	5d                   	pop    %ebp
 949:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 94a:	03 72 04             	add    0x4(%edx),%esi
 94d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 950:	8b 10                	mov    (%eax),%edx
 952:	8b 12                	mov    (%edx),%edx
 954:	89 53 f8             	mov    %edx,-0x8(%ebx)
 957:	eb db                	jmp    934 <free+0x42>
    p->s.size += bp->s.size;
 959:	03 53 fc             	add    -0x4(%ebx),%edx
 95c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 962:	89 10                	mov    %edx,(%eax)
 964:	eb da                	jmp    940 <free+0x4e>

00000966 <morecore>:

static Header*
morecore(uint nu)
{
 966:	55                   	push   %ebp
 967:	89 e5                	mov    %esp,%ebp
 969:	53                   	push   %ebx
 96a:	83 ec 04             	sub    $0x4,%esp
 96d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 96f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 974:	77 05                	ja     97b <morecore+0x15>
    nu = 4096;
 976:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 97b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 982:	83 ec 0c             	sub    $0xc,%esp
 985:	50                   	push   %eax
 986:	e8 41 fd ff ff       	call   6cc <sbrk>
  if(p == (char*)-1)
 98b:	83 c4 10             	add    $0x10,%esp
 98e:	83 f8 ff             	cmp    $0xffffffff,%eax
 991:	74 1c                	je     9af <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 993:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 996:	83 c0 08             	add    $0x8,%eax
 999:	83 ec 0c             	sub    $0xc,%esp
 99c:	50                   	push   %eax
 99d:	e8 50 ff ff ff       	call   8f2 <free>
  return freep;
 9a2:	a1 48 0e 00 00       	mov    0xe48,%eax
 9a7:	83 c4 10             	add    $0x10,%esp
}
 9aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9ad:	c9                   	leave  
 9ae:	c3                   	ret    
    return 0;
 9af:	b8 00 00 00 00       	mov    $0x0,%eax
 9b4:	eb f4                	jmp    9aa <morecore+0x44>

000009b6 <malloc>:

void*
malloc(uint nbytes)
{
 9b6:	f3 0f 1e fb          	endbr32 
 9ba:	55                   	push   %ebp
 9bb:	89 e5                	mov    %esp,%ebp
 9bd:	53                   	push   %ebx
 9be:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9c1:	8b 45 08             	mov    0x8(%ebp),%eax
 9c4:	8d 58 07             	lea    0x7(%eax),%ebx
 9c7:	c1 eb 03             	shr    $0x3,%ebx
 9ca:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9cd:	8b 0d 48 0e 00 00    	mov    0xe48,%ecx
 9d3:	85 c9                	test   %ecx,%ecx
 9d5:	74 04                	je     9db <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d7:	8b 01                	mov    (%ecx),%eax
 9d9:	eb 4b                	jmp    a26 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 9db:	c7 05 48 0e 00 00 4c 	movl   $0xe4c,0xe48
 9e2:	0e 00 00 
 9e5:	c7 05 4c 0e 00 00 4c 	movl   $0xe4c,0xe4c
 9ec:	0e 00 00 
    base.s.size = 0;
 9ef:	c7 05 50 0e 00 00 00 	movl   $0x0,0xe50
 9f6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9f9:	b9 4c 0e 00 00       	mov    $0xe4c,%ecx
 9fe:	eb d7                	jmp    9d7 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a00:	74 1a                	je     a1c <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a02:	29 da                	sub    %ebx,%edx
 a04:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a07:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a0a:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a0d:	89 0d 48 0e 00 00    	mov    %ecx,0xe48
      return (void*)(p + 1);
 a13:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a16:	83 c4 04             	add    $0x4,%esp
 a19:	5b                   	pop    %ebx
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a1c:	8b 10                	mov    (%eax),%edx
 a1e:	89 11                	mov    %edx,(%ecx)
 a20:	eb eb                	jmp    a0d <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a22:	89 c1                	mov    %eax,%ecx
 a24:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a26:	8b 50 04             	mov    0x4(%eax),%edx
 a29:	39 da                	cmp    %ebx,%edx
 a2b:	73 d3                	jae    a00 <malloc+0x4a>
    if(p == freep)
 a2d:	39 05 48 0e 00 00    	cmp    %eax,0xe48
 a33:	75 ed                	jne    a22 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 a35:	89 d8                	mov    %ebx,%eax
 a37:	e8 2a ff ff ff       	call   966 <morecore>
 a3c:	85 c0                	test   %eax,%eax
 a3e:	75 e2                	jne    a22 <malloc+0x6c>
 a40:	eb d4                	jmp    a16 <malloc+0x60>
