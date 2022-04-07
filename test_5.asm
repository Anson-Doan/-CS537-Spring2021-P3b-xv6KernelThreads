
_test_5:     file format elf32-i386


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
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
   a:	8b 45 0c             	mov    0xc(%ebp),%eax
   d:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 42);
   f:	8b 45 08             	mov    0x8(%ebp),%eax
  12:	83 38 2a             	cmpl   $0x2a,(%eax)
  15:	75 60                	jne    77 <worker+0x77>
   assert(tmp2 == 24);
  17:	83 fa 18             	cmp    $0x18,%edx
  1a:	0f 85 a0 00 00 00    	jne    c0 <worker+0xc0>
   assert(global == 1);
  20:	a1 90 0e 00 00       	mov    0xe90,%eax
  25:	83 f8 01             	cmp    $0x1,%eax
  28:	0f 84 db 00 00 00    	je     109 <worker+0x109>
  2e:	6a 38                	push   $0x38
  30:	68 5c 0a 00 00       	push   $0xa5c
  35:	68 65 0a 00 00       	push   $0xa65
  3a:	6a 01                	push   $0x1
  3c:	e8 5d 07 00 00       	call   79e <printf>
  41:	83 c4 0c             	add    $0xc,%esp
  44:	68 a4 0a 00 00       	push   $0xaa4
  49:	68 78 0a 00 00       	push   $0xa78
  4e:	6a 01                	push   $0x1
  50:	e8 49 07 00 00       	call   79e <printf>
  55:	83 c4 08             	add    $0x8,%esp
  58:	68 8c 0a 00 00       	push   $0xa8c
  5d:	6a 01                	push   $0x1
  5f:	e8 3a 07 00 00       	call   79e <printf>
  64:	83 c4 04             	add    $0x4,%esp
  67:	ff 35 ac 0e 00 00    	pushl  0xeac
  6d:	e8 1b 06 00 00       	call   68d <kill>
  72:	e8 de 05 00 00       	call   655 <exit>
   assert(tmp1 == 42);
  77:	6a 36                	push   $0x36
  79:	68 5c 0a 00 00       	push   $0xa5c
  7e:	68 65 0a 00 00       	push   $0xa65
  83:	6a 01                	push   $0x1
  85:	e8 14 07 00 00       	call   79e <printf>
  8a:	83 c4 0c             	add    $0xc,%esp
  8d:	68 6d 0a 00 00       	push   $0xa6d
  92:	68 78 0a 00 00       	push   $0xa78
  97:	6a 01                	push   $0x1
  99:	e8 00 07 00 00       	call   79e <printf>
  9e:	83 c4 08             	add    $0x8,%esp
  a1:	68 8c 0a 00 00       	push   $0xa8c
  a6:	6a 01                	push   $0x1
  a8:	e8 f1 06 00 00       	call   79e <printf>
  ad:	83 c4 04             	add    $0x4,%esp
  b0:	ff 35 ac 0e 00 00    	pushl  0xeac
  b6:	e8 d2 05 00 00       	call   68d <kill>
  bb:	e8 95 05 00 00       	call   655 <exit>
   assert(tmp2 == 24);
  c0:	6a 37                	push   $0x37
  c2:	68 5c 0a 00 00       	push   $0xa5c
  c7:	68 65 0a 00 00       	push   $0xa65
  cc:	6a 01                	push   $0x1
  ce:	e8 cb 06 00 00       	call   79e <printf>
  d3:	83 c4 0c             	add    $0xc,%esp
  d6:	68 99 0a 00 00       	push   $0xa99
  db:	68 78 0a 00 00       	push   $0xa78
  e0:	6a 01                	push   $0x1
  e2:	e8 b7 06 00 00       	call   79e <printf>
  e7:	83 c4 08             	add    $0x8,%esp
  ea:	68 8c 0a 00 00       	push   $0xa8c
  ef:	6a 01                	push   $0x1
  f1:	e8 a8 06 00 00       	call   79e <printf>
  f6:	83 c4 04             	add    $0x4,%esp
  f9:	ff 35 ac 0e 00 00    	pushl  0xeac
  ff:	e8 89 05 00 00       	call   68d <kill>
 104:	e8 4c 05 00 00       	call   655 <exit>
   global++;
 109:	83 c0 01             	add    $0x1,%eax
 10c:	a3 90 0e 00 00       	mov    %eax,0xe90
   exit();
 111:	e8 3f 05 00 00       	call   655 <exit>

00000116 <main>:
{
 116:	f3 0f 1e fb          	endbr32 
 11a:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 11e:	83 e4 f0             	and    $0xfffffff0,%esp
 121:	ff 71 fc             	pushl  -0x4(%ecx)
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
 12a:	51                   	push   %ecx
 12b:	83 ec 18             	sub    $0x18,%esp
   ppid = getpid();
 12e:	e8 aa 05 00 00       	call   6dd <getpid>
 133:	a3 ac 0e 00 00       	mov    %eax,0xeac
   void *stack, *p = malloc(PGSIZE * 2);
 138:	83 ec 0c             	sub    $0xc,%esp
 13b:	68 00 20 00 00       	push   $0x2000
 140:	e8 8a 08 00 00       	call   9cf <malloc>
   assert(p != NULL);
 145:	83 c4 10             	add    $0x10,%esp
 148:	85 c0                	test   %eax,%eax
 14a:	74 14                	je     160 <main+0x4a>
 14c:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 14e:	25 ff 0f 00 00       	and    $0xfff,%eax
 153:	74 54                	je     1a9 <main+0x93>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 155:	bf 00 10 00 00       	mov    $0x1000,%edi
 15a:	29 c7                	sub    %eax,%edi
 15c:	01 df                	add    %ebx,%edi
 15e:	eb 4b                	jmp    1ab <main+0x95>
   assert(p != NULL);
 160:	6a 1d                	push   $0x1d
 162:	68 5c 0a 00 00       	push   $0xa5c
 167:	68 65 0a 00 00       	push   $0xa65
 16c:	6a 01                	push   $0x1
 16e:	e8 2b 06 00 00       	call   79e <printf>
 173:	83 c4 0c             	add    $0xc,%esp
 176:	68 b0 0a 00 00       	push   $0xab0
 17b:	68 78 0a 00 00       	push   $0xa78
 180:	6a 01                	push   $0x1
 182:	e8 17 06 00 00       	call   79e <printf>
 187:	83 c4 08             	add    $0x8,%esp
 18a:	68 8c 0a 00 00       	push   $0xa8c
 18f:	6a 01                	push   $0x1
 191:	e8 08 06 00 00       	call   79e <printf>
 196:	83 c4 04             	add    $0x4,%esp
 199:	ff 35 ac 0e 00 00    	pushl  0xeac
 19f:	e8 e9 04 00 00       	call   68d <kill>
 1a4:	e8 ac 04 00 00       	call   655 <exit>
     stack = p;
 1a9:	89 df                	mov    %ebx,%edi
   int arg1 = 42, arg2 = 24;
 1ab:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1b2:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b9:	57                   	push   %edi
 1ba:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1bd:	50                   	push   %eax
 1be:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1c1:	50                   	push   %eax
 1c2:	68 00 00 00 00       	push   $0x0
 1c7:	e8 81 04 00 00       	call   64d <clone>
 1cc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1ce:	83 c4 10             	add    $0x10,%esp
 1d1:	85 c0                	test   %eax,%eax
 1d3:	7e 69                	jle    23e <main+0x128>
   int join_pid = join(&join_stack);
 1d5:	83 ec 0c             	sub    $0xc,%esp
 1d8:	8d 45 dc             	lea    -0x24(%ebp),%eax
 1db:	50                   	push   %eax
 1dc:	e8 84 04 00 00       	call   665 <join>
   assert(join_pid == clone_pid);
 1e1:	83 c4 10             	add    $0x10,%esp
 1e4:	39 c6                	cmp    %eax,%esi
 1e6:	0f 85 9b 00 00 00    	jne    287 <main+0x171>
   assert(stack == join_stack);
 1ec:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 1ef:	0f 84 db 00 00 00    	je     2d0 <main+0x1ba>
 1f5:	6a 2a                	push   $0x2a
 1f7:	68 5c 0a 00 00       	push   $0xa5c
 1fc:	68 65 0a 00 00       	push   $0xa65
 201:	6a 01                	push   $0x1
 203:	e8 96 05 00 00       	call   79e <printf>
 208:	83 c4 0c             	add    $0xc,%esp
 20b:	68 de 0a 00 00       	push   $0xade
 210:	68 78 0a 00 00       	push   $0xa78
 215:	6a 01                	push   $0x1
 217:	e8 82 05 00 00       	call   79e <printf>
 21c:	83 c4 08             	add    $0x8,%esp
 21f:	68 8c 0a 00 00       	push   $0xa8c
 224:	6a 01                	push   $0x1
 226:	e8 73 05 00 00       	call   79e <printf>
 22b:	83 c4 04             	add    $0x4,%esp
 22e:	ff 35 ac 0e 00 00    	pushl  0xeac
 234:	e8 54 04 00 00       	call   68d <kill>
 239:	e8 17 04 00 00       	call   655 <exit>
   assert(clone_pid > 0);
 23e:	6a 25                	push   $0x25
 240:	68 5c 0a 00 00       	push   $0xa5c
 245:	68 65 0a 00 00       	push   $0xa65
 24a:	6a 01                	push   $0x1
 24c:	e8 4d 05 00 00       	call   79e <printf>
 251:	83 c4 0c             	add    $0xc,%esp
 254:	68 ba 0a 00 00       	push   $0xaba
 259:	68 78 0a 00 00       	push   $0xa78
 25e:	6a 01                	push   $0x1
 260:	e8 39 05 00 00       	call   79e <printf>
 265:	83 c4 08             	add    $0x8,%esp
 268:	68 8c 0a 00 00       	push   $0xa8c
 26d:	6a 01                	push   $0x1
 26f:	e8 2a 05 00 00       	call   79e <printf>
 274:	83 c4 04             	add    $0x4,%esp
 277:	ff 35 ac 0e 00 00    	pushl  0xeac
 27d:	e8 0b 04 00 00       	call   68d <kill>
 282:	e8 ce 03 00 00       	call   655 <exit>
   assert(join_pid == clone_pid);
 287:	6a 29                	push   $0x29
 289:	68 5c 0a 00 00       	push   $0xa5c
 28e:	68 65 0a 00 00       	push   $0xa65
 293:	6a 01                	push   $0x1
 295:	e8 04 05 00 00       	call   79e <printf>
 29a:	83 c4 0c             	add    $0xc,%esp
 29d:	68 c8 0a 00 00       	push   $0xac8
 2a2:	68 78 0a 00 00       	push   $0xa78
 2a7:	6a 01                	push   $0x1
 2a9:	e8 f0 04 00 00       	call   79e <printf>
 2ae:	83 c4 08             	add    $0x8,%esp
 2b1:	68 8c 0a 00 00       	push   $0xa8c
 2b6:	6a 01                	push   $0x1
 2b8:	e8 e1 04 00 00       	call   79e <printf>
 2bd:	83 c4 04             	add    $0x4,%esp
 2c0:	ff 35 ac 0e 00 00    	pushl  0xeac
 2c6:	e8 c2 03 00 00       	call   68d <kill>
 2cb:	e8 85 03 00 00       	call   655 <exit>
   assert(global == 2);
 2d0:	83 3d 90 0e 00 00 02 	cmpl   $0x2,0xe90
 2d7:	74 49                	je     322 <main+0x20c>
 2d9:	6a 2b                	push   $0x2b
 2db:	68 5c 0a 00 00       	push   $0xa5c
 2e0:	68 65 0a 00 00       	push   $0xa65
 2e5:	6a 01                	push   $0x1
 2e7:	e8 b2 04 00 00       	call   79e <printf>
 2ec:	83 c4 0c             	add    $0xc,%esp
 2ef:	68 f2 0a 00 00       	push   $0xaf2
 2f4:	68 78 0a 00 00       	push   $0xa78
 2f9:	6a 01                	push   $0x1
 2fb:	e8 9e 04 00 00       	call   79e <printf>
 300:	83 c4 08             	add    $0x8,%esp
 303:	68 8c 0a 00 00       	push   $0xa8c
 308:	6a 01                	push   $0x1
 30a:	e8 8f 04 00 00       	call   79e <printf>
 30f:	83 c4 04             	add    $0x4,%esp
 312:	ff 35 ac 0e 00 00    	pushl  0xeac
 318:	e8 70 03 00 00       	call   68d <kill>
 31d:	e8 33 03 00 00       	call   655 <exit>
   printf(1, "TEST PASSED\n");
 322:	83 ec 08             	sub    $0x8,%esp
 325:	68 fe 0a 00 00       	push   $0xafe
 32a:	6a 01                	push   $0x1
 32c:	e8 6d 04 00 00       	call   79e <printf>
   free(p);
 331:	89 1c 24             	mov    %ebx,(%esp)
 334:	e8 d2 05 00 00       	call   90b <free>
   exit();
 339:	e8 17 03 00 00       	call   655 <exit>

0000033e <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 33e:	f3 0f 1e fb          	endbr32 
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	56                   	push   %esi
 346:	53                   	push   %ebx
 347:	8b 75 08             	mov    0x8(%ebp),%esi
 34a:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 34d:	89 f0                	mov    %esi,%eax
 34f:	89 d1                	mov    %edx,%ecx
 351:	83 c2 01             	add    $0x1,%edx
 354:	89 c3                	mov    %eax,%ebx
 356:	83 c0 01             	add    $0x1,%eax
 359:	0f b6 09             	movzbl (%ecx),%ecx
 35c:	88 0b                	mov    %cl,(%ebx)
 35e:	84 c9                	test   %cl,%cl
 360:	75 ed                	jne    34f <strcpy+0x11>
    ;
  return os;
}
 362:	89 f0                	mov    %esi,%eax
 364:	5b                   	pop    %ebx
 365:	5e                   	pop    %esi
 366:	5d                   	pop    %ebp
 367:	c3                   	ret    

00000368 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 368:	f3 0f 1e fb          	endbr32 
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 372:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 375:	0f b6 01             	movzbl (%ecx),%eax
 378:	84 c0                	test   %al,%al
 37a:	74 0c                	je     388 <strcmp+0x20>
 37c:	3a 02                	cmp    (%edx),%al
 37e:	75 08                	jne    388 <strcmp+0x20>
    p++, q++;
 380:	83 c1 01             	add    $0x1,%ecx
 383:	83 c2 01             	add    $0x1,%edx
 386:	eb ed                	jmp    375 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 388:	0f b6 c0             	movzbl %al,%eax
 38b:	0f b6 12             	movzbl (%edx),%edx
 38e:	29 d0                	sub    %edx,%eax
}
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <strlen>:

uint
strlen(const char *s)
{
 392:	f3 0f 1e fb          	endbr32 
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 39c:	b8 00 00 00 00       	mov    $0x0,%eax
 3a1:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 3a5:	74 05                	je     3ac <strlen+0x1a>
 3a7:	83 c0 01             	add    $0x1,%eax
 3aa:	eb f5                	jmp    3a1 <strlen+0xf>
    ;
  return n;
}
 3ac:	5d                   	pop    %ebp
 3ad:	c3                   	ret    

000003ae <memset>:

void*
memset(void *dst, int c, uint n)
{
 3ae:	f3 0f 1e fb          	endbr32 
 3b2:	55                   	push   %ebp
 3b3:	89 e5                	mov    %esp,%ebp
 3b5:	57                   	push   %edi
 3b6:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3b9:	89 d7                	mov    %edx,%edi
 3bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3be:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c1:	fc                   	cld    
 3c2:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3c4:	89 d0                	mov    %edx,%eax
 3c6:	5f                   	pop    %edi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    

000003c9 <strchr>:

char*
strchr(const char *s, char c)
{
 3c9:	f3 0f 1e fb          	endbr32 
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	8b 45 08             	mov    0x8(%ebp),%eax
 3d3:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 3d7:	0f b6 10             	movzbl (%eax),%edx
 3da:	84 d2                	test   %dl,%dl
 3dc:	74 09                	je     3e7 <strchr+0x1e>
    if(*s == c)
 3de:	38 ca                	cmp    %cl,%dl
 3e0:	74 0a                	je     3ec <strchr+0x23>
  for(; *s; s++)
 3e2:	83 c0 01             	add    $0x1,%eax
 3e5:	eb f0                	jmp    3d7 <strchr+0xe>
      return (char*)s;
  return 0;
 3e7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3ec:	5d                   	pop    %ebp
 3ed:	c3                   	ret    

000003ee <gets>:

char*
gets(char *buf, int max)
{
 3ee:	f3 0f 1e fb          	endbr32 
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	57                   	push   %edi
 3f6:	56                   	push   %esi
 3f7:	53                   	push   %ebx
 3f8:	83 ec 1c             	sub    $0x1c,%esp
 3fb:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3fe:	bb 00 00 00 00       	mov    $0x0,%ebx
 403:	89 de                	mov    %ebx,%esi
 405:	83 c3 01             	add    $0x1,%ebx
 408:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 40b:	7d 2e                	jge    43b <gets+0x4d>
    cc = read(0, &c, 1);
 40d:	83 ec 04             	sub    $0x4,%esp
 410:	6a 01                	push   $0x1
 412:	8d 45 e7             	lea    -0x19(%ebp),%eax
 415:	50                   	push   %eax
 416:	6a 00                	push   $0x0
 418:	e8 58 02 00 00       	call   675 <read>
    if(cc < 1)
 41d:	83 c4 10             	add    $0x10,%esp
 420:	85 c0                	test   %eax,%eax
 422:	7e 17                	jle    43b <gets+0x4d>
      break;
    buf[i++] = c;
 424:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 428:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 42b:	3c 0a                	cmp    $0xa,%al
 42d:	0f 94 c2             	sete   %dl
 430:	3c 0d                	cmp    $0xd,%al
 432:	0f 94 c0             	sete   %al
 435:	08 c2                	or     %al,%dl
 437:	74 ca                	je     403 <gets+0x15>
    buf[i++] = c;
 439:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 43b:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 43f:	89 f8                	mov    %edi,%eax
 441:	8d 65 f4             	lea    -0xc(%ebp),%esp
 444:	5b                   	pop    %ebx
 445:	5e                   	pop    %esi
 446:	5f                   	pop    %edi
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    

00000449 <stat>:

int
stat(const char *n, struct stat *st)
{
 449:	f3 0f 1e fb          	endbr32 
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	56                   	push   %esi
 451:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 452:	83 ec 08             	sub    $0x8,%esp
 455:	6a 00                	push   $0x0
 457:	ff 75 08             	pushl  0x8(%ebp)
 45a:	e8 3e 02 00 00       	call   69d <open>
  if(fd < 0)
 45f:	83 c4 10             	add    $0x10,%esp
 462:	85 c0                	test   %eax,%eax
 464:	78 24                	js     48a <stat+0x41>
 466:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 468:	83 ec 08             	sub    $0x8,%esp
 46b:	ff 75 0c             	pushl  0xc(%ebp)
 46e:	50                   	push   %eax
 46f:	e8 41 02 00 00       	call   6b5 <fstat>
 474:	89 c6                	mov    %eax,%esi
  close(fd);
 476:	89 1c 24             	mov    %ebx,(%esp)
 479:	e8 07 02 00 00       	call   685 <close>
  return r;
 47e:	83 c4 10             	add    $0x10,%esp
}
 481:	89 f0                	mov    %esi,%eax
 483:	8d 65 f8             	lea    -0x8(%ebp),%esp
 486:	5b                   	pop    %ebx
 487:	5e                   	pop    %esi
 488:	5d                   	pop    %ebp
 489:	c3                   	ret    
    return -1;
 48a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 48f:	eb f0                	jmp    481 <stat+0x38>

00000491 <atoi>:

int
atoi(const char *s)
{
 491:	f3 0f 1e fb          	endbr32 
 495:	55                   	push   %ebp
 496:	89 e5                	mov    %esp,%ebp
 498:	53                   	push   %ebx
 499:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 49c:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 4a1:	0f b6 01             	movzbl (%ecx),%eax
 4a4:	8d 58 d0             	lea    -0x30(%eax),%ebx
 4a7:	80 fb 09             	cmp    $0x9,%bl
 4aa:	77 12                	ja     4be <atoi+0x2d>
    n = n*10 + *s++ - '0';
 4ac:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 4af:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 4b2:	83 c1 01             	add    $0x1,%ecx
 4b5:	0f be c0             	movsbl %al,%eax
 4b8:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 4bc:	eb e3                	jmp    4a1 <atoi+0x10>
  return n;
}
 4be:	89 d0                	mov    %edx,%eax
 4c0:	5b                   	pop    %ebx
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    

000004c3 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4c3:	f3 0f 1e fb          	endbr32 
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	56                   	push   %esi
 4cb:	53                   	push   %ebx
 4cc:	8b 75 08             	mov    0x8(%ebp),%esi
 4cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4d2:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 4d5:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 4d7:	8d 58 ff             	lea    -0x1(%eax),%ebx
 4da:	85 c0                	test   %eax,%eax
 4dc:	7e 0f                	jle    4ed <memmove+0x2a>
    *dst++ = *src++;
 4de:	0f b6 01             	movzbl (%ecx),%eax
 4e1:	88 02                	mov    %al,(%edx)
 4e3:	8d 49 01             	lea    0x1(%ecx),%ecx
 4e6:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 4e9:	89 d8                	mov    %ebx,%eax
 4eb:	eb ea                	jmp    4d7 <memmove+0x14>
  return vdst;
}
 4ed:	89 f0                	mov    %esi,%eax
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret    

000004f3 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 4f3:	f3 0f 1e fb          	endbr32 
 4f7:	55                   	push   %ebp
 4f8:	89 e5                	mov    %esp,%ebp
 4fa:	53                   	push   %ebx
 4fb:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 4fe:	68 00 20 00 00       	push   $0x2000
 503:	e8 c7 04 00 00       	call   9cf <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 508:	83 c4 10             	add    $0x10,%esp
 50b:	89 c2                	mov    %eax,%edx
 50d:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 513:	74 22                	je     537 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 515:	b9 00 10 00 00       	mov    $0x1000,%ecx
 51a:	29 d1                	sub    %edx,%ecx
 51c:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 51e:	ba 00 00 00 00       	mov    $0x0,%edx
 523:	83 fa 3f             	cmp    $0x3f,%edx
 526:	7f 13                	jg     53b <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 528:	83 3c 95 c0 11 00 00 	cmpl   $0x1,0x11c0(,%edx,4)
 52f:	01 
 530:	75 09                	jne    53b <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 532:	83 c2 01             	add    $0x1,%edx
 535:	eb ec                	jmp    523 <thread_create+0x30>
  void *user_stack = curr_ptr;
 537:	89 c1                	mov    %eax,%ecx
 539:	eb e3                	jmp    51e <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 53b:	83 3c 95 c0 11 00 00 	cmpl   $0x1,0x11c0(,%edx,4)
 542:	01 
 543:	74 34                	je     579 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 545:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 548:	c1 e3 02             	shl    $0x2,%ebx
 54b:	89 83 c0 0e 00 00    	mov    %eax,0xec0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 551:	89 8b c4 0e 00 00    	mov    %ecx,0xec4(%ebx)
  cell_full[i] = 1;
 557:	c7 04 95 c0 11 00 00 	movl   $0x1,0x11c0(,%edx,4)
 55e:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 562:	ff 75 10             	pushl  0x10(%ebp)
 565:	ff 75 0c             	pushl  0xc(%ebp)
 568:	ff 75 08             	pushl  0x8(%ebp)
 56b:	51                   	push   %ecx
 56c:	e8 dc 00 00 00       	call   64d <clone>
 571:	83 c4 10             	add    $0x10,%esp
}
 574:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 577:	c9                   	leave  
 578:	c3                   	ret    
    return -1;
 579:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 57e:	eb f4                	jmp    574 <thread_create+0x81>

00000580 <thread_join>:

int thread_join(){
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	56                   	push   %esi
 588:	53                   	push   %ebx
 589:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 58c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 58f:	50                   	push   %eax
 590:	e8 d0 00 00 00       	call   665 <join>
 595:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 597:	83 c4 10             	add    $0x10,%esp
 59a:	bb 00 00 00 00       	mov    $0x0,%ebx
 59f:	83 fb 3f             	cmp    $0x3f,%ebx
 5a2:	7f 14                	jg     5b8 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 5a4:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 5a7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 5aa:	39 14 85 c4 0e 00 00 	cmp    %edx,0xec4(,%eax,4)
 5b1:	74 05                	je     5b8 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 5b3:	83 c3 01             	add    $0x1,%ebx
 5b6:	eb e7                	jmp    59f <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 5b8:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 5bb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5be:	39 0c 85 c4 0e 00 00 	cmp    %ecx,0xec4(,%eax,4)
 5c5:	75 26                	jne    5ed <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 5c7:	83 ec 0c             	sub    $0xc,%esp
 5ca:	ff 34 85 c0 0e 00 00 	pushl  0xec0(,%eax,4)
 5d1:	e8 35 03 00 00       	call   90b <free>
  cell_full[i] = 0;
 5d6:	c7 04 9d c0 11 00 00 	movl   $0x0,0x11c0(,%ebx,4)
 5dd:	00 00 00 00 

  return out;
 5e1:	83 c4 10             	add    $0x10,%esp
}
 5e4:	89 f0                	mov    %esi,%eax
 5e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5e9:	5b                   	pop    %ebx
 5ea:	5e                   	pop    %esi
 5eb:	5d                   	pop    %ebp
 5ec:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 5ed:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5f2:	eb f0                	jmp    5e4 <thread_join+0x64>

000005f4 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 5f4:	f3 0f 1e fb          	endbr32 
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 5fe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 604:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 60b:	5d                   	pop    %ebp
 60c:	c3                   	ret    

0000060d <lock_acquire>:

void lock_acquire(lock_t *lock) {
 60d:	f3 0f 1e fb          	endbr32 
 611:	55                   	push   %ebp
 612:	89 e5                	mov    %esp,%ebp
 614:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 617:	b9 01 00 00 00       	mov    $0x1,%ecx
 61c:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 620:	b8 00 00 00 00       	mov    $0x0,%eax
 625:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 62a:	39 c1                	cmp    %eax,%ecx
 62c:	75 f2                	jne    620 <lock_acquire+0x13>
      ; // spin
    }
}
 62e:	5d                   	pop    %ebp
 62f:	c3                   	ret    

00000630 <lock_release>:

void lock_release(lock_t *lock) {
 630:	f3 0f 1e fb          	endbr32 
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 63a:	8b 42 04             	mov    0x4(%edx),%eax
 63d:	83 c0 01             	add    $0x1,%eax
 640:	89 42 04             	mov    %eax,0x4(%edx)
}
 643:	5d                   	pop    %ebp
 644:	c3                   	ret    

00000645 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 645:	b8 01 00 00 00       	mov    $0x1,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <clone>:
SYSCALL(clone)
 64d:	b8 16 00 00 00       	mov    $0x16,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <exit>:
SYSCALL(exit)
 655:	b8 02 00 00 00       	mov    $0x2,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <wait>:
SYSCALL(wait)
 65d:	b8 03 00 00 00       	mov    $0x3,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <join>:
SYSCALL(join)
 665:	b8 17 00 00 00       	mov    $0x17,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <pipe>:
SYSCALL(pipe)
 66d:	b8 04 00 00 00       	mov    $0x4,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <read>:
SYSCALL(read)
 675:	b8 05 00 00 00       	mov    $0x5,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <write>:
SYSCALL(write)
 67d:	b8 10 00 00 00       	mov    $0x10,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <close>:
SYSCALL(close)
 685:	b8 15 00 00 00       	mov    $0x15,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <kill>:
SYSCALL(kill)
 68d:	b8 06 00 00 00       	mov    $0x6,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <exec>:
SYSCALL(exec)
 695:	b8 07 00 00 00       	mov    $0x7,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <open>:
SYSCALL(open)
 69d:	b8 0f 00 00 00       	mov    $0xf,%eax
 6a2:	cd 40                	int    $0x40
 6a4:	c3                   	ret    

000006a5 <mknod>:
SYSCALL(mknod)
 6a5:	b8 11 00 00 00       	mov    $0x11,%eax
 6aa:	cd 40                	int    $0x40
 6ac:	c3                   	ret    

000006ad <unlink>:
SYSCALL(unlink)
 6ad:	b8 12 00 00 00       	mov    $0x12,%eax
 6b2:	cd 40                	int    $0x40
 6b4:	c3                   	ret    

000006b5 <fstat>:
SYSCALL(fstat)
 6b5:	b8 08 00 00 00       	mov    $0x8,%eax
 6ba:	cd 40                	int    $0x40
 6bc:	c3                   	ret    

000006bd <link>:
SYSCALL(link)
 6bd:	b8 13 00 00 00       	mov    $0x13,%eax
 6c2:	cd 40                	int    $0x40
 6c4:	c3                   	ret    

000006c5 <mkdir>:
SYSCALL(mkdir)
 6c5:	b8 14 00 00 00       	mov    $0x14,%eax
 6ca:	cd 40                	int    $0x40
 6cc:	c3                   	ret    

000006cd <chdir>:
SYSCALL(chdir)
 6cd:	b8 09 00 00 00       	mov    $0x9,%eax
 6d2:	cd 40                	int    $0x40
 6d4:	c3                   	ret    

000006d5 <dup>:
SYSCALL(dup)
 6d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 6da:	cd 40                	int    $0x40
 6dc:	c3                   	ret    

000006dd <getpid>:
SYSCALL(getpid)
 6dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 6e2:	cd 40                	int    $0x40
 6e4:	c3                   	ret    

000006e5 <sbrk>:
SYSCALL(sbrk)
 6e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 6ea:	cd 40                	int    $0x40
 6ec:	c3                   	ret    

000006ed <sleep>:
SYSCALL(sleep)
 6ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 6f2:	cd 40                	int    $0x40
 6f4:	c3                   	ret    

000006f5 <uptime>:
SYSCALL(uptime)
 6f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 6fa:	cd 40                	int    $0x40
 6fc:	c3                   	ret    

000006fd <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6fd:	55                   	push   %ebp
 6fe:	89 e5                	mov    %esp,%ebp
 700:	83 ec 1c             	sub    $0x1c,%esp
 703:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 706:	6a 01                	push   $0x1
 708:	8d 55 f4             	lea    -0xc(%ebp),%edx
 70b:	52                   	push   %edx
 70c:	50                   	push   %eax
 70d:	e8 6b ff ff ff       	call   67d <write>
}
 712:	83 c4 10             	add    $0x10,%esp
 715:	c9                   	leave  
 716:	c3                   	ret    

00000717 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 717:	55                   	push   %ebp
 718:	89 e5                	mov    %esp,%ebp
 71a:	57                   	push   %edi
 71b:	56                   	push   %esi
 71c:	53                   	push   %ebx
 71d:	83 ec 2c             	sub    $0x2c,%esp
 720:	89 45 d0             	mov    %eax,-0x30(%ebp)
 723:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 725:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 729:	0f 95 c2             	setne  %dl
 72c:	89 f0                	mov    %esi,%eax
 72e:	c1 e8 1f             	shr    $0x1f,%eax
 731:	84 c2                	test   %al,%dl
 733:	74 42                	je     777 <printint+0x60>
    neg = 1;
    x = -xx;
 735:	f7 de                	neg    %esi
    neg = 1;
 737:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 73e:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 743:	89 f0                	mov    %esi,%eax
 745:	ba 00 00 00 00       	mov    $0x0,%edx
 74a:	f7 f1                	div    %ecx
 74c:	89 df                	mov    %ebx,%edi
 74e:	83 c3 01             	add    $0x1,%ebx
 751:	0f b6 92 14 0b 00 00 	movzbl 0xb14(%edx),%edx
 758:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 75c:	89 f2                	mov    %esi,%edx
 75e:	89 c6                	mov    %eax,%esi
 760:	39 d1                	cmp    %edx,%ecx
 762:	76 df                	jbe    743 <printint+0x2c>
  if(neg)
 764:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 768:	74 2f                	je     799 <printint+0x82>
    buf[i++] = '-';
 76a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 76f:	8d 5f 02             	lea    0x2(%edi),%ebx
 772:	8b 75 d0             	mov    -0x30(%ebp),%esi
 775:	eb 15                	jmp    78c <printint+0x75>
  neg = 0;
 777:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 77e:	eb be                	jmp    73e <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 780:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 785:	89 f0                	mov    %esi,%eax
 787:	e8 71 ff ff ff       	call   6fd <putc>
  while(--i >= 0)
 78c:	83 eb 01             	sub    $0x1,%ebx
 78f:	79 ef                	jns    780 <printint+0x69>
}
 791:	83 c4 2c             	add    $0x2c,%esp
 794:	5b                   	pop    %ebx
 795:	5e                   	pop    %esi
 796:	5f                   	pop    %edi
 797:	5d                   	pop    %ebp
 798:	c3                   	ret    
 799:	8b 75 d0             	mov    -0x30(%ebp),%esi
 79c:	eb ee                	jmp    78c <printint+0x75>

0000079e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 79e:	f3 0f 1e fb          	endbr32 
 7a2:	55                   	push   %ebp
 7a3:	89 e5                	mov    %esp,%ebp
 7a5:	57                   	push   %edi
 7a6:	56                   	push   %esi
 7a7:	53                   	push   %ebx
 7a8:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 7ab:	8d 45 10             	lea    0x10(%ebp),%eax
 7ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 7b1:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 7b6:	bb 00 00 00 00       	mov    $0x0,%ebx
 7bb:	eb 14                	jmp    7d1 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 7bd:	89 fa                	mov    %edi,%edx
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	e8 36 ff ff ff       	call   6fd <putc>
 7c7:	eb 05                	jmp    7ce <printf+0x30>
      }
    } else if(state == '%'){
 7c9:	83 fe 25             	cmp    $0x25,%esi
 7cc:	74 25                	je     7f3 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 7ce:	83 c3 01             	add    $0x1,%ebx
 7d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 7d4:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 7d8:	84 c0                	test   %al,%al
 7da:	0f 84 23 01 00 00    	je     903 <printf+0x165>
    c = fmt[i] & 0xff;
 7e0:	0f be f8             	movsbl %al,%edi
 7e3:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 7e6:	85 f6                	test   %esi,%esi
 7e8:	75 df                	jne    7c9 <printf+0x2b>
      if(c == '%'){
 7ea:	83 f8 25             	cmp    $0x25,%eax
 7ed:	75 ce                	jne    7bd <printf+0x1f>
        state = '%';
 7ef:	89 c6                	mov    %eax,%esi
 7f1:	eb db                	jmp    7ce <printf+0x30>
      if(c == 'd'){
 7f3:	83 f8 64             	cmp    $0x64,%eax
 7f6:	74 49                	je     841 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7f8:	83 f8 78             	cmp    $0x78,%eax
 7fb:	0f 94 c1             	sete   %cl
 7fe:	83 f8 70             	cmp    $0x70,%eax
 801:	0f 94 c2             	sete   %dl
 804:	08 d1                	or     %dl,%cl
 806:	75 63                	jne    86b <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 808:	83 f8 73             	cmp    $0x73,%eax
 80b:	0f 84 84 00 00 00    	je     895 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 811:	83 f8 63             	cmp    $0x63,%eax
 814:	0f 84 b7 00 00 00    	je     8d1 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 81a:	83 f8 25             	cmp    $0x25,%eax
 81d:	0f 84 cc 00 00 00    	je     8ef <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 823:	ba 25 00 00 00       	mov    $0x25,%edx
 828:	8b 45 08             	mov    0x8(%ebp),%eax
 82b:	e8 cd fe ff ff       	call   6fd <putc>
        putc(fd, c);
 830:	89 fa                	mov    %edi,%edx
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	e8 c3 fe ff ff       	call   6fd <putc>
      }
      state = 0;
 83a:	be 00 00 00 00       	mov    $0x0,%esi
 83f:	eb 8d                	jmp    7ce <printf+0x30>
        printint(fd, *ap, 10, 1);
 841:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 844:	8b 17                	mov    (%edi),%edx
 846:	83 ec 0c             	sub    $0xc,%esp
 849:	6a 01                	push   $0x1
 84b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 850:	8b 45 08             	mov    0x8(%ebp),%eax
 853:	e8 bf fe ff ff       	call   717 <printint>
        ap++;
 858:	83 c7 04             	add    $0x4,%edi
 85b:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 85e:	83 c4 10             	add    $0x10,%esp
      state = 0;
 861:	be 00 00 00 00       	mov    $0x0,%esi
 866:	e9 63 ff ff ff       	jmp    7ce <printf+0x30>
        printint(fd, *ap, 16, 0);
 86b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 86e:	8b 17                	mov    (%edi),%edx
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	6a 00                	push   $0x0
 875:	b9 10 00 00 00       	mov    $0x10,%ecx
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	e8 95 fe ff ff       	call   717 <printint>
        ap++;
 882:	83 c7 04             	add    $0x4,%edi
 885:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 888:	83 c4 10             	add    $0x10,%esp
      state = 0;
 88b:	be 00 00 00 00       	mov    $0x0,%esi
 890:	e9 39 ff ff ff       	jmp    7ce <printf+0x30>
        s = (char*)*ap;
 895:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 898:	8b 30                	mov    (%eax),%esi
        ap++;
 89a:	83 c0 04             	add    $0x4,%eax
 89d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 8a0:	85 f6                	test   %esi,%esi
 8a2:	75 28                	jne    8cc <printf+0x12e>
          s = "(null)";
 8a4:	be 0b 0b 00 00       	mov    $0xb0b,%esi
 8a9:	8b 7d 08             	mov    0x8(%ebp),%edi
 8ac:	eb 0d                	jmp    8bb <printf+0x11d>
          putc(fd, *s);
 8ae:	0f be d2             	movsbl %dl,%edx
 8b1:	89 f8                	mov    %edi,%eax
 8b3:	e8 45 fe ff ff       	call   6fd <putc>
          s++;
 8b8:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 8bb:	0f b6 16             	movzbl (%esi),%edx
 8be:	84 d2                	test   %dl,%dl
 8c0:	75 ec                	jne    8ae <printf+0x110>
      state = 0;
 8c2:	be 00 00 00 00       	mov    $0x0,%esi
 8c7:	e9 02 ff ff ff       	jmp    7ce <printf+0x30>
 8cc:	8b 7d 08             	mov    0x8(%ebp),%edi
 8cf:	eb ea                	jmp    8bb <printf+0x11d>
        putc(fd, *ap);
 8d1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8d4:	0f be 17             	movsbl (%edi),%edx
 8d7:	8b 45 08             	mov    0x8(%ebp),%eax
 8da:	e8 1e fe ff ff       	call   6fd <putc>
        ap++;
 8df:	83 c7 04             	add    $0x4,%edi
 8e2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 8e5:	be 00 00 00 00       	mov    $0x0,%esi
 8ea:	e9 df fe ff ff       	jmp    7ce <printf+0x30>
        putc(fd, c);
 8ef:	89 fa                	mov    %edi,%edx
 8f1:	8b 45 08             	mov    0x8(%ebp),%eax
 8f4:	e8 04 fe ff ff       	call   6fd <putc>
      state = 0;
 8f9:	be 00 00 00 00       	mov    $0x0,%esi
 8fe:	e9 cb fe ff ff       	jmp    7ce <printf+0x30>
    }
  }
}
 903:	8d 65 f4             	lea    -0xc(%ebp),%esp
 906:	5b                   	pop    %ebx
 907:	5e                   	pop    %esi
 908:	5f                   	pop    %edi
 909:	5d                   	pop    %ebp
 90a:	c3                   	ret    

0000090b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 90b:	f3 0f 1e fb          	endbr32 
 90f:	55                   	push   %ebp
 910:	89 e5                	mov    %esp,%ebp
 912:	57                   	push   %edi
 913:	56                   	push   %esi
 914:	53                   	push   %ebx
 915:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 918:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 91b:	a1 a0 0e 00 00       	mov    0xea0,%eax
 920:	eb 02                	jmp    924 <free+0x19>
 922:	89 d0                	mov    %edx,%eax
 924:	39 c8                	cmp    %ecx,%eax
 926:	73 04                	jae    92c <free+0x21>
 928:	39 08                	cmp    %ecx,(%eax)
 92a:	77 12                	ja     93e <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 92c:	8b 10                	mov    (%eax),%edx
 92e:	39 c2                	cmp    %eax,%edx
 930:	77 f0                	ja     922 <free+0x17>
 932:	39 c8                	cmp    %ecx,%eax
 934:	72 08                	jb     93e <free+0x33>
 936:	39 ca                	cmp    %ecx,%edx
 938:	77 04                	ja     93e <free+0x33>
 93a:	89 d0                	mov    %edx,%eax
 93c:	eb e6                	jmp    924 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 93e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 941:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 944:	8b 10                	mov    (%eax),%edx
 946:	39 d7                	cmp    %edx,%edi
 948:	74 19                	je     963 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 94a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 94d:	8b 50 04             	mov    0x4(%eax),%edx
 950:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 953:	39 ce                	cmp    %ecx,%esi
 955:	74 1b                	je     972 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 957:	89 08                	mov    %ecx,(%eax)
  freep = p;
 959:	a3 a0 0e 00 00       	mov    %eax,0xea0
}
 95e:	5b                   	pop    %ebx
 95f:	5e                   	pop    %esi
 960:	5f                   	pop    %edi
 961:	5d                   	pop    %ebp
 962:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 963:	03 72 04             	add    0x4(%edx),%esi
 966:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 969:	8b 10                	mov    (%eax),%edx
 96b:	8b 12                	mov    (%edx),%edx
 96d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 970:	eb db                	jmp    94d <free+0x42>
    p->s.size += bp->s.size;
 972:	03 53 fc             	add    -0x4(%ebx),%edx
 975:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 978:	8b 53 f8             	mov    -0x8(%ebx),%edx
 97b:	89 10                	mov    %edx,(%eax)
 97d:	eb da                	jmp    959 <free+0x4e>

0000097f <morecore>:

static Header*
morecore(uint nu)
{
 97f:	55                   	push   %ebp
 980:	89 e5                	mov    %esp,%ebp
 982:	53                   	push   %ebx
 983:	83 ec 04             	sub    $0x4,%esp
 986:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 988:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 98d:	77 05                	ja     994 <morecore+0x15>
    nu = 4096;
 98f:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 994:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 99b:	83 ec 0c             	sub    $0xc,%esp
 99e:	50                   	push   %eax
 99f:	e8 41 fd ff ff       	call   6e5 <sbrk>
  if(p == (char*)-1)
 9a4:	83 c4 10             	add    $0x10,%esp
 9a7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9aa:	74 1c                	je     9c8 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 9ac:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9af:	83 c0 08             	add    $0x8,%eax
 9b2:	83 ec 0c             	sub    $0xc,%esp
 9b5:	50                   	push   %eax
 9b6:	e8 50 ff ff ff       	call   90b <free>
  return freep;
 9bb:	a1 a0 0e 00 00       	mov    0xea0,%eax
 9c0:	83 c4 10             	add    $0x10,%esp
}
 9c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9c6:	c9                   	leave  
 9c7:	c3                   	ret    
    return 0;
 9c8:	b8 00 00 00 00       	mov    $0x0,%eax
 9cd:	eb f4                	jmp    9c3 <morecore+0x44>

000009cf <malloc>:

void*
malloc(uint nbytes)
{
 9cf:	f3 0f 1e fb          	endbr32 
 9d3:	55                   	push   %ebp
 9d4:	89 e5                	mov    %esp,%ebp
 9d6:	53                   	push   %ebx
 9d7:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9da:	8b 45 08             	mov    0x8(%ebp),%eax
 9dd:	8d 58 07             	lea    0x7(%eax),%ebx
 9e0:	c1 eb 03             	shr    $0x3,%ebx
 9e3:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 9e6:	8b 0d a0 0e 00 00    	mov    0xea0,%ecx
 9ec:	85 c9                	test   %ecx,%ecx
 9ee:	74 04                	je     9f4 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f0:	8b 01                	mov    (%ecx),%eax
 9f2:	eb 4b                	jmp    a3f <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 9f4:	c7 05 a0 0e 00 00 a4 	movl   $0xea4,0xea0
 9fb:	0e 00 00 
 9fe:	c7 05 a4 0e 00 00 a4 	movl   $0xea4,0xea4
 a05:	0e 00 00 
    base.s.size = 0;
 a08:	c7 05 a8 0e 00 00 00 	movl   $0x0,0xea8
 a0f:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a12:	b9 a4 0e 00 00       	mov    $0xea4,%ecx
 a17:	eb d7                	jmp    9f0 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a19:	74 1a                	je     a35 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a1b:	29 da                	sub    %ebx,%edx
 a1d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a20:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a23:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a26:	89 0d a0 0e 00 00    	mov    %ecx,0xea0
      return (void*)(p + 1);
 a2c:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a2f:	83 c4 04             	add    $0x4,%esp
 a32:	5b                   	pop    %ebx
 a33:	5d                   	pop    %ebp
 a34:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a35:	8b 10                	mov    (%eax),%edx
 a37:	89 11                	mov    %edx,(%ecx)
 a39:	eb eb                	jmp    a26 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3b:	89 c1                	mov    %eax,%ecx
 a3d:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 a3f:	8b 50 04             	mov    0x4(%eax),%edx
 a42:	39 da                	cmp    %ebx,%edx
 a44:	73 d3                	jae    a19 <malloc+0x4a>
    if(p == freep)
 a46:	39 05 a0 0e 00 00    	cmp    %eax,0xea0
 a4c:	75 ed                	jne    a3b <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 a4e:	89 d8                	mov    %ebx,%eax
 a50:	e8 2a ff ff ff       	call   97f <morecore>
 a55:	85 c0                	test   %eax,%eax
 a57:	75 e2                	jne    a3b <malloc+0x6c>
 a59:	eb d4                	jmp    a2f <malloc+0x60>
