
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	53                   	push   %ebx
  12:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
  13:	83 ec 08             	sub    $0x8,%esp
  16:	6a 02                	push   $0x2
  18:	68 00 08 00 00       	push   $0x800
  1d:	e8 1e 04 00 00       	call   440 <open>
  22:	83 c4 10             	add    $0x10,%esp
  25:	85 c0                	test   %eax,%eax
  27:	78 59                	js     82 <main+0x82>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 45 04 00 00       	call   478 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 39 04 00 00       	call   478 <dup>
  3f:	83 c4 10             	add    $0x10,%esp

  for(;;){
    printf(1, "init: starting sh\n");
  42:	83 ec 08             	sub    $0x8,%esp
  45:	68 08 08 00 00       	push   $0x808
  4a:	6a 01                	push   $0x1
  4c:	e8 f0 04 00 00       	call   541 <printf>
    pid = fork();
  51:	e8 92 03 00 00       	call   3e8 <fork>
  56:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  58:	83 c4 10             	add    $0x10,%esp
  5b:	85 c0                	test   %eax,%eax
  5d:	78 48                	js     a7 <main+0xa7>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  5f:	74 5a                	je     bb <main+0xbb>
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  61:	e8 9a 03 00 00       	call   400 <wait>
  66:	85 c0                	test   %eax,%eax
  68:	78 d8                	js     42 <main+0x42>
  6a:	39 c3                	cmp    %eax,%ebx
  6c:	74 d4                	je     42 <main+0x42>
      printf(1, "zombie!\n");
  6e:	83 ec 08             	sub    $0x8,%esp
  71:	68 47 08 00 00       	push   $0x847
  76:	6a 01                	push   $0x1
  78:	e8 c4 04 00 00       	call   541 <printf>
  7d:	83 c4 10             	add    $0x10,%esp
  80:	eb df                	jmp    61 <main+0x61>
    mknod("console", 1, 1);
  82:	83 ec 04             	sub    $0x4,%esp
  85:	6a 01                	push   $0x1
  87:	6a 01                	push   $0x1
  89:	68 00 08 00 00       	push   $0x800
  8e:	e8 b5 03 00 00       	call   448 <mknod>
    open("console", O_RDWR);
  93:	83 c4 08             	add    $0x8,%esp
  96:	6a 02                	push   $0x2
  98:	68 00 08 00 00       	push   $0x800
  9d:	e8 9e 03 00 00       	call   440 <open>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	eb 82                	jmp    29 <main+0x29>
      printf(1, "init: fork failed\n");
  a7:	83 ec 08             	sub    $0x8,%esp
  aa:	68 1b 08 00 00       	push   $0x81b
  af:	6a 01                	push   $0x1
  b1:	e8 8b 04 00 00       	call   541 <printf>
      exit();
  b6:	e8 3d 03 00 00       	call   3f8 <exit>
      exec("sh", argv);
  bb:	83 ec 08             	sub    $0x8,%esp
  be:	68 b0 0b 00 00       	push   $0xbb0
  c3:	68 2e 08 00 00       	push   $0x82e
  c8:	e8 6b 03 00 00       	call   438 <exec>
      printf(1, "init: exec sh failed\n");
  cd:	83 c4 08             	add    $0x8,%esp
  d0:	68 31 08 00 00       	push   $0x831
  d5:	6a 01                	push   $0x1
  d7:	e8 65 04 00 00       	call   541 <printf>
      exit();
  dc:	e8 17 03 00 00       	call   3f8 <exit>

000000e1 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
  e1:	f3 0f 1e fb          	endbr32 
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	56                   	push   %esi
  e9:	53                   	push   %ebx
  ea:	8b 75 08             	mov    0x8(%ebp),%esi
  ed:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f0:	89 f0                	mov    %esi,%eax
  f2:	89 d1                	mov    %edx,%ecx
  f4:	83 c2 01             	add    $0x1,%edx
  f7:	89 c3                	mov    %eax,%ebx
  f9:	83 c0 01             	add    $0x1,%eax
  fc:	0f b6 09             	movzbl (%ecx),%ecx
  ff:	88 0b                	mov    %cl,(%ebx)
 101:	84 c9                	test   %cl,%cl
 103:	75 ed                	jne    f2 <strcpy+0x11>
    ;
  return os;
}
 105:	89 f0                	mov    %esi,%eax
 107:	5b                   	pop    %ebx
 108:	5e                   	pop    %esi
 109:	5d                   	pop    %ebp
 10a:	c3                   	ret    

0000010b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10b:	f3 0f 1e fb          	endbr32 
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	8b 4d 08             	mov    0x8(%ebp),%ecx
 115:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 118:	0f b6 01             	movzbl (%ecx),%eax
 11b:	84 c0                	test   %al,%al
 11d:	74 0c                	je     12b <strcmp+0x20>
 11f:	3a 02                	cmp    (%edx),%al
 121:	75 08                	jne    12b <strcmp+0x20>
    p++, q++;
 123:	83 c1 01             	add    $0x1,%ecx
 126:	83 c2 01             	add    $0x1,%edx
 129:	eb ed                	jmp    118 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 12b:	0f b6 c0             	movzbl %al,%eax
 12e:	0f b6 12             	movzbl (%edx),%edx
 131:	29 d0                	sub    %edx,%eax
}
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strlen>:

uint
strlen(const char *s)
{
 135:	f3 0f 1e fb          	endbr32 
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 13f:	b8 00 00 00 00       	mov    $0x0,%eax
 144:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 148:	74 05                	je     14f <strlen+0x1a>
 14a:	83 c0 01             	add    $0x1,%eax
 14d:	eb f5                	jmp    144 <strlen+0xf>
    ;
  return n;
}
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <memset>:

void*
memset(void *dst, int c, uint n)
{
 151:	f3 0f 1e fb          	endbr32 
 155:	55                   	push   %ebp
 156:	89 e5                	mov    %esp,%ebp
 158:	57                   	push   %edi
 159:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 15c:	89 d7                	mov    %edx,%edi
 15e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 161:	8b 45 0c             	mov    0xc(%ebp),%eax
 164:	fc                   	cld    
 165:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 167:	89 d0                	mov    %edx,%eax
 169:	5f                   	pop    %edi
 16a:	5d                   	pop    %ebp
 16b:	c3                   	ret    

0000016c <strchr>:

char*
strchr(const char *s, char c)
{
 16c:	f3 0f 1e fb          	endbr32 
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	74 09                	je     18a <strchr+0x1e>
    if(*s == c)
 181:	38 ca                	cmp    %cl,%dl
 183:	74 0a                	je     18f <strchr+0x23>
  for(; *s; s++)
 185:	83 c0 01             	add    $0x1,%eax
 188:	eb f0                	jmp    17a <strchr+0xe>
      return (char*)s;
  return 0;
 18a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret    

00000191 <gets>:

char*
gets(char *buf, int max)
{
 191:	f3 0f 1e fb          	endbr32 
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
 198:	57                   	push   %edi
 199:	56                   	push   %esi
 19a:	53                   	push   %ebx
 19b:	83 ec 1c             	sub    $0x1c,%esp
 19e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a1:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a6:	89 de                	mov    %ebx,%esi
 1a8:	83 c3 01             	add    $0x1,%ebx
 1ab:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ae:	7d 2e                	jge    1de <gets+0x4d>
    cc = read(0, &c, 1);
 1b0:	83 ec 04             	sub    $0x4,%esp
 1b3:	6a 01                	push   $0x1
 1b5:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1b8:	50                   	push   %eax
 1b9:	6a 00                	push   $0x0
 1bb:	e8 58 02 00 00       	call   418 <read>
    if(cc < 1)
 1c0:	83 c4 10             	add    $0x10,%esp
 1c3:	85 c0                	test   %eax,%eax
 1c5:	7e 17                	jle    1de <gets+0x4d>
      break;
    buf[i++] = c;
 1c7:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1cb:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1ce:	3c 0a                	cmp    $0xa,%al
 1d0:	0f 94 c2             	sete   %dl
 1d3:	3c 0d                	cmp    $0xd,%al
 1d5:	0f 94 c0             	sete   %al
 1d8:	08 c2                	or     %al,%dl
 1da:	74 ca                	je     1a6 <gets+0x15>
    buf[i++] = c;
 1dc:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1de:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 1e2:	89 f8                	mov    %edi,%eax
 1e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e7:	5b                   	pop    %ebx
 1e8:	5e                   	pop    %esi
 1e9:	5f                   	pop    %edi
 1ea:	5d                   	pop    %ebp
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(const char *n, struct stat *st)
{
 1ec:	f3 0f 1e fb          	endbr32 
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 3e 02 00 00       	call   440 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 24                	js     22d <stat+0x41>
 209:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 20b:	83 ec 08             	sub    $0x8,%esp
 20e:	ff 75 0c             	pushl  0xc(%ebp)
 211:	50                   	push   %eax
 212:	e8 41 02 00 00       	call   458 <fstat>
 217:	89 c6                	mov    %eax,%esi
  close(fd);
 219:	89 1c 24             	mov    %ebx,(%esp)
 21c:	e8 07 02 00 00       	call   428 <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	89 f0                	mov    %esi,%eax
 226:	8d 65 f8             	lea    -0x8(%ebp),%esp
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
    return -1;
 22d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 232:	eb f0                	jmp    224 <stat+0x38>

00000234 <atoi>:

int
atoi(const char *s)
{
 234:	f3 0f 1e fb          	endbr32 
 238:	55                   	push   %ebp
 239:	89 e5                	mov    %esp,%ebp
 23b:	53                   	push   %ebx
 23c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 23f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 244:	0f b6 01             	movzbl (%ecx),%eax
 247:	8d 58 d0             	lea    -0x30(%eax),%ebx
 24a:	80 fb 09             	cmp    $0x9,%bl
 24d:	77 12                	ja     261 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 24f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 252:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 255:	83 c1 01             	add    $0x1,%ecx
 258:	0f be c0             	movsbl %al,%eax
 25b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 25f:	eb e3                	jmp    244 <atoi+0x10>
  return n;
}
 261:	89 d0                	mov    %edx,%eax
 263:	5b                   	pop    %ebx
 264:	5d                   	pop    %ebp
 265:	c3                   	ret    

00000266 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 266:	f3 0f 1e fb          	endbr32 
 26a:	55                   	push   %ebp
 26b:	89 e5                	mov    %esp,%ebp
 26d:	56                   	push   %esi
 26e:	53                   	push   %ebx
 26f:	8b 75 08             	mov    0x8(%ebp),%esi
 272:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 275:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 278:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 27a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 27d:	85 c0                	test   %eax,%eax
 27f:	7e 0f                	jle    290 <memmove+0x2a>
    *dst++ = *src++;
 281:	0f b6 01             	movzbl (%ecx),%eax
 284:	88 02                	mov    %al,(%edx)
 286:	8d 49 01             	lea    0x1(%ecx),%ecx
 289:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 28c:	89 d8                	mov    %ebx,%eax
 28e:	eb ea                	jmp    27a <memmove+0x14>
  return vdst;
}
 290:	89 f0                	mov    %esi,%eax
 292:	5b                   	pop    %ebx
 293:	5e                   	pop    %esi
 294:	5d                   	pop    %ebp
 295:	c3                   	ret    

00000296 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 296:	f3 0f 1e fb          	endbr32 
 29a:	55                   	push   %ebp
 29b:	89 e5                	mov    %esp,%ebp
 29d:	53                   	push   %ebx
 29e:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 2a1:	68 00 20 00 00       	push   $0x2000
 2a6:	e8 c7 04 00 00       	call   772 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 2ab:	83 c4 10             	add    $0x10,%esp
 2ae:	89 c2                	mov    %eax,%edx
 2b0:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 2b6:	74 22                	je     2da <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 2b8:	b9 00 10 00 00       	mov    $0x1000,%ecx
 2bd:	29 d1                	sub    %edx,%ecx
 2bf:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 2c1:	ba 00 00 00 00       	mov    $0x0,%edx
 2c6:	83 fa 3f             	cmp    $0x3f,%edx
 2c9:	7f 13                	jg     2de <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 2cb:	83 3c 95 e0 0e 00 00 	cmpl   $0x1,0xee0(,%edx,4)
 2d2:	01 
 2d3:	75 09                	jne    2de <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 2d5:	83 c2 01             	add    $0x1,%edx
 2d8:	eb ec                	jmp    2c6 <thread_create+0x30>
  void *user_stack = curr_ptr;
 2da:	89 c1                	mov    %eax,%ecx
 2dc:	eb e3                	jmp    2c1 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 2de:	83 3c 95 e0 0e 00 00 	cmpl   $0x1,0xee0(,%edx,4)
 2e5:	01 
 2e6:	74 34                	je     31c <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 2e8:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 2eb:	c1 e3 02             	shl    $0x2,%ebx
 2ee:	89 83 e0 0b 00 00    	mov    %eax,0xbe0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 2f4:	89 8b e4 0b 00 00    	mov    %ecx,0xbe4(%ebx)
  cell_full[i] = 1;
 2fa:	c7 04 95 e0 0e 00 00 	movl   $0x1,0xee0(,%edx,4)
 301:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 305:	ff 75 10             	pushl  0x10(%ebp)
 308:	ff 75 0c             	pushl  0xc(%ebp)
 30b:	ff 75 08             	pushl  0x8(%ebp)
 30e:	51                   	push   %ecx
 30f:	e8 dc 00 00 00       	call   3f0 <clone>
 314:	83 c4 10             	add    $0x10,%esp
}
 317:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 31a:	c9                   	leave  
 31b:	c3                   	ret    
    return -1;
 31c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 321:	eb f4                	jmp    317 <thread_create+0x81>

00000323 <thread_join>:

int thread_join(){
 323:	f3 0f 1e fb          	endbr32 
 327:	55                   	push   %ebp
 328:	89 e5                	mov    %esp,%ebp
 32a:	56                   	push   %esi
 32b:	53                   	push   %ebx
 32c:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 32f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 332:	50                   	push   %eax
 333:	e8 d0 00 00 00       	call   408 <join>
 338:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 33a:	83 c4 10             	add    $0x10,%esp
 33d:	bb 00 00 00 00       	mov    $0x0,%ebx
 342:	83 fb 3f             	cmp    $0x3f,%ebx
 345:	7f 14                	jg     35b <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 347:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 34a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 34d:	39 14 85 e4 0b 00 00 	cmp    %edx,0xbe4(,%eax,4)
 354:	74 05                	je     35b <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 356:	83 c3 01             	add    $0x1,%ebx
 359:	eb e7                	jmp    342 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 35b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 35e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 361:	39 0c 85 e4 0b 00 00 	cmp    %ecx,0xbe4(,%eax,4)
 368:	75 26                	jne    390 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 36a:	83 ec 0c             	sub    $0xc,%esp
 36d:	ff 34 85 e0 0b 00 00 	pushl  0xbe0(,%eax,4)
 374:	e8 35 03 00 00       	call   6ae <free>
  cell_full[i] = 0;
 379:	c7 04 9d e0 0e 00 00 	movl   $0x0,0xee0(,%ebx,4)
 380:	00 00 00 00 

  return out;
 384:	83 c4 10             	add    $0x10,%esp
}
 387:	89 f0                	mov    %esi,%eax
 389:	8d 65 f8             	lea    -0x8(%ebp),%esp
 38c:	5b                   	pop    %ebx
 38d:	5e                   	pop    %esi
 38e:	5d                   	pop    %ebp
 38f:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 390:	be ff ff ff ff       	mov    $0xffffffff,%esi
 395:	eb f0                	jmp    387 <thread_join+0x64>

00000397 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 397:	f3 0f 1e fb          	endbr32 
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3a7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3ae:	5d                   	pop    %ebp
 3af:	c3                   	ret    

000003b0 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 3b0:	f3 0f 1e fb          	endbr32 
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 3ba:	b9 01 00 00 00       	mov    $0x1,%ecx
 3bf:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 3c3:	b8 00 00 00 00       	mov    $0x0,%eax
 3c8:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 3cd:	39 c1                	cmp    %eax,%ecx
 3cf:	75 f2                	jne    3c3 <lock_acquire+0x13>
      ; // spin
    }
}
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    

000003d3 <lock_release>:

void lock_release(lock_t *lock) {
 3d3:	f3 0f 1e fb          	endbr32 
 3d7:	55                   	push   %ebp
 3d8:	89 e5                	mov    %esp,%ebp
 3da:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 3dd:	8b 42 04             	mov    0x4(%edx),%eax
 3e0:	83 c0 01             	add    $0x1,%eax
 3e3:	89 42 04             	mov    %eax,0x4(%edx)
}
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    

000003e8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e8:	b8 01 00 00 00       	mov    $0x1,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <clone>:
SYSCALL(clone)
 3f0:	b8 16 00 00 00       	mov    $0x16,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <exit>:
SYSCALL(exit)
 3f8:	b8 02 00 00 00       	mov    $0x2,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <wait>:
SYSCALL(wait)
 400:	b8 03 00 00 00       	mov    $0x3,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <join>:
SYSCALL(join)
 408:	b8 17 00 00 00       	mov    $0x17,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <pipe>:
SYSCALL(pipe)
 410:	b8 04 00 00 00       	mov    $0x4,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <read>:
SYSCALL(read)
 418:	b8 05 00 00 00       	mov    $0x5,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <write>:
SYSCALL(write)
 420:	b8 10 00 00 00       	mov    $0x10,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <close>:
SYSCALL(close)
 428:	b8 15 00 00 00       	mov    $0x15,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <kill>:
SYSCALL(kill)
 430:	b8 06 00 00 00       	mov    $0x6,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <exec>:
SYSCALL(exec)
 438:	b8 07 00 00 00       	mov    $0x7,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <open>:
SYSCALL(open)
 440:	b8 0f 00 00 00       	mov    $0xf,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <mknod>:
SYSCALL(mknod)
 448:	b8 11 00 00 00       	mov    $0x11,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <unlink>:
SYSCALL(unlink)
 450:	b8 12 00 00 00       	mov    $0x12,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <fstat>:
SYSCALL(fstat)
 458:	b8 08 00 00 00       	mov    $0x8,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <link>:
SYSCALL(link)
 460:	b8 13 00 00 00       	mov    $0x13,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <mkdir>:
SYSCALL(mkdir)
 468:	b8 14 00 00 00       	mov    $0x14,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <chdir>:
SYSCALL(chdir)
 470:	b8 09 00 00 00       	mov    $0x9,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <dup>:
SYSCALL(dup)
 478:	b8 0a 00 00 00       	mov    $0xa,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <getpid>:
SYSCALL(getpid)
 480:	b8 0b 00 00 00       	mov    $0xb,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <sbrk>:
SYSCALL(sbrk)
 488:	b8 0c 00 00 00       	mov    $0xc,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <sleep>:
SYSCALL(sleep)
 490:	b8 0d 00 00 00       	mov    $0xd,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <uptime>:
SYSCALL(uptime)
 498:	b8 0e 00 00 00       	mov    $0xe,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	83 ec 1c             	sub    $0x1c,%esp
 4a6:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4a9:	6a 01                	push   $0x1
 4ab:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4ae:	52                   	push   %edx
 4af:	50                   	push   %eax
 4b0:	e8 6b ff ff ff       	call   420 <write>
}
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	c9                   	leave  
 4b9:	c3                   	ret    

000004ba <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ba:	55                   	push   %ebp
 4bb:	89 e5                	mov    %esp,%ebp
 4bd:	57                   	push   %edi
 4be:	56                   	push   %esi
 4bf:	53                   	push   %ebx
 4c0:	83 ec 2c             	sub    $0x2c,%esp
 4c3:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c6:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4c8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4cc:	0f 95 c2             	setne  %dl
 4cf:	89 f0                	mov    %esi,%eax
 4d1:	c1 e8 1f             	shr    $0x1f,%eax
 4d4:	84 c2                	test   %al,%dl
 4d6:	74 42                	je     51a <printint+0x60>
    neg = 1;
    x = -xx;
 4d8:	f7 de                	neg    %esi
    neg = 1;
 4da:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 4e1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 4e6:	89 f0                	mov    %esi,%eax
 4e8:	ba 00 00 00 00       	mov    $0x0,%edx
 4ed:	f7 f1                	div    %ecx
 4ef:	89 df                	mov    %ebx,%edi
 4f1:	83 c3 01             	add    $0x1,%ebx
 4f4:	0f b6 92 58 08 00 00 	movzbl 0x858(%edx),%edx
 4fb:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 4ff:	89 f2                	mov    %esi,%edx
 501:	89 c6                	mov    %eax,%esi
 503:	39 d1                	cmp    %edx,%ecx
 505:	76 df                	jbe    4e6 <printint+0x2c>
  if(neg)
 507:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 50b:	74 2f                	je     53c <printint+0x82>
    buf[i++] = '-';
 50d:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 512:	8d 5f 02             	lea    0x2(%edi),%ebx
 515:	8b 75 d0             	mov    -0x30(%ebp),%esi
 518:	eb 15                	jmp    52f <printint+0x75>
  neg = 0;
 51a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 521:	eb be                	jmp    4e1 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 523:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 528:	89 f0                	mov    %esi,%eax
 52a:	e8 71 ff ff ff       	call   4a0 <putc>
  while(--i >= 0)
 52f:	83 eb 01             	sub    $0x1,%ebx
 532:	79 ef                	jns    523 <printint+0x69>
}
 534:	83 c4 2c             	add    $0x2c,%esp
 537:	5b                   	pop    %ebx
 538:	5e                   	pop    %esi
 539:	5f                   	pop    %edi
 53a:	5d                   	pop    %ebp
 53b:	c3                   	ret    
 53c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 53f:	eb ee                	jmp    52f <printint+0x75>

00000541 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 541:	f3 0f 1e fb          	endbr32 
 545:	55                   	push   %ebp
 546:	89 e5                	mov    %esp,%ebp
 548:	57                   	push   %edi
 549:	56                   	push   %esi
 54a:	53                   	push   %ebx
 54b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 54e:	8d 45 10             	lea    0x10(%ebp),%eax
 551:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 554:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 559:	bb 00 00 00 00       	mov    $0x0,%ebx
 55e:	eb 14                	jmp    574 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 560:	89 fa                	mov    %edi,%edx
 562:	8b 45 08             	mov    0x8(%ebp),%eax
 565:	e8 36 ff ff ff       	call   4a0 <putc>
 56a:	eb 05                	jmp    571 <printf+0x30>
      }
    } else if(state == '%'){
 56c:	83 fe 25             	cmp    $0x25,%esi
 56f:	74 25                	je     596 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 571:	83 c3 01             	add    $0x1,%ebx
 574:	8b 45 0c             	mov    0xc(%ebp),%eax
 577:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 57b:	84 c0                	test   %al,%al
 57d:	0f 84 23 01 00 00    	je     6a6 <printf+0x165>
    c = fmt[i] & 0xff;
 583:	0f be f8             	movsbl %al,%edi
 586:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 589:	85 f6                	test   %esi,%esi
 58b:	75 df                	jne    56c <printf+0x2b>
      if(c == '%'){
 58d:	83 f8 25             	cmp    $0x25,%eax
 590:	75 ce                	jne    560 <printf+0x1f>
        state = '%';
 592:	89 c6                	mov    %eax,%esi
 594:	eb db                	jmp    571 <printf+0x30>
      if(c == 'd'){
 596:	83 f8 64             	cmp    $0x64,%eax
 599:	74 49                	je     5e4 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 59b:	83 f8 78             	cmp    $0x78,%eax
 59e:	0f 94 c1             	sete   %cl
 5a1:	83 f8 70             	cmp    $0x70,%eax
 5a4:	0f 94 c2             	sete   %dl
 5a7:	08 d1                	or     %dl,%cl
 5a9:	75 63                	jne    60e <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5ab:	83 f8 73             	cmp    $0x73,%eax
 5ae:	0f 84 84 00 00 00    	je     638 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5b4:	83 f8 63             	cmp    $0x63,%eax
 5b7:	0f 84 b7 00 00 00    	je     674 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5bd:	83 f8 25             	cmp    $0x25,%eax
 5c0:	0f 84 cc 00 00 00    	je     692 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5c6:	ba 25 00 00 00       	mov    $0x25,%edx
 5cb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ce:	e8 cd fe ff ff       	call   4a0 <putc>
        putc(fd, c);
 5d3:	89 fa                	mov    %edi,%edx
 5d5:	8b 45 08             	mov    0x8(%ebp),%eax
 5d8:	e8 c3 fe ff ff       	call   4a0 <putc>
      }
      state = 0;
 5dd:	be 00 00 00 00       	mov    $0x0,%esi
 5e2:	eb 8d                	jmp    571 <printf+0x30>
        printint(fd, *ap, 10, 1);
 5e4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 5e7:	8b 17                	mov    (%edi),%edx
 5e9:	83 ec 0c             	sub    $0xc,%esp
 5ec:	6a 01                	push   $0x1
 5ee:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	e8 bf fe ff ff       	call   4ba <printint>
        ap++;
 5fb:	83 c7 04             	add    $0x4,%edi
 5fe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 601:	83 c4 10             	add    $0x10,%esp
      state = 0;
 604:	be 00 00 00 00       	mov    $0x0,%esi
 609:	e9 63 ff ff ff       	jmp    571 <printf+0x30>
        printint(fd, *ap, 16, 0);
 60e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 611:	8b 17                	mov    (%edi),%edx
 613:	83 ec 0c             	sub    $0xc,%esp
 616:	6a 00                	push   $0x0
 618:	b9 10 00 00 00       	mov    $0x10,%ecx
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	e8 95 fe ff ff       	call   4ba <printint>
        ap++;
 625:	83 c7 04             	add    $0x4,%edi
 628:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 62b:	83 c4 10             	add    $0x10,%esp
      state = 0;
 62e:	be 00 00 00 00       	mov    $0x0,%esi
 633:	e9 39 ff ff ff       	jmp    571 <printf+0x30>
        s = (char*)*ap;
 638:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63b:	8b 30                	mov    (%eax),%esi
        ap++;
 63d:	83 c0 04             	add    $0x4,%eax
 640:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 643:	85 f6                	test   %esi,%esi
 645:	75 28                	jne    66f <printf+0x12e>
          s = "(null)";
 647:	be 50 08 00 00       	mov    $0x850,%esi
 64c:	8b 7d 08             	mov    0x8(%ebp),%edi
 64f:	eb 0d                	jmp    65e <printf+0x11d>
          putc(fd, *s);
 651:	0f be d2             	movsbl %dl,%edx
 654:	89 f8                	mov    %edi,%eax
 656:	e8 45 fe ff ff       	call   4a0 <putc>
          s++;
 65b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 65e:	0f b6 16             	movzbl (%esi),%edx
 661:	84 d2                	test   %dl,%dl
 663:	75 ec                	jne    651 <printf+0x110>
      state = 0;
 665:	be 00 00 00 00       	mov    $0x0,%esi
 66a:	e9 02 ff ff ff       	jmp    571 <printf+0x30>
 66f:	8b 7d 08             	mov    0x8(%ebp),%edi
 672:	eb ea                	jmp    65e <printf+0x11d>
        putc(fd, *ap);
 674:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 677:	0f be 17             	movsbl (%edi),%edx
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	e8 1e fe ff ff       	call   4a0 <putc>
        ap++;
 682:	83 c7 04             	add    $0x4,%edi
 685:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 688:	be 00 00 00 00       	mov    $0x0,%esi
 68d:	e9 df fe ff ff       	jmp    571 <printf+0x30>
        putc(fd, c);
 692:	89 fa                	mov    %edi,%edx
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	e8 04 fe ff ff       	call   4a0 <putc>
      state = 0;
 69c:	be 00 00 00 00       	mov    $0x0,%esi
 6a1:	e9 cb fe ff ff       	jmp    571 <printf+0x30>
    }
  }
}
 6a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6a9:	5b                   	pop    %ebx
 6aa:	5e                   	pop    %esi
 6ab:	5f                   	pop    %edi
 6ac:	5d                   	pop    %ebp
 6ad:	c3                   	ret    

000006ae <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ae:	f3 0f 1e fb          	endbr32 
 6b2:	55                   	push   %ebp
 6b3:	89 e5                	mov    %esp,%ebp
 6b5:	57                   	push   %edi
 6b6:	56                   	push   %esi
 6b7:	53                   	push   %ebx
 6b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6bb:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6be:	a1 c0 0b 00 00       	mov    0xbc0,%eax
 6c3:	eb 02                	jmp    6c7 <free+0x19>
 6c5:	89 d0                	mov    %edx,%eax
 6c7:	39 c8                	cmp    %ecx,%eax
 6c9:	73 04                	jae    6cf <free+0x21>
 6cb:	39 08                	cmp    %ecx,(%eax)
 6cd:	77 12                	ja     6e1 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6cf:	8b 10                	mov    (%eax),%edx
 6d1:	39 c2                	cmp    %eax,%edx
 6d3:	77 f0                	ja     6c5 <free+0x17>
 6d5:	39 c8                	cmp    %ecx,%eax
 6d7:	72 08                	jb     6e1 <free+0x33>
 6d9:	39 ca                	cmp    %ecx,%edx
 6db:	77 04                	ja     6e1 <free+0x33>
 6dd:	89 d0                	mov    %edx,%eax
 6df:	eb e6                	jmp    6c7 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6e4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6e7:	8b 10                	mov    (%eax),%edx
 6e9:	39 d7                	cmp    %edx,%edi
 6eb:	74 19                	je     706 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6f0:	8b 50 04             	mov    0x4(%eax),%edx
 6f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6f6:	39 ce                	cmp    %ecx,%esi
 6f8:	74 1b                	je     715 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6fa:	89 08                	mov    %ecx,(%eax)
  freep = p;
 6fc:	a3 c0 0b 00 00       	mov    %eax,0xbc0
}
 701:	5b                   	pop    %ebx
 702:	5e                   	pop    %esi
 703:	5f                   	pop    %edi
 704:	5d                   	pop    %ebp
 705:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 706:	03 72 04             	add    0x4(%edx),%esi
 709:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 70c:	8b 10                	mov    (%eax),%edx
 70e:	8b 12                	mov    (%edx),%edx
 710:	89 53 f8             	mov    %edx,-0x8(%ebx)
 713:	eb db                	jmp    6f0 <free+0x42>
    p->s.size += bp->s.size;
 715:	03 53 fc             	add    -0x4(%ebx),%edx
 718:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 71b:	8b 53 f8             	mov    -0x8(%ebx),%edx
 71e:	89 10                	mov    %edx,(%eax)
 720:	eb da                	jmp    6fc <free+0x4e>

00000722 <morecore>:

static Header*
morecore(uint nu)
{
 722:	55                   	push   %ebp
 723:	89 e5                	mov    %esp,%ebp
 725:	53                   	push   %ebx
 726:	83 ec 04             	sub    $0x4,%esp
 729:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 72b:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 730:	77 05                	ja     737 <morecore+0x15>
    nu = 4096;
 732:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 737:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 73e:	83 ec 0c             	sub    $0xc,%esp
 741:	50                   	push   %eax
 742:	e8 41 fd ff ff       	call   488 <sbrk>
  if(p == (char*)-1)
 747:	83 c4 10             	add    $0x10,%esp
 74a:	83 f8 ff             	cmp    $0xffffffff,%eax
 74d:	74 1c                	je     76b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 74f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 752:	83 c0 08             	add    $0x8,%eax
 755:	83 ec 0c             	sub    $0xc,%esp
 758:	50                   	push   %eax
 759:	e8 50 ff ff ff       	call   6ae <free>
  return freep;
 75e:	a1 c0 0b 00 00       	mov    0xbc0,%eax
 763:	83 c4 10             	add    $0x10,%esp
}
 766:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 769:	c9                   	leave  
 76a:	c3                   	ret    
    return 0;
 76b:	b8 00 00 00 00       	mov    $0x0,%eax
 770:	eb f4                	jmp    766 <morecore+0x44>

00000772 <malloc>:

void*
malloc(uint nbytes)
{
 772:	f3 0f 1e fb          	endbr32 
 776:	55                   	push   %ebp
 777:	89 e5                	mov    %esp,%ebp
 779:	53                   	push   %ebx
 77a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	8d 58 07             	lea    0x7(%eax),%ebx
 783:	c1 eb 03             	shr    $0x3,%ebx
 786:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 789:	8b 0d c0 0b 00 00    	mov    0xbc0,%ecx
 78f:	85 c9                	test   %ecx,%ecx
 791:	74 04                	je     797 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 01                	mov    (%ecx),%eax
 795:	eb 4b                	jmp    7e2 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 797:	c7 05 c0 0b 00 00 c4 	movl   $0xbc4,0xbc0
 79e:	0b 00 00 
 7a1:	c7 05 c4 0b 00 00 c4 	movl   $0xbc4,0xbc4
 7a8:	0b 00 00 
    base.s.size = 0;
 7ab:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 7b2:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7b5:	b9 c4 0b 00 00       	mov    $0xbc4,%ecx
 7ba:	eb d7                	jmp    793 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7bc:	74 1a                	je     7d8 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7be:	29 da                	sub    %ebx,%edx
 7c0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c3:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7c6:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7c9:	89 0d c0 0b 00 00    	mov    %ecx,0xbc0
      return (void*)(p + 1);
 7cf:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7d2:	83 c4 04             	add    $0x4,%esp
 7d5:	5b                   	pop    %ebx
 7d6:	5d                   	pop    %ebp
 7d7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7d8:	8b 10                	mov    (%eax),%edx
 7da:	89 11                	mov    %edx,(%ecx)
 7dc:	eb eb                	jmp    7c9 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7de:	89 c1                	mov    %eax,%ecx
 7e0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 7e2:	8b 50 04             	mov    0x4(%eax),%edx
 7e5:	39 da                	cmp    %ebx,%edx
 7e7:	73 d3                	jae    7bc <malloc+0x4a>
    if(p == freep)
 7e9:	39 05 c0 0b 00 00    	cmp    %eax,0xbc0
 7ef:	75 ed                	jne    7de <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 7f1:	89 d8                	mov    %ebx,%eax
 7f3:	e8 2a ff ff ff       	call   722 <morecore>
 7f8:	85 c0                	test   %eax,%eax
 7fa:	75 e2                	jne    7de <malloc+0x6c>
 7fc:	eb d4                	jmp    7d2 <malloc+0x60>
