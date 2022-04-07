
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   c:	83 ec 04             	sub    $0x4,%esp
   f:	68 00 02 00 00       	push   $0x200
  14:	68 20 0c 00 00       	push   $0xc20
  19:	56                   	push   %esi
  1a:	e8 18 04 00 00       	call   437 <read>
  1f:	89 c3                	mov    %eax,%ebx
  21:	83 c4 10             	add    $0x10,%esp
  24:	85 c0                	test   %eax,%eax
  26:	7e 2b                	jle    53 <cat+0x53>
    if (write(1, buf, n) != n) {
  28:	83 ec 04             	sub    $0x4,%esp
  2b:	53                   	push   %ebx
  2c:	68 20 0c 00 00       	push   $0xc20
  31:	6a 01                	push   $0x1
  33:	e8 07 04 00 00       	call   43f <write>
  38:	83 c4 10             	add    $0x10,%esp
  3b:	39 d8                	cmp    %ebx,%eax
  3d:	74 cd                	je     c <cat+0xc>
      printf(1, "cat: write error\n");
  3f:	83 ec 08             	sub    $0x8,%esp
  42:	68 20 08 00 00       	push   $0x820
  47:	6a 01                	push   $0x1
  49:	e8 12 05 00 00       	call   560 <printf>
      exit();
  4e:	e8 c4 03 00 00       	call   417 <exit>
    }
  }
  if(n < 0){
  53:	78 07                	js     5c <cat+0x5c>
    printf(1, "cat: read error\n");
    exit();
  }
}
  55:	8d 65 f8             	lea    -0x8(%ebp),%esp
  58:	5b                   	pop    %ebx
  59:	5e                   	pop    %esi
  5a:	5d                   	pop    %ebp
  5b:	c3                   	ret    
    printf(1, "cat: read error\n");
  5c:	83 ec 08             	sub    $0x8,%esp
  5f:	68 32 08 00 00       	push   $0x832
  64:	6a 01                	push   $0x1
  66:	e8 f5 04 00 00       	call   560 <printf>
    exit();
  6b:	e8 a7 03 00 00       	call   417 <exit>

00000070 <main>:

int
main(int argc, char *argv[])
{
  70:	f3 0f 1e fb          	endbr32 
  74:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  78:	83 e4 f0             	and    $0xfffffff0,%esp
  7b:	ff 71 fc             	pushl  -0x4(%ecx)
  7e:	55                   	push   %ebp
  7f:	89 e5                	mov    %esp,%ebp
  81:	57                   	push   %edi
  82:	56                   	push   %esi
  83:	53                   	push   %ebx
  84:	51                   	push   %ecx
  85:	83 ec 18             	sub    $0x18,%esp
  88:	8b 01                	mov    (%ecx),%eax
  8a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8d:	8b 51 04             	mov    0x4(%ecx),%edx
  90:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  93:	83 f8 01             	cmp    $0x1,%eax
  96:	7e 3e                	jle    d6 <main+0x66>
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  98:	be 01 00 00 00       	mov    $0x1,%esi
  9d:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
  a0:	7d 59                	jge    fb <main+0x8b>
    if((fd = open(argv[i], 0)) < 0){
  a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  a5:	8d 3c b0             	lea    (%eax,%esi,4),%edi
  a8:	83 ec 08             	sub    $0x8,%esp
  ab:	6a 00                	push   $0x0
  ad:	ff 37                	pushl  (%edi)
  af:	e8 ab 03 00 00       	call   45f <open>
  b4:	89 c3                	mov    %eax,%ebx
  b6:	83 c4 10             	add    $0x10,%esp
  b9:	85 c0                	test   %eax,%eax
  bb:	78 28                	js     e5 <main+0x75>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
  bd:	83 ec 0c             	sub    $0xc,%esp
  c0:	50                   	push   %eax
  c1:	e8 3a ff ff ff       	call   0 <cat>
    close(fd);
  c6:	89 1c 24             	mov    %ebx,(%esp)
  c9:	e8 79 03 00 00       	call   447 <close>
  for(i = 1; i < argc; i++){
  ce:	83 c6 01             	add    $0x1,%esi
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	eb c7                	jmp    9d <main+0x2d>
    cat(0);
  d6:	83 ec 0c             	sub    $0xc,%esp
  d9:	6a 00                	push   $0x0
  db:	e8 20 ff ff ff       	call   0 <cat>
    exit();
  e0:	e8 32 03 00 00       	call   417 <exit>
      printf(1, "cat: cannot open %s\n", argv[i]);
  e5:	83 ec 04             	sub    $0x4,%esp
  e8:	ff 37                	pushl  (%edi)
  ea:	68 43 08 00 00       	push   $0x843
  ef:	6a 01                	push   $0x1
  f1:	e8 6a 04 00 00       	call   560 <printf>
      exit();
  f6:	e8 1c 03 00 00       	call   417 <exit>
  }
  exit();
  fb:	e8 17 03 00 00       	call   417 <exit>

00000100 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 100:	f3 0f 1e fb          	endbr32 
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	56                   	push   %esi
 108:	53                   	push   %ebx
 109:	8b 75 08             	mov    0x8(%ebp),%esi
 10c:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 10f:	89 f0                	mov    %esi,%eax
 111:	89 d1                	mov    %edx,%ecx
 113:	83 c2 01             	add    $0x1,%edx
 116:	89 c3                	mov    %eax,%ebx
 118:	83 c0 01             	add    $0x1,%eax
 11b:	0f b6 09             	movzbl (%ecx),%ecx
 11e:	88 0b                	mov    %cl,(%ebx)
 120:	84 c9                	test   %cl,%cl
 122:	75 ed                	jne    111 <strcpy+0x11>
    ;
  return os;
}
 124:	89 f0                	mov    %esi,%eax
 126:	5b                   	pop    %ebx
 127:	5e                   	pop    %esi
 128:	5d                   	pop    %ebp
 129:	c3                   	ret    

0000012a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 12a:	f3 0f 1e fb          	endbr32 
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
 131:	8b 4d 08             	mov    0x8(%ebp),%ecx
 134:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 137:	0f b6 01             	movzbl (%ecx),%eax
 13a:	84 c0                	test   %al,%al
 13c:	74 0c                	je     14a <strcmp+0x20>
 13e:	3a 02                	cmp    (%edx),%al
 140:	75 08                	jne    14a <strcmp+0x20>
    p++, q++;
 142:	83 c1 01             	add    $0x1,%ecx
 145:	83 c2 01             	add    $0x1,%edx
 148:	eb ed                	jmp    137 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 14a:	0f b6 c0             	movzbl %al,%eax
 14d:	0f b6 12             	movzbl (%edx),%edx
 150:	29 d0                	sub    %edx,%eax
}
 152:	5d                   	pop    %ebp
 153:	c3                   	ret    

00000154 <strlen>:

uint
strlen(const char *s)
{
 154:	f3 0f 1e fb          	endbr32 
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 15e:	b8 00 00 00 00       	mov    $0x0,%eax
 163:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 167:	74 05                	je     16e <strlen+0x1a>
 169:	83 c0 01             	add    $0x1,%eax
 16c:	eb f5                	jmp    163 <strlen+0xf>
    ;
  return n;
}
 16e:	5d                   	pop    %ebp
 16f:	c3                   	ret    

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	f3 0f 1e fb          	endbr32 
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	57                   	push   %edi
 178:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 17b:	89 d7                	mov    %edx,%edi
 17d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 180:	8b 45 0c             	mov    0xc(%ebp),%eax
 183:	fc                   	cld    
 184:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 186:	89 d0                	mov    %edx,%eax
 188:	5f                   	pop    %edi
 189:	5d                   	pop    %ebp
 18a:	c3                   	ret    

0000018b <strchr>:

char*
strchr(const char *s, char c)
{
 18b:	f3 0f 1e fb          	endbr32 
 18f:	55                   	push   %ebp
 190:	89 e5                	mov    %esp,%ebp
 192:	8b 45 08             	mov    0x8(%ebp),%eax
 195:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 199:	0f b6 10             	movzbl (%eax),%edx
 19c:	84 d2                	test   %dl,%dl
 19e:	74 09                	je     1a9 <strchr+0x1e>
    if(*s == c)
 1a0:	38 ca                	cmp    %cl,%dl
 1a2:	74 0a                	je     1ae <strchr+0x23>
  for(; *s; s++)
 1a4:	83 c0 01             	add    $0x1,%eax
 1a7:	eb f0                	jmp    199 <strchr+0xe>
      return (char*)s;
  return 0;
 1a9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ae:	5d                   	pop    %ebp
 1af:	c3                   	ret    

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	f3 0f 1e fb          	endbr32 
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
 1b7:	57                   	push   %edi
 1b8:	56                   	push   %esi
 1b9:	53                   	push   %ebx
 1ba:	83 ec 1c             	sub    $0x1c,%esp
 1bd:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c0:	bb 00 00 00 00       	mov    $0x0,%ebx
 1c5:	89 de                	mov    %ebx,%esi
 1c7:	83 c3 01             	add    $0x1,%ebx
 1ca:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cd:	7d 2e                	jge    1fd <gets+0x4d>
    cc = read(0, &c, 1);
 1cf:	83 ec 04             	sub    $0x4,%esp
 1d2:	6a 01                	push   $0x1
 1d4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1d7:	50                   	push   %eax
 1d8:	6a 00                	push   $0x0
 1da:	e8 58 02 00 00       	call   437 <read>
    if(cc < 1)
 1df:	83 c4 10             	add    $0x10,%esp
 1e2:	85 c0                	test   %eax,%eax
 1e4:	7e 17                	jle    1fd <gets+0x4d>
      break;
    buf[i++] = c;
 1e6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ea:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 1ed:	3c 0a                	cmp    $0xa,%al
 1ef:	0f 94 c2             	sete   %dl
 1f2:	3c 0d                	cmp    $0xd,%al
 1f4:	0f 94 c0             	sete   %al
 1f7:	08 c2                	or     %al,%dl
 1f9:	74 ca                	je     1c5 <gets+0x15>
    buf[i++] = c;
 1fb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 1fd:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 201:	89 f8                	mov    %edi,%eax
 203:	8d 65 f4             	lea    -0xc(%ebp),%esp
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5f                   	pop    %edi
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    

0000020b <stat>:

int
stat(const char *n, struct stat *st)
{
 20b:	f3 0f 1e fb          	endbr32 
 20f:	55                   	push   %ebp
 210:	89 e5                	mov    %esp,%ebp
 212:	56                   	push   %esi
 213:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 214:	83 ec 08             	sub    $0x8,%esp
 217:	6a 00                	push   $0x0
 219:	ff 75 08             	pushl  0x8(%ebp)
 21c:	e8 3e 02 00 00       	call   45f <open>
  if(fd < 0)
 221:	83 c4 10             	add    $0x10,%esp
 224:	85 c0                	test   %eax,%eax
 226:	78 24                	js     24c <stat+0x41>
 228:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 22a:	83 ec 08             	sub    $0x8,%esp
 22d:	ff 75 0c             	pushl  0xc(%ebp)
 230:	50                   	push   %eax
 231:	e8 41 02 00 00       	call   477 <fstat>
 236:	89 c6                	mov    %eax,%esi
  close(fd);
 238:	89 1c 24             	mov    %ebx,(%esp)
 23b:	e8 07 02 00 00       	call   447 <close>
  return r;
 240:	83 c4 10             	add    $0x10,%esp
}
 243:	89 f0                	mov    %esi,%eax
 245:	8d 65 f8             	lea    -0x8(%ebp),%esp
 248:	5b                   	pop    %ebx
 249:	5e                   	pop    %esi
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    
    return -1;
 24c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 251:	eb f0                	jmp    243 <stat+0x38>

00000253 <atoi>:

int
atoi(const char *s)
{
 253:	f3 0f 1e fb          	endbr32 
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	53                   	push   %ebx
 25b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 25e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 263:	0f b6 01             	movzbl (%ecx),%eax
 266:	8d 58 d0             	lea    -0x30(%eax),%ebx
 269:	80 fb 09             	cmp    $0x9,%bl
 26c:	77 12                	ja     280 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 26e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 271:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 274:	83 c1 01             	add    $0x1,%ecx
 277:	0f be c0             	movsbl %al,%eax
 27a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 27e:	eb e3                	jmp    263 <atoi+0x10>
  return n;
}
 280:	89 d0                	mov    %edx,%eax
 282:	5b                   	pop    %ebx
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    

00000285 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 285:	f3 0f 1e fb          	endbr32 
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	56                   	push   %esi
 28d:	53                   	push   %ebx
 28e:	8b 75 08             	mov    0x8(%ebp),%esi
 291:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 294:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 297:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 299:	8d 58 ff             	lea    -0x1(%eax),%ebx
 29c:	85 c0                	test   %eax,%eax
 29e:	7e 0f                	jle    2af <memmove+0x2a>
    *dst++ = *src++;
 2a0:	0f b6 01             	movzbl (%ecx),%eax
 2a3:	88 02                	mov    %al,(%edx)
 2a5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2a8:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 2ab:	89 d8                	mov    %ebx,%eax
 2ad:	eb ea                	jmp    299 <memmove+0x14>
  return vdst;
}
 2af:	89 f0                	mov    %esi,%eax
 2b1:	5b                   	pop    %ebx
 2b2:	5e                   	pop    %esi
 2b3:	5d                   	pop    %ebp
 2b4:	c3                   	ret    

000002b5 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 2b5:	f3 0f 1e fb          	endbr32 
 2b9:	55                   	push   %ebp
 2ba:	89 e5                	mov    %esp,%ebp
 2bc:	53                   	push   %ebx
 2bd:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 2c0:	68 00 20 00 00       	push   $0x2000
 2c5:	e8 c7 04 00 00       	call   791 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 2ca:	83 c4 10             	add    $0x10,%esp
 2cd:	89 c2                	mov    %eax,%edx
 2cf:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 2d5:	74 22                	je     2f9 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 2d7:	b9 00 10 00 00       	mov    $0x1000,%ecx
 2dc:	29 d1                	sub    %edx,%ecx
 2de:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 2e0:	ba 00 00 00 00       	mov    $0x0,%edx
 2e5:	83 fa 3f             	cmp    $0x3f,%edx
 2e8:	7f 13                	jg     2fd <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 2ea:	83 3c 95 20 11 00 00 	cmpl   $0x1,0x1120(,%edx,4)
 2f1:	01 
 2f2:	75 09                	jne    2fd <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 2f4:	83 c2 01             	add    $0x1,%edx
 2f7:	eb ec                	jmp    2e5 <thread_create+0x30>
  void *user_stack = curr_ptr;
 2f9:	89 c1                	mov    %eax,%ecx
 2fb:	eb e3                	jmp    2e0 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 2fd:	83 3c 95 20 11 00 00 	cmpl   $0x1,0x1120(,%edx,4)
 304:	01 
 305:	74 34                	je     33b <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 307:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 30a:	c1 e3 02             	shl    $0x2,%ebx
 30d:	89 83 20 0e 00 00    	mov    %eax,0xe20(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 313:	89 8b 24 0e 00 00    	mov    %ecx,0xe24(%ebx)
  cell_full[i] = 1;
 319:	c7 04 95 20 11 00 00 	movl   $0x1,0x1120(,%edx,4)
 320:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 324:	ff 75 10             	pushl  0x10(%ebp)
 327:	ff 75 0c             	pushl  0xc(%ebp)
 32a:	ff 75 08             	pushl  0x8(%ebp)
 32d:	51                   	push   %ecx
 32e:	e8 dc 00 00 00       	call   40f <clone>
 333:	83 c4 10             	add    $0x10,%esp
}
 336:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 339:	c9                   	leave  
 33a:	c3                   	ret    
    return -1;
 33b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 340:	eb f4                	jmp    336 <thread_create+0x81>

00000342 <thread_join>:

int thread_join(){
 342:	f3 0f 1e fb          	endbr32 
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	56                   	push   %esi
 34a:	53                   	push   %ebx
 34b:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 34e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 351:	50                   	push   %eax
 352:	e8 d0 00 00 00       	call   427 <join>
 357:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 359:	83 c4 10             	add    $0x10,%esp
 35c:	bb 00 00 00 00       	mov    $0x0,%ebx
 361:	83 fb 3f             	cmp    $0x3f,%ebx
 364:	7f 14                	jg     37a <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 366:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 369:	8b 55 f4             	mov    -0xc(%ebp),%edx
 36c:	39 14 85 24 0e 00 00 	cmp    %edx,0xe24(,%eax,4)
 373:	74 05                	je     37a <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 375:	83 c3 01             	add    $0x1,%ebx
 378:	eb e7                	jmp    361 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 37a:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 37d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 380:	39 0c 85 24 0e 00 00 	cmp    %ecx,0xe24(,%eax,4)
 387:	75 26                	jne    3af <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 389:	83 ec 0c             	sub    $0xc,%esp
 38c:	ff 34 85 20 0e 00 00 	pushl  0xe20(,%eax,4)
 393:	e8 35 03 00 00       	call   6cd <free>
  cell_full[i] = 0;
 398:	c7 04 9d 20 11 00 00 	movl   $0x0,0x1120(,%ebx,4)
 39f:	00 00 00 00 

  return out;
 3a3:	83 c4 10             	add    $0x10,%esp
}
 3a6:	89 f0                	mov    %esi,%eax
 3a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3ab:	5b                   	pop    %ebx
 3ac:	5e                   	pop    %esi
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 3af:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3b4:	eb f0                	jmp    3a6 <thread_join+0x64>

000003b6 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 3b6:	f3 0f 1e fb          	endbr32 
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 3c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 3c6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 3cd:	5d                   	pop    %ebp
 3ce:	c3                   	ret    

000003cf <lock_acquire>:

void lock_acquire(lock_t *lock) {
 3cf:	f3 0f 1e fb          	endbr32 
 3d3:	55                   	push   %ebp
 3d4:	89 e5                	mov    %esp,%ebp
 3d6:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 3d9:	b9 01 00 00 00       	mov    $0x1,%ecx
 3de:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 3e2:	b8 00 00 00 00       	mov    $0x0,%eax
 3e7:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 3ec:	39 c1                	cmp    %eax,%ecx
 3ee:	75 f2                	jne    3e2 <lock_acquire+0x13>
      ; // spin
    }
}
 3f0:	5d                   	pop    %ebp
 3f1:	c3                   	ret    

000003f2 <lock_release>:

void lock_release(lock_t *lock) {
 3f2:	f3 0f 1e fb          	endbr32 
 3f6:	55                   	push   %ebp
 3f7:	89 e5                	mov    %esp,%ebp
 3f9:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 3fc:	8b 42 04             	mov    0x4(%edx),%eax
 3ff:	83 c0 01             	add    $0x1,%eax
 402:	89 42 04             	mov    %eax,0x4(%edx)
}
 405:	5d                   	pop    %ebp
 406:	c3                   	ret    

00000407 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 407:	b8 01 00 00 00       	mov    $0x1,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <clone>:
SYSCALL(clone)
 40f:	b8 16 00 00 00       	mov    $0x16,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <exit>:
SYSCALL(exit)
 417:	b8 02 00 00 00       	mov    $0x2,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <wait>:
SYSCALL(wait)
 41f:	b8 03 00 00 00       	mov    $0x3,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <join>:
SYSCALL(join)
 427:	b8 17 00 00 00       	mov    $0x17,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <pipe>:
SYSCALL(pipe)
 42f:	b8 04 00 00 00       	mov    $0x4,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <read>:
SYSCALL(read)
 437:	b8 05 00 00 00       	mov    $0x5,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <write>:
SYSCALL(write)
 43f:	b8 10 00 00 00       	mov    $0x10,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <close>:
SYSCALL(close)
 447:	b8 15 00 00 00       	mov    $0x15,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <kill>:
SYSCALL(kill)
 44f:	b8 06 00 00 00       	mov    $0x6,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <exec>:
SYSCALL(exec)
 457:	b8 07 00 00 00       	mov    $0x7,%eax
 45c:	cd 40                	int    $0x40
 45e:	c3                   	ret    

0000045f <open>:
SYSCALL(open)
 45f:	b8 0f 00 00 00       	mov    $0xf,%eax
 464:	cd 40                	int    $0x40
 466:	c3                   	ret    

00000467 <mknod>:
SYSCALL(mknod)
 467:	b8 11 00 00 00       	mov    $0x11,%eax
 46c:	cd 40                	int    $0x40
 46e:	c3                   	ret    

0000046f <unlink>:
SYSCALL(unlink)
 46f:	b8 12 00 00 00       	mov    $0x12,%eax
 474:	cd 40                	int    $0x40
 476:	c3                   	ret    

00000477 <fstat>:
SYSCALL(fstat)
 477:	b8 08 00 00 00       	mov    $0x8,%eax
 47c:	cd 40                	int    $0x40
 47e:	c3                   	ret    

0000047f <link>:
SYSCALL(link)
 47f:	b8 13 00 00 00       	mov    $0x13,%eax
 484:	cd 40                	int    $0x40
 486:	c3                   	ret    

00000487 <mkdir>:
SYSCALL(mkdir)
 487:	b8 14 00 00 00       	mov    $0x14,%eax
 48c:	cd 40                	int    $0x40
 48e:	c3                   	ret    

0000048f <chdir>:
SYSCALL(chdir)
 48f:	b8 09 00 00 00       	mov    $0x9,%eax
 494:	cd 40                	int    $0x40
 496:	c3                   	ret    

00000497 <dup>:
SYSCALL(dup)
 497:	b8 0a 00 00 00       	mov    $0xa,%eax
 49c:	cd 40                	int    $0x40
 49e:	c3                   	ret    

0000049f <getpid>:
SYSCALL(getpid)
 49f:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a4:	cd 40                	int    $0x40
 4a6:	c3                   	ret    

000004a7 <sbrk>:
SYSCALL(sbrk)
 4a7:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ac:	cd 40                	int    $0x40
 4ae:	c3                   	ret    

000004af <sleep>:
SYSCALL(sleep)
 4af:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <uptime>:
SYSCALL(uptime)
 4b7:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4bf:	55                   	push   %ebp
 4c0:	89 e5                	mov    %esp,%ebp
 4c2:	83 ec 1c             	sub    $0x1c,%esp
 4c5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 4c8:	6a 01                	push   $0x1
 4ca:	8d 55 f4             	lea    -0xc(%ebp),%edx
 4cd:	52                   	push   %edx
 4ce:	50                   	push   %eax
 4cf:	e8 6b ff ff ff       	call   43f <write>
}
 4d4:	83 c4 10             	add    $0x10,%esp
 4d7:	c9                   	leave  
 4d8:	c3                   	ret    

000004d9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d9:	55                   	push   %ebp
 4da:	89 e5                	mov    %esp,%ebp
 4dc:	57                   	push   %edi
 4dd:	56                   	push   %esi
 4de:	53                   	push   %ebx
 4df:	83 ec 2c             	sub    $0x2c,%esp
 4e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4e5:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4e7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 4eb:	0f 95 c2             	setne  %dl
 4ee:	89 f0                	mov    %esi,%eax
 4f0:	c1 e8 1f             	shr    $0x1f,%eax
 4f3:	84 c2                	test   %al,%dl
 4f5:	74 42                	je     539 <printint+0x60>
    neg = 1;
    x = -xx;
 4f7:	f7 de                	neg    %esi
    neg = 1;
 4f9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 500:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 505:	89 f0                	mov    %esi,%eax
 507:	ba 00 00 00 00       	mov    $0x0,%edx
 50c:	f7 f1                	div    %ecx
 50e:	89 df                	mov    %ebx,%edi
 510:	83 c3 01             	add    $0x1,%ebx
 513:	0f b6 92 60 08 00 00 	movzbl 0x860(%edx),%edx
 51a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 51e:	89 f2                	mov    %esi,%edx
 520:	89 c6                	mov    %eax,%esi
 522:	39 d1                	cmp    %edx,%ecx
 524:	76 df                	jbe    505 <printint+0x2c>
  if(neg)
 526:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 52a:	74 2f                	je     55b <printint+0x82>
    buf[i++] = '-';
 52c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 531:	8d 5f 02             	lea    0x2(%edi),%ebx
 534:	8b 75 d0             	mov    -0x30(%ebp),%esi
 537:	eb 15                	jmp    54e <printint+0x75>
  neg = 0;
 539:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 540:	eb be                	jmp    500 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 542:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 547:	89 f0                	mov    %esi,%eax
 549:	e8 71 ff ff ff       	call   4bf <putc>
  while(--i >= 0)
 54e:	83 eb 01             	sub    $0x1,%ebx
 551:	79 ef                	jns    542 <printint+0x69>
}
 553:	83 c4 2c             	add    $0x2c,%esp
 556:	5b                   	pop    %ebx
 557:	5e                   	pop    %esi
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret    
 55b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 55e:	eb ee                	jmp    54e <printint+0x75>

00000560 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 560:	f3 0f 1e fb          	endbr32 
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	57                   	push   %edi
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
 56a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 56d:	8d 45 10             	lea    0x10(%ebp),%eax
 570:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 573:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 578:	bb 00 00 00 00       	mov    $0x0,%ebx
 57d:	eb 14                	jmp    593 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 57f:	89 fa                	mov    %edi,%edx
 581:	8b 45 08             	mov    0x8(%ebp),%eax
 584:	e8 36 ff ff ff       	call   4bf <putc>
 589:	eb 05                	jmp    590 <printf+0x30>
      }
    } else if(state == '%'){
 58b:	83 fe 25             	cmp    $0x25,%esi
 58e:	74 25                	je     5b5 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 590:	83 c3 01             	add    $0x1,%ebx
 593:	8b 45 0c             	mov    0xc(%ebp),%eax
 596:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 59a:	84 c0                	test   %al,%al
 59c:	0f 84 23 01 00 00    	je     6c5 <printf+0x165>
    c = fmt[i] & 0xff;
 5a2:	0f be f8             	movsbl %al,%edi
 5a5:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 5a8:	85 f6                	test   %esi,%esi
 5aa:	75 df                	jne    58b <printf+0x2b>
      if(c == '%'){
 5ac:	83 f8 25             	cmp    $0x25,%eax
 5af:	75 ce                	jne    57f <printf+0x1f>
        state = '%';
 5b1:	89 c6                	mov    %eax,%esi
 5b3:	eb db                	jmp    590 <printf+0x30>
      if(c == 'd'){
 5b5:	83 f8 64             	cmp    $0x64,%eax
 5b8:	74 49                	je     603 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5ba:	83 f8 78             	cmp    $0x78,%eax
 5bd:	0f 94 c1             	sete   %cl
 5c0:	83 f8 70             	cmp    $0x70,%eax
 5c3:	0f 94 c2             	sete   %dl
 5c6:	08 d1                	or     %dl,%cl
 5c8:	75 63                	jne    62d <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5ca:	83 f8 73             	cmp    $0x73,%eax
 5cd:	0f 84 84 00 00 00    	je     657 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5d3:	83 f8 63             	cmp    $0x63,%eax
 5d6:	0f 84 b7 00 00 00    	je     693 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5dc:	83 f8 25             	cmp    $0x25,%eax
 5df:	0f 84 cc 00 00 00    	je     6b1 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5e5:	ba 25 00 00 00       	mov    $0x25,%edx
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	e8 cd fe ff ff       	call   4bf <putc>
        putc(fd, c);
 5f2:	89 fa                	mov    %edi,%edx
 5f4:	8b 45 08             	mov    0x8(%ebp),%eax
 5f7:	e8 c3 fe ff ff       	call   4bf <putc>
      }
      state = 0;
 5fc:	be 00 00 00 00       	mov    $0x0,%esi
 601:	eb 8d                	jmp    590 <printf+0x30>
        printint(fd, *ap, 10, 1);
 603:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 606:	8b 17                	mov    (%edi),%edx
 608:	83 ec 0c             	sub    $0xc,%esp
 60b:	6a 01                	push   $0x1
 60d:	b9 0a 00 00 00       	mov    $0xa,%ecx
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	e8 bf fe ff ff       	call   4d9 <printint>
        ap++;
 61a:	83 c7 04             	add    $0x4,%edi
 61d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 620:	83 c4 10             	add    $0x10,%esp
      state = 0;
 623:	be 00 00 00 00       	mov    $0x0,%esi
 628:	e9 63 ff ff ff       	jmp    590 <printf+0x30>
        printint(fd, *ap, 16, 0);
 62d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 630:	8b 17                	mov    (%edi),%edx
 632:	83 ec 0c             	sub    $0xc,%esp
 635:	6a 00                	push   $0x0
 637:	b9 10 00 00 00       	mov    $0x10,%ecx
 63c:	8b 45 08             	mov    0x8(%ebp),%eax
 63f:	e8 95 fe ff ff       	call   4d9 <printint>
        ap++;
 644:	83 c7 04             	add    $0x4,%edi
 647:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 64a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 64d:	be 00 00 00 00       	mov    $0x0,%esi
 652:	e9 39 ff ff ff       	jmp    590 <printf+0x30>
        s = (char*)*ap;
 657:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 65a:	8b 30                	mov    (%eax),%esi
        ap++;
 65c:	83 c0 04             	add    $0x4,%eax
 65f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 662:	85 f6                	test   %esi,%esi
 664:	75 28                	jne    68e <printf+0x12e>
          s = "(null)";
 666:	be 58 08 00 00       	mov    $0x858,%esi
 66b:	8b 7d 08             	mov    0x8(%ebp),%edi
 66e:	eb 0d                	jmp    67d <printf+0x11d>
          putc(fd, *s);
 670:	0f be d2             	movsbl %dl,%edx
 673:	89 f8                	mov    %edi,%eax
 675:	e8 45 fe ff ff       	call   4bf <putc>
          s++;
 67a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 67d:	0f b6 16             	movzbl (%esi),%edx
 680:	84 d2                	test   %dl,%dl
 682:	75 ec                	jne    670 <printf+0x110>
      state = 0;
 684:	be 00 00 00 00       	mov    $0x0,%esi
 689:	e9 02 ff ff ff       	jmp    590 <printf+0x30>
 68e:	8b 7d 08             	mov    0x8(%ebp),%edi
 691:	eb ea                	jmp    67d <printf+0x11d>
        putc(fd, *ap);
 693:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 696:	0f be 17             	movsbl (%edi),%edx
 699:	8b 45 08             	mov    0x8(%ebp),%eax
 69c:	e8 1e fe ff ff       	call   4bf <putc>
        ap++;
 6a1:	83 c7 04             	add    $0x4,%edi
 6a4:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 6a7:	be 00 00 00 00       	mov    $0x0,%esi
 6ac:	e9 df fe ff ff       	jmp    590 <printf+0x30>
        putc(fd, c);
 6b1:	89 fa                	mov    %edi,%edx
 6b3:	8b 45 08             	mov    0x8(%ebp),%eax
 6b6:	e8 04 fe ff ff       	call   4bf <putc>
      state = 0;
 6bb:	be 00 00 00 00       	mov    $0x0,%esi
 6c0:	e9 cb fe ff ff       	jmp    590 <printf+0x30>
    }
  }
}
 6c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c8:	5b                   	pop    %ebx
 6c9:	5e                   	pop    %esi
 6ca:	5f                   	pop    %edi
 6cb:	5d                   	pop    %ebp
 6cc:	c3                   	ret    

000006cd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6cd:	f3 0f 1e fb          	endbr32 
 6d1:	55                   	push   %ebp
 6d2:	89 e5                	mov    %esp,%ebp
 6d4:	57                   	push   %edi
 6d5:	56                   	push   %esi
 6d6:	53                   	push   %ebx
 6d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6da:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dd:	a1 00 0c 00 00       	mov    0xc00,%eax
 6e2:	eb 02                	jmp    6e6 <free+0x19>
 6e4:	89 d0                	mov    %edx,%eax
 6e6:	39 c8                	cmp    %ecx,%eax
 6e8:	73 04                	jae    6ee <free+0x21>
 6ea:	39 08                	cmp    %ecx,(%eax)
 6ec:	77 12                	ja     700 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ee:	8b 10                	mov    (%eax),%edx
 6f0:	39 c2                	cmp    %eax,%edx
 6f2:	77 f0                	ja     6e4 <free+0x17>
 6f4:	39 c8                	cmp    %ecx,%eax
 6f6:	72 08                	jb     700 <free+0x33>
 6f8:	39 ca                	cmp    %ecx,%edx
 6fa:	77 04                	ja     700 <free+0x33>
 6fc:	89 d0                	mov    %edx,%eax
 6fe:	eb e6                	jmp    6e6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 700:	8b 73 fc             	mov    -0x4(%ebx),%esi
 703:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 706:	8b 10                	mov    (%eax),%edx
 708:	39 d7                	cmp    %edx,%edi
 70a:	74 19                	je     725 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 70c:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 70f:	8b 50 04             	mov    0x4(%eax),%edx
 712:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 715:	39 ce                	cmp    %ecx,%esi
 717:	74 1b                	je     734 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 719:	89 08                	mov    %ecx,(%eax)
  freep = p;
 71b:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 720:	5b                   	pop    %ebx
 721:	5e                   	pop    %esi
 722:	5f                   	pop    %edi
 723:	5d                   	pop    %ebp
 724:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 725:	03 72 04             	add    0x4(%edx),%esi
 728:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 72b:	8b 10                	mov    (%eax),%edx
 72d:	8b 12                	mov    (%edx),%edx
 72f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 732:	eb db                	jmp    70f <free+0x42>
    p->s.size += bp->s.size;
 734:	03 53 fc             	add    -0x4(%ebx),%edx
 737:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 73a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 73d:	89 10                	mov    %edx,(%eax)
 73f:	eb da                	jmp    71b <free+0x4e>

00000741 <morecore>:

static Header*
morecore(uint nu)
{
 741:	55                   	push   %ebp
 742:	89 e5                	mov    %esp,%ebp
 744:	53                   	push   %ebx
 745:	83 ec 04             	sub    $0x4,%esp
 748:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 74a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 74f:	77 05                	ja     756 <morecore+0x15>
    nu = 4096;
 751:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 756:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 75d:	83 ec 0c             	sub    $0xc,%esp
 760:	50                   	push   %eax
 761:	e8 41 fd ff ff       	call   4a7 <sbrk>
  if(p == (char*)-1)
 766:	83 c4 10             	add    $0x10,%esp
 769:	83 f8 ff             	cmp    $0xffffffff,%eax
 76c:	74 1c                	je     78a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 76e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 771:	83 c0 08             	add    $0x8,%eax
 774:	83 ec 0c             	sub    $0xc,%esp
 777:	50                   	push   %eax
 778:	e8 50 ff ff ff       	call   6cd <free>
  return freep;
 77d:	a1 00 0c 00 00       	mov    0xc00,%eax
 782:	83 c4 10             	add    $0x10,%esp
}
 785:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 788:	c9                   	leave  
 789:	c3                   	ret    
    return 0;
 78a:	b8 00 00 00 00       	mov    $0x0,%eax
 78f:	eb f4                	jmp    785 <morecore+0x44>

00000791 <malloc>:

void*
malloc(uint nbytes)
{
 791:	f3 0f 1e fb          	endbr32 
 795:	55                   	push   %ebp
 796:	89 e5                	mov    %esp,%ebp
 798:	53                   	push   %ebx
 799:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	8d 58 07             	lea    0x7(%eax),%ebx
 7a2:	c1 eb 03             	shr    $0x3,%ebx
 7a5:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 7a8:	8b 0d 00 0c 00 00    	mov    0xc00,%ecx
 7ae:	85 c9                	test   %ecx,%ecx
 7b0:	74 04                	je     7b6 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b2:	8b 01                	mov    (%ecx),%eax
 7b4:	eb 4b                	jmp    801 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 7b6:	c7 05 00 0c 00 00 04 	movl   $0xc04,0xc00
 7bd:	0c 00 00 
 7c0:	c7 05 04 0c 00 00 04 	movl   $0xc04,0xc04
 7c7:	0c 00 00 
    base.s.size = 0;
 7ca:	c7 05 08 0c 00 00 00 	movl   $0x0,0xc08
 7d1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 7d4:	b9 04 0c 00 00       	mov    $0xc04,%ecx
 7d9:	eb d7                	jmp    7b2 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 7db:	74 1a                	je     7f7 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 7dd:	29 da                	sub    %ebx,%edx
 7df:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 7e5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 7e8:	89 0d 00 0c 00 00    	mov    %ecx,0xc00
      return (void*)(p + 1);
 7ee:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 7f1:	83 c4 04             	add    $0x4,%esp
 7f4:	5b                   	pop    %ebx
 7f5:	5d                   	pop    %ebp
 7f6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 7f7:	8b 10                	mov    (%eax),%edx
 7f9:	89 11                	mov    %edx,(%ecx)
 7fb:	eb eb                	jmp    7e8 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fd:	89 c1                	mov    %eax,%ecx
 7ff:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 801:	8b 50 04             	mov    0x4(%eax),%edx
 804:	39 da                	cmp    %ebx,%edx
 806:	73 d3                	jae    7db <malloc+0x4a>
    if(p == freep)
 808:	39 05 00 0c 00 00    	cmp    %eax,0xc00
 80e:	75 ed                	jne    7fd <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 810:	89 d8                	mov    %ebx,%eax
 812:	e8 2a ff ff ff       	call   741 <morecore>
 817:	85 c0                	test   %eax,%eax
 819:	75 e2                	jne    7fd <malloc+0x6c>
 81b:	eb d4                	jmp    7f1 <malloc+0x60>
