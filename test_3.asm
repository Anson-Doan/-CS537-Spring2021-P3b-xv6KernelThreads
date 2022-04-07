
_test_3:     file format elf32-i386


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
   7:	83 ec 0c             	sub    $0xc,%esp
   assert(write(3, "hello\n", 6) == 6);
   a:	6a 06                	push   $0x6
   c:	68 f4 09 00 00       	push   $0x9f4
  11:	6a 03                	push   $0x3
  13:	e8 fc 05 00 00       	call   614 <write>
  18:	83 c4 10             	add    $0x10,%esp
  1b:	83 f8 06             	cmp    $0x6,%eax
  1e:	74 49                	je     69 <worker+0x69>
  20:	6a 35                	push   $0x35
  22:	68 fb 09 00 00       	push   $0x9fb
  27:	68 04 0a 00 00       	push   $0xa04
  2c:	6a 01                	push   $0x1
  2e:	e8 02 07 00 00       	call   735 <printf>
  33:	83 c4 0c             	add    $0xc,%esp
  36:	68 0c 0a 00 00       	push   $0xa0c
  3b:	68 28 0a 00 00       	push   $0xa28
  40:	6a 01                	push   $0x1
  42:	e8 ee 06 00 00       	call   735 <printf>
  47:	83 c4 08             	add    $0x8,%esp
  4a:	68 3c 0a 00 00       	push   $0xa3c
  4f:	6a 01                	push   $0x1
  51:	e8 df 06 00 00       	call   735 <printf>
  56:	83 c4 04             	add    $0x4,%esp
  59:	ff 35 70 0e 00 00    	pushl  0xe70
  5f:	e8 c0 05 00 00       	call   624 <kill>
  64:	e8 83 05 00 00       	call   5ec <exit>
   xchg(&newfd, open("tmp2", O_WRONLY|O_CREATE));
  69:	83 ec 08             	sub    $0x8,%esp
  6c:	68 01 02 00 00       	push   $0x201
  71:	68 49 0a 00 00       	push   $0xa49
  76:	e8 b9 05 00 00       	call   634 <open>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
  7b:	f0 87 05 60 0e 00 00 	lock xchg %eax,0xe60
   exit();
  82:	e8 65 05 00 00       	call   5ec <exit>

00000087 <main>:
{
  87:	f3 0f 1e fb          	endbr32 
  8b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  8f:	83 e4 f0             	and    $0xfffffff0,%esp
  92:	ff 71 fc             	pushl  -0x4(%ecx)
  95:	55                   	push   %ebp
  96:	89 e5                	mov    %esp,%ebp
  98:	56                   	push   %esi
  99:	53                   	push   %ebx
  9a:	51                   	push   %ecx
  9b:	83 ec 1c             	sub    $0x1c,%esp
   ppid = getpid();
  9e:	e8 d1 05 00 00       	call   674 <getpid>
  a3:	a3 70 0e 00 00       	mov    %eax,0xe70
   void *stack, *p = malloc(PGSIZE * 2);
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	68 00 20 00 00       	push   $0x2000
  b0:	e8 b1 08 00 00       	call   966 <malloc>
   assert(p != NULL);
  b5:	83 c4 10             	add    $0x10,%esp
  b8:	85 c0                	test   %eax,%eax
  ba:	74 7d                	je     139 <main+0xb2>
  bc:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
  be:	25 ff 0f 00 00       	and    $0xfff,%eax
  c3:	0f 84 b9 00 00 00    	je     182 <main+0xfb>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
  c9:	be 00 10 00 00       	mov    $0x1000,%esi
  ce:	29 c6                	sub    %eax,%esi
  d0:	01 de                	add    %ebx,%esi
   int fd = open("tmp", O_WRONLY|O_CREATE);
  d2:	83 ec 08             	sub    $0x8,%esp
  d5:	68 01 02 00 00       	push   $0x201
  da:	68 58 0a 00 00       	push   $0xa58
  df:	e8 50 05 00 00       	call   634 <open>
   assert(fd == 3);
  e4:	83 c4 10             	add    $0x10,%esp
  e7:	83 f8 03             	cmp    $0x3,%eax
  ea:	0f 84 99 00 00 00    	je     189 <main+0x102>
  f0:	6a 25                	push   $0x25
  f2:	68 fb 09 00 00       	push   $0x9fb
  f7:	68 04 0a 00 00       	push   $0xa04
  fc:	6a 01                	push   $0x1
  fe:	e8 32 06 00 00       	call   735 <printf>
 103:	83 c4 0c             	add    $0xc,%esp
 106:	68 5c 0a 00 00       	push   $0xa5c
 10b:	68 28 0a 00 00       	push   $0xa28
 110:	6a 01                	push   $0x1
 112:	e8 1e 06 00 00       	call   735 <printf>
 117:	83 c4 08             	add    $0x8,%esp
 11a:	68 3c 0a 00 00       	push   $0xa3c
 11f:	6a 01                	push   $0x1
 121:	e8 0f 06 00 00       	call   735 <printf>
 126:	83 c4 04             	add    $0x4,%esp
 129:	ff 35 70 0e 00 00    	pushl  0xe70
 12f:	e8 f0 04 00 00       	call   624 <kill>
 134:	e8 b3 04 00 00       	call   5ec <exit>
   assert(p != NULL);
 139:	6a 1e                	push   $0x1e
 13b:	68 fb 09 00 00       	push   $0x9fb
 140:	68 04 0a 00 00       	push   $0xa04
 145:	6a 01                	push   $0x1
 147:	e8 e9 05 00 00       	call   735 <printf>
 14c:	83 c4 0c             	add    $0xc,%esp
 14f:	68 4e 0a 00 00       	push   $0xa4e
 154:	68 28 0a 00 00       	push   $0xa28
 159:	6a 01                	push   $0x1
 15b:	e8 d5 05 00 00       	call   735 <printf>
 160:	83 c4 08             	add    $0x8,%esp
 163:	68 3c 0a 00 00       	push   $0xa3c
 168:	6a 01                	push   $0x1
 16a:	e8 c6 05 00 00       	call   735 <printf>
 16f:	83 c4 04             	add    $0x4,%esp
 172:	ff 35 70 0e 00 00    	pushl  0xe70
 178:	e8 a7 04 00 00       	call   624 <kill>
 17d:	e8 6a 04 00 00       	call   5ec <exit>
     stack = p;
 182:	89 de                	mov    %ebx,%esi
 184:	e9 49 ff ff ff       	jmp    d2 <main+0x4b>
   int clone_pid = clone(worker, 0, 0, stack);
 189:	56                   	push   %esi
 18a:	6a 00                	push   $0x0
 18c:	6a 00                	push   $0x0
 18e:	68 00 00 00 00       	push   $0x0
 193:	e8 4c 04 00 00       	call   5e4 <clone>
 198:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	85 c0                	test   %eax,%eax
 19f:	7e 73                	jle    214 <main+0x18d>
   while(!newfd);
 1a1:	a1 60 0e 00 00       	mov    0xe60,%eax
 1a6:	85 c0                	test   %eax,%eax
 1a8:	74 f7                	je     1a1 <main+0x11a>
   assert(write(newfd, "goodbye\n", 8) == -1);
 1aa:	a1 60 0e 00 00       	mov    0xe60,%eax
 1af:	83 ec 04             	sub    $0x4,%esp
 1b2:	6a 08                	push   $0x8
 1b4:	68 72 0a 00 00       	push   $0xa72
 1b9:	50                   	push   %eax
 1ba:	e8 55 04 00 00       	call   614 <write>
 1bf:	83 c4 10             	add    $0x10,%esp
 1c2:	83 f8 ff             	cmp    $0xffffffff,%eax
 1c5:	0f 84 92 00 00 00    	je     25d <main+0x1d6>
 1cb:	6a 29                	push   $0x29
 1cd:	68 fb 09 00 00       	push   $0x9fb
 1d2:	68 04 0a 00 00       	push   $0xa04
 1d7:	6a 01                	push   $0x1
 1d9:	e8 57 05 00 00       	call   735 <printf>
 1de:	83 c4 0c             	add    $0xc,%esp
 1e1:	68 a0 0a 00 00       	push   $0xaa0
 1e6:	68 28 0a 00 00       	push   $0xa28
 1eb:	6a 01                	push   $0x1
 1ed:	e8 43 05 00 00       	call   735 <printf>
 1f2:	83 c4 08             	add    $0x8,%esp
 1f5:	68 3c 0a 00 00       	push   $0xa3c
 1fa:	6a 01                	push   $0x1
 1fc:	e8 34 05 00 00       	call   735 <printf>
 201:	83 c4 04             	add    $0x4,%esp
 204:	ff 35 70 0e 00 00    	pushl  0xe70
 20a:	e8 15 04 00 00       	call   624 <kill>
 20f:	e8 d8 03 00 00       	call   5ec <exit>
   assert(clone_pid > 0);
 214:	6a 27                	push   $0x27
 216:	68 fb 09 00 00       	push   $0x9fb
 21b:	68 04 0a 00 00       	push   $0xa04
 220:	6a 01                	push   $0x1
 222:	e8 0e 05 00 00       	call   735 <printf>
 227:	83 c4 0c             	add    $0xc,%esp
 22a:	68 64 0a 00 00       	push   $0xa64
 22f:	68 28 0a 00 00       	push   $0xa28
 234:	6a 01                	push   $0x1
 236:	e8 fa 04 00 00       	call   735 <printf>
 23b:	83 c4 08             	add    $0x8,%esp
 23e:	68 3c 0a 00 00       	push   $0xa3c
 243:	6a 01                	push   $0x1
 245:	e8 eb 04 00 00       	call   735 <printf>
 24a:	83 c4 04             	add    $0x4,%esp
 24d:	ff 35 70 0e 00 00    	pushl  0xe70
 253:	e8 cc 03 00 00       	call   624 <kill>
 258:	e8 8f 03 00 00       	call   5ec <exit>
   printf(1, "TEST PASSED\n");
 25d:	83 ec 08             	sub    $0x8,%esp
 260:	68 7b 0a 00 00       	push   $0xa7b
 265:	6a 01                	push   $0x1
 267:	e8 c9 04 00 00       	call   735 <printf>
   int join_pid = join(&join_stack);
 26c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 26f:	89 04 24             	mov    %eax,(%esp)
 272:	e8 85 03 00 00       	call   5fc <join>
   assert(join_pid == clone_pid);
 277:	83 c4 10             	add    $0x10,%esp
 27a:	39 c6                	cmp    %eax,%esi
 27c:	74 49                	je     2c7 <main+0x240>
 27e:	6a 2e                	push   $0x2e
 280:	68 fb 09 00 00       	push   $0x9fb
 285:	68 04 0a 00 00       	push   $0xa04
 28a:	6a 01                	push   $0x1
 28c:	e8 a4 04 00 00       	call   735 <printf>
 291:	83 c4 0c             	add    $0xc,%esp
 294:	68 88 0a 00 00       	push   $0xa88
 299:	68 28 0a 00 00       	push   $0xa28
 29e:	6a 01                	push   $0x1
 2a0:	e8 90 04 00 00       	call   735 <printf>
 2a5:	83 c4 08             	add    $0x8,%esp
 2a8:	68 3c 0a 00 00       	push   $0xa3c
 2ad:	6a 01                	push   $0x1
 2af:	e8 81 04 00 00       	call   735 <printf>
 2b4:	83 c4 04             	add    $0x4,%esp
 2b7:	ff 35 70 0e 00 00    	pushl  0xe70
 2bd:	e8 62 03 00 00       	call   624 <kill>
 2c2:	e8 25 03 00 00       	call   5ec <exit>
   free(p);
 2c7:	83 ec 0c             	sub    $0xc,%esp
 2ca:	53                   	push   %ebx
 2cb:	e8 d2 05 00 00       	call   8a2 <free>
   exit();
 2d0:	e8 17 03 00 00       	call   5ec <exit>

000002d5 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 2d5:	f3 0f 1e fb          	endbr32 
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	56                   	push   %esi
 2dd:	53                   	push   %ebx
 2de:	8b 75 08             	mov    0x8(%ebp),%esi
 2e1:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2e4:	89 f0                	mov    %esi,%eax
 2e6:	89 d1                	mov    %edx,%ecx
 2e8:	83 c2 01             	add    $0x1,%edx
 2eb:	89 c3                	mov    %eax,%ebx
 2ed:	83 c0 01             	add    $0x1,%eax
 2f0:	0f b6 09             	movzbl (%ecx),%ecx
 2f3:	88 0b                	mov    %cl,(%ebx)
 2f5:	84 c9                	test   %cl,%cl
 2f7:	75 ed                	jne    2e6 <strcpy+0x11>
    ;
  return os;
}
 2f9:	89 f0                	mov    %esi,%eax
 2fb:	5b                   	pop    %ebx
 2fc:	5e                   	pop    %esi
 2fd:	5d                   	pop    %ebp
 2fe:	c3                   	ret    

000002ff <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2ff:	f3 0f 1e fb          	endbr32 
 303:	55                   	push   %ebp
 304:	89 e5                	mov    %esp,%ebp
 306:	8b 4d 08             	mov    0x8(%ebp),%ecx
 309:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 30c:	0f b6 01             	movzbl (%ecx),%eax
 30f:	84 c0                	test   %al,%al
 311:	74 0c                	je     31f <strcmp+0x20>
 313:	3a 02                	cmp    (%edx),%al
 315:	75 08                	jne    31f <strcmp+0x20>
    p++, q++;
 317:	83 c1 01             	add    $0x1,%ecx
 31a:	83 c2 01             	add    $0x1,%edx
 31d:	eb ed                	jmp    30c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 31f:	0f b6 c0             	movzbl %al,%eax
 322:	0f b6 12             	movzbl (%edx),%edx
 325:	29 d0                	sub    %edx,%eax
}
 327:	5d                   	pop    %ebp
 328:	c3                   	ret    

00000329 <strlen>:

uint
strlen(const char *s)
{
 329:	f3 0f 1e fb          	endbr32 
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 333:	b8 00 00 00 00       	mov    $0x0,%eax
 338:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 33c:	74 05                	je     343 <strlen+0x1a>
 33e:	83 c0 01             	add    $0x1,%eax
 341:	eb f5                	jmp    338 <strlen+0xf>
    ;
  return n;
}
 343:	5d                   	pop    %ebp
 344:	c3                   	ret    

00000345 <memset>:

void*
memset(void *dst, int c, uint n)
{
 345:	f3 0f 1e fb          	endbr32 
 349:	55                   	push   %ebp
 34a:	89 e5                	mov    %esp,%ebp
 34c:	57                   	push   %edi
 34d:	8b 55 08             	mov    0x8(%ebp),%edx
  asm volatile("cld; rep stosb" :
 350:	89 d7                	mov    %edx,%edi
 352:	8b 4d 10             	mov    0x10(%ebp),%ecx
 355:	8b 45 0c             	mov    0xc(%ebp),%eax
 358:	fc                   	cld    
 359:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 35b:	89 d0                	mov    %edx,%eax
 35d:	5f                   	pop    %edi
 35e:	5d                   	pop    %ebp
 35f:	c3                   	ret    

00000360 <strchr>:

char*
strchr(const char *s, char c)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	8b 45 08             	mov    0x8(%ebp),%eax
 36a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 36e:	0f b6 10             	movzbl (%eax),%edx
 371:	84 d2                	test   %dl,%dl
 373:	74 09                	je     37e <strchr+0x1e>
    if(*s == c)
 375:	38 ca                	cmp    %cl,%dl
 377:	74 0a                	je     383 <strchr+0x23>
  for(; *s; s++)
 379:	83 c0 01             	add    $0x1,%eax
 37c:	eb f0                	jmp    36e <strchr+0xe>
      return (char*)s;
  return 0;
 37e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <gets>:

char*
gets(char *buf, int max)
{
 385:	f3 0f 1e fb          	endbr32 
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	57                   	push   %edi
 38d:	56                   	push   %esi
 38e:	53                   	push   %ebx
 38f:	83 ec 1c             	sub    $0x1c,%esp
 392:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 395:	bb 00 00 00 00       	mov    $0x0,%ebx
 39a:	89 de                	mov    %ebx,%esi
 39c:	83 c3 01             	add    $0x1,%ebx
 39f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3a2:	7d 2e                	jge    3d2 <gets+0x4d>
    cc = read(0, &c, 1);
 3a4:	83 ec 04             	sub    $0x4,%esp
 3a7:	6a 01                	push   $0x1
 3a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3ac:	50                   	push   %eax
 3ad:	6a 00                	push   $0x0
 3af:	e8 58 02 00 00       	call   60c <read>
    if(cc < 1)
 3b4:	83 c4 10             	add    $0x10,%esp
 3b7:	85 c0                	test   %eax,%eax
 3b9:	7e 17                	jle    3d2 <gets+0x4d>
      break;
    buf[i++] = c;
 3bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3bf:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3c2:	3c 0a                	cmp    $0xa,%al
 3c4:	0f 94 c2             	sete   %dl
 3c7:	3c 0d                	cmp    $0xd,%al
 3c9:	0f 94 c0             	sete   %al
 3cc:	08 c2                	or     %al,%dl
 3ce:	74 ca                	je     39a <gets+0x15>
    buf[i++] = c;
 3d0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3d2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3d6:	89 f8                	mov    %edi,%eax
 3d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3db:	5b                   	pop    %ebx
 3dc:	5e                   	pop    %esi
 3dd:	5f                   	pop    %edi
 3de:	5d                   	pop    %ebp
 3df:	c3                   	ret    

000003e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	56                   	push   %esi
 3e8:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3e9:	83 ec 08             	sub    $0x8,%esp
 3ec:	6a 00                	push   $0x0
 3ee:	ff 75 08             	pushl  0x8(%ebp)
 3f1:	e8 3e 02 00 00       	call   634 <open>
  if(fd < 0)
 3f6:	83 c4 10             	add    $0x10,%esp
 3f9:	85 c0                	test   %eax,%eax
 3fb:	78 24                	js     421 <stat+0x41>
 3fd:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3ff:	83 ec 08             	sub    $0x8,%esp
 402:	ff 75 0c             	pushl  0xc(%ebp)
 405:	50                   	push   %eax
 406:	e8 41 02 00 00       	call   64c <fstat>
 40b:	89 c6                	mov    %eax,%esi
  close(fd);
 40d:	89 1c 24             	mov    %ebx,(%esp)
 410:	e8 07 02 00 00       	call   61c <close>
  return r;
 415:	83 c4 10             	add    $0x10,%esp
}
 418:	89 f0                	mov    %esi,%eax
 41a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 41d:	5b                   	pop    %ebx
 41e:	5e                   	pop    %esi
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    
    return -1;
 421:	be ff ff ff ff       	mov    $0xffffffff,%esi
 426:	eb f0                	jmp    418 <stat+0x38>

00000428 <atoi>:

int
atoi(const char *s)
{
 428:	f3 0f 1e fb          	endbr32 
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	53                   	push   %ebx
 430:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 433:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 438:	0f b6 01             	movzbl (%ecx),%eax
 43b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 43e:	80 fb 09             	cmp    $0x9,%bl
 441:	77 12                	ja     455 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 443:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 446:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 449:	83 c1 01             	add    $0x1,%ecx
 44c:	0f be c0             	movsbl %al,%eax
 44f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 453:	eb e3                	jmp    438 <atoi+0x10>
  return n;
}
 455:	89 d0                	mov    %edx,%eax
 457:	5b                   	pop    %ebx
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 45a:	f3 0f 1e fb          	endbr32 
 45e:	55                   	push   %ebp
 45f:	89 e5                	mov    %esp,%ebp
 461:	56                   	push   %esi
 462:	53                   	push   %ebx
 463:	8b 75 08             	mov    0x8(%ebp),%esi
 466:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 469:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 46c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 46e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 471:	85 c0                	test   %eax,%eax
 473:	7e 0f                	jle    484 <memmove+0x2a>
    *dst++ = *src++;
 475:	0f b6 01             	movzbl (%ecx),%eax
 478:	88 02                	mov    %al,(%edx)
 47a:	8d 49 01             	lea    0x1(%ecx),%ecx
 47d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 480:	89 d8                	mov    %ebx,%eax
 482:	eb ea                	jmp    46e <memmove+0x14>
  return vdst;
}
 484:	89 f0                	mov    %esi,%eax
 486:	5b                   	pop    %ebx
 487:	5e                   	pop    %esi
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    

0000048a <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 48a:	f3 0f 1e fb          	endbr32 
 48e:	55                   	push   %ebp
 48f:	89 e5                	mov    %esp,%ebp
 491:	53                   	push   %ebx
 492:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 495:	68 00 20 00 00       	push   $0x2000
 49a:	e8 c7 04 00 00       	call   966 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 49f:	83 c4 10             	add    $0x10,%esp
 4a2:	89 c2                	mov    %eax,%edx
 4a4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 4aa:	74 22                	je     4ce <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 4ac:	b9 00 10 00 00       	mov    $0x1000,%ecx
 4b1:	29 d1                	sub    %edx,%ecx
 4b3:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 4b5:	ba 00 00 00 00       	mov    $0x0,%edx
 4ba:	83 fa 3f             	cmp    $0x3f,%edx
 4bd:	7f 13                	jg     4d2 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 4bf:	83 3c 95 80 11 00 00 	cmpl   $0x1,0x1180(,%edx,4)
 4c6:	01 
 4c7:	75 09                	jne    4d2 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 4c9:	83 c2 01             	add    $0x1,%edx
 4cc:	eb ec                	jmp    4ba <thread_create+0x30>
  void *user_stack = curr_ptr;
 4ce:	89 c1                	mov    %eax,%ecx
 4d0:	eb e3                	jmp    4b5 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 4d2:	83 3c 95 80 11 00 00 	cmpl   $0x1,0x1180(,%edx,4)
 4d9:	01 
 4da:	74 34                	je     510 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 4dc:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 4df:	c1 e3 02             	shl    $0x2,%ebx
 4e2:	89 83 80 0e 00 00    	mov    %eax,0xe80(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 4e8:	89 8b 84 0e 00 00    	mov    %ecx,0xe84(%ebx)
  cell_full[i] = 1;
 4ee:	c7 04 95 80 11 00 00 	movl   $0x1,0x1180(,%edx,4)
 4f5:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 4f9:	ff 75 10             	pushl  0x10(%ebp)
 4fc:	ff 75 0c             	pushl  0xc(%ebp)
 4ff:	ff 75 08             	pushl  0x8(%ebp)
 502:	51                   	push   %ecx
 503:	e8 dc 00 00 00       	call   5e4 <clone>
 508:	83 c4 10             	add    $0x10,%esp
}
 50b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 50e:	c9                   	leave  
 50f:	c3                   	ret    
    return -1;
 510:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 515:	eb f4                	jmp    50b <thread_create+0x81>

00000517 <thread_join>:

int thread_join(){
 517:	f3 0f 1e fb          	endbr32 
 51b:	55                   	push   %ebp
 51c:	89 e5                	mov    %esp,%ebp
 51e:	56                   	push   %esi
 51f:	53                   	push   %ebx
 520:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 523:	8d 45 f4             	lea    -0xc(%ebp),%eax
 526:	50                   	push   %eax
 527:	e8 d0 00 00 00       	call   5fc <join>
 52c:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 52e:	83 c4 10             	add    $0x10,%esp
 531:	bb 00 00 00 00       	mov    $0x0,%ebx
 536:	83 fb 3f             	cmp    $0x3f,%ebx
 539:	7f 14                	jg     54f <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 53b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 53e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 541:	39 14 85 84 0e 00 00 	cmp    %edx,0xe84(,%eax,4)
 548:	74 05                	je     54f <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 54a:	83 c3 01             	add    $0x1,%ebx
 54d:	eb e7                	jmp    536 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 54f:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 552:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 555:	39 0c 85 84 0e 00 00 	cmp    %ecx,0xe84(,%eax,4)
 55c:	75 26                	jne    584 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 55e:	83 ec 0c             	sub    $0xc,%esp
 561:	ff 34 85 80 0e 00 00 	pushl  0xe80(,%eax,4)
 568:	e8 35 03 00 00       	call   8a2 <free>
  cell_full[i] = 0;
 56d:	c7 04 9d 80 11 00 00 	movl   $0x0,0x1180(,%ebx,4)
 574:	00 00 00 00 

  return out;
 578:	83 c4 10             	add    $0x10,%esp
}
 57b:	89 f0                	mov    %esi,%eax
 57d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 580:	5b                   	pop    %ebx
 581:	5e                   	pop    %esi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 584:	be ff ff ff ff       	mov    $0xffffffff,%esi
 589:	eb f0                	jmp    57b <thread_join+0x64>

0000058b <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 58b:	f3 0f 1e fb          	endbr32 
 58f:	55                   	push   %ebp
 590:	89 e5                	mov    %esp,%ebp
 592:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 595:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 59b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    

000005a4 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 5a4:	f3 0f 1e fb          	endbr32 
 5a8:	55                   	push   %ebp
 5a9:	89 e5                	mov    %esp,%ebp
 5ab:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 5ae:	b9 01 00 00 00       	mov    $0x1,%ecx
 5b3:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 5b7:	b8 00 00 00 00       	mov    $0x0,%eax
 5bc:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 5c1:	39 c1                	cmp    %eax,%ecx
 5c3:	75 f2                	jne    5b7 <lock_acquire+0x13>
      ; // spin
    }
}
 5c5:	5d                   	pop    %ebp
 5c6:	c3                   	ret    

000005c7 <lock_release>:

void lock_release(lock_t *lock) {
 5c7:	f3 0f 1e fb          	endbr32 
 5cb:	55                   	push   %ebp
 5cc:	89 e5                	mov    %esp,%ebp
 5ce:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 5d1:	8b 42 04             	mov    0x4(%edx),%eax
 5d4:	83 c0 01             	add    $0x1,%eax
 5d7:	89 42 04             	mov    %eax,0x4(%edx)
}
 5da:	5d                   	pop    %ebp
 5db:	c3                   	ret    

000005dc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5dc:	b8 01 00 00 00       	mov    $0x1,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <clone>:
SYSCALL(clone)
 5e4:	b8 16 00 00 00       	mov    $0x16,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <exit>:
SYSCALL(exit)
 5ec:	b8 02 00 00 00       	mov    $0x2,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <wait>:
SYSCALL(wait)
 5f4:	b8 03 00 00 00       	mov    $0x3,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <join>:
SYSCALL(join)
 5fc:	b8 17 00 00 00       	mov    $0x17,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <pipe>:
SYSCALL(pipe)
 604:	b8 04 00 00 00       	mov    $0x4,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <read>:
SYSCALL(read)
 60c:	b8 05 00 00 00       	mov    $0x5,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <write>:
SYSCALL(write)
 614:	b8 10 00 00 00       	mov    $0x10,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <close>:
SYSCALL(close)
 61c:	b8 15 00 00 00       	mov    $0x15,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <kill>:
SYSCALL(kill)
 624:	b8 06 00 00 00       	mov    $0x6,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <exec>:
SYSCALL(exec)
 62c:	b8 07 00 00 00       	mov    $0x7,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <open>:
SYSCALL(open)
 634:	b8 0f 00 00 00       	mov    $0xf,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <mknod>:
SYSCALL(mknod)
 63c:	b8 11 00 00 00       	mov    $0x11,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <unlink>:
SYSCALL(unlink)
 644:	b8 12 00 00 00       	mov    $0x12,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <fstat>:
SYSCALL(fstat)
 64c:	b8 08 00 00 00       	mov    $0x8,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <link>:
SYSCALL(link)
 654:	b8 13 00 00 00       	mov    $0x13,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <mkdir>:
SYSCALL(mkdir)
 65c:	b8 14 00 00 00       	mov    $0x14,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <chdir>:
SYSCALL(chdir)
 664:	b8 09 00 00 00       	mov    $0x9,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <dup>:
SYSCALL(dup)
 66c:	b8 0a 00 00 00       	mov    $0xa,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <getpid>:
SYSCALL(getpid)
 674:	b8 0b 00 00 00       	mov    $0xb,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <sbrk>:
SYSCALL(sbrk)
 67c:	b8 0c 00 00 00       	mov    $0xc,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <sleep>:
SYSCALL(sleep)
 684:	b8 0d 00 00 00       	mov    $0xd,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <uptime>:
SYSCALL(uptime)
 68c:	b8 0e 00 00 00       	mov    $0xe,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 694:	55                   	push   %ebp
 695:	89 e5                	mov    %esp,%ebp
 697:	83 ec 1c             	sub    $0x1c,%esp
 69a:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 69d:	6a 01                	push   $0x1
 69f:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6a2:	52                   	push   %edx
 6a3:	50                   	push   %eax
 6a4:	e8 6b ff ff ff       	call   614 <write>
}
 6a9:	83 c4 10             	add    $0x10,%esp
 6ac:	c9                   	leave  
 6ad:	c3                   	ret    

000006ae <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6ae:	55                   	push   %ebp
 6af:	89 e5                	mov    %esp,%ebp
 6b1:	57                   	push   %edi
 6b2:	56                   	push   %esi
 6b3:	53                   	push   %ebx
 6b4:	83 ec 2c             	sub    $0x2c,%esp
 6b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6ba:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6bc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6c0:	0f 95 c2             	setne  %dl
 6c3:	89 f0                	mov    %esi,%eax
 6c5:	c1 e8 1f             	shr    $0x1f,%eax
 6c8:	84 c2                	test   %al,%dl
 6ca:	74 42                	je     70e <printint+0x60>
    neg = 1;
    x = -xx;
 6cc:	f7 de                	neg    %esi
    neg = 1;
 6ce:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6d5:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6da:	89 f0                	mov    %esi,%eax
 6dc:	ba 00 00 00 00       	mov    $0x0,%edx
 6e1:	f7 f1                	div    %ecx
 6e3:	89 df                	mov    %ebx,%edi
 6e5:	83 c3 01             	add    $0x1,%ebx
 6e8:	0f b6 92 cc 0a 00 00 	movzbl 0xacc(%edx),%edx
 6ef:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6f3:	89 f2                	mov    %esi,%edx
 6f5:	89 c6                	mov    %eax,%esi
 6f7:	39 d1                	cmp    %edx,%ecx
 6f9:	76 df                	jbe    6da <printint+0x2c>
  if(neg)
 6fb:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6ff:	74 2f                	je     730 <printint+0x82>
    buf[i++] = '-';
 701:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 706:	8d 5f 02             	lea    0x2(%edi),%ebx
 709:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70c:	eb 15                	jmp    723 <printint+0x75>
  neg = 0;
 70e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 715:	eb be                	jmp    6d5 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 717:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 71c:	89 f0                	mov    %esi,%eax
 71e:	e8 71 ff ff ff       	call   694 <putc>
  while(--i >= 0)
 723:	83 eb 01             	sub    $0x1,%ebx
 726:	79 ef                	jns    717 <printint+0x69>
}
 728:	83 c4 2c             	add    $0x2c,%esp
 72b:	5b                   	pop    %ebx
 72c:	5e                   	pop    %esi
 72d:	5f                   	pop    %edi
 72e:	5d                   	pop    %ebp
 72f:	c3                   	ret    
 730:	8b 75 d0             	mov    -0x30(%ebp),%esi
 733:	eb ee                	jmp    723 <printint+0x75>

00000735 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 735:	f3 0f 1e fb          	endbr32 
 739:	55                   	push   %ebp
 73a:	89 e5                	mov    %esp,%ebp
 73c:	57                   	push   %edi
 73d:	56                   	push   %esi
 73e:	53                   	push   %ebx
 73f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 742:	8d 45 10             	lea    0x10(%ebp),%eax
 745:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 748:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 74d:	bb 00 00 00 00       	mov    $0x0,%ebx
 752:	eb 14                	jmp    768 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 754:	89 fa                	mov    %edi,%edx
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	e8 36 ff ff ff       	call   694 <putc>
 75e:	eb 05                	jmp    765 <printf+0x30>
      }
    } else if(state == '%'){
 760:	83 fe 25             	cmp    $0x25,%esi
 763:	74 25                	je     78a <printf+0x55>
  for(i = 0; fmt[i]; i++){
 765:	83 c3 01             	add    $0x1,%ebx
 768:	8b 45 0c             	mov    0xc(%ebp),%eax
 76b:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 76f:	84 c0                	test   %al,%al
 771:	0f 84 23 01 00 00    	je     89a <printf+0x165>
    c = fmt[i] & 0xff;
 777:	0f be f8             	movsbl %al,%edi
 77a:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 77d:	85 f6                	test   %esi,%esi
 77f:	75 df                	jne    760 <printf+0x2b>
      if(c == '%'){
 781:	83 f8 25             	cmp    $0x25,%eax
 784:	75 ce                	jne    754 <printf+0x1f>
        state = '%';
 786:	89 c6                	mov    %eax,%esi
 788:	eb db                	jmp    765 <printf+0x30>
      if(c == 'd'){
 78a:	83 f8 64             	cmp    $0x64,%eax
 78d:	74 49                	je     7d8 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 78f:	83 f8 78             	cmp    $0x78,%eax
 792:	0f 94 c1             	sete   %cl
 795:	83 f8 70             	cmp    $0x70,%eax
 798:	0f 94 c2             	sete   %dl
 79b:	08 d1                	or     %dl,%cl
 79d:	75 63                	jne    802 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 79f:	83 f8 73             	cmp    $0x73,%eax
 7a2:	0f 84 84 00 00 00    	je     82c <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7a8:	83 f8 63             	cmp    $0x63,%eax
 7ab:	0f 84 b7 00 00 00    	je     868 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7b1:	83 f8 25             	cmp    $0x25,%eax
 7b4:	0f 84 cc 00 00 00    	je     886 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7ba:	ba 25 00 00 00       	mov    $0x25,%edx
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	e8 cd fe ff ff       	call   694 <putc>
        putc(fd, c);
 7c7:	89 fa                	mov    %edi,%edx
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
 7cc:	e8 c3 fe ff ff       	call   694 <putc>
      }
      state = 0;
 7d1:	be 00 00 00 00       	mov    $0x0,%esi
 7d6:	eb 8d                	jmp    765 <printf+0x30>
        printint(fd, *ap, 10, 1);
 7d8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7db:	8b 17                	mov    (%edi),%edx
 7dd:	83 ec 0c             	sub    $0xc,%esp
 7e0:	6a 01                	push   $0x1
 7e2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7e7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ea:	e8 bf fe ff ff       	call   6ae <printint>
        ap++;
 7ef:	83 c7 04             	add    $0x4,%edi
 7f2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7f5:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7f8:	be 00 00 00 00       	mov    $0x0,%esi
 7fd:	e9 63 ff ff ff       	jmp    765 <printf+0x30>
        printint(fd, *ap, 16, 0);
 802:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 805:	8b 17                	mov    (%edi),%edx
 807:	83 ec 0c             	sub    $0xc,%esp
 80a:	6a 00                	push   $0x0
 80c:	b9 10 00 00 00       	mov    $0x10,%ecx
 811:	8b 45 08             	mov    0x8(%ebp),%eax
 814:	e8 95 fe ff ff       	call   6ae <printint>
        ap++;
 819:	83 c7 04             	add    $0x4,%edi
 81c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 81f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 822:	be 00 00 00 00       	mov    $0x0,%esi
 827:	e9 39 ff ff ff       	jmp    765 <printf+0x30>
        s = (char*)*ap;
 82c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 82f:	8b 30                	mov    (%eax),%esi
        ap++;
 831:	83 c0 04             	add    $0x4,%eax
 834:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 837:	85 f6                	test   %esi,%esi
 839:	75 28                	jne    863 <printf+0x12e>
          s = "(null)";
 83b:	be c3 0a 00 00       	mov    $0xac3,%esi
 840:	8b 7d 08             	mov    0x8(%ebp),%edi
 843:	eb 0d                	jmp    852 <printf+0x11d>
          putc(fd, *s);
 845:	0f be d2             	movsbl %dl,%edx
 848:	89 f8                	mov    %edi,%eax
 84a:	e8 45 fe ff ff       	call   694 <putc>
          s++;
 84f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 852:	0f b6 16             	movzbl (%esi),%edx
 855:	84 d2                	test   %dl,%dl
 857:	75 ec                	jne    845 <printf+0x110>
      state = 0;
 859:	be 00 00 00 00       	mov    $0x0,%esi
 85e:	e9 02 ff ff ff       	jmp    765 <printf+0x30>
 863:	8b 7d 08             	mov    0x8(%ebp),%edi
 866:	eb ea                	jmp    852 <printf+0x11d>
        putc(fd, *ap);
 868:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86b:	0f be 17             	movsbl (%edi),%edx
 86e:	8b 45 08             	mov    0x8(%ebp),%eax
 871:	e8 1e fe ff ff       	call   694 <putc>
        ap++;
 876:	83 c7 04             	add    $0x4,%edi
 879:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 87c:	be 00 00 00 00       	mov    $0x0,%esi
 881:	e9 df fe ff ff       	jmp    765 <printf+0x30>
        putc(fd, c);
 886:	89 fa                	mov    %edi,%edx
 888:	8b 45 08             	mov    0x8(%ebp),%eax
 88b:	e8 04 fe ff ff       	call   694 <putc>
      state = 0;
 890:	be 00 00 00 00       	mov    $0x0,%esi
 895:	e9 cb fe ff ff       	jmp    765 <printf+0x30>
    }
  }
}
 89a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 89d:	5b                   	pop    %ebx
 89e:	5e                   	pop    %esi
 89f:	5f                   	pop    %edi
 8a0:	5d                   	pop    %ebp
 8a1:	c3                   	ret    

000008a2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a2:	f3 0f 1e fb          	endbr32 
 8a6:	55                   	push   %ebp
 8a7:	89 e5                	mov    %esp,%ebp
 8a9:	57                   	push   %edi
 8aa:	56                   	push   %esi
 8ab:	53                   	push   %ebx
 8ac:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8af:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b2:	a1 64 0e 00 00       	mov    0xe64,%eax
 8b7:	eb 02                	jmp    8bb <free+0x19>
 8b9:	89 d0                	mov    %edx,%eax
 8bb:	39 c8                	cmp    %ecx,%eax
 8bd:	73 04                	jae    8c3 <free+0x21>
 8bf:	39 08                	cmp    %ecx,(%eax)
 8c1:	77 12                	ja     8d5 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8c3:	8b 10                	mov    (%eax),%edx
 8c5:	39 c2                	cmp    %eax,%edx
 8c7:	77 f0                	ja     8b9 <free+0x17>
 8c9:	39 c8                	cmp    %ecx,%eax
 8cb:	72 08                	jb     8d5 <free+0x33>
 8cd:	39 ca                	cmp    %ecx,%edx
 8cf:	77 04                	ja     8d5 <free+0x33>
 8d1:	89 d0                	mov    %edx,%eax
 8d3:	eb e6                	jmp    8bb <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8d5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8d8:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8db:	8b 10                	mov    (%eax),%edx
 8dd:	39 d7                	cmp    %edx,%edi
 8df:	74 19                	je     8fa <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8e1:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8e4:	8b 50 04             	mov    0x4(%eax),%edx
 8e7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8ea:	39 ce                	cmp    %ecx,%esi
 8ec:	74 1b                	je     909 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8ee:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8f0:	a3 64 0e 00 00       	mov    %eax,0xe64
}
 8f5:	5b                   	pop    %ebx
 8f6:	5e                   	pop    %esi
 8f7:	5f                   	pop    %edi
 8f8:	5d                   	pop    %ebp
 8f9:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8fa:	03 72 04             	add    0x4(%edx),%esi
 8fd:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 900:	8b 10                	mov    (%eax),%edx
 902:	8b 12                	mov    (%edx),%edx
 904:	89 53 f8             	mov    %edx,-0x8(%ebx)
 907:	eb db                	jmp    8e4 <free+0x42>
    p->s.size += bp->s.size;
 909:	03 53 fc             	add    -0x4(%ebx),%edx
 90c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 90f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 912:	89 10                	mov    %edx,(%eax)
 914:	eb da                	jmp    8f0 <free+0x4e>

00000916 <morecore>:

static Header*
morecore(uint nu)
{
 916:	55                   	push   %ebp
 917:	89 e5                	mov    %esp,%ebp
 919:	53                   	push   %ebx
 91a:	83 ec 04             	sub    $0x4,%esp
 91d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 91f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 924:	77 05                	ja     92b <morecore+0x15>
    nu = 4096;
 926:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 92b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 932:	83 ec 0c             	sub    $0xc,%esp
 935:	50                   	push   %eax
 936:	e8 41 fd ff ff       	call   67c <sbrk>
  if(p == (char*)-1)
 93b:	83 c4 10             	add    $0x10,%esp
 93e:	83 f8 ff             	cmp    $0xffffffff,%eax
 941:	74 1c                	je     95f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 943:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 946:	83 c0 08             	add    $0x8,%eax
 949:	83 ec 0c             	sub    $0xc,%esp
 94c:	50                   	push   %eax
 94d:	e8 50 ff ff ff       	call   8a2 <free>
  return freep;
 952:	a1 64 0e 00 00       	mov    0xe64,%eax
 957:	83 c4 10             	add    $0x10,%esp
}
 95a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 95d:	c9                   	leave  
 95e:	c3                   	ret    
    return 0;
 95f:	b8 00 00 00 00       	mov    $0x0,%eax
 964:	eb f4                	jmp    95a <morecore+0x44>

00000966 <malloc>:

void*
malloc(uint nbytes)
{
 966:	f3 0f 1e fb          	endbr32 
 96a:	55                   	push   %ebp
 96b:	89 e5                	mov    %esp,%ebp
 96d:	53                   	push   %ebx
 96e:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 971:	8b 45 08             	mov    0x8(%ebp),%eax
 974:	8d 58 07             	lea    0x7(%eax),%ebx
 977:	c1 eb 03             	shr    $0x3,%ebx
 97a:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 97d:	8b 0d 64 0e 00 00    	mov    0xe64,%ecx
 983:	85 c9                	test   %ecx,%ecx
 985:	74 04                	je     98b <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 987:	8b 01                	mov    (%ecx),%eax
 989:	eb 4b                	jmp    9d6 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 98b:	c7 05 64 0e 00 00 68 	movl   $0xe68,0xe64
 992:	0e 00 00 
 995:	c7 05 68 0e 00 00 68 	movl   $0xe68,0xe68
 99c:	0e 00 00 
    base.s.size = 0;
 99f:	c7 05 6c 0e 00 00 00 	movl   $0x0,0xe6c
 9a6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9a9:	b9 68 0e 00 00       	mov    $0xe68,%ecx
 9ae:	eb d7                	jmp    987 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9b0:	74 1a                	je     9cc <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9b2:	29 da                	sub    %ebx,%edx
 9b4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9b7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9ba:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9bd:	89 0d 64 0e 00 00    	mov    %ecx,0xe64
      return (void*)(p + 1);
 9c3:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9c6:	83 c4 04             	add    $0x4,%esp
 9c9:	5b                   	pop    %ebx
 9ca:	5d                   	pop    %ebp
 9cb:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9cc:	8b 10                	mov    (%eax),%edx
 9ce:	89 11                	mov    %edx,(%ecx)
 9d0:	eb eb                	jmp    9bd <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d2:	89 c1                	mov    %eax,%ecx
 9d4:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9d6:	8b 50 04             	mov    0x4(%eax),%edx
 9d9:	39 da                	cmp    %ebx,%edx
 9db:	73 d3                	jae    9b0 <malloc+0x4a>
    if(p == freep)
 9dd:	39 05 64 0e 00 00    	cmp    %eax,0xe64
 9e3:	75 ed                	jne    9d2 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 9e5:	89 d8                	mov    %ebx,%eax
 9e7:	e8 2a ff ff ff       	call   916 <morecore>
 9ec:	85 c0                	test   %eax,%eax
 9ee:	75 e2                	jne    9d2 <malloc+0x6c>
 9f0:	eb d4                	jmp    9c6 <malloc+0x60>
