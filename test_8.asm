
_test_8:     file format elf32-i386


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
  20:	a1 00 0f 00 00       	mov    0xf00,%eax
  25:	83 f8 01             	cmp    $0x1,%eax
  28:	0f 84 db 00 00 00    	je     109 <worker+0x109>
  2e:	6a 3b                	push   $0x3b
  30:	68 c0 0a 00 00       	push   $0xac0
  35:	68 c9 0a 00 00       	push   $0xac9
  3a:	6a 01                	push   $0x1
  3c:	e8 c0 07 00 00       	call   801 <printf>
  41:	83 c4 0c             	add    $0xc,%esp
  44:	68 08 0b 00 00       	push   $0xb08
  49:	68 dc 0a 00 00       	push   $0xadc
  4e:	6a 01                	push   $0x1
  50:	e8 ac 07 00 00       	call   801 <printf>
  55:	83 c4 08             	add    $0x8,%esp
  58:	68 f0 0a 00 00       	push   $0xaf0
  5d:	6a 01                	push   $0x1
  5f:	e8 9d 07 00 00       	call   801 <printf>
  64:	83 c4 04             	add    $0x4,%esp
  67:	ff 35 2c 0f 00 00    	pushl  0xf2c
  6d:	e8 7e 06 00 00       	call   6f0 <kill>
  72:	e8 41 06 00 00       	call   6b8 <exit>
   assert(tmp1 == 42);
  77:	6a 39                	push   $0x39
  79:	68 c0 0a 00 00       	push   $0xac0
  7e:	68 c9 0a 00 00       	push   $0xac9
  83:	6a 01                	push   $0x1
  85:	e8 77 07 00 00       	call   801 <printf>
  8a:	83 c4 0c             	add    $0xc,%esp
  8d:	68 d1 0a 00 00       	push   $0xad1
  92:	68 dc 0a 00 00       	push   $0xadc
  97:	6a 01                	push   $0x1
  99:	e8 63 07 00 00       	call   801 <printf>
  9e:	83 c4 08             	add    $0x8,%esp
  a1:	68 f0 0a 00 00       	push   $0xaf0
  a6:	6a 01                	push   $0x1
  a8:	e8 54 07 00 00       	call   801 <printf>
  ad:	83 c4 04             	add    $0x4,%esp
  b0:	ff 35 2c 0f 00 00    	pushl  0xf2c
  b6:	e8 35 06 00 00       	call   6f0 <kill>
  bb:	e8 f8 05 00 00       	call   6b8 <exit>
   assert(tmp2 == 24);
  c0:	6a 3a                	push   $0x3a
  c2:	68 c0 0a 00 00       	push   $0xac0
  c7:	68 c9 0a 00 00       	push   $0xac9
  cc:	6a 01                	push   $0x1
  ce:	e8 2e 07 00 00       	call   801 <printf>
  d3:	83 c4 0c             	add    $0xc,%esp
  d6:	68 fd 0a 00 00       	push   $0xafd
  db:	68 dc 0a 00 00       	push   $0xadc
  e0:	6a 01                	push   $0x1
  e2:	e8 1a 07 00 00       	call   801 <printf>
  e7:	83 c4 08             	add    $0x8,%esp
  ea:	68 f0 0a 00 00       	push   $0xaf0
  ef:	6a 01                	push   $0x1
  f1:	e8 0b 07 00 00       	call   801 <printf>
  f6:	83 c4 04             	add    $0x4,%esp
  f9:	ff 35 2c 0f 00 00    	pushl  0xf2c
  ff:	e8 ec 05 00 00       	call   6f0 <kill>
 104:	e8 af 05 00 00       	call   6b8 <exit>
   global++;
 109:	83 c0 01             	add    $0x1,%eax
 10c:	a3 00 0f 00 00       	mov    %eax,0xf00
   exit();
 111:	e8 a2 05 00 00       	call   6b8 <exit>

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
 12e:	e8 0d 06 00 00       	call   740 <getpid>
 133:	a3 2c 0f 00 00       	mov    %eax,0xf2c
   void *stack, *p = malloc(PGSIZE * 2);
 138:	83 ec 0c             	sub    $0xc,%esp
 13b:	68 00 20 00 00       	push   $0x2000
 140:	e8 ed 08 00 00       	call   a32 <malloc>
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
 162:	68 c0 0a 00 00       	push   $0xac0
 167:	68 c9 0a 00 00       	push   $0xac9
 16c:	6a 01                	push   $0x1
 16e:	e8 8e 06 00 00       	call   801 <printf>
 173:	83 c4 0c             	add    $0xc,%esp
 176:	68 14 0b 00 00       	push   $0xb14
 17b:	68 dc 0a 00 00       	push   $0xadc
 180:	6a 01                	push   $0x1
 182:	e8 7a 06 00 00       	call   801 <printf>
 187:	83 c4 08             	add    $0x8,%esp
 18a:	68 f0 0a 00 00       	push   $0xaf0
 18f:	6a 01                	push   $0x1
 191:	e8 6b 06 00 00       	call   801 <printf>
 196:	83 c4 04             	add    $0x4,%esp
 199:	ff 35 2c 0f 00 00    	pushl  0xf2c
 19f:	e8 4c 05 00 00       	call   6f0 <kill>
 1a4:	e8 0f 05 00 00       	call   6b8 <exit>
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
 1c7:	e8 e4 04 00 00       	call   6b0 <clone>
 1cc:	89 c6                	mov    %eax,%esi
   assert(clone_pid > 0);
 1ce:	83 c4 10             	add    $0x10,%esp
 1d1:	85 c0                	test   %eax,%eax
 1d3:	7e 67                	jle    23c <main+0x126>
   sleep(250);
 1d5:	83 ec 0c             	sub    $0xc,%esp
 1d8:	68 fa 00 00 00       	push   $0xfa
 1dd:	e8 6e 05 00 00       	call   750 <sleep>
   assert(wait() == -1);
 1e2:	e8 d9 04 00 00       	call   6c0 <wait>
 1e7:	83 c4 10             	add    $0x10,%esp
 1ea:	83 f8 ff             	cmp    $0xffffffff,%eax
 1ed:	0f 84 92 00 00 00    	je     285 <main+0x16f>
 1f3:	6a 28                	push   $0x28
 1f5:	68 c0 0a 00 00       	push   $0xac0
 1fa:	68 c9 0a 00 00       	push   $0xac9
 1ff:	6a 01                	push   $0x1
 201:	e8 fb 05 00 00       	call   801 <printf>
 206:	83 c4 0c             	add    $0xc,%esp
 209:	68 2c 0b 00 00       	push   $0xb2c
 20e:	68 dc 0a 00 00       	push   $0xadc
 213:	6a 01                	push   $0x1
 215:	e8 e7 05 00 00       	call   801 <printf>
 21a:	83 c4 08             	add    $0x8,%esp
 21d:	68 f0 0a 00 00       	push   $0xaf0
 222:	6a 01                	push   $0x1
 224:	e8 d8 05 00 00       	call   801 <printf>
 229:	83 c4 04             	add    $0x4,%esp
 22c:	ff 35 2c 0f 00 00    	pushl  0xf2c
 232:	e8 b9 04 00 00       	call   6f0 <kill>
 237:	e8 7c 04 00 00       	call   6b8 <exit>
   assert(clone_pid > 0);
 23c:	6a 25                	push   $0x25
 23e:	68 c0 0a 00 00       	push   $0xac0
 243:	68 c9 0a 00 00       	push   $0xac9
 248:	6a 01                	push   $0x1
 24a:	e8 b2 05 00 00       	call   801 <printf>
 24f:	83 c4 0c             	add    $0xc,%esp
 252:	68 1e 0b 00 00       	push   $0xb1e
 257:	68 dc 0a 00 00       	push   $0xadc
 25c:	6a 01                	push   $0x1
 25e:	e8 9e 05 00 00       	call   801 <printf>
 263:	83 c4 08             	add    $0x8,%esp
 266:	68 f0 0a 00 00       	push   $0xaf0
 26b:	6a 01                	push   $0x1
 26d:	e8 8f 05 00 00       	call   801 <printf>
 272:	83 c4 04             	add    $0x4,%esp
 275:	ff 35 2c 0f 00 00    	pushl  0xf2c
 27b:	e8 70 04 00 00       	call   6f0 <kill>
 280:	e8 33 04 00 00       	call   6b8 <exit>
   int join_pid = join(&join_stack);
 285:	83 ec 0c             	sub    $0xc,%esp
 288:	8d 45 dc             	lea    -0x24(%ebp),%eax
 28b:	50                   	push   %eax
 28c:	e8 37 04 00 00       	call   6c8 <join>
   assert(join_pid == clone_pid);
 291:	83 c4 10             	add    $0x10,%esp
 294:	39 c6                	cmp    %eax,%esi
 296:	75 52                	jne    2ea <main+0x1d4>
   assert(stack == join_stack);
 298:	39 7d dc             	cmp    %edi,-0x24(%ebp)
 29b:	0f 84 92 00 00 00    	je     333 <main+0x21d>
 2a1:	6a 2d                	push   $0x2d
 2a3:	68 c0 0a 00 00       	push   $0xac0
 2a8:	68 c9 0a 00 00       	push   $0xac9
 2ad:	6a 01                	push   $0x1
 2af:	e8 4d 05 00 00       	call   801 <printf>
 2b4:	83 c4 0c             	add    $0xc,%esp
 2b7:	68 4f 0b 00 00       	push   $0xb4f
 2bc:	68 dc 0a 00 00       	push   $0xadc
 2c1:	6a 01                	push   $0x1
 2c3:	e8 39 05 00 00       	call   801 <printf>
 2c8:	83 c4 08             	add    $0x8,%esp
 2cb:	68 f0 0a 00 00       	push   $0xaf0
 2d0:	6a 01                	push   $0x1
 2d2:	e8 2a 05 00 00       	call   801 <printf>
 2d7:	83 c4 04             	add    $0x4,%esp
 2da:	ff 35 2c 0f 00 00    	pushl  0xf2c
 2e0:	e8 0b 04 00 00       	call   6f0 <kill>
 2e5:	e8 ce 03 00 00       	call   6b8 <exit>
   assert(join_pid == clone_pid);
 2ea:	6a 2c                	push   $0x2c
 2ec:	68 c0 0a 00 00       	push   $0xac0
 2f1:	68 c9 0a 00 00       	push   $0xac9
 2f6:	6a 01                	push   $0x1
 2f8:	e8 04 05 00 00       	call   801 <printf>
 2fd:	83 c4 0c             	add    $0xc,%esp
 300:	68 39 0b 00 00       	push   $0xb39
 305:	68 dc 0a 00 00       	push   $0xadc
 30a:	6a 01                	push   $0x1
 30c:	e8 f0 04 00 00       	call   801 <printf>
 311:	83 c4 08             	add    $0x8,%esp
 314:	68 f0 0a 00 00       	push   $0xaf0
 319:	6a 01                	push   $0x1
 31b:	e8 e1 04 00 00       	call   801 <printf>
 320:	83 c4 04             	add    $0x4,%esp
 323:	ff 35 2c 0f 00 00    	pushl  0xf2c
 329:	e8 c2 03 00 00       	call   6f0 <kill>
 32e:	e8 85 03 00 00       	call   6b8 <exit>
   assert(global == 2);
 333:	83 3d 00 0f 00 00 02 	cmpl   $0x2,0xf00
 33a:	74 49                	je     385 <main+0x26f>
 33c:	6a 2e                	push   $0x2e
 33e:	68 c0 0a 00 00       	push   $0xac0
 343:	68 c9 0a 00 00       	push   $0xac9
 348:	6a 01                	push   $0x1
 34a:	e8 b2 04 00 00       	call   801 <printf>
 34f:	83 c4 0c             	add    $0xc,%esp
 352:	68 63 0b 00 00       	push   $0xb63
 357:	68 dc 0a 00 00       	push   $0xadc
 35c:	6a 01                	push   $0x1
 35e:	e8 9e 04 00 00       	call   801 <printf>
 363:	83 c4 08             	add    $0x8,%esp
 366:	68 f0 0a 00 00       	push   $0xaf0
 36b:	6a 01                	push   $0x1
 36d:	e8 8f 04 00 00       	call   801 <printf>
 372:	83 c4 04             	add    $0x4,%esp
 375:	ff 35 2c 0f 00 00    	pushl  0xf2c
 37b:	e8 70 03 00 00       	call   6f0 <kill>
 380:	e8 33 03 00 00       	call   6b8 <exit>
   printf(1, "TEST PASSED\n");
 385:	83 ec 08             	sub    $0x8,%esp
 388:	68 6f 0b 00 00       	push   $0xb6f
 38d:	6a 01                	push   $0x1
 38f:	e8 6d 04 00 00       	call   801 <printf>
   free(p);
 394:	89 1c 24             	mov    %ebx,(%esp)
 397:	e8 d2 05 00 00       	call   96e <free>
   exit();
 39c:	e8 17 03 00 00       	call   6b8 <exit>

000003a1 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 3a1:	f3 0f 1e fb          	endbr32 
 3a5:	55                   	push   %ebp
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	56                   	push   %esi
 3a9:	53                   	push   %ebx
 3aa:	8b 75 08             	mov    0x8(%ebp),%esi
 3ad:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3b0:	89 f0                	mov    %esi,%eax
 3b2:	89 d1                	mov    %edx,%ecx
 3b4:	83 c2 01             	add    $0x1,%edx
 3b7:	89 c3                	mov    %eax,%ebx
 3b9:	83 c0 01             	add    $0x1,%eax
 3bc:	0f b6 09             	movzbl (%ecx),%ecx
 3bf:	88 0b                	mov    %cl,(%ebx)
 3c1:	84 c9                	test   %cl,%cl
 3c3:	75 ed                	jne    3b2 <strcpy+0x11>
    ;
  return os;
}
 3c5:	89 f0                	mov    %esi,%eax
 3c7:	5b                   	pop    %ebx
 3c8:	5e                   	pop    %esi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3cb:	f3 0f 1e fb          	endbr32 
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 3d8:	0f b6 01             	movzbl (%ecx),%eax
 3db:	84 c0                	test   %al,%al
 3dd:	74 0c                	je     3eb <strcmp+0x20>
 3df:	3a 02                	cmp    (%edx),%al
 3e1:	75 08                	jne    3eb <strcmp+0x20>
    p++, q++;
 3e3:	83 c1 01             	add    $0x1,%ecx
 3e6:	83 c2 01             	add    $0x1,%edx
 3e9:	eb ed                	jmp    3d8 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 3eb:	0f b6 c0             	movzbl %al,%eax
 3ee:	0f b6 12             	movzbl (%edx),%edx
 3f1:	29 d0                	sub    %edx,%eax
}
 3f3:	5d                   	pop    %ebp
 3f4:	c3                   	ret    

000003f5 <strlen>:

uint
strlen(const char *s)
{
 3f5:	f3 0f 1e fb          	endbr32 
 3f9:	55                   	push   %ebp
 3fa:	89 e5                	mov    %esp,%ebp
 3fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3ff:	b8 00 00 00 00       	mov    $0x0,%eax
 404:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 408:	74 05                	je     40f <strlen+0x1a>
 40a:	83 c0 01             	add    $0x1,%eax
 40d:	eb f5                	jmp    404 <strlen+0xf>
    ;
  return n;
}
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    

00000411 <memset>:

void*
memset(void *dst, int c, uint n)
{
 411:	f3 0f 1e fb          	endbr32 
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	57                   	push   %edi
 419:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 41c:	89 d7                	mov    %edx,%edi
 41e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 421:	8b 45 0c             	mov    0xc(%ebp),%eax
 424:	fc                   	cld    
 425:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 427:	89 d0                	mov    %edx,%eax
 429:	5f                   	pop    %edi
 42a:	5d                   	pop    %ebp
 42b:	c3                   	ret    

0000042c <strchr>:

char*
strchr(const char *s, char c)
{
 42c:	f3 0f 1e fb          	endbr32 
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 43a:	0f b6 10             	movzbl (%eax),%edx
 43d:	84 d2                	test   %dl,%dl
 43f:	74 09                	je     44a <strchr+0x1e>
    if(*s == c)
 441:	38 ca                	cmp    %cl,%dl
 443:	74 0a                	je     44f <strchr+0x23>
  for(; *s; s++)
 445:	83 c0 01             	add    $0x1,%eax
 448:	eb f0                	jmp    43a <strchr+0xe>
      return (char*)s;
  return 0;
 44a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    

00000451 <gets>:

char*
gets(char *buf, int max)
{
 451:	f3 0f 1e fb          	endbr32 
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	57                   	push   %edi
 459:	56                   	push   %esi
 45a:	53                   	push   %ebx
 45b:	83 ec 1c             	sub    $0x1c,%esp
 45e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 461:	bb 00 00 00 00       	mov    $0x0,%ebx
 466:	89 de                	mov    %ebx,%esi
 468:	83 c3 01             	add    $0x1,%ebx
 46b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 46e:	7d 2e                	jge    49e <gets+0x4d>
    cc = read(0, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	6a 01                	push   $0x1
 475:	8d 45 e7             	lea    -0x19(%ebp),%eax
 478:	50                   	push   %eax
 479:	6a 00                	push   $0x0
 47b:	e8 58 02 00 00       	call   6d8 <read>
    if(cc < 1)
 480:	83 c4 10             	add    $0x10,%esp
 483:	85 c0                	test   %eax,%eax
 485:	7e 17                	jle    49e <gets+0x4d>
      break;
    buf[i++] = c;
 487:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 48b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 48e:	3c 0a                	cmp    $0xa,%al
 490:	0f 94 c2             	sete   %dl
 493:	3c 0d                	cmp    $0xd,%al
 495:	0f 94 c0             	sete   %al
 498:	08 c2                	or     %al,%dl
 49a:	74 ca                	je     466 <gets+0x15>
    buf[i++] = c;
 49c:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 49e:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 4a2:	89 f8                	mov    %edi,%eax
 4a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4a7:	5b                   	pop    %ebx
 4a8:	5e                   	pop    %esi
 4a9:	5f                   	pop    %edi
 4aa:	5d                   	pop    %ebp
 4ab:	c3                   	ret    

000004ac <stat>:

int
stat(const char *n, struct stat *st)
{
 4ac:	f3 0f 1e fb          	endbr32 
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	56                   	push   %esi
 4b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b5:	83 ec 08             	sub    $0x8,%esp
 4b8:	6a 00                	push   $0x0
 4ba:	ff 75 08             	pushl  0x8(%ebp)
 4bd:	e8 3e 02 00 00       	call   700 <open>
  if(fd < 0)
 4c2:	83 c4 10             	add    $0x10,%esp
 4c5:	85 c0                	test   %eax,%eax
 4c7:	78 24                	js     4ed <stat+0x41>
 4c9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4cb:	83 ec 08             	sub    $0x8,%esp
 4ce:	ff 75 0c             	pushl  0xc(%ebp)
 4d1:	50                   	push   %eax
 4d2:	e8 41 02 00 00       	call   718 <fstat>
 4d7:	89 c6                	mov    %eax,%esi
  close(fd);
 4d9:	89 1c 24             	mov    %ebx,(%esp)
 4dc:	e8 07 02 00 00       	call   6e8 <close>
  return r;
 4e1:	83 c4 10             	add    $0x10,%esp
}
 4e4:	89 f0                	mov    %esi,%eax
 4e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 4e9:	5b                   	pop    %ebx
 4ea:	5e                   	pop    %esi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    
    return -1;
 4ed:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f2:	eb f0                	jmp    4e4 <stat+0x38>

000004f4 <atoi>:

int
atoi(const char *s)
{
 4f4:	f3 0f 1e fb          	endbr32 
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	53                   	push   %ebx
 4fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 4ff:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 504:	0f b6 01             	movzbl (%ecx),%eax
 507:	8d 58 d0             	lea    -0x30(%eax),%ebx
 50a:	80 fb 09             	cmp    $0x9,%bl
 50d:	77 12                	ja     521 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 50f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 512:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 515:	83 c1 01             	add    $0x1,%ecx
 518:	0f be c0             	movsbl %al,%eax
 51b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 51f:	eb e3                	jmp    504 <atoi+0x10>
  return n;
}
 521:	89 d0                	mov    %edx,%eax
 523:	5b                   	pop    %ebx
 524:	5d                   	pop    %ebp
 525:	c3                   	ret    

00000526 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 526:	f3 0f 1e fb          	endbr32 
 52a:	55                   	push   %ebp
 52b:	89 e5                	mov    %esp,%ebp
 52d:	56                   	push   %esi
 52e:	53                   	push   %ebx
 52f:	8b 75 08             	mov    0x8(%ebp),%esi
 532:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 535:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 538:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 53a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 53d:	85 c0                	test   %eax,%eax
 53f:	7e 0f                	jle    550 <memmove+0x2a>
    *dst++ = *src++;
 541:	0f b6 01             	movzbl (%ecx),%eax
 544:	88 02                	mov    %al,(%edx)
 546:	8d 49 01             	lea    0x1(%ecx),%ecx
 549:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 54c:	89 d8                	mov    %ebx,%eax
 54e:	eb ea                	jmp    53a <memmove+0x14>
  return vdst;
}
 550:	89 f0                	mov    %esi,%eax
 552:	5b                   	pop    %ebx
 553:	5e                   	pop    %esi
 554:	5d                   	pop    %ebp
 555:	c3                   	ret    

00000556 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 556:	f3 0f 1e fb          	endbr32 
 55a:	55                   	push   %ebp
 55b:	89 e5                	mov    %esp,%ebp
 55d:	53                   	push   %ebx
 55e:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 561:	68 00 20 00 00       	push   $0x2000
 566:	e8 c7 04 00 00       	call   a32 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 56b:	83 c4 10             	add    $0x10,%esp
 56e:	89 c2                	mov    %eax,%edx
 570:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 576:	74 22                	je     59a <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 578:	b9 00 10 00 00       	mov    $0x1000,%ecx
 57d:	29 d1                	sub    %edx,%ecx
 57f:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 581:	ba 00 00 00 00       	mov    $0x0,%edx
 586:	83 fa 3f             	cmp    $0x3f,%edx
 589:	7f 13                	jg     59e <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 58b:	83 3c 95 40 12 00 00 	cmpl   $0x1,0x1240(,%edx,4)
 592:	01 
 593:	75 09                	jne    59e <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 595:	83 c2 01             	add    $0x1,%edx
 598:	eb ec                	jmp    586 <thread_create+0x30>
  void *user_stack = curr_ptr;
 59a:	89 c1                	mov    %eax,%ecx
 59c:	eb e3                	jmp    581 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 59e:	83 3c 95 40 12 00 00 	cmpl   $0x1,0x1240(,%edx,4)
 5a5:	01 
 5a6:	74 34                	je     5dc <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 5a8:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 5ab:	c1 e3 02             	shl    $0x2,%ebx
 5ae:	89 83 40 0f 00 00    	mov    %eax,0xf40(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 5b4:	89 8b 44 0f 00 00    	mov    %ecx,0xf44(%ebx)
  cell_full[i] = 1;
 5ba:	c7 04 95 40 12 00 00 	movl   $0x1,0x1240(,%edx,4)
 5c1:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 5c5:	ff 75 10             	pushl  0x10(%ebp)
 5c8:	ff 75 0c             	pushl  0xc(%ebp)
 5cb:	ff 75 08             	pushl  0x8(%ebp)
 5ce:	51                   	push   %ecx
 5cf:	e8 dc 00 00 00       	call   6b0 <clone>
 5d4:	83 c4 10             	add    $0x10,%esp
}
 5d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5da:	c9                   	leave  
 5db:	c3                   	ret    
    return -1;
 5dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5e1:	eb f4                	jmp    5d7 <thread_create+0x81>

000005e3 <thread_join>:

int thread_join(){
 5e3:	f3 0f 1e fb          	endbr32 
 5e7:	55                   	push   %ebp
 5e8:	89 e5                	mov    %esp,%ebp
 5ea:	56                   	push   %esi
 5eb:	53                   	push   %ebx
 5ec:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 5ef:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5f2:	50                   	push   %eax
 5f3:	e8 d0 00 00 00       	call   6c8 <join>
 5f8:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 5fa:	83 c4 10             	add    $0x10,%esp
 5fd:	bb 00 00 00 00       	mov    $0x0,%ebx
 602:	83 fb 3f             	cmp    $0x3f,%ebx
 605:	7f 14                	jg     61b <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 607:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 60a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 60d:	39 14 85 44 0f 00 00 	cmp    %edx,0xf44(,%eax,4)
 614:	74 05                	je     61b <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 616:	83 c3 01             	add    $0x1,%ebx
 619:	eb e7                	jmp    602 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 61b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 61e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 621:	39 0c 85 44 0f 00 00 	cmp    %ecx,0xf44(,%eax,4)
 628:	75 26                	jne    650 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 62a:	83 ec 0c             	sub    $0xc,%esp
 62d:	ff 34 85 40 0f 00 00 	pushl  0xf40(,%eax,4)
 634:	e8 35 03 00 00       	call   96e <free>
  cell_full[i] = 0;
 639:	c7 04 9d 40 12 00 00 	movl   $0x0,0x1240(,%ebx,4)
 640:	00 00 00 00 

  return out;
 644:	83 c4 10             	add    $0x10,%esp
}
 647:	89 f0                	mov    %esi,%eax
 649:	8d 65 f8             	lea    -0x8(%ebp),%esp
 64c:	5b                   	pop    %ebx
 64d:	5e                   	pop    %esi
 64e:	5d                   	pop    %ebp
 64f:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 650:	be ff ff ff ff       	mov    $0xffffffff,%esi
 655:	eb f0                	jmp    647 <thread_join+0x64>

00000657 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 657:	f3 0f 1e fb          	endbr32 
 65b:	55                   	push   %ebp
 65c:	89 e5                	mov    %esp,%ebp
 65e:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 661:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 667:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 66e:	5d                   	pop    %ebp
 66f:	c3                   	ret    

00000670 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 670:	f3 0f 1e fb          	endbr32 
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 67a:	b9 01 00 00 00       	mov    $0x1,%ecx
 67f:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 683:	b8 00 00 00 00       	mov    $0x0,%eax
 688:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 68d:	39 c1                	cmp    %eax,%ecx
 68f:	75 f2                	jne    683 <lock_acquire+0x13>
      ; // spin
    }
}
 691:	5d                   	pop    %ebp
 692:	c3                   	ret    

00000693 <lock_release>:

void lock_release(lock_t *lock) {
 693:	f3 0f 1e fb          	endbr32 
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 69d:	8b 42 04             	mov    0x4(%edx),%eax
 6a0:	83 c0 01             	add    $0x1,%eax
 6a3:	89 42 04             	mov    %eax,0x4(%edx)
}
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    

000006a8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6a8:	b8 01 00 00 00       	mov    $0x1,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <clone>:
SYSCALL(clone)
 6b0:	b8 16 00 00 00       	mov    $0x16,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <exit>:
SYSCALL(exit)
 6b8:	b8 02 00 00 00       	mov    $0x2,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <wait>:
SYSCALL(wait)
 6c0:	b8 03 00 00 00       	mov    $0x3,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <join>:
SYSCALL(join)
 6c8:	b8 17 00 00 00       	mov    $0x17,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <pipe>:
SYSCALL(pipe)
 6d0:	b8 04 00 00 00       	mov    $0x4,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <read>:
SYSCALL(read)
 6d8:	b8 05 00 00 00       	mov    $0x5,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <write>:
SYSCALL(write)
 6e0:	b8 10 00 00 00       	mov    $0x10,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <close>:
SYSCALL(close)
 6e8:	b8 15 00 00 00       	mov    $0x15,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <kill>:
SYSCALL(kill)
 6f0:	b8 06 00 00 00       	mov    $0x6,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <exec>:
SYSCALL(exec)
 6f8:	b8 07 00 00 00       	mov    $0x7,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <open>:
SYSCALL(open)
 700:	b8 0f 00 00 00       	mov    $0xf,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <mknod>:
SYSCALL(mknod)
 708:	b8 11 00 00 00       	mov    $0x11,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <unlink>:
SYSCALL(unlink)
 710:	b8 12 00 00 00       	mov    $0x12,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <fstat>:
SYSCALL(fstat)
 718:	b8 08 00 00 00       	mov    $0x8,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <link>:
SYSCALL(link)
 720:	b8 13 00 00 00       	mov    $0x13,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <mkdir>:
SYSCALL(mkdir)
 728:	b8 14 00 00 00       	mov    $0x14,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <chdir>:
SYSCALL(chdir)
 730:	b8 09 00 00 00       	mov    $0x9,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <dup>:
SYSCALL(dup)
 738:	b8 0a 00 00 00       	mov    $0xa,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <getpid>:
SYSCALL(getpid)
 740:	b8 0b 00 00 00       	mov    $0xb,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <sbrk>:
SYSCALL(sbrk)
 748:	b8 0c 00 00 00       	mov    $0xc,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <sleep>:
SYSCALL(sleep)
 750:	b8 0d 00 00 00       	mov    $0xd,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <uptime>:
SYSCALL(uptime)
 758:	b8 0e 00 00 00       	mov    $0xe,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 1c             	sub    $0x1c,%esp
 766:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 769:	6a 01                	push   $0x1
 76b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 76e:	52                   	push   %edx
 76f:	50                   	push   %eax
 770:	e8 6b ff ff ff       	call   6e0 <write>
}
 775:	83 c4 10             	add    $0x10,%esp
 778:	c9                   	leave  
 779:	c3                   	ret    

0000077a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 77a:	55                   	push   %ebp
 77b:	89 e5                	mov    %esp,%ebp
 77d:	57                   	push   %edi
 77e:	56                   	push   %esi
 77f:	53                   	push   %ebx
 780:	83 ec 2c             	sub    $0x2c,%esp
 783:	89 45 d0             	mov    %eax,-0x30(%ebp)
 786:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 788:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 78c:	0f 95 c2             	setne  %dl
 78f:	89 f0                	mov    %esi,%eax
 791:	c1 e8 1f             	shr    $0x1f,%eax
 794:	84 c2                	test   %al,%dl
 796:	74 42                	je     7da <printint+0x60>
    neg = 1;
    x = -xx;
 798:	f7 de                	neg    %esi
    neg = 1;
 79a:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 7a1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 7a6:	89 f0                	mov    %esi,%eax
 7a8:	ba 00 00 00 00       	mov    $0x0,%edx
 7ad:	f7 f1                	div    %ecx
 7af:	89 df                	mov    %ebx,%edi
 7b1:	83 c3 01             	add    $0x1,%ebx
 7b4:	0f b6 92 84 0b 00 00 	movzbl 0xb84(%edx),%edx
 7bb:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 7bf:	89 f2                	mov    %esi,%edx
 7c1:	89 c6                	mov    %eax,%esi
 7c3:	39 d1                	cmp    %edx,%ecx
 7c5:	76 df                	jbe    7a6 <printint+0x2c>
  if(neg)
 7c7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 7cb:	74 2f                	je     7fc <printint+0x82>
    buf[i++] = '-';
 7cd:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 7d2:	8d 5f 02             	lea    0x2(%edi),%ebx
 7d5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7d8:	eb 15                	jmp    7ef <printint+0x75>
  neg = 0;
 7da:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 7e1:	eb be                	jmp    7a1 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 7e3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 7e8:	89 f0                	mov    %esi,%eax
 7ea:	e8 71 ff ff ff       	call   760 <putc>
  while(--i >= 0)
 7ef:	83 eb 01             	sub    $0x1,%ebx
 7f2:	79 ef                	jns    7e3 <printint+0x69>
}
 7f4:	83 c4 2c             	add    $0x2c,%esp
 7f7:	5b                   	pop    %ebx
 7f8:	5e                   	pop    %esi
 7f9:	5f                   	pop    %edi
 7fa:	5d                   	pop    %ebp
 7fb:	c3                   	ret    
 7fc:	8b 75 d0             	mov    -0x30(%ebp),%esi
 7ff:	eb ee                	jmp    7ef <printint+0x75>

00000801 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 801:	f3 0f 1e fb          	endbr32 
 805:	55                   	push   %ebp
 806:	89 e5                	mov    %esp,%ebp
 808:	57                   	push   %edi
 809:	56                   	push   %esi
 80a:	53                   	push   %ebx
 80b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 80e:	8d 45 10             	lea    0x10(%ebp),%eax
 811:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 814:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 819:	bb 00 00 00 00       	mov    $0x0,%ebx
 81e:	eb 14                	jmp    834 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 820:	89 fa                	mov    %edi,%edx
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	e8 36 ff ff ff       	call   760 <putc>
 82a:	eb 05                	jmp    831 <printf+0x30>
      }
    } else if(state == '%'){
 82c:	83 fe 25             	cmp    $0x25,%esi
 82f:	74 25                	je     856 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 831:	83 c3 01             	add    $0x1,%ebx
 834:	8b 45 0c             	mov    0xc(%ebp),%eax
 837:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 83b:	84 c0                	test   %al,%al
 83d:	0f 84 23 01 00 00    	je     966 <printf+0x165>
    c = fmt[i] & 0xff;
 843:	0f be f8             	movsbl %al,%edi
 846:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 849:	85 f6                	test   %esi,%esi
 84b:	75 df                	jne    82c <printf+0x2b>
      if(c == '%'){
 84d:	83 f8 25             	cmp    $0x25,%eax
 850:	75 ce                	jne    820 <printf+0x1f>
        state = '%';
 852:	89 c6                	mov    %eax,%esi
 854:	eb db                	jmp    831 <printf+0x30>
      if(c == 'd'){
 856:	83 f8 64             	cmp    $0x64,%eax
 859:	74 49                	je     8a4 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 85b:	83 f8 78             	cmp    $0x78,%eax
 85e:	0f 94 c1             	sete   %cl
 861:	83 f8 70             	cmp    $0x70,%eax
 864:	0f 94 c2             	sete   %dl
 867:	08 d1                	or     %dl,%cl
 869:	75 63                	jne    8ce <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 86b:	83 f8 73             	cmp    $0x73,%eax
 86e:	0f 84 84 00 00 00    	je     8f8 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 874:	83 f8 63             	cmp    $0x63,%eax
 877:	0f 84 b7 00 00 00    	je     934 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 87d:	83 f8 25             	cmp    $0x25,%eax
 880:	0f 84 cc 00 00 00    	je     952 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 886:	ba 25 00 00 00       	mov    $0x25,%edx
 88b:	8b 45 08             	mov    0x8(%ebp),%eax
 88e:	e8 cd fe ff ff       	call   760 <putc>
        putc(fd, c);
 893:	89 fa                	mov    %edi,%edx
 895:	8b 45 08             	mov    0x8(%ebp),%eax
 898:	e8 c3 fe ff ff       	call   760 <putc>
      }
      state = 0;
 89d:	be 00 00 00 00       	mov    $0x0,%esi
 8a2:	eb 8d                	jmp    831 <printf+0x30>
        printint(fd, *ap, 10, 1);
 8a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8a7:	8b 17                	mov    (%edi),%edx
 8a9:	83 ec 0c             	sub    $0xc,%esp
 8ac:	6a 01                	push   $0x1
 8ae:	b9 0a 00 00 00       	mov    $0xa,%ecx
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax
 8b6:	e8 bf fe ff ff       	call   77a <printint>
        ap++;
 8bb:	83 c7 04             	add    $0x4,%edi
 8be:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8c4:	be 00 00 00 00       	mov    $0x0,%esi
 8c9:	e9 63 ff ff ff       	jmp    831 <printf+0x30>
        printint(fd, *ap, 16, 0);
 8ce:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 8d1:	8b 17                	mov    (%edi),%edx
 8d3:	83 ec 0c             	sub    $0xc,%esp
 8d6:	6a 00                	push   $0x0
 8d8:	b9 10 00 00 00       	mov    $0x10,%ecx
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
 8e0:	e8 95 fe ff ff       	call   77a <printint>
        ap++;
 8e5:	83 c7 04             	add    $0x4,%edi
 8e8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 8eb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8ee:	be 00 00 00 00       	mov    $0x0,%esi
 8f3:	e9 39 ff ff ff       	jmp    831 <printf+0x30>
        s = (char*)*ap;
 8f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8fb:	8b 30                	mov    (%eax),%esi
        ap++;
 8fd:	83 c0 04             	add    $0x4,%eax
 900:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 903:	85 f6                	test   %esi,%esi
 905:	75 28                	jne    92f <printf+0x12e>
          s = "(null)";
 907:	be 7c 0b 00 00       	mov    $0xb7c,%esi
 90c:	8b 7d 08             	mov    0x8(%ebp),%edi
 90f:	eb 0d                	jmp    91e <printf+0x11d>
          putc(fd, *s);
 911:	0f be d2             	movsbl %dl,%edx
 914:	89 f8                	mov    %edi,%eax
 916:	e8 45 fe ff ff       	call   760 <putc>
          s++;
 91b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 91e:	0f b6 16             	movzbl (%esi),%edx
 921:	84 d2                	test   %dl,%dl
 923:	75 ec                	jne    911 <printf+0x110>
      state = 0;
 925:	be 00 00 00 00       	mov    $0x0,%esi
 92a:	e9 02 ff ff ff       	jmp    831 <printf+0x30>
 92f:	8b 7d 08             	mov    0x8(%ebp),%edi
 932:	eb ea                	jmp    91e <printf+0x11d>
        putc(fd, *ap);
 934:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 937:	0f be 17             	movsbl (%edi),%edx
 93a:	8b 45 08             	mov    0x8(%ebp),%eax
 93d:	e8 1e fe ff ff       	call   760 <putc>
        ap++;
 942:	83 c7 04             	add    $0x4,%edi
 945:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 948:	be 00 00 00 00       	mov    $0x0,%esi
 94d:	e9 df fe ff ff       	jmp    831 <printf+0x30>
        putc(fd, c);
 952:	89 fa                	mov    %edi,%edx
 954:	8b 45 08             	mov    0x8(%ebp),%eax
 957:	e8 04 fe ff ff       	call   760 <putc>
      state = 0;
 95c:	be 00 00 00 00       	mov    $0x0,%esi
 961:	e9 cb fe ff ff       	jmp    831 <printf+0x30>
    }
  }
}
 966:	8d 65 f4             	lea    -0xc(%ebp),%esp
 969:	5b                   	pop    %ebx
 96a:	5e                   	pop    %esi
 96b:	5f                   	pop    %edi
 96c:	5d                   	pop    %ebp
 96d:	c3                   	ret    

0000096e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 96e:	f3 0f 1e fb          	endbr32 
 972:	55                   	push   %ebp
 973:	89 e5                	mov    %esp,%ebp
 975:	57                   	push   %edi
 976:	56                   	push   %esi
 977:	53                   	push   %ebx
 978:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 97b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 97e:	a1 20 0f 00 00       	mov    0xf20,%eax
 983:	eb 02                	jmp    987 <free+0x19>
 985:	89 d0                	mov    %edx,%eax
 987:	39 c8                	cmp    %ecx,%eax
 989:	73 04                	jae    98f <free+0x21>
 98b:	39 08                	cmp    %ecx,(%eax)
 98d:	77 12                	ja     9a1 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 98f:	8b 10                	mov    (%eax),%edx
 991:	39 c2                	cmp    %eax,%edx
 993:	77 f0                	ja     985 <free+0x17>
 995:	39 c8                	cmp    %ecx,%eax
 997:	72 08                	jb     9a1 <free+0x33>
 999:	39 ca                	cmp    %ecx,%edx
 99b:	77 04                	ja     9a1 <free+0x33>
 99d:	89 d0                	mov    %edx,%eax
 99f:	eb e6                	jmp    987 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 9a1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 9a4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 9a7:	8b 10                	mov    (%eax),%edx
 9a9:	39 d7                	cmp    %edx,%edi
 9ab:	74 19                	je     9c6 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 9ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 9b0:	8b 50 04             	mov    0x4(%eax),%edx
 9b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 9b6:	39 ce                	cmp    %ecx,%esi
 9b8:	74 1b                	je     9d5 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 9ba:	89 08                	mov    %ecx,(%eax)
  freep = p;
 9bc:	a3 20 0f 00 00       	mov    %eax,0xf20
}
 9c1:	5b                   	pop    %ebx
 9c2:	5e                   	pop    %esi
 9c3:	5f                   	pop    %edi
 9c4:	5d                   	pop    %ebp
 9c5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 9c6:	03 72 04             	add    0x4(%edx),%esi
 9c9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 9cc:	8b 10                	mov    (%eax),%edx
 9ce:	8b 12                	mov    (%edx),%edx
 9d0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 9d3:	eb db                	jmp    9b0 <free+0x42>
    p->s.size += bp->s.size;
 9d5:	03 53 fc             	add    -0x4(%ebx),%edx
 9d8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9db:	8b 53 f8             	mov    -0x8(%ebx),%edx
 9de:	89 10                	mov    %edx,(%eax)
 9e0:	eb da                	jmp    9bc <free+0x4e>

000009e2 <morecore>:

static Header*
morecore(uint nu)
{
 9e2:	55                   	push   %ebp
 9e3:	89 e5                	mov    %esp,%ebp
 9e5:	53                   	push   %ebx
 9e6:	83 ec 04             	sub    $0x4,%esp
 9e9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 9eb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 9f0:	77 05                	ja     9f7 <morecore+0x15>
    nu = 4096;
 9f2:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 9f7:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 9fe:	83 ec 0c             	sub    $0xc,%esp
 a01:	50                   	push   %eax
 a02:	e8 41 fd ff ff       	call   748 <sbrk>
  if(p == (char*)-1)
 a07:	83 c4 10             	add    $0x10,%esp
 a0a:	83 f8 ff             	cmp    $0xffffffff,%eax
 a0d:	74 1c                	je     a2b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 a0f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 a12:	83 c0 08             	add    $0x8,%eax
 a15:	83 ec 0c             	sub    $0xc,%esp
 a18:	50                   	push   %eax
 a19:	e8 50 ff ff ff       	call   96e <free>
  return freep;
 a1e:	a1 20 0f 00 00       	mov    0xf20,%eax
 a23:	83 c4 10             	add    $0x10,%esp
}
 a26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 a29:	c9                   	leave  
 a2a:	c3                   	ret    
    return 0;
 a2b:	b8 00 00 00 00       	mov    $0x0,%eax
 a30:	eb f4                	jmp    a26 <morecore+0x44>

00000a32 <malloc>:

void*
malloc(uint nbytes)
{
 a32:	f3 0f 1e fb          	endbr32 
 a36:	55                   	push   %ebp
 a37:	89 e5                	mov    %esp,%ebp
 a39:	53                   	push   %ebx
 a3a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a3d:	8b 45 08             	mov    0x8(%ebp),%eax
 a40:	8d 58 07             	lea    0x7(%eax),%ebx
 a43:	c1 eb 03             	shr    $0x3,%ebx
 a46:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 a49:	8b 0d 20 0f 00 00    	mov    0xf20,%ecx
 a4f:	85 c9                	test   %ecx,%ecx
 a51:	74 04                	je     a57 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a53:	8b 01                	mov    (%ecx),%eax
 a55:	eb 4b                	jmp    aa2 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 a57:	c7 05 20 0f 00 00 24 	movl   $0xf24,0xf20
 a5e:	0f 00 00 
 a61:	c7 05 24 0f 00 00 24 	movl   $0xf24,0xf24
 a68:	0f 00 00 
    base.s.size = 0;
 a6b:	c7 05 28 0f 00 00 00 	movl   $0x0,0xf28
 a72:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 a75:	b9 24 0f 00 00       	mov    $0xf24,%ecx
 a7a:	eb d7                	jmp    a53 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 a7c:	74 1a                	je     a98 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 a7e:	29 da                	sub    %ebx,%edx
 a80:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a83:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 a86:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 a89:	89 0d 20 0f 00 00    	mov    %ecx,0xf20
      return (void*)(p + 1);
 a8f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 a92:	83 c4 04             	add    $0x4,%esp
 a95:	5b                   	pop    %ebx
 a96:	5d                   	pop    %ebp
 a97:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 a98:	8b 10                	mov    (%eax),%edx
 a9a:	89 11                	mov    %edx,(%ecx)
 a9c:	eb eb                	jmp    a89 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9e:	89 c1                	mov    %eax,%ecx
 aa0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 aa2:	8b 50 04             	mov    0x4(%eax),%edx
 aa5:	39 da                	cmp    %ebx,%edx
 aa7:	73 d3                	jae    a7c <malloc+0x4a>
    if(p == freep)
 aa9:	39 05 20 0f 00 00    	cmp    %eax,0xf20
 aaf:	75 ed                	jne    a9e <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 ab1:	89 d8                	mov    %ebx,%eax
 ab3:	e8 2a ff ff ff       	call   9e2 <morecore>
 ab8:	85 c0                	test   %eax,%eax
 aba:	75 e2                	jne    a9e <malloc+0x6c>
 abc:	eb d4                	jmp    a92 <malloc+0x60>
