
_test_4:     file format elf32-i386


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
   exit();
   a:	e8 1d 04 00 00       	call   42c <exit>

0000000f <main>:
{
   f:	f3 0f 1e fb          	endbr32 
  13:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  17:	83 e4 f0             	and    $0xfffffff0,%esp
  1a:	ff 71 fc             	pushl  -0x4(%ecx)
  1d:	55                   	push   %ebp
  1e:	89 e5                	mov    %esp,%ebp
  20:	53                   	push   %ebx
  21:	51                   	push   %ecx
   ppid = getpid();
  22:	e8 8d 04 00 00       	call   4b4 <getpid>
  27:	a3 2c 0c 00 00       	mov    %eax,0xc2c
   void *stack, *p = malloc(PGSIZE * 2);
  2c:	83 ec 0c             	sub    $0xc,%esp
  2f:	68 00 20 00 00       	push   $0x2000
  34:	e8 6d 07 00 00       	call   7a6 <malloc>
   assert(p != NULL);
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	74 70                	je     b0 <main+0xa1>
  40:	89 c3                	mov    %eax,%ebx
   if((uint)p % PGSIZE == 0)
  42:	a9 ff 0f 00 00       	test   $0xfff,%eax
  47:	75 03                	jne    4c <main+0x3d>
     stack = p + 4;
  49:	8d 40 04             	lea    0x4(%eax),%eax
   assert(clone(worker, 0, 0, stack) == -1);
  4c:	50                   	push   %eax
  4d:	6a 00                	push   $0x0
  4f:	6a 00                	push   $0x0
  51:	68 00 00 00 00       	push   $0x0
  56:	e8 c9 03 00 00       	call   424 <clone>
  5b:	83 c4 10             	add    $0x10,%esp
  5e:	83 f8 ff             	cmp    $0xffffffff,%eax
  61:	0f 84 92 00 00 00    	je     f9 <main+0xea>
  67:	6a 21                	push   $0x21
  69:	68 34 08 00 00       	push   $0x834
  6e:	68 3d 08 00 00       	push   $0x83d
  73:	6a 01                	push   $0x1
  75:	e8 fb 04 00 00       	call   575 <printf>
  7a:	83 c4 0c             	add    $0xc,%esp
  7d:	68 80 08 00 00       	push   $0x880
  82:	68 4f 08 00 00       	push   $0x84f
  87:	6a 01                	push   $0x1
  89:	e8 e7 04 00 00       	call   575 <printf>
  8e:	83 c4 08             	add    $0x8,%esp
  91:	68 63 08 00 00       	push   $0x863
  96:	6a 01                	push   $0x1
  98:	e8 d8 04 00 00       	call   575 <printf>
  9d:	83 c4 04             	add    $0x4,%esp
  a0:	ff 35 2c 0c 00 00    	pushl  0xc2c
  a6:	e8 b9 03 00 00       	call   464 <kill>
  ab:	e8 7c 03 00 00       	call   42c <exit>
   assert(p != NULL);
  b0:	6a 1b                	push   $0x1b
  b2:	68 34 08 00 00       	push   $0x834
  b7:	68 3d 08 00 00       	push   $0x83d
  bc:	6a 01                	push   $0x1
  be:	e8 b2 04 00 00       	call   575 <printf>
  c3:	83 c4 0c             	add    $0xc,%esp
  c6:	68 45 08 00 00       	push   $0x845
  cb:	68 4f 08 00 00       	push   $0x84f
  d0:	6a 01                	push   $0x1
  d2:	e8 9e 04 00 00       	call   575 <printf>
  d7:	83 c4 08             	add    $0x8,%esp
  da:	68 63 08 00 00       	push   $0x863
  df:	6a 01                	push   $0x1
  e1:	e8 8f 04 00 00       	call   575 <printf>
  e6:	83 c4 04             	add    $0x4,%esp
  e9:	ff 35 2c 0c 00 00    	pushl  0xc2c
  ef:	e8 70 03 00 00       	call   464 <kill>
  f4:	e8 33 03 00 00       	call   42c <exit>
   printf(1, "TEST PASSED\n");
  f9:	83 ec 08             	sub    $0x8,%esp
  fc:	68 70 08 00 00       	push   $0x870
 101:	6a 01                	push   $0x1
 103:	e8 6d 04 00 00       	call   575 <printf>
   free(p);
 108:	89 1c 24             	mov    %ebx,(%esp)
 10b:	e8 d2 05 00 00       	call   6e2 <free>
   exit();
 110:	e8 17 03 00 00       	call   42c <exit>

00000115 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 115:	f3 0f 1e fb          	endbr32 
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	56                   	push   %esi
 11d:	53                   	push   %ebx
 11e:	8b 75 08             	mov    0x8(%ebp),%esi
 121:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 124:	89 f0                	mov    %esi,%eax
 126:	89 d1                	mov    %edx,%ecx
 128:	83 c2 01             	add    $0x1,%edx
 12b:	89 c3                	mov    %eax,%ebx
 12d:	83 c0 01             	add    $0x1,%eax
 130:	0f b6 09             	movzbl (%ecx),%ecx
 133:	88 0b                	mov    %cl,(%ebx)
 135:	84 c9                	test   %cl,%cl
 137:	75 ed                	jne    126 <strcpy+0x11>
    ;
  return os;
}
 139:	89 f0                	mov    %esi,%eax
 13b:	5b                   	pop    %ebx
 13c:	5e                   	pop    %esi
 13d:	5d                   	pop    %ebp
 13e:	c3                   	ret    

0000013f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 13f:	f3 0f 1e fb          	endbr32 
 143:	55                   	push   %ebp
 144:	89 e5                	mov    %esp,%ebp
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 14c:	0f b6 01             	movzbl (%ecx),%eax
 14f:	84 c0                	test   %al,%al
 151:	74 0c                	je     15f <strcmp+0x20>
 153:	3a 02                	cmp    (%edx),%al
 155:	75 08                	jne    15f <strcmp+0x20>
    p++, q++;
 157:	83 c1 01             	add    $0x1,%ecx
 15a:	83 c2 01             	add    $0x1,%edx
 15d:	eb ed                	jmp    14c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 15f:	0f b6 c0             	movzbl %al,%eax
 162:	0f b6 12             	movzbl (%edx),%edx
 165:	29 d0                	sub    %edx,%eax
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    

00000169 <strlen>:

uint
strlen(const char *s)
{
 169:	f3 0f 1e fb          	endbr32 
 16d:	55                   	push   %ebp
 16e:	89 e5                	mov    %esp,%ebp
 170:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 173:	b8 00 00 00 00       	mov    $0x0,%eax
 178:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 17c:	74 05                	je     183 <strlen+0x1a>
 17e:	83 c0 01             	add    $0x1,%eax
 181:	eb f5                	jmp    178 <strlen+0xf>
    ;
  return n;
}
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    

00000185 <memset>:

void*
memset(void *dst, int c, uint n)
{
 185:	f3 0f 1e fb          	endbr32 
 189:	55                   	push   %ebp
 18a:	89 e5                	mov    %esp,%ebp
 18c:	57                   	push   %edi
 18d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 190:	89 d7                	mov    %edx,%edi
 192:	8b 4d 10             	mov    0x10(%ebp),%ecx
 195:	8b 45 0c             	mov    0xc(%ebp),%eax
 198:	fc                   	cld    
 199:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 19b:	89 d0                	mov    %edx,%eax
 19d:	5f                   	pop    %edi
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	f3 0f 1e fb          	endbr32 
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ae:	0f b6 10             	movzbl (%eax),%edx
 1b1:	84 d2                	test   %dl,%dl
 1b3:	74 09                	je     1be <strchr+0x1e>
    if(*s == c)
 1b5:	38 ca                	cmp    %cl,%dl
 1b7:	74 0a                	je     1c3 <strchr+0x23>
  for(; *s; s++)
 1b9:	83 c0 01             	add    $0x1,%eax
 1bc:	eb f0                	jmp    1ae <strchr+0xe>
      return (char*)s;
  return 0;
 1be:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    

000001c5 <gets>:

char*
gets(char *buf, int max)
{
 1c5:	f3 0f 1e fb          	endbr32 
 1c9:	55                   	push   %ebp
 1ca:	89 e5                	mov    %esp,%ebp
 1cc:	57                   	push   %edi
 1cd:	56                   	push   %esi
 1ce:	53                   	push   %ebx
 1cf:	83 ec 1c             	sub    $0x1c,%esp
 1d2:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d5:	bb 00 00 00 00       	mov    $0x0,%ebx
 1da:	89 de                	mov    %ebx,%esi
 1dc:	83 c3 01             	add    $0x1,%ebx
 1df:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e2:	7d 2e                	jge    212 <gets+0x4d>
    cc = read(0, &c, 1);
 1e4:	83 ec 04             	sub    $0x4,%esp
 1e7:	6a 01                	push   $0x1
 1e9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ec:	50                   	push   %eax
 1ed:	6a 00                	push   $0x0
 1ef:	e8 58 02 00 00       	call   44c <read>
    if(cc < 1)
 1f4:	83 c4 10             	add    $0x10,%esp
 1f7:	85 c0                	test   %eax,%eax
 1f9:	7e 17                	jle    212 <gets+0x4d>
      break;
    buf[i++] = c;
 1fb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ff:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 202:	3c 0a                	cmp    $0xa,%al
 204:	0f 94 c2             	sete   %dl
 207:	3c 0d                	cmp    $0xd,%al
 209:	0f 94 c0             	sete   %al
 20c:	08 c2                	or     %al,%dl
 20e:	74 ca                	je     1da <gets+0x15>
    buf[i++] = c;
 210:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 212:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 216:	89 f8                	mov    %edi,%eax
 218:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21b:	5b                   	pop    %ebx
 21c:	5e                   	pop    %esi
 21d:	5f                   	pop    %edi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    

00000220 <stat>:

int
stat(const char *n, struct stat *st)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	6a 00                	push   $0x0
 22e:	ff 75 08             	pushl  0x8(%ebp)
 231:	e8 3e 02 00 00       	call   474 <open>
  if(fd < 0)
 236:	83 c4 10             	add    $0x10,%esp
 239:	85 c0                	test   %eax,%eax
 23b:	78 24                	js     261 <stat+0x41>
 23d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 23f:	83 ec 08             	sub    $0x8,%esp
 242:	ff 75 0c             	pushl  0xc(%ebp)
 245:	50                   	push   %eax
 246:	e8 41 02 00 00       	call   48c <fstat>
 24b:	89 c6                	mov    %eax,%esi
  close(fd);
 24d:	89 1c 24             	mov    %ebx,(%esp)
 250:	e8 07 02 00 00       	call   45c <close>
  return r;
 255:	83 c4 10             	add    $0x10,%esp
}
 258:	89 f0                	mov    %esi,%eax
 25a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
    return -1;
 261:	be ff ff ff ff       	mov    $0xffffffff,%esi
 266:	eb f0                	jmp    258 <stat+0x38>

00000268 <atoi>:

int
atoi(const char *s)
{
 268:	f3 0f 1e fb          	endbr32 
 26c:	55                   	push   %ebp
 26d:	89 e5                	mov    %esp,%ebp
 26f:	53                   	push   %ebx
 270:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 273:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 278:	0f b6 01             	movzbl (%ecx),%eax
 27b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 27e:	80 fb 09             	cmp    $0x9,%bl
 281:	77 12                	ja     295 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 283:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 286:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 289:	83 c1 01             	add    $0x1,%ecx
 28c:	0f be c0             	movsbl %al,%eax
 28f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 293:	eb e3                	jmp    278 <atoi+0x10>
  return n;
}
 295:	89 d0                	mov    %edx,%eax
 297:	5b                   	pop    %ebx
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    

0000029a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29a:	f3 0f 1e fb          	endbr32 
 29e:	55                   	push   %ebp
 29f:	89 e5                	mov    %esp,%ebp
 2a1:	56                   	push   %esi
 2a2:	53                   	push   %ebx
 2a3:	8b 75 08             	mov    0x8(%ebp),%esi
 2a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2a9:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 2ac:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 2ae:	8d 58 ff             	lea    -0x1(%eax),%ebx
 2b1:	85 c0                	test   %eax,%eax
 2b3:	7e 0f                	jle    2c4 <memmove+0x2a>
    *dst++ = *src++;
 2b5:	0f b6 01             	movzbl (%ecx),%eax
 2b8:	88 02                	mov    %al,(%edx)
 2ba:	8d 49 01             	lea    0x1(%ecx),%ecx
 2bd:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2c0:	89 d8                	mov    %ebx,%eax
 2c2:	eb ea                	jmp    2ae <memmove+0x14>
  return vdst;
}
 2c4:	89 f0                	mov    %esi,%eax
 2c6:	5b                   	pop    %ebx
 2c7:	5e                   	pop    %esi
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    

000002ca <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2ca:	f3 0f 1e fb          	endbr32 
 2ce:	55                   	push   %ebp
 2cf:	89 e5                	mov    %esp,%ebp
 2d1:	53                   	push   %ebx
 2d2:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 2d5:	68 00 20 00 00       	push   $0x2000
 2da:	e8 c7 04 00 00       	call   7a6 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 2df:	83 c4 10             	add    $0x10,%esp
 2e2:	89 c2                	mov    %eax,%edx
 2e4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 2ea:	74 22                	je     30e <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 2ec:	b9 00 10 00 00       	mov    $0x1000,%ecx
 2f1:	29 d1                	sub    %edx,%ecx
 2f3:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 2f5:	ba 00 00 00 00       	mov    $0x0,%edx
 2fa:	83 fa 3f             	cmp    $0x3f,%edx
 2fd:	7f 13                	jg     312 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 2ff:	83 3c 95 40 0f 00 00 	cmpl   $0x1,0xf40(,%edx,4)
 306:	01 
 307:	75 09                	jne    312 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 309:	83 c2 01             	add    $0x1,%edx
 30c:	eb ec                	jmp    2fa <thread_create+0x30>
  void *user_stack = curr_ptr;
 30e:	89 c1                	mov    %eax,%ecx
 310:	eb e3                	jmp    2f5 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 312:	83 3c 95 40 0f 00 00 	cmpl   $0x1,0xf40(,%edx,4)
 319:	01 
 31a:	74 34                	je     350 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 31c:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 31f:	c1 e3 02             	shl    $0x2,%ebx
 322:	89 83 40 0c 00 00    	mov    %eax,0xc40(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 328:	89 8b 44 0c 00 00    	mov    %ecx,0xc44(%ebx)
  cell_full[i] = 1;
 32e:	c7 04 95 40 0f 00 00 	movl   $0x1,0xf40(,%edx,4)
 335:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 339:	ff 75 10             	pushl  0x10(%ebp)
 33c:	ff 75 0c             	pushl  0xc(%ebp)
 33f:	ff 75 08             	pushl  0x8(%ebp)
 342:	51                   	push   %ecx
 343:	e8 dc 00 00 00       	call   424 <clone>
 348:	83 c4 10             	add    $0x10,%esp
}
 34b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34e:	c9                   	leave  
 34f:	c3                   	ret    
    return -1;
 350:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 355:	eb f4                	jmp    34b <thread_create+0x81>

00000357 <thread_join>:

int thread_join(){
 357:	f3 0f 1e fb          	endbr32 
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	56                   	push   %esi
 35f:	53                   	push   %ebx
 360:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 363:	8d 45 f4             	lea    -0xc(%ebp),%eax
 366:	50                   	push   %eax
 367:	e8 d0 00 00 00       	call   43c <join>
 36c:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 36e:	83 c4 10             	add    $0x10,%esp
 371:	bb 00 00 00 00       	mov    $0x0,%ebx
 376:	83 fb 3f             	cmp    $0x3f,%ebx
 379:	7f 14                	jg     38f <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 37b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 37e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 381:	39 14 85 44 0c 00 00 	cmp    %edx,0xc44(,%eax,4)
 388:	74 05                	je     38f <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 38a:	83 c3 01             	add    $0x1,%ebx
 38d:	eb e7                	jmp    376 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 38f:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 392:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 395:	39 0c 85 44 0c 00 00 	cmp    %ecx,0xc44(,%eax,4)
 39c:	75 26                	jne    3c4 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 39e:	83 ec 0c             	sub    $0xc,%esp
 3a1:	ff 34 85 40 0c 00 00 	pushl  0xc40(,%eax,4)
 3a8:	e8 35 03 00 00       	call   6e2 <free>
  cell_full[i] = 0;
 3ad:	c7 04 9d 40 0f 00 00 	movl   $0x0,0xf40(,%ebx,4)
 3b4:	00 00 00 00 

  return out;
 3b8:	83 c4 10             	add    $0x10,%esp
}
 3bb:	89 f0                	mov    %esi,%eax
 3bd:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3c0:	5b                   	pop    %ebx
 3c1:	5e                   	pop    %esi
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 3c4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3c9:	eb f0                	jmp    3bb <thread_join+0x64>

000003cb <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 3cb:	f3 0f 1e fb          	endbr32 
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3db:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3e2:	5d                   	pop    %ebp
 3e3:	c3                   	ret    

000003e4 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 3e4:	f3 0f 1e fb          	endbr32 
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 3ee:	b9 01 00 00 00       	mov    $0x1,%ecx
 3f3:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 3f7:	b8 00 00 00 00       	mov    $0x0,%eax
 3fc:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 401:	39 c1                	cmp    %eax,%ecx
 403:	75 f2                	jne    3f7 <lock_acquire+0x13>
      ; // spin
    }
}
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    

00000407 <lock_release>:

void lock_release(lock_t *lock) {
 407:	f3 0f 1e fb          	endbr32 
 40b:	55                   	push   %ebp
 40c:	89 e5                	mov    %esp,%ebp
 40e:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 411:	8b 42 04             	mov    0x4(%edx),%eax
 414:	83 c0 01             	add    $0x1,%eax
 417:	89 42 04             	mov    %eax,0x4(%edx)
}
 41a:	5d                   	pop    %ebp
 41b:	c3                   	ret    

0000041c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 41c:	b8 01 00 00 00       	mov    $0x1,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <clone>:
SYSCALL(clone)
 424:	b8 16 00 00 00       	mov    $0x16,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <exit>:
SYSCALL(exit)
 42c:	b8 02 00 00 00       	mov    $0x2,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <wait>:
SYSCALL(wait)
 434:	b8 03 00 00 00       	mov    $0x3,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <join>:
SYSCALL(join)
 43c:	b8 17 00 00 00       	mov    $0x17,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <pipe>:
SYSCALL(pipe)
 444:	b8 04 00 00 00       	mov    $0x4,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <read>:
SYSCALL(read)
 44c:	b8 05 00 00 00       	mov    $0x5,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <write>:
SYSCALL(write)
 454:	b8 10 00 00 00       	mov    $0x10,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <close>:
SYSCALL(close)
 45c:	b8 15 00 00 00       	mov    $0x15,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <kill>:
SYSCALL(kill)
 464:	b8 06 00 00 00       	mov    $0x6,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <exec>:
SYSCALL(exec)
 46c:	b8 07 00 00 00       	mov    $0x7,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <open>:
SYSCALL(open)
 474:	b8 0f 00 00 00       	mov    $0xf,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <mknod>:
SYSCALL(mknod)
 47c:	b8 11 00 00 00       	mov    $0x11,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <unlink>:
SYSCALL(unlink)
 484:	b8 12 00 00 00       	mov    $0x12,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <fstat>:
SYSCALL(fstat)
 48c:	b8 08 00 00 00       	mov    $0x8,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <link>:
SYSCALL(link)
 494:	b8 13 00 00 00       	mov    $0x13,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <mkdir>:
SYSCALL(mkdir)
 49c:	b8 14 00 00 00       	mov    $0x14,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <chdir>:
SYSCALL(chdir)
 4a4:	b8 09 00 00 00       	mov    $0x9,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <dup>:
SYSCALL(dup)
 4ac:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <getpid>:
SYSCALL(getpid)
 4b4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <sbrk>:
SYSCALL(sbrk)
 4bc:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <sleep>:
SYSCALL(sleep)
 4c4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <uptime>:
SYSCALL(uptime)
 4cc:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	83 ec 1c             	sub    $0x1c,%esp
 4da:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4dd:	6a 01                	push   $0x1
 4df:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4e2:	52                   	push   %edx
 4e3:	50                   	push   %eax
 4e4:	e8 6b ff ff ff       	call   454 <write>
}
 4e9:	83 c4 10             	add    $0x10,%esp
 4ec:	c9                   	leave  
 4ed:	c3                   	ret    

000004ee <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	57                   	push   %edi
 4f2:	56                   	push   %esi
 4f3:	53                   	push   %ebx
 4f4:	83 ec 2c             	sub    $0x2c,%esp
 4f7:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4fa:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4fc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 500:	0f 95 c2             	setne  %dl
 503:	89 f0                	mov    %esi,%eax
 505:	c1 e8 1f             	shr    $0x1f,%eax
 508:	84 c2                	test   %al,%dl
 50a:	74 42                	je     54e <printint+0x60>
    neg = 1;
    x = -xx;
 50c:	f7 de                	neg    %esi
    neg = 1;
 50e:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 515:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 51a:	89 f0                	mov    %esi,%eax
 51c:	ba 00 00 00 00       	mov    $0x0,%edx
 521:	f7 f1                	div    %ecx
 523:	89 df                	mov    %ebx,%edi
 525:	83 c3 01             	add    $0x1,%ebx
 528:	0f b6 92 a8 08 00 00 	movzbl 0x8a8(%edx),%edx
 52f:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 533:	89 f2                	mov    %esi,%edx
 535:	89 c6                	mov    %eax,%esi
 537:	39 d1                	cmp    %edx,%ecx
 539:	76 df                	jbe    51a <printint+0x2c>
  if(neg)
 53b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 53f:	74 2f                	je     570 <printint+0x82>
    buf[i++] = '-';
 541:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 546:	8d 5f 02             	lea    0x2(%edi),%ebx
 549:	8b 75 d0             	mov    -0x30(%ebp),%esi
 54c:	eb 15                	jmp    563 <printint+0x75>
  neg = 0;
 54e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 555:	eb be                	jmp    515 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 557:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 55c:	89 f0                	mov    %esi,%eax
 55e:	e8 71 ff ff ff       	call   4d4 <putc>
  while(--i >= 0)
 563:	83 eb 01             	sub    $0x1,%ebx
 566:	79 ef                	jns    557 <printint+0x69>
}
 568:	83 c4 2c             	add    $0x2c,%esp
 56b:	5b                   	pop    %ebx
 56c:	5e                   	pop    %esi
 56d:	5f                   	pop    %edi
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    
 570:	8b 75 d0             	mov    -0x30(%ebp),%esi
 573:	eb ee                	jmp    563 <printint+0x75>

00000575 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 575:	f3 0f 1e fb          	endbr32 
 579:	55                   	push   %ebp
 57a:	89 e5                	mov    %esp,%ebp
 57c:	57                   	push   %edi
 57d:	56                   	push   %esi
 57e:	53                   	push   %ebx
 57f:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 582:	8d 45 10             	lea    0x10(%ebp),%eax
 585:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 588:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 58d:	bb 00 00 00 00       	mov    $0x0,%ebx
 592:	eb 14                	jmp    5a8 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 594:	89 fa                	mov    %edi,%edx
 596:	8b 45 08             	mov    0x8(%ebp),%eax
 599:	e8 36 ff ff ff       	call   4d4 <putc>
 59e:	eb 05                	jmp    5a5 <printf+0x30>
      }
    } else if(state == '%'){
 5a0:	83 fe 25             	cmp    $0x25,%esi
 5a3:	74 25                	je     5ca <printf+0x55>
  for(i = 0; fmt[i]; i++){
 5a5:	83 c3 01             	add    $0x1,%ebx
 5a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ab:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 5af:	84 c0                	test   %al,%al
 5b1:	0f 84 23 01 00 00    	je     6da <printf+0x165>
    c = fmt[i] & 0xff;
 5b7:	0f be f8             	movsbl %al,%edi
 5ba:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5bd:	85 f6                	test   %esi,%esi
 5bf:	75 df                	jne    5a0 <printf+0x2b>
      if(c == '%'){
 5c1:	83 f8 25             	cmp    $0x25,%eax
 5c4:	75 ce                	jne    594 <printf+0x1f>
        state = '%';
 5c6:	89 c6                	mov    %eax,%esi
 5c8:	eb db                	jmp    5a5 <printf+0x30>
      if(c == 'd'){
 5ca:	83 f8 64             	cmp    $0x64,%eax
 5cd:	74 49                	je     618 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5cf:	83 f8 78             	cmp    $0x78,%eax
 5d2:	0f 94 c1             	sete   %cl
 5d5:	83 f8 70             	cmp    $0x70,%eax
 5d8:	0f 94 c2             	sete   %dl
 5db:	08 d1                	or     %dl,%cl
 5dd:	75 63                	jne    642 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5df:	83 f8 73             	cmp    $0x73,%eax
 5e2:	0f 84 84 00 00 00    	je     66c <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5e8:	83 f8 63             	cmp    $0x63,%eax
 5eb:	0f 84 b7 00 00 00    	je     6a8 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5f1:	83 f8 25             	cmp    $0x25,%eax
 5f4:	0f 84 cc 00 00 00    	je     6c6 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5fa:	ba 25 00 00 00       	mov    $0x25,%edx
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	e8 cd fe ff ff       	call   4d4 <putc>
        putc(fd, c);
 607:	89 fa                	mov    %edi,%edx
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	e8 c3 fe ff ff       	call   4d4 <putc>
      }
      state = 0;
 611:	be 00 00 00 00       	mov    $0x0,%esi
 616:	eb 8d                	jmp    5a5 <printf+0x30>
        printint(fd, *ap, 10, 1);
 618:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 61b:	8b 17                	mov    (%edi),%edx
 61d:	83 ec 0c             	sub    $0xc,%esp
 620:	6a 01                	push   $0x1
 622:	b9 0a 00 00 00       	mov    $0xa,%ecx
 627:	8b 45 08             	mov    0x8(%ebp),%eax
 62a:	e8 bf fe ff ff       	call   4ee <printint>
        ap++;
 62f:	83 c7 04             	add    $0x4,%edi
 632:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 635:	83 c4 10             	add    $0x10,%esp
      state = 0;
 638:	be 00 00 00 00       	mov    $0x0,%esi
 63d:	e9 63 ff ff ff       	jmp    5a5 <printf+0x30>
        printint(fd, *ap, 16, 0);
 642:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 645:	8b 17                	mov    (%edi),%edx
 647:	83 ec 0c             	sub    $0xc,%esp
 64a:	6a 00                	push   $0x0
 64c:	b9 10 00 00 00       	mov    $0x10,%ecx
 651:	8b 45 08             	mov    0x8(%ebp),%eax
 654:	e8 95 fe ff ff       	call   4ee <printint>
        ap++;
 659:	83 c7 04             	add    $0x4,%edi
 65c:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 65f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 662:	be 00 00 00 00       	mov    $0x0,%esi
 667:	e9 39 ff ff ff       	jmp    5a5 <printf+0x30>
        s = (char*)*ap;
 66c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66f:	8b 30                	mov    (%eax),%esi
        ap++;
 671:	83 c0 04             	add    $0x4,%eax
 674:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 677:	85 f6                	test   %esi,%esi
 679:	75 28                	jne    6a3 <printf+0x12e>
          s = "(null)";
 67b:	be a1 08 00 00       	mov    $0x8a1,%esi
 680:	8b 7d 08             	mov    0x8(%ebp),%edi
 683:	eb 0d                	jmp    692 <printf+0x11d>
          putc(fd, *s);
 685:	0f be d2             	movsbl %dl,%edx
 688:	89 f8                	mov    %edi,%eax
 68a:	e8 45 fe ff ff       	call   4d4 <putc>
          s++;
 68f:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 692:	0f b6 16             	movzbl (%esi),%edx
 695:	84 d2                	test   %dl,%dl
 697:	75 ec                	jne    685 <printf+0x110>
      state = 0;
 699:	be 00 00 00 00       	mov    $0x0,%esi
 69e:	e9 02 ff ff ff       	jmp    5a5 <printf+0x30>
 6a3:	8b 7d 08             	mov    0x8(%ebp),%edi
 6a6:	eb ea                	jmp    692 <printf+0x11d>
        putc(fd, *ap);
 6a8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 6ab:	0f be 17             	movsbl (%edi),%edx
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	e8 1e fe ff ff       	call   4d4 <putc>
        ap++;
 6b6:	83 c7 04             	add    $0x4,%edi
 6b9:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6bc:	be 00 00 00 00       	mov    $0x0,%esi
 6c1:	e9 df fe ff ff       	jmp    5a5 <printf+0x30>
        putc(fd, c);
 6c6:	89 fa                	mov    %edi,%edx
 6c8:	8b 45 08             	mov    0x8(%ebp),%eax
 6cb:	e8 04 fe ff ff       	call   4d4 <putc>
      state = 0;
 6d0:	be 00 00 00 00       	mov    $0x0,%esi
 6d5:	e9 cb fe ff ff       	jmp    5a5 <printf+0x30>
    }
  }
}
 6da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6dd:	5b                   	pop    %ebx
 6de:	5e                   	pop    %esi
 6df:	5f                   	pop    %edi
 6e0:	5d                   	pop    %ebp
 6e1:	c3                   	ret    

000006e2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e2:	f3 0f 1e fb          	endbr32 
 6e6:	55                   	push   %ebp
 6e7:	89 e5                	mov    %esp,%ebp
 6e9:	57                   	push   %edi
 6ea:	56                   	push   %esi
 6eb:	53                   	push   %ebx
 6ec:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ef:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f2:	a1 20 0c 00 00       	mov    0xc20,%eax
 6f7:	eb 02                	jmp    6fb <free+0x19>
 6f9:	89 d0                	mov    %edx,%eax
 6fb:	39 c8                	cmp    %ecx,%eax
 6fd:	73 04                	jae    703 <free+0x21>
 6ff:	39 08                	cmp    %ecx,(%eax)
 701:	77 12                	ja     715 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 703:	8b 10                	mov    (%eax),%edx
 705:	39 c2                	cmp    %eax,%edx
 707:	77 f0                	ja     6f9 <free+0x17>
 709:	39 c8                	cmp    %ecx,%eax
 70b:	72 08                	jb     715 <free+0x33>
 70d:	39 ca                	cmp    %ecx,%edx
 70f:	77 04                	ja     715 <free+0x33>
 711:	89 d0                	mov    %edx,%eax
 713:	eb e6                	jmp    6fb <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 715:	8b 73 fc             	mov    -0x4(%ebx),%esi
 718:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71b:	8b 10                	mov    (%eax),%edx
 71d:	39 d7                	cmp    %edx,%edi
 71f:	74 19                	je     73a <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 721:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 724:	8b 50 04             	mov    0x4(%eax),%edx
 727:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 72a:	39 ce                	cmp    %ecx,%esi
 72c:	74 1b                	je     749 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 72e:	89 08                	mov    %ecx,(%eax)
  freep = p;
 730:	a3 20 0c 00 00       	mov    %eax,0xc20
}
 735:	5b                   	pop    %ebx
 736:	5e                   	pop    %esi
 737:	5f                   	pop    %edi
 738:	5d                   	pop    %ebp
 739:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 73a:	03 72 04             	add    0x4(%edx),%esi
 73d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 740:	8b 10                	mov    (%eax),%edx
 742:	8b 12                	mov    (%edx),%edx
 744:	89 53 f8             	mov    %edx,-0x8(%ebx)
 747:	eb db                	jmp    724 <free+0x42>
    p->s.size += bp->s.size;
 749:	03 53 fc             	add    -0x4(%ebx),%edx
 74c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 74f:	8b 53 f8             	mov    -0x8(%ebx),%edx
 752:	89 10                	mov    %edx,(%eax)
 754:	eb da                	jmp    730 <free+0x4e>

00000756 <morecore>:

static Header*
morecore(uint nu)
{
 756:	55                   	push   %ebp
 757:	89 e5                	mov    %esp,%ebp
 759:	53                   	push   %ebx
 75a:	83 ec 04             	sub    $0x4,%esp
 75d:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 75f:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 764:	77 05                	ja     76b <morecore+0x15>
    nu = 4096;
 766:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 76b:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 772:	83 ec 0c             	sub    $0xc,%esp
 775:	50                   	push   %eax
 776:	e8 41 fd ff ff       	call   4bc <sbrk>
  if(p == (char*)-1)
 77b:	83 c4 10             	add    $0x10,%esp
 77e:	83 f8 ff             	cmp    $0xffffffff,%eax
 781:	74 1c                	je     79f <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 783:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 786:	83 c0 08             	add    $0x8,%eax
 789:	83 ec 0c             	sub    $0xc,%esp
 78c:	50                   	push   %eax
 78d:	e8 50 ff ff ff       	call   6e2 <free>
  return freep;
 792:	a1 20 0c 00 00       	mov    0xc20,%eax
 797:	83 c4 10             	add    $0x10,%esp
}
 79a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 79d:	c9                   	leave  
 79e:	c3                   	ret    
    return 0;
 79f:	b8 00 00 00 00       	mov    $0x0,%eax
 7a4:	eb f4                	jmp    79a <morecore+0x44>

000007a6 <malloc>:

void*
malloc(uint nbytes)
{
 7a6:	f3 0f 1e fb          	endbr32 
 7aa:	55                   	push   %ebp
 7ab:	89 e5                	mov    %esp,%ebp
 7ad:	53                   	push   %ebx
 7ae:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	8d 58 07             	lea    0x7(%eax),%ebx
 7b7:	c1 eb 03             	shr    $0x3,%ebx
 7ba:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7bd:	8b 0d 20 0c 00 00    	mov    0xc20,%ecx
 7c3:	85 c9                	test   %ecx,%ecx
 7c5:	74 04                	je     7cb <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c7:	8b 01                	mov    (%ecx),%eax
 7c9:	eb 4b                	jmp    816 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 7cb:	c7 05 20 0c 00 00 24 	movl   $0xc24,0xc20
 7d2:	0c 00 00 
 7d5:	c7 05 24 0c 00 00 24 	movl   $0xc24,0xc24
 7dc:	0c 00 00 
    base.s.size = 0;
 7df:	c7 05 28 0c 00 00 00 	movl   $0x0,0xc28
 7e6:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7e9:	b9 24 0c 00 00       	mov    $0xc24,%ecx
 7ee:	eb d7                	jmp    7c7 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7f0:	74 1a                	je     80c <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7f2:	29 da                	sub    %ebx,%edx
 7f4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7f7:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7fa:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7fd:	89 0d 20 0c 00 00    	mov    %ecx,0xc20
      return (void*)(p + 1);
 803:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 806:	83 c4 04             	add    $0x4,%esp
 809:	5b                   	pop    %ebx
 80a:	5d                   	pop    %ebp
 80b:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 80c:	8b 10                	mov    (%eax),%edx
 80e:	89 11                	mov    %edx,(%ecx)
 810:	eb eb                	jmp    7fd <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 812:	89 c1                	mov    %eax,%ecx
 814:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 816:	8b 50 04             	mov    0x4(%eax),%edx
 819:	39 da                	cmp    %ebx,%edx
 81b:	73 d3                	jae    7f0 <malloc+0x4a>
    if(p == freep)
 81d:	39 05 20 0c 00 00    	cmp    %eax,0xc20
 823:	75 ed                	jne    812 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 825:	89 d8                	mov    %ebx,%eax
 827:	e8 2a ff ff ff       	call   756 <morecore>
 82c:	85 c0                	test   %eax,%eax
 82e:	75 e2                	jne    812 <malloc+0x6c>
 830:	eb d4                	jmp    806 <malloc+0x60>
