
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	57                   	push   %edi
   8:	56                   	push   %esi
   9:	53                   	push   %ebx
   a:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
   d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  14:	be 00 00 00 00       	mov    $0x0,%esi
  19:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  20:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  27:	83 ec 04             	sub    $0x4,%esp
  2a:	68 00 02 00 00       	push   $0x200
  2f:	68 80 0c 00 00       	push   $0xc80
  34:	ff 75 08             	pushl  0x8(%ebp)
  37:	e8 65 04 00 00       	call   4a1 <read>
  3c:	89 c7                	mov    %eax,%edi
  3e:	83 c4 10             	add    $0x10,%esp
  41:	85 c0                	test   %eax,%eax
  43:	7e 54                	jle    99 <wc+0x99>
    for(i=0; i<n; i++){
  45:	bb 00 00 00 00       	mov    $0x0,%ebx
  4a:	eb 22                	jmp    6e <wc+0x6e>
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
  4c:	83 ec 08             	sub    $0x8,%esp
  4f:	0f be c0             	movsbl %al,%eax
  52:	50                   	push   %eax
  53:	68 88 08 00 00       	push   $0x888
  58:	e8 98 01 00 00       	call   1f5 <strchr>
  5d:	83 c4 10             	add    $0x10,%esp
  60:	85 c0                	test   %eax,%eax
  62:	74 22                	je     86 <wc+0x86>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	39 fb                	cmp    %edi,%ebx
  70:	7d b5                	jge    27 <wc+0x27>
      c++;
  72:	83 c6 01             	add    $0x1,%esi
      if(buf[i] == '\n')
  75:	0f b6 83 80 0c 00 00 	movzbl 0xc80(%ebx),%eax
  7c:	3c 0a                	cmp    $0xa,%al
  7e:	75 cc                	jne    4c <wc+0x4c>
        l++;
  80:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  84:	eb c6                	jmp    4c <wc+0x4c>
      else if(!inword){
  86:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8a:	75 df                	jne    6b <wc+0x6b>
        w++;
  8c:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
        inword = 1;
  90:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  97:	eb d2                	jmp    6b <wc+0x6b>
      }
    }
  }
  if(n < 0){
  99:	78 24                	js     bf <wc+0xbf>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  9b:	83 ec 08             	sub    $0x8,%esp
  9e:	ff 75 0c             	pushl  0xc(%ebp)
  a1:	56                   	push   %esi
  a2:	ff 75 dc             	pushl  -0x24(%ebp)
  a5:	ff 75 e0             	pushl  -0x20(%ebp)
  a8:	68 9e 08 00 00       	push   $0x89e
  ad:	6a 01                	push   $0x1
  af:	e8 16 05 00 00       	call   5ca <printf>
}
  b4:	83 c4 20             	add    $0x20,%esp
  b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ba:	5b                   	pop    %ebx
  bb:	5e                   	pop    %esi
  bc:	5f                   	pop    %edi
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret    
    printf(1, "wc: read error\n");
  bf:	83 ec 08             	sub    $0x8,%esp
  c2:	68 8e 08 00 00       	push   $0x88e
  c7:	6a 01                	push   $0x1
  c9:	e8 fc 04 00 00       	call   5ca <printf>
    exit();
  ce:	e8 ae 03 00 00       	call   481 <exit>

000000d3 <main>:

int
main(int argc, char *argv[])
{
  d3:	f3 0f 1e fb          	endbr32 
  d7:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  db:	83 e4 f0             	and    $0xfffffff0,%esp
  de:	ff 71 fc             	pushl  -0x4(%ecx)
  e1:	55                   	push   %ebp
  e2:	89 e5                	mov    %esp,%ebp
  e4:	57                   	push   %edi
  e5:	56                   	push   %esi
  e6:	53                   	push   %ebx
  e7:	51                   	push   %ecx
  e8:	83 ec 18             	sub    $0x18,%esp
  eb:	8b 01                	mov    (%ecx),%eax
  ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  f0:	8b 51 04             	mov    0x4(%ecx),%edx
  f3:	89 55 e0             	mov    %edx,-0x20(%ebp)
  int fd, i;

  if(argc <= 1){
  f6:	83 f8 01             	cmp    $0x1,%eax
  f9:	7e 40                	jle    13b <main+0x68>
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  fb:	be 01 00 00 00       	mov    $0x1,%esi
 100:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 103:	7d 60                	jge    165 <main+0x92>
    if((fd = open(argv[i], 0)) < 0){
 105:	8b 45 e0             	mov    -0x20(%ebp),%eax
 108:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 10b:	83 ec 08             	sub    $0x8,%esp
 10e:	6a 00                	push   $0x0
 110:	ff 37                	pushl  (%edi)
 112:	e8 b2 03 00 00       	call   4c9 <open>
 117:	89 c3                	mov    %eax,%ebx
 119:	83 c4 10             	add    $0x10,%esp
 11c:	85 c0                	test   %eax,%eax
 11e:	78 2f                	js     14f <main+0x7c>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
 120:	83 ec 08             	sub    $0x8,%esp
 123:	ff 37                	pushl  (%edi)
 125:	50                   	push   %eax
 126:	e8 d5 fe ff ff       	call   0 <wc>
    close(fd);
 12b:	89 1c 24             	mov    %ebx,(%esp)
 12e:	e8 7e 03 00 00       	call   4b1 <close>
  for(i = 1; i < argc; i++){
 133:	83 c6 01             	add    $0x1,%esi
 136:	83 c4 10             	add    $0x10,%esp
 139:	eb c5                	jmp    100 <main+0x2d>
    wc(0, "");
 13b:	83 ec 08             	sub    $0x8,%esp
 13e:	68 9d 08 00 00       	push   $0x89d
 143:	6a 00                	push   $0x0
 145:	e8 b6 fe ff ff       	call   0 <wc>
    exit();
 14a:	e8 32 03 00 00       	call   481 <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
 14f:	83 ec 04             	sub    $0x4,%esp
 152:	ff 37                	pushl  (%edi)
 154:	68 ab 08 00 00       	push   $0x8ab
 159:	6a 01                	push   $0x1
 15b:	e8 6a 04 00 00       	call   5ca <printf>
      exit();
 160:	e8 1c 03 00 00       	call   481 <exit>
  }
  exit();
 165:	e8 17 03 00 00       	call   481 <exit>

0000016a <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 16a:	f3 0f 1e fb          	endbr32 
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	56                   	push   %esi
 172:	53                   	push   %ebx
 173:	8b 75 08             	mov    0x8(%ebp),%esi
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 179:	89 f0                	mov    %esi,%eax
 17b:	89 d1                	mov    %edx,%ecx
 17d:	83 c2 01             	add    $0x1,%edx
 180:	89 c3                	mov    %eax,%ebx
 182:	83 c0 01             	add    $0x1,%eax
 185:	0f b6 09             	movzbl (%ecx),%ecx
 188:	88 0b                	mov    %cl,(%ebx)
 18a:	84 c9                	test   %cl,%cl
 18c:	75 ed                	jne    17b <strcpy+0x11>
    ;
  return os;
}
 18e:	89 f0                	mov    %esi,%eax
 190:	5b                   	pop    %ebx
 191:	5e                   	pop    %esi
 192:	5d                   	pop    %ebp
 193:	c3                   	ret    

00000194 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 194:	f3 0f 1e fb          	endbr32 
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 19e:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 1a1:	0f b6 01             	movzbl (%ecx),%eax
 1a4:	84 c0                	test   %al,%al
 1a6:	74 0c                	je     1b4 <strcmp+0x20>
 1a8:	3a 02                	cmp    (%edx),%al
 1aa:	75 08                	jne    1b4 <strcmp+0x20>
    p++, q++;
 1ac:	83 c1 01             	add    $0x1,%ecx
 1af:	83 c2 01             	add    $0x1,%edx
 1b2:	eb ed                	jmp    1a1 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 1b4:	0f b6 c0             	movzbl %al,%eax
 1b7:	0f b6 12             	movzbl (%edx),%edx
 1ba:	29 d0                	sub    %edx,%eax
}
 1bc:	5d                   	pop    %ebp
 1bd:	c3                   	ret    

000001be <strlen>:

uint
strlen(const char *s)
{
 1be:	f3 0f 1e fb          	endbr32 
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 1c8:	b8 00 00 00 00       	mov    $0x0,%eax
 1cd:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 1d1:	74 05                	je     1d8 <strlen+0x1a>
 1d3:	83 c0 01             	add    $0x1,%eax
 1d6:	eb f5                	jmp    1cd <strlen+0xf>
    ;
  return n;
}
 1d8:	5d                   	pop    %ebp
 1d9:	c3                   	ret    

000001da <memset>:

void*
memset(void *dst, int c, uint n)
{
 1da:	f3 0f 1e fb          	endbr32 
 1de:	55                   	push   %ebp
 1df:	89 e5                	mov    %esp,%ebp
 1e1:	57                   	push   %edi
 1e2:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e5:	89 d7                	mov    %edx,%edi
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f0:	89 d0                	mov    %edx,%eax
 1f2:	5f                   	pop    %edi
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    

000001f5 <strchr>:

char*
strchr(const char *s, char c)
{
 1f5:	f3 0f 1e fb          	endbr32 
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 203:	0f b6 10             	movzbl (%eax),%edx
 206:	84 d2                	test   %dl,%dl
 208:	74 09                	je     213 <strchr+0x1e>
    if(*s == c)
 20a:	38 ca                	cmp    %cl,%dl
 20c:	74 0a                	je     218 <strchr+0x23>
  for(; *s; s++)
 20e:	83 c0 01             	add    $0x1,%eax
 211:	eb f0                	jmp    203 <strchr+0xe>
      return (char*)s;
  return 0;
 213:	b8 00 00 00 00       	mov    $0x0,%eax
}
 218:	5d                   	pop    %ebp
 219:	c3                   	ret    

0000021a <gets>:

char*
gets(char *buf, int max)
{
 21a:	f3 0f 1e fb          	endbr32 
 21e:	55                   	push   %ebp
 21f:	89 e5                	mov    %esp,%ebp
 221:	57                   	push   %edi
 222:	56                   	push   %esi
 223:	53                   	push   %ebx
 224:	83 ec 1c             	sub    $0x1c,%esp
 227:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22a:	bb 00 00 00 00       	mov    $0x0,%ebx
 22f:	89 de                	mov    %ebx,%esi
 231:	83 c3 01             	add    $0x1,%ebx
 234:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 237:	7d 2e                	jge    267 <gets+0x4d>
    cc = read(0, &c, 1);
 239:	83 ec 04             	sub    $0x4,%esp
 23c:	6a 01                	push   $0x1
 23e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 241:	50                   	push   %eax
 242:	6a 00                	push   $0x0
 244:	e8 58 02 00 00       	call   4a1 <read>
    if(cc < 1)
 249:	83 c4 10             	add    $0x10,%esp
 24c:	85 c0                	test   %eax,%eax
 24e:	7e 17                	jle    267 <gets+0x4d>
      break;
    buf[i++] = c;
 250:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 254:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 257:	3c 0a                	cmp    $0xa,%al
 259:	0f 94 c2             	sete   %dl
 25c:	3c 0d                	cmp    $0xd,%al
 25e:	0f 94 c0             	sete   %al
 261:	08 c2                	or     %al,%dl
 263:	74 ca                	je     22f <gets+0x15>
    buf[i++] = c;
 265:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 267:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 26b:	89 f8                	mov    %edi,%eax
 26d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 270:	5b                   	pop    %ebx
 271:	5e                   	pop    %esi
 272:	5f                   	pop    %edi
 273:	5d                   	pop    %ebp
 274:	c3                   	ret    

00000275 <stat>:

int
stat(const char *n, struct stat *st)
{
 275:	f3 0f 1e fb          	endbr32 
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
 27c:	56                   	push   %esi
 27d:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27e:	83 ec 08             	sub    $0x8,%esp
 281:	6a 00                	push   $0x0
 283:	ff 75 08             	pushl  0x8(%ebp)
 286:	e8 3e 02 00 00       	call   4c9 <open>
  if(fd < 0)
 28b:	83 c4 10             	add    $0x10,%esp
 28e:	85 c0                	test   %eax,%eax
 290:	78 24                	js     2b6 <stat+0x41>
 292:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 294:	83 ec 08             	sub    $0x8,%esp
 297:	ff 75 0c             	pushl  0xc(%ebp)
 29a:	50                   	push   %eax
 29b:	e8 41 02 00 00       	call   4e1 <fstat>
 2a0:	89 c6                	mov    %eax,%esi
  close(fd);
 2a2:	89 1c 24             	mov    %ebx,(%esp)
 2a5:	e8 07 02 00 00       	call   4b1 <close>
  return r;
 2aa:	83 c4 10             	add    $0x10,%esp
}
 2ad:	89 f0                	mov    %esi,%eax
 2af:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b2:	5b                   	pop    %ebx
 2b3:	5e                   	pop    %esi
 2b4:	5d                   	pop    %ebp
 2b5:	c3                   	ret    
    return -1;
 2b6:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2bb:	eb f0                	jmp    2ad <stat+0x38>

000002bd <atoi>:

int
atoi(const char *s)
{
 2bd:	f3 0f 1e fb          	endbr32 
 2c1:	55                   	push   %ebp
 2c2:	89 e5                	mov    %esp,%ebp
 2c4:	53                   	push   %ebx
 2c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 2c8:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 2cd:	0f b6 01             	movzbl (%ecx),%eax
 2d0:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d3:	80 fb 09             	cmp    $0x9,%bl
 2d6:	77 12                	ja     2ea <atoi+0x2d>
    n = n*10 + *s++ - '0';
 2d8:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 2db:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 2de:	83 c1 01             	add    $0x1,%ecx
 2e1:	0f be c0             	movsbl %al,%eax
 2e4:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 2e8:	eb e3                	jmp    2cd <atoi+0x10>
  return n;
}
 2ea:	89 d0                	mov    %edx,%eax
 2ec:	5b                   	pop    %ebx
 2ed:	5d                   	pop    %ebp
 2ee:	c3                   	ret    

000002ef <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2ef:	f3 0f 1e fb          	endbr32 
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	56                   	push   %esi
 2f7:	53                   	push   %ebx
 2f8:	8b 75 08             	mov    0x8(%ebp),%esi
 2fb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2fe:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 301:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 303:	8d 58 ff             	lea    -0x1(%eax),%ebx
 306:	85 c0                	test   %eax,%eax
 308:	7e 0f                	jle    319 <memmove+0x2a>
    *dst++ = *src++;
 30a:	0f b6 01             	movzbl (%ecx),%eax
 30d:	88 02                	mov    %al,(%edx)
 30f:	8d 49 01             	lea    0x1(%ecx),%ecx
 312:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 315:	89 d8                	mov    %ebx,%eax
 317:	eb ea                	jmp    303 <memmove+0x14>
  return vdst;
}
 319:	89 f0                	mov    %esi,%eax
 31b:	5b                   	pop    %ebx
 31c:	5e                   	pop    %esi
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret    

0000031f <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 31f:	f3 0f 1e fb          	endbr32 
 323:	55                   	push   %ebp
 324:	89 e5                	mov    %esp,%ebp
 326:	53                   	push   %ebx
 327:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 32a:	68 00 20 00 00       	push   $0x2000
 32f:	e8 c7 04 00 00       	call   7fb <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 334:	83 c4 10             	add    $0x10,%esp
 337:	89 c2                	mov    %eax,%edx
 339:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 33f:	74 22                	je     363 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 341:	b9 00 10 00 00       	mov    $0x1000,%ecx
 346:	29 d1                	sub    %edx,%ecx
 348:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 34a:	ba 00 00 00 00       	mov    $0x0,%edx
 34f:	83 fa 3f             	cmp    $0x3f,%edx
 352:	7f 13                	jg     367 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 354:	83 3c 95 80 11 00 00 	cmpl   $0x1,0x1180(,%edx,4)
 35b:	01 
 35c:	75 09                	jne    367 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 35e:	83 c2 01             	add    $0x1,%edx
 361:	eb ec                	jmp    34f <thread_create+0x30>
  void *user_stack = curr_ptr;
 363:	89 c1                	mov    %eax,%ecx
 365:	eb e3                	jmp    34a <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 367:	83 3c 95 80 11 00 00 	cmpl   $0x1,0x1180(,%edx,4)
 36e:	01 
 36f:	74 34                	je     3a5 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 371:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 374:	c1 e3 02             	shl    $0x2,%ebx
 377:	89 83 80 0e 00 00    	mov    %eax,0xe80(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 37d:	89 8b 84 0e 00 00    	mov    %ecx,0xe84(%ebx)
  cell_full[i] = 1;
 383:	c7 04 95 80 11 00 00 	movl   $0x1,0x1180(,%edx,4)
 38a:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 38e:	ff 75 10             	pushl  0x10(%ebp)
 391:	ff 75 0c             	pushl  0xc(%ebp)
 394:	ff 75 08             	pushl  0x8(%ebp)
 397:	51                   	push   %ecx
 398:	e8 dc 00 00 00       	call   479 <clone>
 39d:	83 c4 10             	add    $0x10,%esp
}
 3a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3a3:	c9                   	leave  
 3a4:	c3                   	ret    
    return -1;
 3a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3aa:	eb f4                	jmp    3a0 <thread_create+0x81>

000003ac <thread_join>:

int thread_join(){
 3ac:	f3 0f 1e fb          	endbr32 
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	56                   	push   %esi
 3b4:	53                   	push   %ebx
 3b5:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 3b8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3bb:	50                   	push   %eax
 3bc:	e8 d0 00 00 00       	call   491 <join>
 3c1:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 3c3:	83 c4 10             	add    $0x10,%esp
 3c6:	bb 00 00 00 00       	mov    $0x0,%ebx
 3cb:	83 fb 3f             	cmp    $0x3f,%ebx
 3ce:	7f 14                	jg     3e4 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 3d0:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 3d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3d6:	39 14 85 84 0e 00 00 	cmp    %edx,0xe84(,%eax,4)
 3dd:	74 05                	je     3e4 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 3df:	83 c3 01             	add    $0x1,%ebx
 3e2:	eb e7                	jmp    3cb <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 3e4:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 3e7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3ea:	39 0c 85 84 0e 00 00 	cmp    %ecx,0xe84(,%eax,4)
 3f1:	75 26                	jne    419 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 3f3:	83 ec 0c             	sub    $0xc,%esp
 3f6:	ff 34 85 80 0e 00 00 	pushl  0xe80(,%eax,4)
 3fd:	e8 35 03 00 00       	call   737 <free>
  cell_full[i] = 0;
 402:	c7 04 9d 80 11 00 00 	movl   $0x0,0x1180(,%ebx,4)
 409:	00 00 00 00 

  return out;
 40d:	83 c4 10             	add    $0x10,%esp
}
 410:	89 f0                	mov    %esi,%eax
 412:	8d 65 f8             	lea    -0x8(%ebp),%esp
 415:	5b                   	pop    %ebx
 416:	5e                   	pop    %esi
 417:	5d                   	pop    %ebp
 418:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 419:	be ff ff ff ff       	mov    $0xffffffff,%esi
 41e:	eb f0                	jmp    410 <thread_join+0x64>

00000420 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 42a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 430:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

00000439 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 439:	f3 0f 1e fb          	endbr32 
 43d:	55                   	push   %ebp
 43e:	89 e5                	mov    %esp,%ebp
 440:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 443:	b9 01 00 00 00       	mov    $0x1,%ecx
 448:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 44c:	b8 00 00 00 00       	mov    $0x0,%eax
 451:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 456:	39 c1                	cmp    %eax,%ecx
 458:	75 f2                	jne    44c <lock_acquire+0x13>
      ; // spin
    }
}
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    

0000045c <lock_release>:

void lock_release(lock_t *lock) {
 45c:	f3 0f 1e fb          	endbr32 
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 466:	8b 42 04             	mov    0x4(%edx),%eax
 469:	83 c0 01             	add    $0x1,%eax
 46c:	89 42 04             	mov    %eax,0x4(%edx)
}
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    

00000471 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 471:	b8 01 00 00 00       	mov    $0x1,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <clone>:
SYSCALL(clone)
 479:	b8 16 00 00 00       	mov    $0x16,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <exit>:
SYSCALL(exit)
 481:	b8 02 00 00 00       	mov    $0x2,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <wait>:
SYSCALL(wait)
 489:	b8 03 00 00 00       	mov    $0x3,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <join>:
SYSCALL(join)
 491:	b8 17 00 00 00       	mov    $0x17,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <pipe>:
SYSCALL(pipe)
 499:	b8 04 00 00 00       	mov    $0x4,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <read>:
SYSCALL(read)
 4a1:	b8 05 00 00 00       	mov    $0x5,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <write>:
SYSCALL(write)
 4a9:	b8 10 00 00 00       	mov    $0x10,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <close>:
SYSCALL(close)
 4b1:	b8 15 00 00 00       	mov    $0x15,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <kill>:
SYSCALL(kill)
 4b9:	b8 06 00 00 00       	mov    $0x6,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <exec>:
SYSCALL(exec)
 4c1:	b8 07 00 00 00       	mov    $0x7,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <open>:
SYSCALL(open)
 4c9:	b8 0f 00 00 00       	mov    $0xf,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <mknod>:
SYSCALL(mknod)
 4d1:	b8 11 00 00 00       	mov    $0x11,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <unlink>:
SYSCALL(unlink)
 4d9:	b8 12 00 00 00       	mov    $0x12,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <fstat>:
SYSCALL(fstat)
 4e1:	b8 08 00 00 00       	mov    $0x8,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <link>:
SYSCALL(link)
 4e9:	b8 13 00 00 00       	mov    $0x13,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <mkdir>:
SYSCALL(mkdir)
 4f1:	b8 14 00 00 00       	mov    $0x14,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <chdir>:
SYSCALL(chdir)
 4f9:	b8 09 00 00 00       	mov    $0x9,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <dup>:
SYSCALL(dup)
 501:	b8 0a 00 00 00       	mov    $0xa,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <getpid>:
SYSCALL(getpid)
 509:	b8 0b 00 00 00       	mov    $0xb,%eax
 50e:	cd 40                	int    $0x40
 510:	c3                   	ret    

00000511 <sbrk>:
SYSCALL(sbrk)
 511:	b8 0c 00 00 00       	mov    $0xc,%eax
 516:	cd 40                	int    $0x40
 518:	c3                   	ret    

00000519 <sleep>:
SYSCALL(sleep)
 519:	b8 0d 00 00 00       	mov    $0xd,%eax
 51e:	cd 40                	int    $0x40
 520:	c3                   	ret    

00000521 <uptime>:
SYSCALL(uptime)
 521:	b8 0e 00 00 00       	mov    $0xe,%eax
 526:	cd 40                	int    $0x40
 528:	c3                   	ret    

00000529 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 529:	55                   	push   %ebp
 52a:	89 e5                	mov    %esp,%ebp
 52c:	83 ec 1c             	sub    $0x1c,%esp
 52f:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 532:	6a 01                	push   $0x1
 534:	8d 55 f4             	lea    -0xc(%ebp),%edx
 537:	52                   	push   %edx
 538:	50                   	push   %eax
 539:	e8 6b ff ff ff       	call   4a9 <write>
}
 53e:	83 c4 10             	add    $0x10,%esp
 541:	c9                   	leave  
 542:	c3                   	ret    

00000543 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	57                   	push   %edi
 547:	56                   	push   %esi
 548:	53                   	push   %ebx
 549:	83 ec 2c             	sub    $0x2c,%esp
 54c:	89 45 d0             	mov    %eax,-0x30(%ebp)
 54f:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 551:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 555:	0f 95 c2             	setne  %dl
 558:	89 f0                	mov    %esi,%eax
 55a:	c1 e8 1f             	shr    $0x1f,%eax
 55d:	84 c2                	test   %al,%dl
 55f:	74 42                	je     5a3 <printint+0x60>
    neg = 1;
    x = -xx;
 561:	f7 de                	neg    %esi
    neg = 1;
 563:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 56a:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 56f:	89 f0                	mov    %esi,%eax
 571:	ba 00 00 00 00       	mov    $0x0,%edx
 576:	f7 f1                	div    %ecx
 578:	89 df                	mov    %ebx,%edi
 57a:	83 c3 01             	add    $0x1,%ebx
 57d:	0f b6 92 c8 08 00 00 	movzbl 0x8c8(%edx),%edx
 584:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 588:	89 f2                	mov    %esi,%edx
 58a:	89 c6                	mov    %eax,%esi
 58c:	39 d1                	cmp    %edx,%ecx
 58e:	76 df                	jbe    56f <printint+0x2c>
  if(neg)
 590:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 594:	74 2f                	je     5c5 <printint+0x82>
    buf[i++] = '-';
 596:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 59b:	8d 5f 02             	lea    0x2(%edi),%ebx
 59e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5a1:	eb 15                	jmp    5b8 <printint+0x75>
  neg = 0;
 5a3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 5aa:	eb be                	jmp    56a <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 5ac:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 5b1:	89 f0                	mov    %esi,%eax
 5b3:	e8 71 ff ff ff       	call   529 <putc>
  while(--i >= 0)
 5b8:	83 eb 01             	sub    $0x1,%ebx
 5bb:	79 ef                	jns    5ac <printint+0x69>
}
 5bd:	83 c4 2c             	add    $0x2c,%esp
 5c0:	5b                   	pop    %ebx
 5c1:	5e                   	pop    %esi
 5c2:	5f                   	pop    %edi
 5c3:	5d                   	pop    %ebp
 5c4:	c3                   	ret    
 5c5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 5c8:	eb ee                	jmp    5b8 <printint+0x75>

000005ca <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ca:	f3 0f 1e fb          	endbr32 
 5ce:	55                   	push   %ebp
 5cf:	89 e5                	mov    %esp,%ebp
 5d1:	57                   	push   %edi
 5d2:	56                   	push   %esi
 5d3:	53                   	push   %ebx
 5d4:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 5d7:	8d 45 10             	lea    0x10(%ebp),%eax
 5da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 5dd:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 5e2:	bb 00 00 00 00       	mov    $0x0,%ebx
 5e7:	eb 14                	jmp    5fd <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 5e9:	89 fa                	mov    %edi,%edx
 5eb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ee:	e8 36 ff ff ff       	call   529 <putc>
 5f3:	eb 05                	jmp    5fa <printf+0x30>
      }
    } else if(state == '%'){
 5f5:	83 fe 25             	cmp    $0x25,%esi
 5f8:	74 25                	je     61f <printf+0x55>
  for(i = 0; fmt[i]; i++){
 5fa:	83 c3 01             	add    $0x1,%ebx
 5fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 600:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 604:	84 c0                	test   %al,%al
 606:	0f 84 23 01 00 00    	je     72f <printf+0x165>
    c = fmt[i] & 0xff;
 60c:	0f be f8             	movsbl %al,%edi
 60f:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 612:	85 f6                	test   %esi,%esi
 614:	75 df                	jne    5f5 <printf+0x2b>
      if(c == '%'){
 616:	83 f8 25             	cmp    $0x25,%eax
 619:	75 ce                	jne    5e9 <printf+0x1f>
        state = '%';
 61b:	89 c6                	mov    %eax,%esi
 61d:	eb db                	jmp    5fa <printf+0x30>
      if(c == 'd'){
 61f:	83 f8 64             	cmp    $0x64,%eax
 622:	74 49                	je     66d <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 624:	83 f8 78             	cmp    $0x78,%eax
 627:	0f 94 c1             	sete   %cl
 62a:	83 f8 70             	cmp    $0x70,%eax
 62d:	0f 94 c2             	sete   %dl
 630:	08 d1                	or     %dl,%cl
 632:	75 63                	jne    697 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 634:	83 f8 73             	cmp    $0x73,%eax
 637:	0f 84 84 00 00 00    	je     6c1 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63d:	83 f8 63             	cmp    $0x63,%eax
 640:	0f 84 b7 00 00 00    	je     6fd <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 646:	83 f8 25             	cmp    $0x25,%eax
 649:	0f 84 cc 00 00 00    	je     71b <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 64f:	ba 25 00 00 00       	mov    $0x25,%edx
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	e8 cd fe ff ff       	call   529 <putc>
        putc(fd, c);
 65c:	89 fa                	mov    %edi,%edx
 65e:	8b 45 08             	mov    0x8(%ebp),%eax
 661:	e8 c3 fe ff ff       	call   529 <putc>
      }
      state = 0;
 666:	be 00 00 00 00       	mov    $0x0,%esi
 66b:	eb 8d                	jmp    5fa <printf+0x30>
        printint(fd, *ap, 10, 1);
 66d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 670:	8b 17                	mov    (%edi),%edx
 672:	83 ec 0c             	sub    $0xc,%esp
 675:	6a 01                	push   $0x1
 677:	b9 0a 00 00 00       	mov    $0xa,%ecx
 67c:	8b 45 08             	mov    0x8(%ebp),%eax
 67f:	e8 bf fe ff ff       	call   543 <printint>
        ap++;
 684:	83 c7 04             	add    $0x4,%edi
 687:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 68a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68d:	be 00 00 00 00       	mov    $0x0,%esi
 692:	e9 63 ff ff ff       	jmp    5fa <printf+0x30>
        printint(fd, *ap, 16, 0);
 697:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 69a:	8b 17                	mov    (%edi),%edx
 69c:	83 ec 0c             	sub    $0xc,%esp
 69f:	6a 00                	push   $0x0
 6a1:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a6:	8b 45 08             	mov    0x8(%ebp),%eax
 6a9:	e8 95 fe ff ff       	call   543 <printint>
        ap++;
 6ae:	83 c7 04             	add    $0x4,%edi
 6b1:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 6b4:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6b7:	be 00 00 00 00       	mov    $0x0,%esi
 6bc:	e9 39 ff ff ff       	jmp    5fa <printf+0x30>
        s = (char*)*ap;
 6c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c4:	8b 30                	mov    (%eax),%esi
        ap++;
 6c6:	83 c0 04             	add    $0x4,%eax
 6c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 6cc:	85 f6                	test   %esi,%esi
 6ce:	75 28                	jne    6f8 <printf+0x12e>
          s = "(null)";
 6d0:	be bf 08 00 00       	mov    $0x8bf,%esi
 6d5:	8b 7d 08             	mov    0x8(%ebp),%edi
 6d8:	eb 0d                	jmp    6e7 <printf+0x11d>
          putc(fd, *s);
 6da:	0f be d2             	movsbl %dl,%edx
 6dd:	89 f8                	mov    %edi,%eax
 6df:	e8 45 fe ff ff       	call   529 <putc>
          s++;
 6e4:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 6e7:	0f b6 16             	movzbl (%esi),%edx
 6ea:	84 d2                	test   %dl,%dl
 6ec:	75 ec                	jne    6da <printf+0x110>
      state = 0;
 6ee:	be 00 00 00 00       	mov    $0x0,%esi
 6f3:	e9 02 ff ff ff       	jmp    5fa <printf+0x30>
 6f8:	8b 7d 08             	mov    0x8(%ebp),%edi
 6fb:	eb ea                	jmp    6e7 <printf+0x11d>
        putc(fd, *ap);
 6fd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 700:	0f be 17             	movsbl (%edi),%edx
 703:	8b 45 08             	mov    0x8(%ebp),%eax
 706:	e8 1e fe ff ff       	call   529 <putc>
        ap++;
 70b:	83 c7 04             	add    $0x4,%edi
 70e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 711:	be 00 00 00 00       	mov    $0x0,%esi
 716:	e9 df fe ff ff       	jmp    5fa <printf+0x30>
        putc(fd, c);
 71b:	89 fa                	mov    %edi,%edx
 71d:	8b 45 08             	mov    0x8(%ebp),%eax
 720:	e8 04 fe ff ff       	call   529 <putc>
      state = 0;
 725:	be 00 00 00 00       	mov    $0x0,%esi
 72a:	e9 cb fe ff ff       	jmp    5fa <printf+0x30>
    }
  }
}
 72f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 732:	5b                   	pop    %ebx
 733:	5e                   	pop    %esi
 734:	5f                   	pop    %edi
 735:	5d                   	pop    %ebp
 736:	c3                   	ret    

00000737 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 737:	f3 0f 1e fb          	endbr32 
 73b:	55                   	push   %ebp
 73c:	89 e5                	mov    %esp,%ebp
 73e:	57                   	push   %edi
 73f:	56                   	push   %esi
 740:	53                   	push   %ebx
 741:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 744:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 747:	a1 60 0c 00 00       	mov    0xc60,%eax
 74c:	eb 02                	jmp    750 <free+0x19>
 74e:	89 d0                	mov    %edx,%eax
 750:	39 c8                	cmp    %ecx,%eax
 752:	73 04                	jae    758 <free+0x21>
 754:	39 08                	cmp    %ecx,(%eax)
 756:	77 12                	ja     76a <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 758:	8b 10                	mov    (%eax),%edx
 75a:	39 c2                	cmp    %eax,%edx
 75c:	77 f0                	ja     74e <free+0x17>
 75e:	39 c8                	cmp    %ecx,%eax
 760:	72 08                	jb     76a <free+0x33>
 762:	39 ca                	cmp    %ecx,%edx
 764:	77 04                	ja     76a <free+0x33>
 766:	89 d0                	mov    %edx,%eax
 768:	eb e6                	jmp    750 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 76a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 76d:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 770:	8b 10                	mov    (%eax),%edx
 772:	39 d7                	cmp    %edx,%edi
 774:	74 19                	je     78f <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 776:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 779:	8b 50 04             	mov    0x4(%eax),%edx
 77c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 77f:	39 ce                	cmp    %ecx,%esi
 781:	74 1b                	je     79e <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 783:	89 08                	mov    %ecx,(%eax)
  freep = p;
 785:	a3 60 0c 00 00       	mov    %eax,0xc60
}
 78a:	5b                   	pop    %ebx
 78b:	5e                   	pop    %esi
 78c:	5f                   	pop    %edi
 78d:	5d                   	pop    %ebp
 78e:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 78f:	03 72 04             	add    0x4(%edx),%esi
 792:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 795:	8b 10                	mov    (%eax),%edx
 797:	8b 12                	mov    (%edx),%edx
 799:	89 53 f8             	mov    %edx,-0x8(%ebx)
 79c:	eb db                	jmp    779 <free+0x42>
    p->s.size += bp->s.size;
 79e:	03 53 fc             	add    -0x4(%ebx),%edx
 7a1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a4:	8b 53 f8             	mov    -0x8(%ebx),%edx
 7a7:	89 10                	mov    %edx,(%eax)
 7a9:	eb da                	jmp    785 <free+0x4e>

000007ab <morecore>:

static Header*
morecore(uint nu)
{
 7ab:	55                   	push   %ebp
 7ac:	89 e5                	mov    %esp,%ebp
 7ae:	53                   	push   %ebx
 7af:	83 ec 04             	sub    $0x4,%esp
 7b2:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 7b4:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 7b9:	77 05                	ja     7c0 <morecore+0x15>
    nu = 4096;
 7bb:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 7c0:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7c7:	83 ec 0c             	sub    $0xc,%esp
 7ca:	50                   	push   %eax
 7cb:	e8 41 fd ff ff       	call   511 <sbrk>
  if(p == (char*)-1)
 7d0:	83 c4 10             	add    $0x10,%esp
 7d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 7d6:	74 1c                	je     7f4 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 7d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7db:	83 c0 08             	add    $0x8,%eax
 7de:	83 ec 0c             	sub    $0xc,%esp
 7e1:	50                   	push   %eax
 7e2:	e8 50 ff ff ff       	call   737 <free>
  return freep;
 7e7:	a1 60 0c 00 00       	mov    0xc60,%eax
 7ec:	83 c4 10             	add    $0x10,%esp
}
 7ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 7f2:	c9                   	leave  
 7f3:	c3                   	ret    
    return 0;
 7f4:	b8 00 00 00 00       	mov    $0x0,%eax
 7f9:	eb f4                	jmp    7ef <morecore+0x44>

000007fb <malloc>:

void*
malloc(uint nbytes)
{
 7fb:	f3 0f 1e fb          	endbr32 
 7ff:	55                   	push   %ebp
 800:	89 e5                	mov    %esp,%ebp
 802:	53                   	push   %ebx
 803:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 806:	8b 45 08             	mov    0x8(%ebp),%eax
 809:	8d 58 07             	lea    0x7(%eax),%ebx
 80c:	c1 eb 03             	shr    $0x3,%ebx
 80f:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 812:	8b 0d 60 0c 00 00    	mov    0xc60,%ecx
 818:	85 c9                	test   %ecx,%ecx
 81a:	74 04                	je     820 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81c:	8b 01                	mov    (%ecx),%eax
 81e:	eb 4b                	jmp    86b <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 820:	c7 05 60 0c 00 00 64 	movl   $0xc64,0xc60
 827:	0c 00 00 
 82a:	c7 05 64 0c 00 00 64 	movl   $0xc64,0xc64
 831:	0c 00 00 
    base.s.size = 0;
 834:	c7 05 68 0c 00 00 00 	movl   $0x0,0xc68
 83b:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 83e:	b9 64 0c 00 00       	mov    $0xc64,%ecx
 843:	eb d7                	jmp    81c <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 845:	74 1a                	je     861 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 847:	29 da                	sub    %ebx,%edx
 849:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 84c:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 84f:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 852:	89 0d 60 0c 00 00    	mov    %ecx,0xc60
      return (void*)(p + 1);
 858:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 85b:	83 c4 04             	add    $0x4,%esp
 85e:	5b                   	pop    %ebx
 85f:	5d                   	pop    %ebp
 860:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 861:	8b 10                	mov    (%eax),%edx
 863:	89 11                	mov    %edx,(%ecx)
 865:	eb eb                	jmp    852 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 867:	89 c1                	mov    %eax,%ecx
 869:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 86b:	8b 50 04             	mov    0x4(%eax),%edx
 86e:	39 da                	cmp    %ebx,%edx
 870:	73 d3                	jae    845 <malloc+0x4a>
    if(p == freep)
 872:	39 05 60 0c 00 00    	cmp    %eax,0xc60
 878:	75 ed                	jne    867 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 87a:	89 d8                	mov    %ebx,%eax
 87c:	e8 2a ff ff ff       	call   7ab <morecore>
 881:	85 c0                	test   %eax,%eax
 883:	75 e2                	jne    867 <malloc+0x6c>
 885:	eb d4                	jmp    85b <malloc+0x60>
