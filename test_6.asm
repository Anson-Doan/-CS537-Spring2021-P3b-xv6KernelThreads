
_test_6:     file format elf32-i386


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
  20:	a1 48 0f 00 00       	mov    0xf48,%eax
  25:	83 f8 01             	cmp    $0x1,%eax
  28:	0f 84 db 00 00 00    	je     109 <worker+0x109>
  2e:	6a 39                	push   $0x39
  30:	68 e0 0a 00 00       	push   $0xae0
  35:	68 e9 0a 00 00       	push   $0xae9
  3a:	6a 01                	push   $0x1
  3c:	e8 df 07 00 00       	call   820 <printf>
  41:	83 c4 0c             	add    $0xc,%esp
  44:	68 28 0b 00 00       	push   $0xb28
  49:	68 fc 0a 00 00       	push   $0xafc
  4e:	6a 01                	push   $0x1
  50:	e8 cb 07 00 00       	call   820 <printf>
  55:	83 c4 08             	add    $0x8,%esp
  58:	68 10 0b 00 00       	push   $0xb10
  5d:	6a 01                	push   $0x1
  5f:	e8 bc 07 00 00       	call   820 <printf>
  64:	83 c4 04             	add    $0x4,%esp
  67:	ff 35 6c 0f 00 00    	pushl  0xf6c
  6d:	e8 9d 06 00 00       	call   70f <kill>
  72:	e8 60 06 00 00       	call   6d7 <exit>
   assert(tmp1 == 42);
  77:	6a 37                	push   $0x37
  79:	68 e0 0a 00 00       	push   $0xae0
  7e:	68 e9 0a 00 00       	push   $0xae9
  83:	6a 01                	push   $0x1
  85:	e8 96 07 00 00       	call   820 <printf>
  8a:	83 c4 0c             	add    $0xc,%esp
  8d:	68 f1 0a 00 00       	push   $0xaf1
  92:	68 fc 0a 00 00       	push   $0xafc
  97:	6a 01                	push   $0x1
  99:	e8 82 07 00 00       	call   820 <printf>
  9e:	83 c4 08             	add    $0x8,%esp
  a1:	68 10 0b 00 00       	push   $0xb10
  a6:	6a 01                	push   $0x1
  a8:	e8 73 07 00 00       	call   820 <printf>
  ad:	83 c4 04             	add    $0x4,%esp
  b0:	ff 35 6c 0f 00 00    	pushl  0xf6c
  b6:	e8 54 06 00 00       	call   70f <kill>
  bb:	e8 17 06 00 00       	call   6d7 <exit>
   assert(tmp2 == 24);
  c0:	6a 38                	push   $0x38
  c2:	68 e0 0a 00 00       	push   $0xae0
  c7:	68 e9 0a 00 00       	push   $0xae9
  cc:	6a 01                	push   $0x1
  ce:	e8 4d 07 00 00       	call   820 <printf>
  d3:	83 c4 0c             	add    $0xc,%esp
  d6:	68 1d 0b 00 00       	push   $0xb1d
  db:	68 fc 0a 00 00       	push   $0xafc
  e0:	6a 01                	push   $0x1
  e2:	e8 39 07 00 00       	call   820 <printf>
  e7:	83 c4 08             	add    $0x8,%esp
  ea:	68 10 0b 00 00       	push   $0xb10
  ef:	6a 01                	push   $0x1
  f1:	e8 2a 07 00 00       	call   820 <printf>
  f6:	83 c4 04             	add    $0x4,%esp
  f9:	ff 35 6c 0f 00 00    	pushl  0xf6c
  ff:	e8 0b 06 00 00       	call   70f <kill>
 104:	e8 ce 05 00 00       	call   6d7 <exit>
   global++;
 109:	83 c0 01             	add    $0x1,%eax
 10c:	a3 48 0f 00 00       	mov    %eax,0xf48
   exit();
 111:	e8 c1 05 00 00       	call   6d7 <exit>

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
 12b:	83 ec 28             	sub    $0x28,%esp
   ppid = getpid();
 12e:	e8 2c 06 00 00       	call   75f <getpid>
 133:	a3 6c 0f 00 00       	mov    %eax,0xf6c
   void *stack, *p = malloc(PGSIZE * 2);
 138:	83 ec 0c             	sub    $0xc,%esp
 13b:	68 00 20 00 00       	push   $0x2000
 140:	e8 0c 09 00 00       	call   a51 <malloc>
   assert(p != NULL);
 145:	83 c4 10             	add    $0x10,%esp
 148:	85 c0                	test   %eax,%eax
 14a:	74 14                	je     160 <main+0x4a>
 14c:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE)
 14e:	25 ff 0f 00 00       	and    $0xfff,%eax
 153:	74 54                	je     1a9 <main+0x93>
     stack = p + (PGSIZE - (uint)p % PGSIZE);
 155:	be 00 10 00 00       	mov    $0x1000,%esi
 15a:	29 c6                	sub    %eax,%esi
 15c:	01 de                	add    %ebx,%esi
 15e:	eb 4b                	jmp    1ab <main+0x95>
   assert(p != NULL);
 160:	6a 1d                	push   $0x1d
 162:	68 e0 0a 00 00       	push   $0xae0
 167:	68 e9 0a 00 00       	push   $0xae9
 16c:	6a 01                	push   $0x1
 16e:	e8 ad 06 00 00       	call   820 <printf>
 173:	83 c4 0c             	add    $0xc,%esp
 176:	68 34 0b 00 00       	push   $0xb34
 17b:	68 fc 0a 00 00       	push   $0xafc
 180:	6a 01                	push   $0x1
 182:	e8 99 06 00 00       	call   820 <printf>
 187:	83 c4 08             	add    $0x8,%esp
 18a:	68 10 0b 00 00       	push   $0xb10
 18f:	6a 01                	push   $0x1
 191:	e8 8a 06 00 00       	call   820 <printf>
 196:	83 c4 04             	add    $0x4,%esp
 199:	ff 35 6c 0f 00 00    	pushl  0xf6c
 19f:	e8 6b 05 00 00       	call   70f <kill>
 1a4:	e8 2e 05 00 00       	call   6d7 <exit>
     stack = p;
 1a9:	89 de                	mov    %ebx,%esi
   int arg1 = 42, arg2 = 24;
 1ab:	c7 45 e4 2a 00 00 00 	movl   $0x2a,-0x1c(%ebp)
 1b2:	c7 45 e0 18 00 00 00 	movl   $0x18,-0x20(%ebp)
   int clone_pid = clone(worker, &arg1, &arg2, stack);
 1b9:	56                   	push   %esi
 1ba:	8d 45 e0             	lea    -0x20(%ebp),%eax
 1bd:	50                   	push   %eax
 1be:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 1c1:	50                   	push   %eax
 1c2:	68 00 00 00 00       	push   $0x0
 1c7:	e8 03 05 00 00       	call   6cf <clone>
 1cc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   assert(clone_pid > 0);
 1cf:	83 c4 10             	add    $0x10,%esp
 1d2:	85 c0                	test   %eax,%eax
 1d4:	0f 8e 81 00 00 00    	jle    25b <main+0x145>
   sbrk(PGSIZE);
 1da:	83 ec 0c             	sub    $0xc,%esp
 1dd:	68 00 10 00 00       	push   $0x1000
 1e2:	e8 80 05 00 00       	call   767 <sbrk>
   void **join_stack = (void**) ((uint)sbrk(0) - 4);
 1e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1ee:	e8 74 05 00 00       	call   767 <sbrk>
 1f3:	89 c7                	mov    %eax,%edi
 1f5:	8d 40 fc             	lea    -0x4(%eax),%eax
 1f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
   assert(join((void**)((uint)join_stack + 2)) == -1);
 1fb:	8d 47 fe             	lea    -0x2(%edi),%eax
 1fe:	89 04 24             	mov    %eax,(%esp)
 201:	e8 e1 04 00 00       	call   6e7 <join>
 206:	83 c4 10             	add    $0x10,%esp
 209:	83 f8 ff             	cmp    $0xffffffff,%eax
 20c:	0f 84 92 00 00 00    	je     2a4 <main+0x18e>
 212:	6a 29                	push   $0x29
 214:	68 e0 0a 00 00       	push   $0xae0
 219:	68 e9 0a 00 00       	push   $0xae9
 21e:	6a 01                	push   $0x1
 220:	e8 fb 05 00 00       	call   820 <printf>
 225:	83 c4 0c             	add    $0xc,%esp
 228:	68 98 0b 00 00       	push   $0xb98
 22d:	68 fc 0a 00 00       	push   $0xafc
 232:	6a 01                	push   $0x1
 234:	e8 e7 05 00 00       	call   820 <printf>
 239:	83 c4 08             	add    $0x8,%esp
 23c:	68 10 0b 00 00       	push   $0xb10
 241:	6a 01                	push   $0x1
 243:	e8 d8 05 00 00       	call   820 <printf>
 248:	83 c4 04             	add    $0x4,%esp
 24b:	ff 35 6c 0f 00 00    	pushl  0xf6c
 251:	e8 b9 04 00 00       	call   70f <kill>
 256:	e8 7c 04 00 00       	call   6d7 <exit>
   assert(clone_pid > 0);
 25b:	6a 25                	push   $0x25
 25d:	68 e0 0a 00 00       	push   $0xae0
 262:	68 e9 0a 00 00       	push   $0xae9
 267:	6a 01                	push   $0x1
 269:	e8 b2 05 00 00       	call   820 <printf>
 26e:	83 c4 0c             	add    $0xc,%esp
 271:	68 3e 0b 00 00       	push   $0xb3e
 276:	68 fc 0a 00 00       	push   $0xafc
 27b:	6a 01                	push   $0x1
 27d:	e8 9e 05 00 00       	call   820 <printf>
 282:	83 c4 08             	add    $0x8,%esp
 285:	68 10 0b 00 00       	push   $0xb10
 28a:	6a 01                	push   $0x1
 28c:	e8 8f 05 00 00       	call   820 <printf>
 291:	83 c4 04             	add    $0x4,%esp
 294:	ff 35 6c 0f 00 00    	pushl  0xf6c
 29a:	e8 70 04 00 00       	call   70f <kill>
 29f:	e8 33 04 00 00       	call   6d7 <exit>
   assert(join(join_stack) == clone_pid);
 2a4:	83 ec 0c             	sub    $0xc,%esp
 2a7:	ff 75 d0             	pushl  -0x30(%ebp)
 2aa:	e8 38 04 00 00       	call   6e7 <join>
 2af:	83 c4 10             	add    $0x10,%esp
 2b2:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
 2b5:	75 52                	jne    309 <main+0x1f3>
   assert(stack == *join_stack);
 2b7:	39 77 fc             	cmp    %esi,-0x4(%edi)
 2ba:	0f 84 92 00 00 00    	je     352 <main+0x23c>
 2c0:	6a 2b                	push   $0x2b
 2c2:	68 e0 0a 00 00       	push   $0xae0
 2c7:	68 e9 0a 00 00       	push   $0xae9
 2cc:	6a 01                	push   $0x1
 2ce:	e8 4d 05 00 00       	call   820 <printf>
 2d3:	83 c4 0c             	add    $0xc,%esp
 2d6:	68 6a 0b 00 00       	push   $0xb6a
 2db:	68 fc 0a 00 00       	push   $0xafc
 2e0:	6a 01                	push   $0x1
 2e2:	e8 39 05 00 00       	call   820 <printf>
 2e7:	83 c4 08             	add    $0x8,%esp
 2ea:	68 10 0b 00 00       	push   $0xb10
 2ef:	6a 01                	push   $0x1
 2f1:	e8 2a 05 00 00       	call   820 <printf>
 2f6:	83 c4 04             	add    $0x4,%esp
 2f9:	ff 35 6c 0f 00 00    	pushl  0xf6c
 2ff:	e8 0b 04 00 00       	call   70f <kill>
 304:	e8 ce 03 00 00       	call   6d7 <exit>
   assert(join(join_stack) == clone_pid);
 309:	6a 2a                	push   $0x2a
 30b:	68 e0 0a 00 00       	push   $0xae0
 310:	68 e9 0a 00 00       	push   $0xae9
 315:	6a 01                	push   $0x1
 317:	e8 04 05 00 00       	call   820 <printf>
 31c:	83 c4 0c             	add    $0xc,%esp
 31f:	68 4c 0b 00 00       	push   $0xb4c
 324:	68 fc 0a 00 00       	push   $0xafc
 329:	6a 01                	push   $0x1
 32b:	e8 f0 04 00 00       	call   820 <printf>
 330:	83 c4 08             	add    $0x8,%esp
 333:	68 10 0b 00 00       	push   $0xb10
 338:	6a 01                	push   $0x1
 33a:	e8 e1 04 00 00       	call   820 <printf>
 33f:	83 c4 04             	add    $0x4,%esp
 342:	ff 35 6c 0f 00 00    	pushl  0xf6c
 348:	e8 c2 03 00 00       	call   70f <kill>
 34d:	e8 85 03 00 00       	call   6d7 <exit>
   assert(global == 2);
 352:	83 3d 48 0f 00 00 02 	cmpl   $0x2,0xf48
 359:	74 49                	je     3a4 <main+0x28e>
 35b:	6a 2c                	push   $0x2c
 35d:	68 e0 0a 00 00       	push   $0xae0
 362:	68 e9 0a 00 00       	push   $0xae9
 367:	6a 01                	push   $0x1
 369:	e8 b2 04 00 00       	call   820 <printf>
 36e:	83 c4 0c             	add    $0xc,%esp
 371:	68 7f 0b 00 00       	push   $0xb7f
 376:	68 fc 0a 00 00       	push   $0xafc
 37b:	6a 01                	push   $0x1
 37d:	e8 9e 04 00 00       	call   820 <printf>
 382:	83 c4 08             	add    $0x8,%esp
 385:	68 10 0b 00 00       	push   $0xb10
 38a:	6a 01                	push   $0x1
 38c:	e8 8f 04 00 00       	call   820 <printf>
 391:	83 c4 04             	add    $0x4,%esp
 394:	ff 35 6c 0f 00 00    	pushl  0xf6c
 39a:	e8 70 03 00 00       	call   70f <kill>
 39f:	e8 33 03 00 00       	call   6d7 <exit>
   printf(1, "TEST PASSED\n");
 3a4:	83 ec 08             	sub    $0x8,%esp
 3a7:	68 8b 0b 00 00       	push   $0xb8b
 3ac:	6a 01                	push   $0x1
 3ae:	e8 6d 04 00 00       	call   820 <printf>
   free(p);
 3b3:	89 1c 24             	mov    %ebx,(%esp)
 3b6:	e8 d2 05 00 00       	call   98d <free>
   exit();
 3bb:	e8 17 03 00 00       	call   6d7 <exit>

000003c0 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 3c0:	f3 0f 1e fb          	endbr32 
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	56                   	push   %esi
 3c8:	53                   	push   %ebx
 3c9:	8b 75 08             	mov    0x8(%ebp),%esi
 3cc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3cf:	89 f0                	mov    %esi,%eax
 3d1:	89 d1                	mov    %edx,%ecx
 3d3:	83 c2 01             	add    $0x1,%edx
 3d6:	89 c3                	mov    %eax,%ebx
 3d8:	83 c0 01             	add    $0x1,%eax
 3db:	0f b6 09             	movzbl (%ecx),%ecx
 3de:	88 0b                	mov    %cl,(%ebx)
 3e0:	84 c9                	test   %cl,%cl
 3e2:	75 ed                	jne    3d1 <strcpy+0x11>
    ;
  return os;
}
 3e4:	89 f0                	mov    %esi,%eax
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5d                   	pop    %ebp
 3e9:	c3                   	ret    

000003ea <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3ea:	f3 0f 1e fb          	endbr32 
 3ee:	55                   	push   %ebp
 3ef:	89 e5                	mov    %esp,%ebp
 3f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3f4:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3f7:	0f b6 01             	movzbl (%ecx),%eax
 3fa:	84 c0                	test   %al,%al
 3fc:	74 0c                	je     40a <strcmp+0x20>
 3fe:	3a 02                	cmp    (%edx),%al
 400:	75 08                	jne    40a <strcmp+0x20>
    p++, q++;
 402:	83 c1 01             	add    $0x1,%ecx
 405:	83 c2 01             	add    $0x1,%edx
 408:	eb ed                	jmp    3f7 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 40a:	0f b6 c0             	movzbl %al,%eax
 40d:	0f b6 12             	movzbl (%edx),%edx
 410:	29 d0                	sub    %edx,%eax
}
 412:	5d                   	pop    %ebp
 413:	c3                   	ret    

00000414 <strlen>:

uint
strlen(const char *s)
{
 414:	f3 0f 1e fb          	endbr32 
 418:	55                   	push   %ebp
 419:	89 e5                	mov    %esp,%ebp
 41b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 41e:	b8 00 00 00 00       	mov    $0x0,%eax
 423:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 427:	74 05                	je     42e <strlen+0x1a>
 429:	83 c0 01             	add    $0x1,%eax
 42c:	eb f5                	jmp    423 <strlen+0xf>
    ;
  return n;
}
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    

00000430 <memset>:

void*
memset(void *dst, int c, uint n)
{
 430:	f3 0f 1e fb          	endbr32 
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	57                   	push   %edi
 438:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 43b:	89 d7                	mov    %edx,%edi
 43d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	fc                   	cld    
 444:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 446:	89 d0                	mov    %edx,%eax
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    

0000044b <strchr>:

char*
strchr(const char *s, char c)
{
 44b:	f3 0f 1e fb          	endbr32 
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	8b 45 08             	mov    0x8(%ebp),%eax
 455:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 459:	0f b6 10             	movzbl (%eax),%edx
 45c:	84 d2                	test   %dl,%dl
 45e:	74 09                	je     469 <strchr+0x1e>
    if(*s == c)
 460:	38 ca                	cmp    %cl,%dl
 462:	74 0a                	je     46e <strchr+0x23>
  for(; *s; s++)
 464:	83 c0 01             	add    $0x1,%eax
 467:	eb f0                	jmp    459 <strchr+0xe>
      return (char*)s;
  return 0;
 469:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46e:	5d                   	pop    %ebp
 46f:	c3                   	ret    

00000470 <gets>:

char*
gets(char *buf, int max)
{
 470:	f3 0f 1e fb          	endbr32 
 474:	55                   	push   %ebp
 475:	89 e5                	mov    %esp,%ebp
 477:	57                   	push   %edi
 478:	56                   	push   %esi
 479:	53                   	push   %ebx
 47a:	83 ec 1c             	sub    $0x1c,%esp
 47d:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 480:	bb 00 00 00 00       	mov    $0x0,%ebx
 485:	89 de                	mov    %ebx,%esi
 487:	83 c3 01             	add    $0x1,%ebx
 48a:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 48d:	7d 2e                	jge    4bd <gets+0x4d>
    cc = read(0, &c, 1);
 48f:	83 ec 04             	sub    $0x4,%esp
 492:	6a 01                	push   $0x1
 494:	8d 45 e7             	lea    -0x19(%ebp),%eax
 497:	50                   	push   %eax
 498:	6a 00                	push   $0x0
 49a:	e8 58 02 00 00       	call   6f7 <read>
    if(cc < 1)
 49f:	83 c4 10             	add    $0x10,%esp
 4a2:	85 c0                	test   %eax,%eax
 4a4:	7e 17                	jle    4bd <gets+0x4d>
      break;
    buf[i++] = c;
 4a6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 4aa:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 4ad:	3c 0a                	cmp    $0xa,%al
 4af:	0f 94 c2             	sete   %dl
 4b2:	3c 0d                	cmp    $0xd,%al
 4b4:	0f 94 c0             	sete   %al
 4b7:	08 c2                	or     %al,%dl
 4b9:	74 ca                	je     485 <gets+0x15>
    buf[i++] = c;
 4bb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 4bd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4c1:	89 f8                	mov    %edi,%eax
 4c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4c6:	5b                   	pop    %ebx
 4c7:	5e                   	pop    %esi
 4c8:	5f                   	pop    %edi
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret    

000004cb <stat>:

int
stat(const char *n, struct stat *st)
{
 4cb:	f3 0f 1e fb          	endbr32 
 4cf:	55                   	push   %ebp
 4d0:	89 e5                	mov    %esp,%ebp
 4d2:	56                   	push   %esi
 4d3:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d4:	83 ec 08             	sub    $0x8,%esp
 4d7:	6a 00                	push   $0x0
 4d9:	ff 75 08             	pushl  0x8(%ebp)
 4dc:	e8 3e 02 00 00       	call   71f <open>
  if(fd < 0)
 4e1:	83 c4 10             	add    $0x10,%esp
 4e4:	85 c0                	test   %eax,%eax
 4e6:	78 24                	js     50c <stat+0x41>
 4e8:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4ea:	83 ec 08             	sub    $0x8,%esp
 4ed:	ff 75 0c             	pushl  0xc(%ebp)
 4f0:	50                   	push   %eax
 4f1:	e8 41 02 00 00       	call   737 <fstat>
 4f6:	89 c6                	mov    %eax,%esi
  close(fd);
 4f8:	89 1c 24             	mov    %ebx,(%esp)
 4fb:	e8 07 02 00 00       	call   707 <close>
  return r;
 500:	83 c4 10             	add    $0x10,%esp
}
 503:	89 f0                	mov    %esi,%eax
 505:	8d 65 f8             	lea    -0x8(%ebp),%esp
 508:	5b                   	pop    %ebx
 509:	5e                   	pop    %esi
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret    
    return -1;
 50c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 511:	eb f0                	jmp    503 <stat+0x38>

00000513 <atoi>:

int
atoi(const char *s)
{
 513:	f3 0f 1e fb          	endbr32 
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	53                   	push   %ebx
 51b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 51e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 523:	0f b6 01             	movzbl (%ecx),%eax
 526:	8d 58 d0             	lea    -0x30(%eax),%ebx
 529:	80 fb 09             	cmp    $0x9,%bl
 52c:	77 12                	ja     540 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 52e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 531:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 534:	83 c1 01             	add    $0x1,%ecx
 537:	0f be c0             	movsbl %al,%eax
 53a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 53e:	eb e3                	jmp    523 <atoi+0x10>
  return n;
}
 540:	89 d0                	mov    %edx,%eax
 542:	5b                   	pop    %ebx
 543:	5d                   	pop    %ebp
 544:	c3                   	ret    

00000545 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 545:	f3 0f 1e fb          	endbr32 
 549:	55                   	push   %ebp
 54a:	89 e5                	mov    %esp,%ebp
 54c:	56                   	push   %esi
 54d:	53                   	push   %ebx
 54e:	8b 75 08             	mov    0x8(%ebp),%esi
 551:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 554:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 557:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 559:	8d 58 ff             	lea    -0x1(%eax),%ebx
 55c:	85 c0                	test   %eax,%eax
 55e:	7e 0f                	jle    56f <memmove+0x2a>
    *dst++ = *src++;
 560:	0f b6 01             	movzbl (%ecx),%eax
 563:	88 02                	mov    %al,(%edx)
 565:	8d 49 01             	lea    0x1(%ecx),%ecx
 568:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 56b:	89 d8                	mov    %ebx,%eax
 56d:	eb ea                	jmp    559 <memmove+0x14>
  return vdst;
}
 56f:	89 f0                	mov    %esi,%eax
 571:	5b                   	pop    %ebx
 572:	5e                   	pop    %esi
 573:	5d                   	pop    %ebp
 574:	c3                   	ret    

00000575 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 575:	f3 0f 1e fb          	endbr32 
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	53                   	push   %ebx
 57d:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 580:	68 00 20 00 00       	push   $0x2000
 585:	e8 c7 04 00 00       	call   a51 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 58a:	83 c4 10             	add    $0x10,%esp
 58d:	89 c2                	mov    %eax,%edx
 58f:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 595:	74 22                	je     5b9 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 597:	b9 00 10 00 00       	mov    $0x1000,%ecx
 59c:	29 d1                	sub    %edx,%ecx
 59e:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 5a0:	ba 00 00 00 00       	mov    $0x0,%edx
 5a5:	83 fa 3f             	cmp    $0x3f,%edx
 5a8:	7f 13                	jg     5bd <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 5aa:	83 3c 95 80 12 00 00 	cmpl   $0x1,0x1280(,%edx,4)
 5b1:	01 
 5b2:	75 09                	jne    5bd <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 5b4:	83 c2 01             	add    $0x1,%edx
 5b7:	eb ec                	jmp    5a5 <thread_create+0x30>
  void *user_stack = curr_ptr;
 5b9:	89 c1                	mov    %eax,%ecx
 5bb:	eb e3                	jmp    5a0 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 5bd:	83 3c 95 80 12 00 00 	cmpl   $0x1,0x1280(,%edx,4)
 5c4:	01 
 5c5:	74 34                	je     5fb <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 5c7:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 5ca:	c1 e3 02             	shl    $0x2,%ebx
 5cd:	89 83 80 0f 00 00    	mov    %eax,0xf80(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 5d3:	89 8b 84 0f 00 00    	mov    %ecx,0xf84(%ebx)
  cell_full[i] = 1;
 5d9:	c7 04 95 80 12 00 00 	movl   $0x1,0x1280(,%edx,4)
 5e0:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 5e4:	ff 75 10             	pushl  0x10(%ebp)
 5e7:	ff 75 0c             	pushl  0xc(%ebp)
 5ea:	ff 75 08             	pushl  0x8(%ebp)
 5ed:	51                   	push   %ecx
 5ee:	e8 dc 00 00 00       	call   6cf <clone>
 5f3:	83 c4 10             	add    $0x10,%esp
}
 5f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5f9:	c9                   	leave  
 5fa:	c3                   	ret    
    return -1;
 5fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 600:	eb f4                	jmp    5f6 <thread_create+0x81>

00000602 <thread_join>:

int thread_join(){
 602:	f3 0f 1e fb          	endbr32 
 606:	55                   	push   %ebp
 607:	89 e5                	mov    %esp,%ebp
 609:	56                   	push   %esi
 60a:	53                   	push   %ebx
 60b:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 60e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 611:	50                   	push   %eax
 612:	e8 d0 00 00 00       	call   6e7 <join>
 617:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 619:	83 c4 10             	add    $0x10,%esp
 61c:	bb 00 00 00 00       	mov    $0x0,%ebx
 621:	83 fb 3f             	cmp    $0x3f,%ebx
 624:	7f 14                	jg     63a <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 626:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 629:	8b 55 f4             	mov    -0xc(%ebp),%edx
 62c:	39 14 85 84 0f 00 00 	cmp    %edx,0xf84(,%eax,4)
 633:	74 05                	je     63a <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 635:	83 c3 01             	add    $0x1,%ebx
 638:	eb e7                	jmp    621 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 63a:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 63d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 640:	39 0c 85 84 0f 00 00 	cmp    %ecx,0xf84(,%eax,4)
 647:	75 26                	jne    66f <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 649:	83 ec 0c             	sub    $0xc,%esp
 64c:	ff 34 85 80 0f 00 00 	pushl  0xf80(,%eax,4)
 653:	e8 35 03 00 00       	call   98d <free>
  cell_full[i] = 0;
 658:	c7 04 9d 80 12 00 00 	movl   $0x0,0x1280(,%ebx,4)
 65f:	00 00 00 00 

  return out;
 663:	83 c4 10             	add    $0x10,%esp
}
 666:	89 f0                	mov    %esi,%eax
 668:	8d 65 f8             	lea    -0x8(%ebp),%esp
 66b:	5b                   	pop    %ebx
 66c:	5e                   	pop    %esi
 66d:	5d                   	pop    %ebp
 66e:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 66f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 674:	eb f0                	jmp    666 <thread_join+0x64>

00000676 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 676:	f3 0f 1e fb          	endbr32 
 67a:	55                   	push   %ebp
 67b:	89 e5                	mov    %esp,%ebp
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 680:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 686:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 68d:	5d                   	pop    %ebp
 68e:	c3                   	ret    

0000068f <lock_acquire>:

void lock_acquire(lock_t *lock) {
 68f:	f3 0f 1e fb          	endbr32 
 693:	55                   	push   %ebp
 694:	89 e5                	mov    %esp,%ebp
 696:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 699:	b9 01 00 00 00       	mov    $0x1,%ecx
 69e:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 6a2:	b8 00 00 00 00       	mov    $0x0,%eax
 6a7:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 6ac:	39 c1                	cmp    %eax,%ecx
 6ae:	75 f2                	jne    6a2 <lock_acquire+0x13>
      ; // spin
    }
}
 6b0:	5d                   	pop    %ebp
 6b1:	c3                   	ret    

000006b2 <lock_release>:

void lock_release(lock_t *lock) {
 6b2:	f3 0f 1e fb          	endbr32 
 6b6:	55                   	push   %ebp
 6b7:	89 e5                	mov    %esp,%ebp
 6b9:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 6bc:	8b 42 04             	mov    0x4(%edx),%eax
 6bf:	83 c0 01             	add    $0x1,%eax
 6c2:	89 42 04             	mov    %eax,0x4(%edx)
}
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret    

000006c7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6c7:	b8 01 00 00 00       	mov    $0x1,%eax
 6cc:	cd 40                	int    $0x40
 6ce:	c3                   	ret    

000006cf <clone>:
SYSCALL(clone)
 6cf:	b8 16 00 00 00       	mov    $0x16,%eax
 6d4:	cd 40                	int    $0x40
 6d6:	c3                   	ret    

000006d7 <exit>:
SYSCALL(exit)
 6d7:	b8 02 00 00 00       	mov    $0x2,%eax
 6dc:	cd 40                	int    $0x40
 6de:	c3                   	ret    

000006df <wait>:
SYSCALL(wait)
 6df:	b8 03 00 00 00       	mov    $0x3,%eax
 6e4:	cd 40                	int    $0x40
 6e6:	c3                   	ret    

000006e7 <join>:
SYSCALL(join)
 6e7:	b8 17 00 00 00       	mov    $0x17,%eax
 6ec:	cd 40                	int    $0x40
 6ee:	c3                   	ret    

000006ef <pipe>:
SYSCALL(pipe)
 6ef:	b8 04 00 00 00       	mov    $0x4,%eax
 6f4:	cd 40                	int    $0x40
 6f6:	c3                   	ret    

000006f7 <read>:
SYSCALL(read)
 6f7:	b8 05 00 00 00       	mov    $0x5,%eax
 6fc:	cd 40                	int    $0x40
 6fe:	c3                   	ret    

000006ff <write>:
SYSCALL(write)
 6ff:	b8 10 00 00 00       	mov    $0x10,%eax
 704:	cd 40                	int    $0x40
 706:	c3                   	ret    

00000707 <close>:
SYSCALL(close)
 707:	b8 15 00 00 00       	mov    $0x15,%eax
 70c:	cd 40                	int    $0x40
 70e:	c3                   	ret    

0000070f <kill>:
SYSCALL(kill)
 70f:	b8 06 00 00 00       	mov    $0x6,%eax
 714:	cd 40                	int    $0x40
 716:	c3                   	ret    

00000717 <exec>:
SYSCALL(exec)
 717:	b8 07 00 00 00       	mov    $0x7,%eax
 71c:	cd 40                	int    $0x40
 71e:	c3                   	ret    

0000071f <open>:
SYSCALL(open)
 71f:	b8 0f 00 00 00       	mov    $0xf,%eax
 724:	cd 40                	int    $0x40
 726:	c3                   	ret    

00000727 <mknod>:
SYSCALL(mknod)
 727:	b8 11 00 00 00       	mov    $0x11,%eax
 72c:	cd 40                	int    $0x40
 72e:	c3                   	ret    

0000072f <unlink>:
SYSCALL(unlink)
 72f:	b8 12 00 00 00       	mov    $0x12,%eax
 734:	cd 40                	int    $0x40
 736:	c3                   	ret    

00000737 <fstat>:
SYSCALL(fstat)
 737:	b8 08 00 00 00       	mov    $0x8,%eax
 73c:	cd 40                	int    $0x40
 73e:	c3                   	ret    

0000073f <link>:
SYSCALL(link)
 73f:	b8 13 00 00 00       	mov    $0x13,%eax
 744:	cd 40                	int    $0x40
 746:	c3                   	ret    

00000747 <mkdir>:
SYSCALL(mkdir)
 747:	b8 14 00 00 00       	mov    $0x14,%eax
 74c:	cd 40                	int    $0x40
 74e:	c3                   	ret    

0000074f <chdir>:
SYSCALL(chdir)
 74f:	b8 09 00 00 00       	mov    $0x9,%eax
 754:	cd 40                	int    $0x40
 756:	c3                   	ret    

00000757 <dup>:
SYSCALL(dup)
 757:	b8 0a 00 00 00       	mov    $0xa,%eax
 75c:	cd 40                	int    $0x40
 75e:	c3                   	ret    

0000075f <getpid>:
SYSCALL(getpid)
 75f:	b8 0b 00 00 00       	mov    $0xb,%eax
 764:	cd 40                	int    $0x40
 766:	c3                   	ret    

00000767 <sbrk>:
SYSCALL(sbrk)
 767:	b8 0c 00 00 00       	mov    $0xc,%eax
 76c:	cd 40                	int    $0x40
 76e:	c3                   	ret    

0000076f <sleep>:
SYSCALL(sleep)
 76f:	b8 0d 00 00 00       	mov    $0xd,%eax
 774:	cd 40                	int    $0x40
 776:	c3                   	ret    

00000777 <uptime>:
SYSCALL(uptime)
 777:	b8 0e 00 00 00       	mov    $0xe,%eax
 77c:	cd 40                	int    $0x40
 77e:	c3                   	ret    

0000077f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 77f:	55                   	push   %ebp
 780:	89 e5                	mov    %esp,%ebp
 782:	83 ec 1c             	sub    $0x1c,%esp
 785:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 788:	6a 01                	push   $0x1
 78a:	8d 55 f4             	lea    -0xc(%ebp),%edx
 78d:	52                   	push   %edx
 78e:	50                   	push   %eax
 78f:	e8 6b ff ff ff       	call   6ff <write>
}
 794:	83 c4 10             	add    $0x10,%esp
 797:	c9                   	leave  
 798:	c3                   	ret    

00000799 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 799:	55                   	push   %ebp
 79a:	89 e5                	mov    %esp,%ebp
 79c:	57                   	push   %edi
 79d:	56                   	push   %esi
 79e:	53                   	push   %ebx
 79f:	83 ec 2c             	sub    $0x2c,%esp
 7a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7a5:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 7ab:	0f 95 c2             	setne  %dl
 7ae:	89 f0                	mov    %esi,%eax
 7b0:	c1 e8 1f             	shr    $0x1f,%eax
 7b3:	84 c2                	test   %al,%dl
 7b5:	74 42                	je     7f9 <printint+0x60>
    neg = 1;
    x = -xx;
 7b7:	f7 de                	neg    %esi
    neg = 1;
 7b9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7c0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7c5:	89 f0                	mov    %esi,%eax
 7c7:	ba 00 00 00 00       	mov    $0x0,%edx
 7cc:	f7 f1                	div    %ecx
 7ce:	89 df                	mov    %ebx,%edi
 7d0:	83 c3 01             	add    $0x1,%ebx
 7d3:	0f b6 92 cc 0b 00 00 	movzbl 0xbcc(%edx),%edx
 7da:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7de:	89 f2                	mov    %esi,%edx
 7e0:	89 c6                	mov    %eax,%esi
 7e2:	39 d1                	cmp    %edx,%ecx
 7e4:	76 df                	jbe    7c5 <printint+0x2c>
  if(neg)
 7e6:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7ea:	74 2f                	je     81b <printint+0x82>
    buf[i++] = '-';
 7ec:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7f1:	8d 5f 02             	lea    0x2(%edi),%ebx
 7f4:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7f7:	eb 15                	jmp    80e <printint+0x75>
  neg = 0;
 7f9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 800:	eb be                	jmp    7c0 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 802:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 807:	89 f0                	mov    %esi,%eax
 809:	e8 71 ff ff ff       	call   77f <putc>
  while(--i >= 0)
 80e:	83 eb 01             	sub    $0x1,%ebx
 811:	79 ef                	jns    802 <printint+0x69>
}
 813:	83 c4 2c             	add    $0x2c,%esp
 816:	5b                   	pop    %ebx
 817:	5e                   	pop    %esi
 818:	5f                   	pop    %edi
 819:	5d                   	pop    %ebp
 81a:	c3                   	ret    
 81b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 81e:	eb ee                	jmp    80e <printint+0x75>

00000820 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 820:	f3 0f 1e fb          	endbr32 
 824:	55                   	push   %ebp
 825:	89 e5                	mov    %esp,%ebp
 827:	57                   	push   %edi
 828:	56                   	push   %esi
 829:	53                   	push   %ebx
 82a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 82d:	8d 45 10             	lea    0x10(%ebp),%eax
 830:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 833:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 838:	bb 00 00 00 00       	mov    $0x0,%ebx
 83d:	eb 14                	jmp    853 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 83f:	89 fa                	mov    %edi,%edx
 841:	8b 45 08             	mov    0x8(%ebp),%eax
 844:	e8 36 ff ff ff       	call   77f <putc>
 849:	eb 05                	jmp    850 <printf+0x30>
      }
    } else if(state == '%'){
 84b:	83 fe 25             	cmp    $0x25,%esi
 84e:	74 25                	je     875 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 850:	83 c3 01             	add    $0x1,%ebx
 853:	8b 45 0c             	mov    0xc(%ebp),%eax
 856:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 85a:	84 c0                	test   %al,%al
 85c:	0f 84 23 01 00 00    	je     985 <printf+0x165>
    c = fmt[i] & 0xff;
 862:	0f be f8             	movsbl %al,%edi
 865:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 868:	85 f6                	test   %esi,%esi
 86a:	75 df                	jne    84b <printf+0x2b>
      if(c == '%'){
 86c:	83 f8 25             	cmp    $0x25,%eax
 86f:	75 ce                	jne    83f <printf+0x1f>
        state = '%';
 871:	89 c6                	mov    %eax,%esi
 873:	eb db                	jmp    850 <printf+0x30>
      if(c == 'd'){
 875:	83 f8 64             	cmp    $0x64,%eax
 878:	74 49                	je     8c3 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 87a:	83 f8 78             	cmp    $0x78,%eax
 87d:	0f 94 c1             	sete   %cl
 880:	83 f8 70             	cmp    $0x70,%eax
 883:	0f 94 c2             	sete   %dl
 886:	08 d1                	or     %dl,%cl
 888:	75 63                	jne    8ed <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 88a:	83 f8 73             	cmp    $0x73,%eax
 88d:	0f 84 84 00 00 00    	je     917 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 893:	83 f8 63             	cmp    $0x63,%eax
 896:	0f 84 b7 00 00 00    	je     953 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 89c:	83 f8 25             	cmp    $0x25,%eax
 89f:	0f 84 cc 00 00 00    	je     971 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8a5:	ba 25 00 00 00       	mov    $0x25,%edx
 8aa:	8b 45 08             	mov    0x8(%ebp),%eax
 8ad:	e8 cd fe ff ff       	call   77f <putc>
        putc(fd, c);
 8b2:	89 fa                	mov    %edi,%edx
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	e8 c3 fe ff ff       	call   77f <putc>
      }
      state = 0;
 8bc:	be 00 00 00 00       	mov    $0x0,%esi
 8c1:	eb 8d                	jmp    850 <printf+0x30>
        printint(fd, *ap, 10, 1);
 8c3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8c6:	8b 17                	mov    (%edi),%edx
 8c8:	83 ec 0c             	sub    $0xc,%esp
 8cb:	6a 01                	push   $0x1
 8cd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8d2:	8b 45 08             	mov    0x8(%ebp),%eax
 8d5:	e8 bf fe ff ff       	call   799 <printint>
        ap++;
 8da:	83 c7 04             	add    $0x4,%edi
 8dd:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8e0:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8e3:	be 00 00 00 00       	mov    $0x0,%esi
 8e8:	e9 63 ff ff ff       	jmp    850 <printf+0x30>
        printint(fd, *ap, 16, 0);
 8ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8f0:	8b 17                	mov    (%edi),%edx
 8f2:	83 ec 0c             	sub    $0xc,%esp
 8f5:	6a 00                	push   $0x0
 8f7:	b9 10 00 00 00       	mov    $0x10,%ecx
 8fc:	8b 45 08             	mov    0x8(%ebp),%eax
 8ff:	e8 95 fe ff ff       	call   799 <printint>
        ap++;
 904:	83 c7 04             	add    $0x4,%edi
 907:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 90a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 90d:	be 00 00 00 00       	mov    $0x0,%esi
 912:	e9 39 ff ff ff       	jmp    850 <printf+0x30>
        s = (char*)*ap;
 917:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 91a:	8b 30                	mov    (%eax),%esi
        ap++;
 91c:	83 c0 04             	add    $0x4,%eax
 91f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 922:	85 f6                	test   %esi,%esi
 924:	75 28                	jne    94e <printf+0x12e>
          s = "(null)";
 926:	be c3 0b 00 00       	mov    $0xbc3,%esi
 92b:	8b 7d 08             	mov    0x8(%ebp),%edi
 92e:	eb 0d                	jmp    93d <printf+0x11d>
          putc(fd, *s);
 930:	0f be d2             	movsbl %dl,%edx
 933:	89 f8                	mov    %edi,%eax
 935:	e8 45 fe ff ff       	call   77f <putc>
          s++;
 93a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 93d:	0f b6 16             	movzbl (%esi),%edx
 940:	84 d2                	test   %dl,%dl
 942:	75 ec                	jne    930 <printf+0x110>
      state = 0;
 944:	be 00 00 00 00       	mov    $0x0,%esi
 949:	e9 02 ff ff ff       	jmp    850 <printf+0x30>
 94e:	8b 7d 08             	mov    0x8(%ebp),%edi
 951:	eb ea                	jmp    93d <printf+0x11d>
        putc(fd, *ap);
 953:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 956:	0f be 17             	movsbl (%edi),%edx
 959:	8b 45 08             	mov    0x8(%ebp),%eax
 95c:	e8 1e fe ff ff       	call   77f <putc>
        ap++;
 961:	83 c7 04             	add    $0x4,%edi
 964:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 967:	be 00 00 00 00       	mov    $0x0,%esi
 96c:	e9 df fe ff ff       	jmp    850 <printf+0x30>
        putc(fd, c);
 971:	89 fa                	mov    %edi,%edx
 973:	8b 45 08             	mov    0x8(%ebp),%eax
 976:	e8 04 fe ff ff       	call   77f <putc>
      state = 0;
 97b:	be 00 00 00 00       	mov    $0x0,%esi
 980:	e9 cb fe ff ff       	jmp    850 <printf+0x30>
    }
  }
}
 985:	8d 65 f4             	lea    -0xc(%ebp),%esp
 988:	5b                   	pop    %ebx
 989:	5e                   	pop    %esi
 98a:	5f                   	pop    %edi
 98b:	5d                   	pop    %ebp
 98c:	c3                   	ret    

0000098d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 98d:	f3 0f 1e fb          	endbr32 
 991:	55                   	push   %ebp
 992:	89 e5                	mov    %esp,%ebp
 994:	57                   	push   %edi
 995:	56                   	push   %esi
 996:	53                   	push   %ebx
 997:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 99a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 99d:	a1 60 0f 00 00       	mov    0xf60,%eax
 9a2:	eb 02                	jmp    9a6 <free+0x19>
 9a4:	89 d0                	mov    %edx,%eax
 9a6:	39 c8                	cmp    %ecx,%eax
 9a8:	73 04                	jae    9ae <free+0x21>
 9aa:	39 08                	cmp    %ecx,(%eax)
 9ac:	77 12                	ja     9c0 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9ae:	8b 10                	mov    (%eax),%edx
 9b0:	39 c2                	cmp    %eax,%edx
 9b2:	77 f0                	ja     9a4 <free+0x17>
 9b4:	39 c8                	cmp    %ecx,%eax
 9b6:	72 08                	jb     9c0 <free+0x33>
 9b8:	39 ca                	cmp    %ecx,%edx
 9ba:	77 04                	ja     9c0 <free+0x33>
 9bc:	89 d0                	mov    %edx,%eax
 9be:	eb e6                	jmp    9a6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9c6:	8b 10                	mov    (%eax),%edx
 9c8:	39 d7                	cmp    %edx,%edi
 9ca:	74 19                	je     9e5 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9cc:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9cf:	8b 50 04             	mov    0x4(%eax),%edx
 9d2:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9d5:	39 ce                	cmp    %ecx,%esi
 9d7:	74 1b                	je     9f4 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9d9:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9db:	a3 60 0f 00 00       	mov    %eax,0xf60
}
 9e0:	5b                   	pop    %ebx
 9e1:	5e                   	pop    %esi
 9e2:	5f                   	pop    %edi
 9e3:	5d                   	pop    %ebp
 9e4:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9e5:	03 72 04             	add    0x4(%edx),%esi
 9e8:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9eb:	8b 10                	mov    (%eax),%edx
 9ed:	8b 12                	mov    (%edx),%edx
 9ef:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9f2:	eb db                	jmp    9cf <free+0x42>
    p->s.size += bp->s.size;
 9f4:	03 53 fc             	add    -0x4(%ebx),%edx
 9f7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9fa:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9fd:	89 10                	mov    %edx,(%eax)
 9ff:	eb da                	jmp    9db <free+0x4e>

00000a01 <morecore>:

static Header*
morecore(uint nu)
{
 a01:	55                   	push   %ebp
 a02:	89 e5                	mov    %esp,%ebp
 a04:	53                   	push   %ebx
 a05:	83 ec 04             	sub    $0x4,%esp
 a08:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a0a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a0f:	77 05                	ja     a16 <morecore+0x15>
    nu = 4096;
 a11:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a16:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a1d:	83 ec 0c             	sub    $0xc,%esp
 a20:	50                   	push   %eax
 a21:	e8 41 fd ff ff       	call   767 <sbrk>
  if(p == (char*)-1)
 a26:	83 c4 10             	add    $0x10,%esp
 a29:	83 f8 ff             	cmp    $0xffffffff,%eax
 a2c:	74 1c                	je     a4a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a2e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a31:	83 c0 08             	add    $0x8,%eax
 a34:	83 ec 0c             	sub    $0xc,%esp
 a37:	50                   	push   %eax
 a38:	e8 50 ff ff ff       	call   98d <free>
  return freep;
 a3d:	a1 60 0f 00 00       	mov    0xf60,%eax
 a42:	83 c4 10             	add    $0x10,%esp
}
 a45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a48:	c9                   	leave  
 a49:	c3                   	ret    
    return 0;
 a4a:	b8 00 00 00 00       	mov    $0x0,%eax
 a4f:	eb f4                	jmp    a45 <morecore+0x44>

00000a51 <malloc>:

void*
malloc(uint nbytes)
{
 a51:	f3 0f 1e fb          	endbr32 
 a55:	55                   	push   %ebp
 a56:	89 e5                	mov    %esp,%ebp
 a58:	53                   	push   %ebx
 a59:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a5c:	8b 45 08             	mov    0x8(%ebp),%eax
 a5f:	8d 58 07             	lea    0x7(%eax),%ebx
 a62:	c1 eb 03             	shr    $0x3,%ebx
 a65:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a68:	8b 0d 60 0f 00 00    	mov    0xf60,%ecx
 a6e:	85 c9                	test   %ecx,%ecx
 a70:	74 04                	je     a76 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a72:	8b 01                	mov    (%ecx),%eax
 a74:	eb 4b                	jmp    ac1 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 a76:	c7 05 60 0f 00 00 64 	movl   $0xf64,0xf60
 a7d:	0f 00 00 
 a80:	c7 05 64 0f 00 00 64 	movl   $0xf64,0xf64
 a87:	0f 00 00 
    base.s.size = 0;
 a8a:	c7 05 68 0f 00 00 00 	movl   $0x0,0xf68
 a91:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a94:	b9 64 0f 00 00       	mov    $0xf64,%ecx
 a99:	eb d7                	jmp    a72 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a9b:	74 1a                	je     ab7 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a9d:	29 da                	sub    %ebx,%edx
 a9f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aa2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 aa5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 aa8:	89 0d 60 0f 00 00    	mov    %ecx,0xf60
      return (void*)(p + 1);
 aae:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 ab1:	83 c4 04             	add    $0x4,%esp
 ab4:	5b                   	pop    %ebx
 ab5:	5d                   	pop    %ebp
 ab6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 ab7:	8b 10                	mov    (%eax),%edx
 ab9:	89 11                	mov    %edx,(%ecx)
 abb:	eb eb                	jmp    aa8 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 abd:	89 c1                	mov    %eax,%ecx
 abf:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 ac1:	8b 50 04             	mov    0x4(%eax),%edx
 ac4:	39 da                	cmp    %ebx,%edx
 ac6:	73 d3                	jae    a9b <malloc+0x4a>
    if(p == freep)
 ac8:	39 05 60 0f 00 00    	cmp    %eax,0xf60
 ace:	75 ed                	jne    abd <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 ad0:	89 d8                	mov    %ebx,%eax
 ad2:	e8 2a ff ff ff       	call   a01 <morecore>
 ad7:	85 c0                	test   %eax,%eax
 ad9:	75 e2                	jne    abd <malloc+0x6c>
 adb:	eb d4                	jmp    ab1 <malloc+0x60>
