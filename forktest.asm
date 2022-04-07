
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	53                   	push   %ebx
   8:	83 ec 10             	sub    $0x10,%esp
   b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
   e:	53                   	push   %ebx
   f:	e8 35 01 00 00       	call   149 <strlen>
  14:	83 c4 0c             	add    $0xc,%esp
  17:	50                   	push   %eax
  18:	53                   	push   %ebx
  19:	ff 75 08             	pushl  0x8(%ebp)
  1c:	e8 13 04 00 00       	call   434 <write>
}
  21:	83 c4 10             	add    $0x10,%esp
  24:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	f3 0f 1e fb          	endbr32 
  2d:	55                   	push   %ebp
  2e:	89 e5                	mov    %esp,%ebp
  30:	53                   	push   %ebx
  31:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
  34:	68 04 06 00 00       	push   $0x604
  39:	6a 01                	push   $0x1
  3b:	e8 c0 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  40:	83 c4 10             	add    $0x10,%esp
  43:	bb 00 00 00 00       	mov    $0x0,%ebx
  48:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
  4e:	7f 15                	jg     65 <forktest+0x3c>
    pid = fork();
  50:	e8 a7 03 00 00       	call   3fc <fork>
    if(pid < 0)
  55:	85 c0                	test   %eax,%eax
  57:	78 0c                	js     65 <forktest+0x3c>
      break;
    if(pid == 0)
  59:	74 05                	je     60 <forktest+0x37>
  for(n=0; n<N; n++){
  5b:	83 c3 01             	add    $0x1,%ebx
  5e:	eb e8                	jmp    48 <forktest+0x1f>
      exit();
  60:	e8 a7 03 00 00       	call   40c <exit>
  }

  if(n == N){
  65:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  6b:	74 12                	je     7f <forktest+0x56>
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  6d:	85 db                	test   %ebx,%ebx
  6f:	7e 3b                	jle    ac <forktest+0x83>
    if(wait() < 0){
  71:	e8 9e 03 00 00       	call   414 <wait>
  76:	85 c0                	test   %eax,%eax
  78:	78 1e                	js     98 <forktest+0x6f>
  for(; n > 0; n--){
  7a:	83 eb 01             	sub    $0x1,%ebx
  7d:	eb ee                	jmp    6d <forktest+0x44>
    printf(1, "fork claimed to work N times!\n", N);
  7f:	83 ec 04             	sub    $0x4,%esp
  82:	68 e8 03 00 00       	push   $0x3e8
  87:	68 44 06 00 00       	push   $0x644
  8c:	6a 01                	push   $0x1
  8e:	e8 6d ff ff ff       	call   0 <printf>
    exit();
  93:	e8 74 03 00 00       	call   40c <exit>
      printf(1, "wait stopped early\n");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 0f 06 00 00       	push   $0x60f
  a0:	6a 01                	push   $0x1
  a2:	e8 59 ff ff ff       	call   0 <printf>
      exit();
  a7:	e8 60 03 00 00       	call   40c <exit>
    }
  }

  if(wait() != -1){
  ac:	e8 63 03 00 00       	call   414 <wait>
  b1:	83 f8 ff             	cmp    $0xffffffff,%eax
  b4:	75 17                	jne    cd <forktest+0xa4>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
  b6:	83 ec 08             	sub    $0x8,%esp
  b9:	68 36 06 00 00       	push   $0x636
  be:	6a 01                	push   $0x1
  c0:	e8 3b ff ff ff       	call   0 <printf>
}
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cb:	c9                   	leave  
  cc:	c3                   	ret    
    printf(1, "wait got too many\n");
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	68 23 06 00 00       	push   $0x623
  d5:	6a 01                	push   $0x1
  d7:	e8 24 ff ff ff       	call   0 <printf>
    exit();
  dc:	e8 2b 03 00 00       	call   40c <exit>

000000e1 <main>:

int
main(void)
{
  e1:	f3 0f 1e fb          	endbr32 
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
  eb:	e8 39 ff ff ff       	call   29 <forktest>
  exit();
  f0:	e8 17 03 00 00       	call   40c <exit>

000000f5 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  f5:	f3 0f 1e fb          	endbr32 
  f9:	55                   	push   %ebp
  fa:	89 e5                	mov    %esp,%ebp
  fc:	56                   	push   %esi
  fd:	53                   	push   %ebx
  fe:	8b 75 08             	mov    0x8(%ebp),%esi
 101:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 104:	89 f0                	mov    %esi,%eax
 106:	89 d1                	mov    %edx,%ecx
 108:	83 c2 01             	add    $0x1,%edx
 10b:	89 c3                	mov    %eax,%ebx
 10d:	83 c0 01             	add    $0x1,%eax
 110:	0f b6 09             	movzbl (%ecx),%ecx
 113:	88 0b                	mov    %cl,(%ebx)
 115:	84 c9                	test   %cl,%cl
 117:	75 ed                	jne    106 <strcpy+0x11>
    ;
  return os;
}
 119:	89 f0                	mov    %esi,%eax
 11b:	5b                   	pop    %ebx
 11c:	5e                   	pop    %esi
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    

0000011f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11f:	f3 0f 1e fb          	endbr32 
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 12c:	0f b6 01             	movzbl (%ecx),%eax
 12f:	84 c0                	test   %al,%al
 131:	74 0c                	je     13f <strcmp+0x20>
 133:	3a 02                	cmp    (%edx),%al
 135:	75 08                	jne    13f <strcmp+0x20>
    p++, q++;
 137:	83 c1 01             	add    $0x1,%ecx
 13a:	83 c2 01             	add    $0x1,%edx
 13d:	eb ed                	jmp    12c <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 13f:	0f b6 c0             	movzbl %al,%eax
 142:	0f b6 12             	movzbl (%edx),%edx
 145:	29 d0                	sub    %edx,%eax
}
 147:	5d                   	pop    %ebp
 148:	c3                   	ret    

00000149 <strlen>:

uint
strlen(const char *s)
{
 149:	f3 0f 1e fb          	endbr32 
 14d:	55                   	push   %ebp
 14e:	89 e5                	mov    %esp,%ebp
 150:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 153:	b8 00 00 00 00       	mov    $0x0,%eax
 158:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 15c:	74 05                	je     163 <strlen+0x1a>
 15e:	83 c0 01             	add    $0x1,%eax
 161:	eb f5                	jmp    158 <strlen+0xf>
    ;
  return n;
}
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    

00000165 <memset>:

void*
memset(void *dst, int c, uint n)
{
 165:	f3 0f 1e fb          	endbr32 
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	57                   	push   %edi
 16d:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 170:	89 d7                	mov    %edx,%edi
 172:	8b 4d 10             	mov    0x10(%ebp),%ecx
 175:	8b 45 0c             	mov    0xc(%ebp),%eax
 178:	fc                   	cld    
 179:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 17b:	89 d0                	mov    %edx,%eax
 17d:	5f                   	pop    %edi
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <strchr>:

char*
strchr(const char *s, char c)
{
 180:	f3 0f 1e fb          	endbr32 
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 18e:	0f b6 10             	movzbl (%eax),%edx
 191:	84 d2                	test   %dl,%dl
 193:	74 09                	je     19e <strchr+0x1e>
    if(*s == c)
 195:	38 ca                	cmp    %cl,%dl
 197:	74 0a                	je     1a3 <strchr+0x23>
  for(; *s; s++)
 199:	83 c0 01             	add    $0x1,%eax
 19c:	eb f0                	jmp    18e <strchr+0xe>
      return (char*)s;
  return 0;
 19e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    

000001a5 <gets>:

char*
gets(char *buf, int max)
{
 1a5:	f3 0f 1e fb          	endbr32 
 1a9:	55                   	push   %ebp
 1aa:	89 e5                	mov    %esp,%ebp
 1ac:	57                   	push   %edi
 1ad:	56                   	push   %esi
 1ae:	53                   	push   %ebx
 1af:	83 ec 1c             	sub    $0x1c,%esp
 1b2:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b5:	bb 00 00 00 00       	mov    $0x0,%ebx
 1ba:	89 de                	mov    %ebx,%esi
 1bc:	83 c3 01             	add    $0x1,%ebx
 1bf:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1c2:	7d 2e                	jge    1f2 <gets+0x4d>
    cc = read(0, &c, 1);
 1c4:	83 ec 04             	sub    $0x4,%esp
 1c7:	6a 01                	push   $0x1
 1c9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1cc:	50                   	push   %eax
 1cd:	6a 00                	push   $0x0
 1cf:	e8 58 02 00 00       	call   42c <read>
    if(cc < 1)
 1d4:	83 c4 10             	add    $0x10,%esp
 1d7:	85 c0                	test   %eax,%eax
 1d9:	7e 17                	jle    1f2 <gets+0x4d>
      break;
    buf[i++] = c;
 1db:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1df:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1e2:	3c 0a                	cmp    $0xa,%al
 1e4:	0f 94 c2             	sete   %dl
 1e7:	3c 0d                	cmp    $0xd,%al
 1e9:	0f 94 c0             	sete   %al
 1ec:	08 c2                	or     %al,%dl
 1ee:	74 ca                	je     1ba <gets+0x15>
    buf[i++] = c;
 1f0:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1f2:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1f6:	89 f8                	mov    %edi,%eax
 1f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fb:	5b                   	pop    %ebx
 1fc:	5e                   	pop    %esi
 1fd:	5f                   	pop    %edi
 1fe:	5d                   	pop    %ebp
 1ff:	c3                   	ret    

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	f3 0f 1e fb          	endbr32 
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	56                   	push   %esi
 208:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	6a 00                	push   $0x0
 20e:	ff 75 08             	pushl  0x8(%ebp)
 211:	e8 3e 02 00 00       	call   454 <open>
  if(fd < 0)
 216:	83 c4 10             	add    $0x10,%esp
 219:	85 c0                	test   %eax,%eax
 21b:	78 24                	js     241 <stat+0x41>
 21d:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 21f:	83 ec 08             	sub    $0x8,%esp
 222:	ff 75 0c             	pushl  0xc(%ebp)
 225:	50                   	push   %eax
 226:	e8 41 02 00 00       	call   46c <fstat>
 22b:	89 c6                	mov    %eax,%esi
  close(fd);
 22d:	89 1c 24             	mov    %ebx,(%esp)
 230:	e8 07 02 00 00       	call   43c <close>
  return r;
 235:	83 c4 10             	add    $0x10,%esp
}
 238:	89 f0                	mov    %esi,%eax
 23a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 23d:	5b                   	pop    %ebx
 23e:	5e                   	pop    %esi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
    return -1;
 241:	be ff ff ff ff       	mov    $0xffffffff,%esi
 246:	eb f0                	jmp    238 <stat+0x38>

00000248 <atoi>:

int
atoi(const char *s)
{
 248:	f3 0f 1e fb          	endbr32 
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	53                   	push   %ebx
 250:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 253:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 258:	0f b6 01             	movzbl (%ecx),%eax
 25b:	8d 58 d0             	lea    -0x30(%eax),%ebx
 25e:	80 fb 09             	cmp    $0x9,%bl
 261:	77 12                	ja     275 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 263:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 266:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 269:	83 c1 01             	add    $0x1,%ecx
 26c:	0f be c0             	movsbl %al,%eax
 26f:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 273:	eb e3                	jmp    258 <atoi+0x10>
  return n;
}
 275:	89 d0                	mov    %edx,%eax
 277:	5b                   	pop    %ebx
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    

0000027a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 27a:	f3 0f 1e fb          	endbr32 
 27e:	55                   	push   %ebp
 27f:	89 e5                	mov    %esp,%ebp
 281:	56                   	push   %esi
 282:	53                   	push   %ebx
 283:	8b 75 08             	mov    0x8(%ebp),%esi
 286:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 289:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 28c:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 28e:	8d 58 ff             	lea    -0x1(%eax),%ebx
 291:	85 c0                	test   %eax,%eax
 293:	7e 0f                	jle    2a4 <memmove+0x2a>
    *dst++ = *src++;
 295:	0f b6 01             	movzbl (%ecx),%eax
 298:	88 02                	mov    %al,(%edx)
 29a:	8d 49 01             	lea    0x1(%ecx),%ecx
 29d:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2a0:	89 d8                	mov    %ebx,%eax
 2a2:	eb ea                	jmp    28e <memmove+0x14>
  return vdst;
}
 2a4:	89 f0                	mov    %esi,%eax
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    

000002aa <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2aa:	f3 0f 1e fb          	endbr32 
 2ae:	55                   	push   %ebp
 2af:	89 e5                	mov    %esp,%ebp
 2b1:	53                   	push   %ebx
 2b2:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 2b5:	68 00 20 00 00       	push   $0x2000
 2ba:	e8 b9 02 00 00       	call   578 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	89 c2                	mov    %eax,%edx
 2c4:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 2ca:	74 22                	je     2ee <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 2cc:	b9 00 10 00 00       	mov    $0x1000,%ecx
 2d1:	29 d1                	sub    %edx,%ecx
 2d3:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 2d5:	ba 00 00 00 00       	mov    $0x0,%edx
 2da:	83 fa 3f             	cmp    $0x3f,%edx
 2dd:	7f 13                	jg     2f2 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 2df:	83 3c 95 a0 0c 00 00 	cmpl   $0x1,0xca0(,%edx,4)
 2e6:	01 
 2e7:	75 09                	jne    2f2 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 2e9:	83 c2 01             	add    $0x1,%edx
 2ec:	eb ec                	jmp    2da <thread_create+0x30>
  void *user_stack = curr_ptr;
 2ee:	89 c1                	mov    %eax,%ecx
 2f0:	eb e3                	jmp    2d5 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 2f2:	83 3c 95 a0 0c 00 00 	cmpl   $0x1,0xca0(,%edx,4)
 2f9:	01 
 2fa:	74 34                	je     330 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 2fc:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 2ff:	c1 e3 02             	shl    $0x2,%ebx
 302:	89 83 a0 09 00 00    	mov    %eax,0x9a0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 308:	89 8b a4 09 00 00    	mov    %ecx,0x9a4(%ebx)
  cell_full[i] = 1;
 30e:	c7 04 95 a0 0c 00 00 	movl   $0x1,0xca0(,%edx,4)
 315:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 319:	ff 75 10             	pushl  0x10(%ebp)
 31c:	ff 75 0c             	pushl  0xc(%ebp)
 31f:	ff 75 08             	pushl  0x8(%ebp)
 322:	51                   	push   %ecx
 323:	e8 dc 00 00 00       	call   404 <clone>
 328:	83 c4 10             	add    $0x10,%esp
}
 32b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 32e:	c9                   	leave  
 32f:	c3                   	ret    
    return -1;
 330:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 335:	eb f4                	jmp    32b <thread_create+0x81>

00000337 <thread_join>:

int thread_join(){
 337:	f3 0f 1e fb          	endbr32 
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	56                   	push   %esi
 33f:	53                   	push   %ebx
 340:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 343:	8d 45 f4             	lea    -0xc(%ebp),%eax
 346:	50                   	push   %eax
 347:	e8 d0 00 00 00       	call   41c <join>
 34c:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 34e:	83 c4 10             	add    $0x10,%esp
 351:	bb 00 00 00 00       	mov    $0x0,%ebx
 356:	83 fb 3f             	cmp    $0x3f,%ebx
 359:	7f 14                	jg     36f <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 35b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 35e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 361:	39 14 85 a4 09 00 00 	cmp    %edx,0x9a4(,%eax,4)
 368:	74 05                	je     36f <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 36a:	83 c3 01             	add    $0x1,%ebx
 36d:	eb e7                	jmp    356 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 36f:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 372:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 375:	39 0c 85 a4 09 00 00 	cmp    %ecx,0x9a4(,%eax,4)
 37c:	75 26                	jne    3a4 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 37e:	83 ec 0c             	sub    $0xc,%esp
 381:	ff 34 85 a0 09 00 00 	pushl  0x9a0(,%eax,4)
 388:	e8 27 01 00 00       	call   4b4 <free>
  cell_full[i] = 0;
 38d:	c7 04 9d a0 0c 00 00 	movl   $0x0,0xca0(,%ebx,4)
 394:	00 00 00 00 

  return out;
 398:	83 c4 10             	add    $0x10,%esp
}
 39b:	89 f0                	mov    %esi,%eax
 39d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3a0:	5b                   	pop    %ebx
 3a1:	5e                   	pop    %esi
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 3a4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3a9:	eb f0                	jmp    39b <thread_join+0x64>

000003ab <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 3ab:	f3 0f 1e fb          	endbr32 
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3bb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3c2:	5d                   	pop    %ebp
 3c3:	c3                   	ret    

000003c4 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 3c4:	f3 0f 1e fb          	endbr32 
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 3ce:	b9 01 00 00 00       	mov    $0x1,%ecx
 3d3:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 3d7:	b8 00 00 00 00       	mov    $0x0,%eax
 3dc:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 3e1:	39 c1                	cmp    %eax,%ecx
 3e3:	75 f2                	jne    3d7 <lock_acquire+0x13>
      ; // spin
    }
}
 3e5:	5d                   	pop    %ebp
 3e6:	c3                   	ret    

000003e7 <lock_release>:

void lock_release(lock_t *lock) {
 3e7:	f3 0f 1e fb          	endbr32 
 3eb:	55                   	push   %ebp
 3ec:	89 e5                	mov    %esp,%ebp
 3ee:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 3f1:	8b 42 04             	mov    0x4(%edx),%eax
 3f4:	83 c0 01             	add    $0x1,%eax
 3f7:	89 42 04             	mov    %eax,0x4(%edx)
}
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    

000003fc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fc:	b8 01 00 00 00       	mov    $0x1,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <clone>:
SYSCALL(clone)
 404:	b8 16 00 00 00       	mov    $0x16,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <exit>:
SYSCALL(exit)
 40c:	b8 02 00 00 00       	mov    $0x2,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <wait>:
SYSCALL(wait)
 414:	b8 03 00 00 00       	mov    $0x3,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <join>:
SYSCALL(join)
 41c:	b8 17 00 00 00       	mov    $0x17,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <pipe>:
SYSCALL(pipe)
 424:	b8 04 00 00 00       	mov    $0x4,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <read>:
SYSCALL(read)
 42c:	b8 05 00 00 00       	mov    $0x5,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <write>:
SYSCALL(write)
 434:	b8 10 00 00 00       	mov    $0x10,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <close>:
SYSCALL(close)
 43c:	b8 15 00 00 00       	mov    $0x15,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <kill>:
SYSCALL(kill)
 444:	b8 06 00 00 00       	mov    $0x6,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <exec>:
SYSCALL(exec)
 44c:	b8 07 00 00 00       	mov    $0x7,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <open>:
SYSCALL(open)
 454:	b8 0f 00 00 00       	mov    $0xf,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <mknod>:
SYSCALL(mknod)
 45c:	b8 11 00 00 00       	mov    $0x11,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <unlink>:
SYSCALL(unlink)
 464:	b8 12 00 00 00       	mov    $0x12,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <fstat>:
SYSCALL(fstat)
 46c:	b8 08 00 00 00       	mov    $0x8,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <link>:
SYSCALL(link)
 474:	b8 13 00 00 00       	mov    $0x13,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <mkdir>:
SYSCALL(mkdir)
 47c:	b8 14 00 00 00       	mov    $0x14,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <chdir>:
SYSCALL(chdir)
 484:	b8 09 00 00 00       	mov    $0x9,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <dup>:
SYSCALL(dup)
 48c:	b8 0a 00 00 00       	mov    $0xa,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <getpid>:
SYSCALL(getpid)
 494:	b8 0b 00 00 00       	mov    $0xb,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <sbrk>:
SYSCALL(sbrk)
 49c:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sleep>:
SYSCALL(sleep)
 4a4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <uptime>:
SYSCALL(uptime)
 4ac:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 4b4:	f3 0f 1e fb          	endbr32 
 4b8:	55                   	push   %ebp
 4b9:	89 e5                	mov    %esp,%ebp
 4bb:	57                   	push   %edi
 4bc:	56                   	push   %esi
 4bd:	53                   	push   %ebx
 4be:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 4c1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 4c4:	a1 80 09 00 00       	mov    0x980,%eax
 4c9:	eb 02                	jmp    4cd <free+0x19>
 4cb:	89 d0                	mov    %edx,%eax
 4cd:	39 c8                	cmp    %ecx,%eax
 4cf:	73 04                	jae    4d5 <free+0x21>
 4d1:	39 08                	cmp    %ecx,(%eax)
 4d3:	77 12                	ja     4e7 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4d5:	8b 10                	mov    (%eax),%edx
 4d7:	39 c2                	cmp    %eax,%edx
 4d9:	77 f0                	ja     4cb <free+0x17>
 4db:	39 c8                	cmp    %ecx,%eax
 4dd:	72 08                	jb     4e7 <free+0x33>
 4df:	39 ca                	cmp    %ecx,%edx
 4e1:	77 04                	ja     4e7 <free+0x33>
 4e3:	89 d0                	mov    %edx,%eax
 4e5:	eb e6                	jmp    4cd <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 4e7:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4ea:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4ed:	8b 10                	mov    (%eax),%edx
 4ef:	39 d7                	cmp    %edx,%edi
 4f1:	74 19                	je     50c <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 4f3:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 4f6:	8b 50 04             	mov    0x4(%eax),%edx
 4f9:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 4fc:	39 ce                	cmp    %ecx,%esi
 4fe:	74 1b                	je     51b <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 500:	89 08                	mov    %ecx,(%eax)
  freep = p;
 502:	a3 80 09 00 00       	mov    %eax,0x980
}
 507:	5b                   	pop    %ebx
 508:	5e                   	pop    %esi
 509:	5f                   	pop    %edi
 50a:	5d                   	pop    %ebp
 50b:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 50c:	03 72 04             	add    0x4(%edx),%esi
 50f:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 512:	8b 10                	mov    (%eax),%edx
 514:	8b 12                	mov    (%edx),%edx
 516:	89 53 f8             	mov    %edx,-0x8(%ebx)
 519:	eb db                	jmp    4f6 <free+0x42>
    p->s.size += bp->s.size;
 51b:	03 53 fc             	add    -0x4(%ebx),%edx
 51e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 521:	8b 53 f8             	mov    -0x8(%ebx),%edx
 524:	89 10                	mov    %edx,(%eax)
 526:	eb da                	jmp    502 <free+0x4e>

00000528 <morecore>:

static Header*
morecore(uint nu)
{
 528:	55                   	push   %ebp
 529:	89 e5                	mov    %esp,%ebp
 52b:	53                   	push   %ebx
 52c:	83 ec 04             	sub    $0x4,%esp
 52f:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 531:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 536:	77 05                	ja     53d <morecore+0x15>
    nu = 4096;
 538:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 53d:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 544:	83 ec 0c             	sub    $0xc,%esp
 547:	50                   	push   %eax
 548:	e8 4f ff ff ff       	call   49c <sbrk>
  if(p == (char*)-1)
 54d:	83 c4 10             	add    $0x10,%esp
 550:	83 f8 ff             	cmp    $0xffffffff,%eax
 553:	74 1c                	je     571 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 555:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 558:	83 c0 08             	add    $0x8,%eax
 55b:	83 ec 0c             	sub    $0xc,%esp
 55e:	50                   	push   %eax
 55f:	e8 50 ff ff ff       	call   4b4 <free>
  return freep;
 564:	a1 80 09 00 00       	mov    0x980,%eax
 569:	83 c4 10             	add    $0x10,%esp
}
 56c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 56f:	c9                   	leave  
 570:	c3                   	ret    
    return 0;
 571:	b8 00 00 00 00       	mov    $0x0,%eax
 576:	eb f4                	jmp    56c <morecore+0x44>

00000578 <malloc>:

void*
malloc(uint nbytes)
{
 578:	f3 0f 1e fb          	endbr32 
 57c:	55                   	push   %ebp
 57d:	89 e5                	mov    %esp,%ebp
 57f:	53                   	push   %ebx
 580:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 583:	8b 45 08             	mov    0x8(%ebp),%eax
 586:	8d 58 07             	lea    0x7(%eax),%ebx
 589:	c1 eb 03             	shr    $0x3,%ebx
 58c:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 58f:	8b 0d 80 09 00 00    	mov    0x980,%ecx
 595:	85 c9                	test   %ecx,%ecx
 597:	74 04                	je     59d <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 599:	8b 01                	mov    (%ecx),%eax
 59b:	eb 4b                	jmp    5e8 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 59d:	c7 05 80 09 00 00 84 	movl   $0x984,0x980
 5a4:	09 00 00 
 5a7:	c7 05 84 09 00 00 84 	movl   $0x984,0x984
 5ae:	09 00 00 
    base.s.size = 0;
 5b1:	c7 05 88 09 00 00 00 	movl   $0x0,0x988
 5b8:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 5bb:	b9 84 09 00 00       	mov    $0x984,%ecx
 5c0:	eb d7                	jmp    599 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 5c2:	74 1a                	je     5de <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 5c4:	29 da                	sub    %ebx,%edx
 5c6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 5c9:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 5cc:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 5cf:	89 0d 80 09 00 00    	mov    %ecx,0x980
      return (void*)(p + 1);
 5d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 5d8:	83 c4 04             	add    $0x4,%esp
 5db:	5b                   	pop    %ebx
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 5de:	8b 10                	mov    (%eax),%edx
 5e0:	89 11                	mov    %edx,(%ecx)
 5e2:	eb eb                	jmp    5cf <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5e4:	89 c1                	mov    %eax,%ecx
 5e6:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 5e8:	8b 50 04             	mov    0x4(%eax),%edx
 5eb:	39 da                	cmp    %ebx,%edx
 5ed:	73 d3                	jae    5c2 <malloc+0x4a>
    if(p == freep)
 5ef:	39 05 80 09 00 00    	cmp    %eax,0x980
 5f5:	75 ed                	jne    5e4 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 5f7:	89 d8                	mov    %ebx,%eax
 5f9:	e8 2a ff ff ff       	call   528 <morecore>
 5fe:	85 c0                	test   %eax,%eax
 600:	75 e2                	jne    5e4 <malloc+0x6c>
 602:	eb d4                	jmp    5d8 <malloc+0x60>
