
_test_14:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   d:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   f:	8b 45 08             	mov    0x8(%ebp),%eax
  12:	83 38 2a             	cmpl   $0x2a,(%eax)
  15:	75 1d                	jne    34 <worker+0x34>
   assert(tmp2 == 24);
  17:	83 fa 18             	cmp    $0x18,%edx
  1a:	75 61                	jne    7d <worker+0x7d>
   assert(global == 1);
  1c:	a1 9c 0d 00 00       	mov    0xd9c,%eax
  21:	83 f8 01             	cmp    $0x1,%eax
  24:	0f 85 9c 00 00 00    	jne    c6 <worker+0xc6>
   global++;
  2a:	83 c0 01             	add    $0x1,%eax
  2d:	a3 9c 0d 00 00       	mov    %eax,0xd9c
   // no exit() in thread
}
  32:	c9                   	leave  
  33:	c3                   	ret    
   assert(tmp1 == 42);
  34:	6a 2c                	push   $0x2c
  36:	68 84 09 00 00       	push   $0x984
  3b:	68 8e 09 00 00       	push   $0x98e
  40:	6a 01                	push   $0x1
  42:	e8 7d 06 00 00       	call   6c4 <printf>
  47:	83 c4 0c             	add    $0xc,%esp
  4a:	68 96 09 00 00       	push   $0x996
  4f:	68 a1 09 00 00       	push   $0x9a1
  54:	6a 01                	push   $0x1
  56:	e8 69 06 00 00       	call   6c4 <printf>
  5b:	83 c4 08             	add    $0x8,%esp
  5e:	68 b5 09 00 00       	push   $0x9b5
  63:	6a 01                	push   $0x1
  65:	e8 5a 06 00 00       	call   6c4 <printf>
  6a:	83 c4 04             	add    $0x4,%esp
  6d:	ff 35 ac 0d 00 00    	pushl  0xdac
  73:	e8 3b 05 00 00       	call   5b3 <kill>
  78:	e8 fe 04 00 00       	call   57b <exit>
   assert(tmp2 == 24);
  7d:	6a 2d                	push   $0x2d
  7f:	68 84 09 00 00       	push   $0x984
  84:	68 8e 09 00 00       	push   $0x98e
  89:	6a 01                	push   $0x1
  8b:	e8 34 06 00 00       	call   6c4 <printf>
  90:	83 c4 0c             	add    $0xc,%esp
  93:	68 c2 09 00 00       	push   $0x9c2
  98:	68 a1 09 00 00       	push   $0x9a1
  9d:	6a 01                	push   $0x1
  9f:	e8 20 06 00 00       	call   6c4 <printf>
  a4:	83 c4 08             	add    $0x8,%esp
  a7:	68 b5 09 00 00       	push   $0x9b5
  ac:	6a 01                	push   $0x1
  ae:	e8 11 06 00 00       	call   6c4 <printf>
  b3:	83 c4 04             	add    $0x4,%esp
  b6:	ff 35 ac 0d 00 00    	pushl  0xdac
  bc:	e8 f2 04 00 00       	call   5b3 <kill>
  c1:	e8 b5 04 00 00       	call   57b <exit>
   assert(global == 1);
  c6:	6a 2e                	push   $0x2e
  c8:	68 84 09 00 00       	push   $0x984
  cd:	68 8e 09 00 00       	push   $0x98e
  d2:	6a 01                	push   $0x1
  d4:	e8 eb 05 00 00       	call   6c4 <printf>
  d9:	83 c4 0c             	add    $0xc,%esp
  dc:	68 cd 09 00 00       	push   $0x9cd
  e1:	68 a1 09 00 00       	push   $0x9a1
  e6:	6a 01                	push   $0x1
  e8:	e8 d7 05 00 00       	call   6c4 <printf>
  ed:	83 c4 08             	add    $0x8,%esp
  f0:	68 b5 09 00 00       	push   $0x9b5
  f5:	6a 01                	push   $0x1
  f7:	e8 c8 05 00 00       	call   6c4 <printf>
  fc:	83 c4 04             	add    $0x4,%esp
  ff:	ff 35 ac 0d 00 00    	pushl  0xdac
 105:	e8 a9 04 00 00       	call   5b3 <kill>
 10a:	e8 6c 04 00 00       	call   57b <exit>

0000010f <main>:
{
 10f:	f3 0f 1e fb          	endbr32 
 113:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 117:	83 e4 f0             	and    $0xfffffff0,%esp
 11a:	ff 71 fc             	pushl  -0x4(%ecx)
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	53                   	push   %ebx
 121:	51                   	push   %ecx
 122:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 125:	e8 d9 04 00 00       	call   603 <getpid>
 12a:	a3 ac 0d 00 00       	mov    %eax,0xdac
   int arg1 = 42, arg2 = 24;
 12f:	c7 45 f4 2a 00 00 00 	movl   $0x2a,-0xc(%ebp)
 136:	c7 45 f0 18 00 00 00 	movl   $0x18,-0x10(%ebp)
   int thread_pid = thread_create(worker, &arg1, &arg2);
 13d:	83 ec 04             	sub    $0x4,%esp
 140:	8d 45 f0             	lea    -0x10(%ebp),%eax
 143:	50                   	push   %eax
 144:	8d 45 f4             	lea    -0xc(%ebp),%eax
 147:	50                   	push   %eax
 148:	68 00 00 00 00       	push   $0x0
 14d:	e8 c7 02 00 00       	call   419 <thread_create>
   assert(thread_pid > 0);
 152:	83 c4 10             	add    $0x10,%esp
 155:	85 c0                	test   %eax,%eax
 157:	7e 65                	jle    1be <main+0xaf>
 159:	89 c3                	mov    %eax,%ebx
   int join_pid = thread_join();
 15b:	e8 46 03 00 00       	call   4a6 <thread_join>
   assert(join_pid == thread_pid);
 160:	39 c3                	cmp    %eax,%ebx
 162:	0f 85 9f 00 00 00    	jne    207 <main+0xf8>
   assert(global == 2);
 168:	83 3d 9c 0d 00 00 02 	cmpl   $0x2,0xd9c
 16f:	0f 84 db 00 00 00    	je     250 <main+0x141>
 175:	6a 22                	push   $0x22
 177:	68 84 09 00 00       	push   $0x984
 17c:	68 8e 09 00 00       	push   $0x98e
 181:	6a 01                	push   $0x1
 183:	e8 3c 05 00 00       	call   6c4 <printf>
 188:	83 c4 0c             	add    $0xc,%esp
 18b:	68 ff 09 00 00       	push   $0x9ff
 190:	68 a1 09 00 00       	push   $0x9a1
 195:	6a 01                	push   $0x1
 197:	e8 28 05 00 00       	call   6c4 <printf>
 19c:	83 c4 08             	add    $0x8,%esp
 19f:	68 b5 09 00 00       	push   $0x9b5
 1a4:	6a 01                	push   $0x1
 1a6:	e8 19 05 00 00       	call   6c4 <printf>
 1ab:	83 c4 04             	add    $0x4,%esp
 1ae:	ff 35 ac 0d 00 00    	pushl  0xdac
 1b4:	e8 fa 03 00 00       	call   5b3 <kill>
 1b9:	e8 bd 03 00 00       	call   57b <exit>
   assert(thread_pid > 0);
 1be:	6a 1e                	push   $0x1e
 1c0:	68 84 09 00 00       	push   $0x984
 1c5:	68 8e 09 00 00       	push   $0x98e
 1ca:	6a 01                	push   $0x1
 1cc:	e8 f3 04 00 00       	call   6c4 <printf>
 1d1:	83 c4 0c             	add    $0xc,%esp
 1d4:	68 d9 09 00 00       	push   $0x9d9
 1d9:	68 a1 09 00 00       	push   $0x9a1
 1de:	6a 01                	push   $0x1
 1e0:	e8 df 04 00 00       	call   6c4 <printf>
 1e5:	83 c4 08             	add    $0x8,%esp
 1e8:	68 b5 09 00 00       	push   $0x9b5
 1ed:	6a 01                	push   $0x1
 1ef:	e8 d0 04 00 00       	call   6c4 <printf>
 1f4:	83 c4 04             	add    $0x4,%esp
 1f7:	ff 35 ac 0d 00 00    	pushl  0xdac
 1fd:	e8 b1 03 00 00       	call   5b3 <kill>
 202:	e8 74 03 00 00       	call   57b <exit>
   assert(join_pid == thread_pid);
 207:	6a 21                	push   $0x21
 209:	68 84 09 00 00       	push   $0x984
 20e:	68 8e 09 00 00       	push   $0x98e
 213:	6a 01                	push   $0x1
 215:	e8 aa 04 00 00       	call   6c4 <printf>
 21a:	83 c4 0c             	add    $0xc,%esp
 21d:	68 e8 09 00 00       	push   $0x9e8
 222:	68 a1 09 00 00       	push   $0x9a1
 227:	6a 01                	push   $0x1
 229:	e8 96 04 00 00       	call   6c4 <printf>
 22e:	83 c4 08             	add    $0x8,%esp
 231:	68 b5 09 00 00       	push   $0x9b5
 236:	6a 01                	push   $0x1
 238:	e8 87 04 00 00       	call   6c4 <printf>
 23d:	83 c4 04             	add    $0x4,%esp
 240:	ff 35 ac 0d 00 00    	pushl  0xdac
 246:	e8 68 03 00 00       	call   5b3 <kill>
 24b:	e8 2b 03 00 00       	call   57b <exit>
   printf(1, "TEST PASSED\n");
 250:	83 ec 08             	sub    $0x8,%esp
 253:	68 0b 0a 00 00       	push   $0xa0b
 258:	6a 01                	push   $0x1
 25a:	e8 65 04 00 00       	call   6c4 <printf>
   exit();
 25f:	e8 17 03 00 00       	call   57b <exit>

00000264 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 264:	f3 0f 1e fb          	endbr32 
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	56                   	push   %esi
 26c:	53                   	push   %ebx
 26d:	8b 75 08             	mov    0x8(%ebp),%esi
 270:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 273:	89 f0                	mov    %esi,%eax
 275:	89 d1                	mov    %edx,%ecx
 277:	83 c2 01             	add    $0x1,%edx
 27a:	89 c3                	mov    %eax,%ebx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	0f b6 09             	movzbl (%ecx),%ecx
 282:	88 0b                	mov    %cl,(%ebx)
 284:	84 c9                	test   %cl,%cl
 286:	75 ed                	jne    275 <strcpy+0x11>
    ;
  return os;
}
 288:	89 f0                	mov    %esi,%eax
 28a:	5b                   	pop    %ebx
 28b:	5e                   	pop    %esi
 28c:	5d                   	pop    %ebp
 28d:	c3                   	ret    

0000028e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 28e:	f3 0f 1e fb          	endbr32 
 292:	55                   	push   %ebp
 293:	89 e5                	mov    %esp,%ebp
 295:	8b 4d 08             	mov    0x8(%ebp),%ecx
 298:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 29b:	0f b6 01             	movzbl (%ecx),%eax
 29e:	84 c0                	test   %al,%al
 2a0:	74 0c                	je     2ae <strcmp+0x20>
 2a2:	3a 02                	cmp    (%edx),%al
 2a4:	75 08                	jne    2ae <strcmp+0x20>
    p++, q++;
 2a6:	83 c1 01             	add    $0x1,%ecx
 2a9:	83 c2 01             	add    $0x1,%edx
 2ac:	eb ed                	jmp    29b <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 2ae:	0f b6 c0             	movzbl %al,%eax
 2b1:	0f b6 12             	movzbl (%edx),%edx
 2b4:	29 d0                	sub    %edx,%eax
}
 2b6:	5d                   	pop    %ebp
 2b7:	c3                   	ret    

000002b8 <strlen>:

uint
strlen(const char *s)
{
 2b8:	f3 0f 1e fb          	endbr32 
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 2c2:	b8 00 00 00 00       	mov    $0x0,%eax
 2c7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 2cb:	74 05                	je     2d2 <strlen+0x1a>
 2cd:	83 c0 01             	add    $0x1,%eax
 2d0:	eb f5                	jmp    2c7 <strlen+0xf>
    ;
  return n;
}
 2d2:	5d                   	pop    %ebp
 2d3:	c3                   	ret    

000002d4 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2d4:	f3 0f 1e fb          	endbr32 
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	57                   	push   %edi
 2dc:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2df:	89 d7                	mov    %edx,%edi
 2e1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e7:	fc                   	cld    
 2e8:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2ea:	89 d0                	mov    %edx,%eax
 2ec:	5f                   	pop    %edi
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    

000002ef <strchr>:

char*
strchr(const char *s, char c)
{
 2ef:	f3 0f 1e fb          	endbr32 
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2fd:	0f b6 10             	movzbl (%eax),%edx
 300:	84 d2                	test   %dl,%dl
 302:	74 09                	je     30d <strchr+0x1e>
    if(*s == c)
 304:	38 ca                	cmp    %cl,%dl
 306:	74 0a                	je     312 <strchr+0x23>
  for(; *s; s++)
 308:	83 c0 01             	add    $0x1,%eax
 30b:	eb f0                	jmp    2fd <strchr+0xe>
      return (char*)s;
  return 0;
 30d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 312:	5d                   	pop    %ebp
 313:	c3                   	ret    

00000314 <gets>:

char*
gets(char *buf, int max)
{
 314:	f3 0f 1e fb          	endbr32 
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	57                   	push   %edi
 31c:	56                   	push   %esi
 31d:	53                   	push   %ebx
 31e:	83 ec 1c             	sub    $0x1c,%esp
 321:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 324:	bb 00 00 00 00       	mov    $0x0,%ebx
 329:	89 de                	mov    %ebx,%esi
 32b:	83 c3 01             	add    $0x1,%ebx
 32e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 331:	7d 2e                	jge    361 <gets+0x4d>
    cc = read(0, &c, 1);
 333:	83 ec 04             	sub    $0x4,%esp
 336:	6a 01                	push   $0x1
 338:	8d 45 e7             	lea    -0x19(%ebp),%eax
 33b:	50                   	push   %eax
 33c:	6a 00                	push   $0x0
 33e:	e8 58 02 00 00       	call   59b <read>
    if(cc < 1)
 343:	83 c4 10             	add    $0x10,%esp
 346:	85 c0                	test   %eax,%eax
 348:	7e 17                	jle    361 <gets+0x4d>
      break;
    buf[i++] = c;
 34a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 34e:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 351:	3c 0a                	cmp    $0xa,%al
 353:	0f 94 c2             	sete   %dl
 356:	3c 0d                	cmp    $0xd,%al
 358:	0f 94 c0             	sete   %al
 35b:	08 c2                	or     %al,%dl
 35d:	74 ca                	je     329 <gets+0x15>
    buf[i++] = c;
 35f:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 361:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 365:	89 f8                	mov    %edi,%eax
 367:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36a:	5b                   	pop    %ebx
 36b:	5e                   	pop    %esi
 36c:	5f                   	pop    %edi
 36d:	5d                   	pop    %ebp
 36e:	c3                   	ret    

0000036f <stat>:

int
stat(const char *n, struct stat *st)
{
 36f:	f3 0f 1e fb          	endbr32 
 373:	55                   	push   %ebp
 374:	89 e5                	mov    %esp,%ebp
 376:	56                   	push   %esi
 377:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 378:	83 ec 08             	sub    $0x8,%esp
 37b:	6a 00                	push   $0x0
 37d:	ff 75 08             	pushl  0x8(%ebp)
 380:	e8 3e 02 00 00       	call   5c3 <open>
  if(fd < 0)
 385:	83 c4 10             	add    $0x10,%esp
 388:	85 c0                	test   %eax,%eax
 38a:	78 24                	js     3b0 <stat+0x41>
 38c:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 38e:	83 ec 08             	sub    $0x8,%esp
 391:	ff 75 0c             	pushl  0xc(%ebp)
 394:	50                   	push   %eax
 395:	e8 41 02 00 00       	call   5db <fstat>
 39a:	89 c6                	mov    %eax,%esi
  close(fd);
 39c:	89 1c 24             	mov    %ebx,(%esp)
 39f:	e8 07 02 00 00       	call   5ab <close>
  return r;
 3a4:	83 c4 10             	add    $0x10,%esp
}
 3a7:	89 f0                	mov    %esi,%eax
 3a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3ac:	5b                   	pop    %ebx
 3ad:	5e                   	pop    %esi
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    
    return -1;
 3b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3b5:	eb f0                	jmp    3a7 <stat+0x38>

000003b7 <atoi>:

int
atoi(const char *s)
{
 3b7:	f3 0f 1e fb          	endbr32 
 3bb:	55                   	push   %ebp
 3bc:	89 e5                	mov    %esp,%ebp
 3be:	53                   	push   %ebx
 3bf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 3c2:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 3c7:	0f b6 01             	movzbl (%ecx),%eax
 3ca:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3cd:	80 fb 09             	cmp    $0x9,%bl
 3d0:	77 12                	ja     3e4 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 3d2:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 3d5:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 3d8:	83 c1 01             	add    $0x1,%ecx
 3db:	0f be c0             	movsbl %al,%eax
 3de:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 3e2:	eb e3                	jmp    3c7 <atoi+0x10>
  return n;
}
 3e4:	89 d0                	mov    %edx,%eax
 3e6:	5b                   	pop    %ebx
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    

000003e9 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e9:	f3 0f 1e fb          	endbr32 
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	56                   	push   %esi
 3f1:	53                   	push   %ebx
 3f2:	8b 75 08             	mov    0x8(%ebp),%esi
 3f5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 3f8:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 3fb:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 3fd:	8d 58 ff             	lea    -0x1(%eax),%ebx
 400:	85 c0                	test   %eax,%eax
 402:	7e 0f                	jle    413 <memmove+0x2a>
    *dst++ = *src++;
 404:	0f b6 01             	movzbl (%ecx),%eax
 407:	88 02                	mov    %al,(%edx)
 409:	8d 49 01             	lea    0x1(%ecx),%ecx
 40c:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 40f:	89 d8                	mov    %ebx,%eax
 411:	eb ea                	jmp    3fd <memmove+0x14>
  return vdst;
}
 413:	89 f0                	mov    %esi,%eax
 415:	5b                   	pop    %ebx
 416:	5e                   	pop    %esi
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    

00000419 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 419:	f3 0f 1e fb          	endbr32 
 41d:	55                   	push   %ebp
 41e:	89 e5                	mov    %esp,%ebp
 420:	53                   	push   %ebx
 421:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 424:	68 00 20 00 00       	push   $0x2000
 429:	e8 c7 04 00 00       	call   8f5 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 42e:	83 c4 10             	add    $0x10,%esp
 431:	89 c2                	mov    %eax,%edx
 433:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 439:	74 22                	je     45d <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 43b:	b9 00 10 00 00       	mov    $0x1000,%ecx
 440:	29 d1                	sub    %edx,%ecx
 442:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 444:	ba 00 00 00 00       	mov    $0x0,%edx
 449:	83 fa 3f             	cmp    $0x3f,%edx
 44c:	7f 13                	jg     461 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 44e:	83 3c 95 c0 10 00 00 	cmpl   $0x1,0x10c0(,%edx,4)
 455:	01 
 456:	75 09                	jne    461 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 458:	83 c2 01             	add    $0x1,%edx
 45b:	eb ec                	jmp    449 <thread_create+0x30>
  void *user_stack = curr_ptr;
 45d:	89 c1                	mov    %eax,%ecx
 45f:	eb e3                	jmp    444 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 461:	83 3c 95 c0 10 00 00 	cmpl   $0x1,0x10c0(,%edx,4)
 468:	01 
 469:	74 34                	je     49f <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 46b:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 46e:	c1 e3 02             	shl    $0x2,%ebx
 471:	89 83 c0 0d 00 00    	mov    %eax,0xdc0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 477:	89 8b c4 0d 00 00    	mov    %ecx,0xdc4(%ebx)
  cell_full[i] = 1;
 47d:	c7 04 95 c0 10 00 00 	movl   $0x1,0x10c0(,%edx,4)
 484:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 488:	ff 75 10             	pushl  0x10(%ebp)
 48b:	ff 75 0c             	pushl  0xc(%ebp)
 48e:	ff 75 08             	pushl  0x8(%ebp)
 491:	51                   	push   %ecx
 492:	e8 dc 00 00 00       	call   573 <clone>
 497:	83 c4 10             	add    $0x10,%esp
}
 49a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 49d:	c9                   	leave  
 49e:	c3                   	ret    
    return -1;
 49f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4a4:	eb f4                	jmp    49a <thread_create+0x81>

000004a6 <thread_join>:

int thread_join(){
 4a6:	f3 0f 1e fb          	endbr32 
 4aa:	55                   	push   %ebp
 4ab:	89 e5                	mov    %esp,%ebp
 4ad:	56                   	push   %esi
 4ae:	53                   	push   %ebx
 4af:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 4b2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b5:	50                   	push   %eax
 4b6:	e8 d0 00 00 00       	call   58b <join>
 4bb:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 4bd:	83 c4 10             	add    $0x10,%esp
 4c0:	bb 00 00 00 00       	mov    $0x0,%ebx
 4c5:	83 fb 3f             	cmp    $0x3f,%ebx
 4c8:	7f 14                	jg     4de <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 4ca:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 4cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d0:	39 14 85 c4 0d 00 00 	cmp    %edx,0xdc4(,%eax,4)
 4d7:	74 05                	je     4de <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 4d9:	83 c3 01             	add    $0x1,%ebx
 4dc:	eb e7                	jmp    4c5 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 4de:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 4e1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4e4:	39 0c 85 c4 0d 00 00 	cmp    %ecx,0xdc4(,%eax,4)
 4eb:	75 26                	jne    513 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 4ed:	83 ec 0c             	sub    $0xc,%esp
 4f0:	ff 34 85 c0 0d 00 00 	pushl  0xdc0(,%eax,4)
 4f7:	e8 35 03 00 00       	call   831 <free>
  cell_full[i] = 0;
 4fc:	c7 04 9d c0 10 00 00 	movl   $0x0,0x10c0(,%ebx,4)
 503:	00 00 00 00 

  return out;
 507:	83 c4 10             	add    $0x10,%esp
}
 50a:	89 f0                	mov    %esi,%eax
 50c:	8d 65 f8             	lea    -0x8(%ebp),%esp
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5d                   	pop    %ebp
 512:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 513:	be ff ff ff ff       	mov    $0xffffffff,%esi
 518:	eb f0                	jmp    50a <thread_join+0x64>

0000051a <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 51a:	f3 0f 1e fb          	endbr32 
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
 521:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 524:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 52a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 531:	5d                   	pop    %ebp
 532:	c3                   	ret    

00000533 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 533:	f3 0f 1e fb          	endbr32 
 537:	55                   	push   %ebp
 538:	89 e5                	mov    %esp,%ebp
 53a:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 53d:	b9 01 00 00 00       	mov    $0x1,%ecx
 542:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 546:	b8 00 00 00 00       	mov    $0x0,%eax
 54b:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 550:	39 c1                	cmp    %eax,%ecx
 552:	75 f2                	jne    546 <lock_acquire+0x13>
      ; // spin
    }
}
 554:	5d                   	pop    %ebp
 555:	c3                   	ret    

00000556 <lock_release>:

void lock_release(lock_t *lock) {
 556:	f3 0f 1e fb          	endbr32 
 55a:	55                   	push   %ebp
 55b:	89 e5                	mov    %esp,%ebp
 55d:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 560:	8b 42 04             	mov    0x4(%edx),%eax
 563:	83 c0 01             	add    $0x1,%eax
 566:	89 42 04             	mov    %eax,0x4(%edx)
}
 569:	5d                   	pop    %ebp
 56a:	c3                   	ret    

0000056b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 56b:	b8 01 00 00 00       	mov    $0x1,%eax
 570:	cd 40                	int    $0x40
 572:	c3                   	ret    

00000573 <clone>:
SYSCALL(clone)
 573:	b8 16 00 00 00       	mov    $0x16,%eax
 578:	cd 40                	int    $0x40
 57a:	c3                   	ret    

0000057b <exit>:
SYSCALL(exit)
 57b:	b8 02 00 00 00       	mov    $0x2,%eax
 580:	cd 40                	int    $0x40
 582:	c3                   	ret    

00000583 <wait>:
SYSCALL(wait)
 583:	b8 03 00 00 00       	mov    $0x3,%eax
 588:	cd 40                	int    $0x40
 58a:	c3                   	ret    

0000058b <join>:
SYSCALL(join)
 58b:	b8 17 00 00 00       	mov    $0x17,%eax
 590:	cd 40                	int    $0x40
 592:	c3                   	ret    

00000593 <pipe>:
SYSCALL(pipe)
 593:	b8 04 00 00 00       	mov    $0x4,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret    

0000059b <read>:
SYSCALL(read)
 59b:	b8 05 00 00 00       	mov    $0x5,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret    

000005a3 <write>:
SYSCALL(write)
 5a3:	b8 10 00 00 00       	mov    $0x10,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret    

000005ab <close>:
SYSCALL(close)
 5ab:	b8 15 00 00 00       	mov    $0x15,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret    

000005b3 <kill>:
SYSCALL(kill)
 5b3:	b8 06 00 00 00       	mov    $0x6,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret    

000005bb <exec>:
SYSCALL(exec)
 5bb:	b8 07 00 00 00       	mov    $0x7,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <open>:
SYSCALL(open)
 5c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <mknod>:
SYSCALL(mknod)
 5cb:	b8 11 00 00 00       	mov    $0x11,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <unlink>:
SYSCALL(unlink)
 5d3:	b8 12 00 00 00       	mov    $0x12,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <fstat>:
SYSCALL(fstat)
 5db:	b8 08 00 00 00       	mov    $0x8,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <link>:
SYSCALL(link)
 5e3:	b8 13 00 00 00       	mov    $0x13,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <mkdir>:
SYSCALL(mkdir)
 5eb:	b8 14 00 00 00       	mov    $0x14,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <chdir>:
SYSCALL(chdir)
 5f3:	b8 09 00 00 00       	mov    $0x9,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <dup>:
SYSCALL(dup)
 5fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <getpid>:
SYSCALL(getpid)
 603:	b8 0b 00 00 00       	mov    $0xb,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <sbrk>:
SYSCALL(sbrk)
 60b:	b8 0c 00 00 00       	mov    $0xc,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <sleep>:
SYSCALL(sleep)
 613:	b8 0d 00 00 00       	mov    $0xd,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <uptime>:
SYSCALL(uptime)
 61b:	b8 0e 00 00 00       	mov    $0xe,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 623:	55                   	push   %ebp
 624:	89 e5                	mov    %esp,%ebp
 626:	83 ec 1c             	sub    $0x1c,%esp
 629:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 62c:	6a 01                	push   $0x1
 62e:	8d 55 f4             	lea    -0xc(%ebp),%edx
 631:	52                   	push   %edx
 632:	50                   	push   %eax
 633:	e8 6b ff ff ff       	call   5a3 <write>
}
 638:	83 c4 10             	add    $0x10,%esp
 63b:	c9                   	leave  
 63c:	c3                   	ret    

0000063d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 63d:	55                   	push   %ebp
 63e:	89 e5                	mov    %esp,%ebp
 640:	57                   	push   %edi
 641:	56                   	push   %esi
 642:	53                   	push   %ebx
 643:	83 ec 2c             	sub    $0x2c,%esp
 646:	89 45 d0             	mov    %eax,-0x30(%ebp)
 649:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 64b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 64f:	0f 95 c2             	setne  %dl
 652:	89 f0                	mov    %esi,%eax
 654:	c1 e8 1f             	shr    $0x1f,%eax
 657:	84 c2                	test   %al,%dl
 659:	74 42                	je     69d <printint+0x60>
    neg = 1;
    x = -xx;
 65b:	f7 de                	neg    %esi
    neg = 1;
 65d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 664:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 669:	89 f0                	mov    %esi,%eax
 66b:	ba 00 00 00 00       	mov    $0x0,%edx
 670:	f7 f1                	div    %ecx
 672:	89 df                	mov    %ebx,%edi
 674:	83 c3 01             	add    $0x1,%ebx
 677:	0f b6 92 20 0a 00 00 	movzbl 0xa20(%edx),%edx
 67e:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 682:	89 f2                	mov    %esi,%edx
 684:	89 c6                	mov    %eax,%esi
 686:	39 d1                	cmp    %edx,%ecx
 688:	76 df                	jbe    669 <printint+0x2c>
  if(neg)
 68a:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 68e:	74 2f                	je     6bf <printint+0x82>
    buf[i++] = '-';
 690:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 695:	8d 5f 02             	lea    0x2(%edi),%ebx
 698:	8b 75 d0             	mov    -0x30(%ebp),%esi
 69b:	eb 15                	jmp    6b2 <printint+0x75>
  neg = 0;
 69d:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6a4:	eb be                	jmp    664 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 6a6:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6ab:	89 f0                	mov    %esi,%eax
 6ad:	e8 71 ff ff ff       	call   623 <putc>
  while(--i >= 0)
 6b2:	83 eb 01             	sub    $0x1,%ebx
 6b5:	79 ef                	jns    6a6 <printint+0x69>
}
 6b7:	83 c4 2c             	add    $0x2c,%esp
 6ba:	5b                   	pop    %ebx
 6bb:	5e                   	pop    %esi
 6bc:	5f                   	pop    %edi
 6bd:	5d                   	pop    %ebp
 6be:	c3                   	ret    
 6bf:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6c2:	eb ee                	jmp    6b2 <printint+0x75>

000006c4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c4:	f3 0f 1e fb          	endbr32 
 6c8:	55                   	push   %ebp
 6c9:	89 e5                	mov    %esp,%ebp
 6cb:	57                   	push   %edi
 6cc:	56                   	push   %esi
 6cd:	53                   	push   %ebx
 6ce:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 6d1:	8d 45 10             	lea    0x10(%ebp),%eax
 6d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 6d7:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 6dc:	bb 00 00 00 00       	mov    $0x0,%ebx
 6e1:	eb 14                	jmp    6f7 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 6e3:	89 fa                	mov    %edi,%edx
 6e5:	8b 45 08             	mov    0x8(%ebp),%eax
 6e8:	e8 36 ff ff ff       	call   623 <putc>
 6ed:	eb 05                	jmp    6f4 <printf+0x30>
      }
    } else if(state == '%'){
 6ef:	83 fe 25             	cmp    $0x25,%esi
 6f2:	74 25                	je     719 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 6f4:	83 c3 01             	add    $0x1,%ebx
 6f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fa:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 6fe:	84 c0                	test   %al,%al
 700:	0f 84 23 01 00 00    	je     829 <printf+0x165>
    c = fmt[i] & 0xff;
 706:	0f be f8             	movsbl %al,%edi
 709:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 70c:	85 f6                	test   %esi,%esi
 70e:	75 df                	jne    6ef <printf+0x2b>
      if(c == '%'){
 710:	83 f8 25             	cmp    $0x25,%eax
 713:	75 ce                	jne    6e3 <printf+0x1f>
        state = '%';
 715:	89 c6                	mov    %eax,%esi
 717:	eb db                	jmp    6f4 <printf+0x30>
      if(c == 'd'){
 719:	83 f8 64             	cmp    $0x64,%eax
 71c:	74 49                	je     767 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 71e:	83 f8 78             	cmp    $0x78,%eax
 721:	0f 94 c1             	sete   %cl
 724:	83 f8 70             	cmp    $0x70,%eax
 727:	0f 94 c2             	sete   %dl
 72a:	08 d1                	or     %dl,%cl
 72c:	75 63                	jne    791 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 72e:	83 f8 73             	cmp    $0x73,%eax
 731:	0f 84 84 00 00 00    	je     7bb <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 737:	83 f8 63             	cmp    $0x63,%eax
 73a:	0f 84 b7 00 00 00    	je     7f7 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 740:	83 f8 25             	cmp    $0x25,%eax
 743:	0f 84 cc 00 00 00    	je     815 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 749:	ba 25 00 00 00       	mov    $0x25,%edx
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	e8 cd fe ff ff       	call   623 <putc>
        putc(fd, c);
 756:	89 fa                	mov    %edi,%edx
 758:	8b 45 08             	mov    0x8(%ebp),%eax
 75b:	e8 c3 fe ff ff       	call   623 <putc>
      }
      state = 0;
 760:	be 00 00 00 00       	mov    $0x0,%esi
 765:	eb 8d                	jmp    6f4 <printf+0x30>
        printint(fd, *ap, 10, 1);
 767:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 76a:	8b 17                	mov    (%edi),%edx
 76c:	83 ec 0c             	sub    $0xc,%esp
 76f:	6a 01                	push   $0x1
 771:	b9 0a 00 00 00       	mov    $0xa,%ecx
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	e8 bf fe ff ff       	call   63d <printint>
        ap++;
 77e:	83 c7 04             	add    $0x4,%edi
 781:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 784:	83 c4 10             	add    $0x10,%esp
      state = 0;
 787:	be 00 00 00 00       	mov    $0x0,%esi
 78c:	e9 63 ff ff ff       	jmp    6f4 <printf+0x30>
        printint(fd, *ap, 16, 0);
 791:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 794:	8b 17                	mov    (%edi),%edx
 796:	83 ec 0c             	sub    $0xc,%esp
 799:	6a 00                	push   $0x0
 79b:	b9 10 00 00 00       	mov    $0x10,%ecx
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
 7a3:	e8 95 fe ff ff       	call   63d <printint>
        ap++;
 7a8:	83 c7 04             	add    $0x4,%edi
 7ab:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7ae:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7b1:	be 00 00 00 00       	mov    $0x0,%esi
 7b6:	e9 39 ff ff ff       	jmp    6f4 <printf+0x30>
        s = (char*)*ap;
 7bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7be:	8b 30                	mov    (%eax),%esi
        ap++;
 7c0:	83 c0 04             	add    $0x4,%eax
 7c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 7c6:	85 f6                	test   %esi,%esi
 7c8:	75 28                	jne    7f2 <printf+0x12e>
          s = "(null)";
 7ca:	be 18 0a 00 00       	mov    $0xa18,%esi
 7cf:	8b 7d 08             	mov    0x8(%ebp),%edi
 7d2:	eb 0d                	jmp    7e1 <printf+0x11d>
          putc(fd, *s);
 7d4:	0f be d2             	movsbl %dl,%edx
 7d7:	89 f8                	mov    %edi,%eax
 7d9:	e8 45 fe ff ff       	call   623 <putc>
          s++;
 7de:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 7e1:	0f b6 16             	movzbl (%esi),%edx
 7e4:	84 d2                	test   %dl,%dl
 7e6:	75 ec                	jne    7d4 <printf+0x110>
      state = 0;
 7e8:	be 00 00 00 00       	mov    $0x0,%esi
 7ed:	e9 02 ff ff ff       	jmp    6f4 <printf+0x30>
 7f2:	8b 7d 08             	mov    0x8(%ebp),%edi
 7f5:	eb ea                	jmp    7e1 <printf+0x11d>
        putc(fd, *ap);
 7f7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7fa:	0f be 17             	movsbl (%edi),%edx
 7fd:	8b 45 08             	mov    0x8(%ebp),%eax
 800:	e8 1e fe ff ff       	call   623 <putc>
        ap++;
 805:	83 c7 04             	add    $0x4,%edi
 808:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 80b:	be 00 00 00 00       	mov    $0x0,%esi
 810:	e9 df fe ff ff       	jmp    6f4 <printf+0x30>
        putc(fd, c);
 815:	89 fa                	mov    %edi,%edx
 817:	8b 45 08             	mov    0x8(%ebp),%eax
 81a:	e8 04 fe ff ff       	call   623 <putc>
      state = 0;
 81f:	be 00 00 00 00       	mov    $0x0,%esi
 824:	e9 cb fe ff ff       	jmp    6f4 <printf+0x30>
    }
  }
}
 829:	8d 65 f4             	lea    -0xc(%ebp),%esp
 82c:	5b                   	pop    %ebx
 82d:	5e                   	pop    %esi
 82e:	5f                   	pop    %edi
 82f:	5d                   	pop    %ebp
 830:	c3                   	ret    

00000831 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 831:	f3 0f 1e fb          	endbr32 
 835:	55                   	push   %ebp
 836:	89 e5                	mov    %esp,%ebp
 838:	57                   	push   %edi
 839:	56                   	push   %esi
 83a:	53                   	push   %ebx
 83b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 83e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 841:	a1 a0 0d 00 00       	mov    0xda0,%eax
 846:	eb 02                	jmp    84a <free+0x19>
 848:	89 d0                	mov    %edx,%eax
 84a:	39 c8                	cmp    %ecx,%eax
 84c:	73 04                	jae    852 <free+0x21>
 84e:	39 08                	cmp    %ecx,(%eax)
 850:	77 12                	ja     864 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 852:	8b 10                	mov    (%eax),%edx
 854:	39 c2                	cmp    %eax,%edx
 856:	77 f0                	ja     848 <free+0x17>
 858:	39 c8                	cmp    %ecx,%eax
 85a:	72 08                	jb     864 <free+0x33>
 85c:	39 ca                	cmp    %ecx,%edx
 85e:	77 04                	ja     864 <free+0x33>
 860:	89 d0                	mov    %edx,%eax
 862:	eb e6                	jmp    84a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 864:	8b 73 fc             	mov    -0x4(%ebx),%esi
 867:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 86a:	8b 10                	mov    (%eax),%edx
 86c:	39 d7                	cmp    %edx,%edi
 86e:	74 19                	je     889 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 870:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 873:	8b 50 04             	mov    0x4(%eax),%edx
 876:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 879:	39 ce                	cmp    %ecx,%esi
 87b:	74 1b                	je     898 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 87d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 87f:	a3 a0 0d 00 00       	mov    %eax,0xda0
}
 884:	5b                   	pop    %ebx
 885:	5e                   	pop    %esi
 886:	5f                   	pop    %edi
 887:	5d                   	pop    %ebp
 888:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 889:	03 72 04             	add    0x4(%edx),%esi
 88c:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 88f:	8b 10                	mov    (%eax),%edx
 891:	8b 12                	mov    (%edx),%edx
 893:	89 53 f8             	mov    %edx,-0x8(%ebx)
 896:	eb db                	jmp    873 <free+0x42>
    p->s.size += bp->s.size;
 898:	03 53 fc             	add    -0x4(%ebx),%edx
 89b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 89e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8a1:	89 10                	mov    %edx,(%eax)
 8a3:	eb da                	jmp    87f <free+0x4e>

000008a5 <morecore>:

static Header*
morecore(uint nu)
{
 8a5:	55                   	push   %ebp
 8a6:	89 e5                	mov    %esp,%ebp
 8a8:	53                   	push   %ebx
 8a9:	83 ec 04             	sub    $0x4,%esp
 8ac:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8ae:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 8b3:	77 05                	ja     8ba <morecore+0x15>
    nu = 4096;
 8b5:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 8ba:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 8c1:	83 ec 0c             	sub    $0xc,%esp
 8c4:	50                   	push   %eax
 8c5:	e8 41 fd ff ff       	call   60b <sbrk>
  if(p == (char*)-1)
 8ca:	83 c4 10             	add    $0x10,%esp
 8cd:	83 f8 ff             	cmp    $0xffffffff,%eax
 8d0:	74 1c                	je     8ee <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 8d2:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 8d5:	83 c0 08             	add    $0x8,%eax
 8d8:	83 ec 0c             	sub    $0xc,%esp
 8db:	50                   	push   %eax
 8dc:	e8 50 ff ff ff       	call   831 <free>
  return freep;
 8e1:	a1 a0 0d 00 00       	mov    0xda0,%eax
 8e6:	83 c4 10             	add    $0x10,%esp
}
 8e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 8ec:	c9                   	leave  
 8ed:	c3                   	ret    
    return 0;
 8ee:	b8 00 00 00 00       	mov    $0x0,%eax
 8f3:	eb f4                	jmp    8e9 <morecore+0x44>

000008f5 <malloc>:

void*
malloc(uint nbytes)
{
 8f5:	f3 0f 1e fb          	endbr32 
 8f9:	55                   	push   %ebp
 8fa:	89 e5                	mov    %esp,%ebp
 8fc:	53                   	push   %ebx
 8fd:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 900:	8b 45 08             	mov    0x8(%ebp),%eax
 903:	8d 58 07             	lea    0x7(%eax),%ebx
 906:	c1 eb 03             	shr    $0x3,%ebx
 909:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 90c:	8b 0d a0 0d 00 00    	mov    0xda0,%ecx
 912:	85 c9                	test   %ecx,%ecx
 914:	74 04                	je     91a <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 916:	8b 01                	mov    (%ecx),%eax
 918:	eb 4b                	jmp    965 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 91a:	c7 05 a0 0d 00 00 a4 	movl   $0xda4,0xda0
 921:	0d 00 00 
 924:	c7 05 a4 0d 00 00 a4 	movl   $0xda4,0xda4
 92b:	0d 00 00 
    base.s.size = 0;
 92e:	c7 05 a8 0d 00 00 00 	movl   $0x0,0xda8
 935:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 938:	b9 a4 0d 00 00       	mov    $0xda4,%ecx
 93d:	eb d7                	jmp    916 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 93f:	74 1a                	je     95b <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 941:	29 da                	sub    %ebx,%edx
 943:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 946:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 949:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 94c:	89 0d a0 0d 00 00    	mov    %ecx,0xda0
      return (void*)(p + 1);
 952:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 955:	83 c4 04             	add    $0x4,%esp
 958:	5b                   	pop    %ebx
 959:	5d                   	pop    %ebp
 95a:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 95b:	8b 10                	mov    (%eax),%edx
 95d:	89 11                	mov    %edx,(%ecx)
 95f:	eb eb                	jmp    94c <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 961:	89 c1                	mov    %eax,%ecx
 963:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 965:	8b 50 04             	mov    0x4(%eax),%edx
 968:	39 da                	cmp    %ebx,%edx
 96a:	73 d3                	jae    93f <malloc+0x4a>
    if(p == freep)
 96c:	39 05 a0 0d 00 00    	cmp    %eax,0xda0
 972:	75 ed                	jne    961 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 974:	89 d8                	mov    %ebx,%eax
 976:	e8 2a ff ff ff       	call   8a5 <morecore>
 97b:	85 c0                	test   %eax,%eax
 97d:	75 e2                	jne    961 <malloc+0x6c>
 97f:	eb d4                	jmp    955 <malloc+0x60>
