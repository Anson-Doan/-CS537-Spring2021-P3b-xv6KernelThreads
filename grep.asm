
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	57                   	push   %edi
   8:	56                   	push   %esi
   9:	53                   	push   %ebx
   a:	83 ec 0c             	sub    $0xc,%esp
   d:	8b 75 08             	mov    0x8(%ebp),%esi
  10:	8b 7d 0c             	mov    0xc(%ebp),%edi
  13:	8b 5d 10             	mov    0x10(%ebp),%ebx
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
  16:	83 ec 08             	sub    $0x8,%esp
  19:	53                   	push   %ebx
  1a:	57                   	push   %edi
  1b:	e8 2c 00 00 00       	call   4c <matchhere>
  20:	83 c4 10             	add    $0x10,%esp
  23:	85 c0                	test   %eax,%eax
  25:	75 18                	jne    3f <matchstar+0x3f>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
  27:	0f b6 13             	movzbl (%ebx),%edx
  2a:	84 d2                	test   %dl,%dl
  2c:	74 16                	je     44 <matchstar+0x44>
  2e:	83 c3 01             	add    $0x1,%ebx
  31:	0f be d2             	movsbl %dl,%edx
  34:	39 f2                	cmp    %esi,%edx
  36:	74 de                	je     16 <matchstar+0x16>
  38:	83 fe 2e             	cmp    $0x2e,%esi
  3b:	74 d9                	je     16 <matchstar+0x16>
  3d:	eb 05                	jmp    44 <matchstar+0x44>
      return 1;
  3f:	b8 01 00 00 00       	mov    $0x1,%eax
  return 0;
}
  44:	8d 65 f4             	lea    -0xc(%ebp),%esp
  47:	5b                   	pop    %ebx
  48:	5e                   	pop    %esi
  49:	5f                   	pop    %edi
  4a:	5d                   	pop    %ebp
  4b:	c3                   	ret    

0000004c <matchhere>:
{
  4c:	f3 0f 1e fb          	endbr32 
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	83 ec 08             	sub    $0x8,%esp
  56:	8b 55 08             	mov    0x8(%ebp),%edx
  if(re[0] == '\0')
  59:	0f b6 02             	movzbl (%edx),%eax
  5c:	84 c0                	test   %al,%al
  5e:	74 68                	je     c8 <matchhere+0x7c>
  if(re[1] == '*')
  60:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
  64:	80 f9 2a             	cmp    $0x2a,%cl
  67:	74 1d                	je     86 <matchhere+0x3a>
  if(re[0] == '$' && re[1] == '\0')
  69:	3c 24                	cmp    $0x24,%al
  6b:	74 31                	je     9e <matchhere+0x52>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
  6d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  70:	0f b6 09             	movzbl (%ecx),%ecx
  73:	84 c9                	test   %cl,%cl
  75:	74 58                	je     cf <matchhere+0x83>
  77:	3c 2e                	cmp    $0x2e,%al
  79:	74 35                	je     b0 <matchhere+0x64>
  7b:	38 c8                	cmp    %cl,%al
  7d:	74 31                	je     b0 <matchhere+0x64>
  return 0;
  7f:	b8 00 00 00 00       	mov    $0x0,%eax
  84:	eb 47                	jmp    cd <matchhere+0x81>
    return matchstar(re[0], re+2, text);
  86:	83 ec 04             	sub    $0x4,%esp
  89:	ff 75 0c             	pushl  0xc(%ebp)
  8c:	83 c2 02             	add    $0x2,%edx
  8f:	52                   	push   %edx
  90:	0f be c0             	movsbl %al,%eax
  93:	50                   	push   %eax
  94:	e8 67 ff ff ff       	call   0 <matchstar>
  99:	83 c4 10             	add    $0x10,%esp
  9c:	eb 2f                	jmp    cd <matchhere+0x81>
  if(re[0] == '$' && re[1] == '\0')
  9e:	84 c9                	test   %cl,%cl
  a0:	75 cb                	jne    6d <matchhere+0x21>
    return *text == '\0';
  a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  a5:	80 38 00             	cmpb   $0x0,(%eax)
  a8:	0f 94 c0             	sete   %al
  ab:	0f b6 c0             	movzbl %al,%eax
  ae:	eb 1d                	jmp    cd <matchhere+0x81>
    return matchhere(re+1, text+1);
  b0:	83 ec 08             	sub    $0x8,%esp
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	83 c0 01             	add    $0x1,%eax
  b9:	50                   	push   %eax
  ba:	83 c2 01             	add    $0x1,%edx
  bd:	52                   	push   %edx
  be:	e8 89 ff ff ff       	call   4c <matchhere>
  c3:	83 c4 10             	add    $0x10,%esp
  c6:	eb 05                	jmp    cd <matchhere+0x81>
    return 1;
  c8:	b8 01 00 00 00       	mov    $0x1,%eax
}
  cd:	c9                   	leave  
  ce:	c3                   	ret    
  return 0;
  cf:	b8 00 00 00 00       	mov    $0x0,%eax
  d4:	eb f7                	jmp    cd <matchhere+0x81>

000000d6 <match>:
{
  d6:	f3 0f 1e fb          	endbr32 
  da:	55                   	push   %ebp
  db:	89 e5                	mov    %esp,%ebp
  dd:	56                   	push   %esi
  de:	53                   	push   %ebx
  df:	8b 75 08             	mov    0x8(%ebp),%esi
  e2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
  e5:	80 3e 5e             	cmpb   $0x5e,(%esi)
  e8:	75 14                	jne    fe <match+0x28>
    return matchhere(re+1, text);
  ea:	83 ec 08             	sub    $0x8,%esp
  ed:	53                   	push   %ebx
  ee:	83 c6 01             	add    $0x1,%esi
  f1:	56                   	push   %esi
  f2:	e8 55 ff ff ff       	call   4c <matchhere>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	eb 22                	jmp    11e <match+0x48>
  }while(*text++ != '\0');
  fc:	89 d3                	mov    %edx,%ebx
    if(matchhere(re, text))
  fe:	83 ec 08             	sub    $0x8,%esp
 101:	53                   	push   %ebx
 102:	56                   	push   %esi
 103:	e8 44 ff ff ff       	call   4c <matchhere>
 108:	83 c4 10             	add    $0x10,%esp
 10b:	85 c0                	test   %eax,%eax
 10d:	75 0a                	jne    119 <match+0x43>
  }while(*text++ != '\0');
 10f:	8d 53 01             	lea    0x1(%ebx),%edx
 112:	80 3b 00             	cmpb   $0x0,(%ebx)
 115:	75 e5                	jne    fc <match+0x26>
 117:	eb 05                	jmp    11e <match+0x48>
      return 1;
 119:	b8 01 00 00 00       	mov    $0x1,%eax
}
 11e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 121:	5b                   	pop    %ebx
 122:	5e                   	pop    %esi
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <grep>:
{
 125:	f3 0f 1e fb          	endbr32 
 129:	55                   	push   %ebp
 12a:	89 e5                	mov    %esp,%ebp
 12c:	57                   	push   %edi
 12d:	56                   	push   %esi
 12e:	53                   	push   %ebx
 12f:	83 ec 1c             	sub    $0x1c,%esp
 132:	8b 7d 08             	mov    0x8(%ebp),%edi
  m = 0;
 135:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 13c:	eb 53                	jmp    191 <grep+0x6c>
        *q = '\n';
 13e:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 141:	8d 43 01             	lea    0x1(%ebx),%eax
 144:	83 ec 04             	sub    $0x4,%esp
 147:	29 f0                	sub    %esi,%eax
 149:	50                   	push   %eax
 14a:	56                   	push   %esi
 14b:	6a 01                	push   $0x1
 14d:	e8 9e 04 00 00       	call   5f0 <write>
 152:	83 c4 10             	add    $0x10,%esp
      p = q+1;
 155:	8d 73 01             	lea    0x1(%ebx),%esi
    while((q = strchr(p, '\n')) != 0){
 158:	83 ec 08             	sub    $0x8,%esp
 15b:	6a 0a                	push   $0xa
 15d:	56                   	push   %esi
 15e:	e8 d9 01 00 00       	call   33c <strchr>
 163:	89 c3                	mov    %eax,%ebx
 165:	83 c4 10             	add    $0x10,%esp
 168:	85 c0                	test   %eax,%eax
 16a:	74 16                	je     182 <grep+0x5d>
      *q = 0;
 16c:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 16f:	83 ec 08             	sub    $0x8,%esp
 172:	56                   	push   %esi
 173:	57                   	push   %edi
 174:	e8 5d ff ff ff       	call   d6 <match>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	85 c0                	test   %eax,%eax
 17e:	74 d5                	je     155 <grep+0x30>
 180:	eb bc                	jmp    13e <grep+0x19>
    if(p == buf)
 182:	81 fe 40 0e 00 00    	cmp    $0xe40,%esi
 188:	74 5f                	je     1e9 <grep+0xc4>
    if(m > 0){
 18a:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 18d:	85 c9                	test   %ecx,%ecx
 18f:	7f 38                	jg     1c9 <grep+0xa4>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 191:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 196:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 199:	29 c8                	sub    %ecx,%eax
 19b:	83 ec 04             	sub    $0x4,%esp
 19e:	50                   	push   %eax
 19f:	8d 81 40 0e 00 00    	lea    0xe40(%ecx),%eax
 1a5:	50                   	push   %eax
 1a6:	ff 75 0c             	pushl  0xc(%ebp)
 1a9:	e8 3a 04 00 00       	call   5e8 <read>
 1ae:	83 c4 10             	add    $0x10,%esp
 1b1:	85 c0                	test   %eax,%eax
 1b3:	7e 3d                	jle    1f2 <grep+0xcd>
    m += n;
 1b5:	01 45 e4             	add    %eax,-0x1c(%ebp)
 1b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
 1bb:	c6 82 40 0e 00 00 00 	movb   $0x0,0xe40(%edx)
    p = buf;
 1c2:	be 40 0e 00 00       	mov    $0xe40,%esi
    while((q = strchr(p, '\n')) != 0){
 1c7:	eb 8f                	jmp    158 <grep+0x33>
      m -= p - buf;
 1c9:	89 f0                	mov    %esi,%eax
 1cb:	2d 40 0e 00 00       	sub    $0xe40,%eax
 1d0:	29 c1                	sub    %eax,%ecx
 1d2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
      memmove(buf, p, m);
 1d5:	83 ec 04             	sub    $0x4,%esp
 1d8:	51                   	push   %ecx
 1d9:	56                   	push   %esi
 1da:	68 40 0e 00 00       	push   $0xe40
 1df:	e8 52 02 00 00       	call   436 <memmove>
 1e4:	83 c4 10             	add    $0x10,%esp
 1e7:	eb a8                	jmp    191 <grep+0x6c>
      m = 0;
 1e9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1f0:	eb 9f                	jmp    191 <grep+0x6c>
}
 1f2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f5:	5b                   	pop    %ebx
 1f6:	5e                   	pop    %esi
 1f7:	5f                   	pop    %edi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <main>:
{
 1fa:	f3 0f 1e fb          	endbr32 
 1fe:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 202:	83 e4 f0             	and    $0xfffffff0,%esp
 205:	ff 71 fc             	pushl  -0x4(%ecx)
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	57                   	push   %edi
 20c:	56                   	push   %esi
 20d:	53                   	push   %ebx
 20e:	51                   	push   %ecx
 20f:	83 ec 18             	sub    $0x18,%esp
 212:	8b 01                	mov    (%ecx),%eax
 214:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 217:	8b 51 04             	mov    0x4(%ecx),%edx
 21a:	89 55 e0             	mov    %edx,-0x20(%ebp)
  if(argc <= 1){
 21d:	83 f8 01             	cmp    $0x1,%eax
 220:	7e 50                	jle    272 <main+0x78>
  pattern = argv[1];
 222:	8b 45 e0             	mov    -0x20(%ebp),%eax
 225:	8b 40 04             	mov    0x4(%eax),%eax
 228:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(argc <= 2){
 22b:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 22f:	7e 55                	jle    286 <main+0x8c>
  for(i = 2; i < argc; i++){
 231:	be 02 00 00 00       	mov    $0x2,%esi
 236:	3b 75 e4             	cmp    -0x1c(%ebp),%esi
 239:	7d 71                	jge    2ac <main+0xb2>
    if((fd = open(argv[i], 0)) < 0){
 23b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23e:	8d 3c b0             	lea    (%eax,%esi,4),%edi
 241:	83 ec 08             	sub    $0x8,%esp
 244:	6a 00                	push   $0x0
 246:	ff 37                	pushl  (%edi)
 248:	e8 c3 03 00 00       	call   610 <open>
 24d:	89 c3                	mov    %eax,%ebx
 24f:	83 c4 10             	add    $0x10,%esp
 252:	85 c0                	test   %eax,%eax
 254:	78 40                	js     296 <main+0x9c>
    grep(pattern, fd);
 256:	83 ec 08             	sub    $0x8,%esp
 259:	50                   	push   %eax
 25a:	ff 75 dc             	pushl  -0x24(%ebp)
 25d:	e8 c3 fe ff ff       	call   125 <grep>
    close(fd);
 262:	89 1c 24             	mov    %ebx,(%esp)
 265:	e8 8e 03 00 00       	call   5f8 <close>
  for(i = 2; i < argc; i++){
 26a:	83 c6 01             	add    $0x1,%esi
 26d:	83 c4 10             	add    $0x10,%esp
 270:	eb c4                	jmp    236 <main+0x3c>
    printf(2, "usage: grep pattern [file ...]\n");
 272:	83 ec 08             	sub    $0x8,%esp
 275:	68 d0 09 00 00       	push   $0x9d0
 27a:	6a 02                	push   $0x2
 27c:	e8 90 04 00 00       	call   711 <printf>
    exit();
 281:	e8 42 03 00 00       	call   5c8 <exit>
    grep(pattern, 0);
 286:	83 ec 08             	sub    $0x8,%esp
 289:	6a 00                	push   $0x0
 28b:	50                   	push   %eax
 28c:	e8 94 fe ff ff       	call   125 <grep>
    exit();
 291:	e8 32 03 00 00       	call   5c8 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
 296:	83 ec 04             	sub    $0x4,%esp
 299:	ff 37                	pushl  (%edi)
 29b:	68 f0 09 00 00       	push   $0x9f0
 2a0:	6a 01                	push   $0x1
 2a2:	e8 6a 04 00 00       	call   711 <printf>
      exit();
 2a7:	e8 1c 03 00 00       	call   5c8 <exit>
  exit();
 2ac:	e8 17 03 00 00       	call   5c8 <exit>

000002b1 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 2b1:	f3 0f 1e fb          	endbr32 
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	56                   	push   %esi
 2b9:	53                   	push   %ebx
 2ba:	8b 75 08             	mov    0x8(%ebp),%esi
 2bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c0:	89 f0                	mov    %esi,%eax
 2c2:	89 d1                	mov    %edx,%ecx
 2c4:	83 c2 01             	add    $0x1,%edx
 2c7:	89 c3                	mov    %eax,%ebx
 2c9:	83 c0 01             	add    $0x1,%eax
 2cc:	0f b6 09             	movzbl (%ecx),%ecx
 2cf:	88 0b                	mov    %cl,(%ebx)
 2d1:	84 c9                	test   %cl,%cl
 2d3:	75 ed                	jne    2c2 <strcpy+0x11>
    ;
  return os;
}
 2d5:	89 f0                	mov    %esi,%eax
 2d7:	5b                   	pop    %ebx
 2d8:	5e                   	pop    %esi
 2d9:	5d                   	pop    %ebp
 2da:	c3                   	ret    

000002db <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2db:	f3 0f 1e fb          	endbr32 
 2df:	55                   	push   %ebp
 2e0:	89 e5                	mov    %esp,%ebp
 2e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e5:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 2e8:	0f b6 01             	movzbl (%ecx),%eax
 2eb:	84 c0                	test   %al,%al
 2ed:	74 0c                	je     2fb <strcmp+0x20>
 2ef:	3a 02                	cmp    (%edx),%al
 2f1:	75 08                	jne    2fb <strcmp+0x20>
    p++, q++;
 2f3:	83 c1 01             	add    $0x1,%ecx
 2f6:	83 c2 01             	add    $0x1,%edx
 2f9:	eb ed                	jmp    2e8 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 2fb:	0f b6 c0             	movzbl %al,%eax
 2fe:	0f b6 12             	movzbl (%edx),%edx
 301:	29 d0                	sub    %edx,%eax
}
 303:	5d                   	pop    %ebp
 304:	c3                   	ret    

00000305 <strlen>:

uint
strlen(const char *s)
{
 305:	f3 0f 1e fb          	endbr32 
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 30f:	b8 00 00 00 00       	mov    $0x0,%eax
 314:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 318:	74 05                	je     31f <strlen+0x1a>
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	eb f5                	jmp    314 <strlen+0xf>
    ;
  return n;
}
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    

00000321 <memset>:

void*
memset(void *dst, int c, uint n)
{
 321:	f3 0f 1e fb          	endbr32 
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	57                   	push   %edi
 329:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 32c:	89 d7                	mov    %edx,%edi
 32e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 331:	8b 45 0c             	mov    0xc(%ebp),%eax
 334:	fc                   	cld    
 335:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 337:	89 d0                	mov    %edx,%eax
 339:	5f                   	pop    %edi
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret    

0000033c <strchr>:

char*
strchr(const char *s, char c)
{
 33c:	f3 0f 1e fb          	endbr32 
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 34a:	0f b6 10             	movzbl (%eax),%edx
 34d:	84 d2                	test   %dl,%dl
 34f:	74 09                	je     35a <strchr+0x1e>
    if(*s == c)
 351:	38 ca                	cmp    %cl,%dl
 353:	74 0a                	je     35f <strchr+0x23>
  for(; *s; s++)
 355:	83 c0 01             	add    $0x1,%eax
 358:	eb f0                	jmp    34a <strchr+0xe>
      return (char*)s;
  return 0;
 35a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35f:	5d                   	pop    %ebp
 360:	c3                   	ret    

00000361 <gets>:

char*
gets(char *buf, int max)
{
 361:	f3 0f 1e fb          	endbr32 
 365:	55                   	push   %ebp
 366:	89 e5                	mov    %esp,%ebp
 368:	57                   	push   %edi
 369:	56                   	push   %esi
 36a:	53                   	push   %ebx
 36b:	83 ec 1c             	sub    $0x1c,%esp
 36e:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 371:	bb 00 00 00 00       	mov    $0x0,%ebx
 376:	89 de                	mov    %ebx,%esi
 378:	83 c3 01             	add    $0x1,%ebx
 37b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 37e:	7d 2e                	jge    3ae <gets+0x4d>
    cc = read(0, &c, 1);
 380:	83 ec 04             	sub    $0x4,%esp
 383:	6a 01                	push   $0x1
 385:	8d 45 e7             	lea    -0x19(%ebp),%eax
 388:	50                   	push   %eax
 389:	6a 00                	push   $0x0
 38b:	e8 58 02 00 00       	call   5e8 <read>
    if(cc < 1)
 390:	83 c4 10             	add    $0x10,%esp
 393:	85 c0                	test   %eax,%eax
 395:	7e 17                	jle    3ae <gets+0x4d>
      break;
    buf[i++] = c;
 397:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 39b:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 39e:	3c 0a                	cmp    $0xa,%al
 3a0:	0f 94 c2             	sete   %dl
 3a3:	3c 0d                	cmp    $0xd,%al
 3a5:	0f 94 c0             	sete   %al
 3a8:	08 c2                	or     %al,%dl
 3aa:	74 ca                	je     376 <gets+0x15>
    buf[i++] = c;
 3ac:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3ae:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3b2:	89 f8                	mov    %edi,%eax
 3b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3b7:	5b                   	pop    %ebx
 3b8:	5e                   	pop    %esi
 3b9:	5f                   	pop    %edi
 3ba:	5d                   	pop    %ebp
 3bb:	c3                   	ret    

000003bc <stat>:

int
stat(const char *n, struct stat *st)
{
 3bc:	f3 0f 1e fb          	endbr32 
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	56                   	push   %esi
 3c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3c5:	83 ec 08             	sub    $0x8,%esp
 3c8:	6a 00                	push   $0x0
 3ca:	ff 75 08             	pushl  0x8(%ebp)
 3cd:	e8 3e 02 00 00       	call   610 <open>
  if(fd < 0)
 3d2:	83 c4 10             	add    $0x10,%esp
 3d5:	85 c0                	test   %eax,%eax
 3d7:	78 24                	js     3fd <stat+0x41>
 3d9:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 3db:	83 ec 08             	sub    $0x8,%esp
 3de:	ff 75 0c             	pushl  0xc(%ebp)
 3e1:	50                   	push   %eax
 3e2:	e8 41 02 00 00       	call   628 <fstat>
 3e7:	89 c6                	mov    %eax,%esi
  close(fd);
 3e9:	89 1c 24             	mov    %ebx,(%esp)
 3ec:	e8 07 02 00 00       	call   5f8 <close>
  return r;
 3f1:	83 c4 10             	add    $0x10,%esp
}
 3f4:	89 f0                	mov    %esi,%eax
 3f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    
    return -1;
 3fd:	be ff ff ff ff       	mov    $0xffffffff,%esi
 402:	eb f0                	jmp    3f4 <stat+0x38>

00000404 <atoi>:

int
atoi(const char *s)
{
 404:	f3 0f 1e fb          	endbr32 
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	53                   	push   %ebx
 40c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 414:	0f b6 01             	movzbl (%ecx),%eax
 417:	8d 58 d0             	lea    -0x30(%eax),%ebx
 41a:	80 fb 09             	cmp    $0x9,%bl
 41d:	77 12                	ja     431 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 41f:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 422:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 425:	83 c1 01             	add    $0x1,%ecx
 428:	0f be c0             	movsbl %al,%eax
 42b:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 42f:	eb e3                	jmp    414 <atoi+0x10>
  return n;
}
 431:	89 d0                	mov    %edx,%eax
 433:	5b                   	pop    %ebx
 434:	5d                   	pop    %ebp
 435:	c3                   	ret    

00000436 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 436:	f3 0f 1e fb          	endbr32 
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	8b 75 08             	mov    0x8(%ebp),%esi
 442:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 445:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 448:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 44a:	8d 58 ff             	lea    -0x1(%eax),%ebx
 44d:	85 c0                	test   %eax,%eax
 44f:	7e 0f                	jle    460 <memmove+0x2a>
    *dst++ = *src++;
 451:	0f b6 01             	movzbl (%ecx),%eax
 454:	88 02                	mov    %al,(%edx)
 456:	8d 49 01             	lea    0x1(%ecx),%ecx
 459:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 45c:	89 d8                	mov    %ebx,%eax
 45e:	eb ea                	jmp    44a <memmove+0x14>
  return vdst;
}
 460:	89 f0                	mov    %esi,%eax
 462:	5b                   	pop    %ebx
 463:	5e                   	pop    %esi
 464:	5d                   	pop    %ebp
 465:	c3                   	ret    

00000466 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 466:	f3 0f 1e fb          	endbr32 
 46a:	55                   	push   %ebp
 46b:	89 e5                	mov    %esp,%ebp
 46d:	53                   	push   %ebx
 46e:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 471:	68 00 20 00 00       	push   $0x2000
 476:	e8 c7 04 00 00       	call   942 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 47b:	83 c4 10             	add    $0x10,%esp
 47e:	89 c2                	mov    %eax,%edx
 480:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 486:	74 22                	je     4aa <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 488:	b9 00 10 00 00       	mov    $0x1000,%ecx
 48d:	29 d1                	sub    %edx,%ecx
 48f:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 491:	ba 00 00 00 00       	mov    $0x0,%edx
 496:	83 fa 3f             	cmp    $0x3f,%edx
 499:	7f 13                	jg     4ae <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 49b:	83 3c 95 40 15 00 00 	cmpl   $0x1,0x1540(,%edx,4)
 4a2:	01 
 4a3:	75 09                	jne    4ae <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 4a5:	83 c2 01             	add    $0x1,%edx
 4a8:	eb ec                	jmp    496 <thread_create+0x30>
  void *user_stack = curr_ptr;
 4aa:	89 c1                	mov    %eax,%ecx
 4ac:	eb e3                	jmp    491 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 4ae:	83 3c 95 40 15 00 00 	cmpl   $0x1,0x1540(,%edx,4)
 4b5:	01 
 4b6:	74 34                	je     4ec <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 4b8:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 4bb:	c1 e3 02             	shl    $0x2,%ebx
 4be:	89 83 40 12 00 00    	mov    %eax,0x1240(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 4c4:	89 8b 44 12 00 00    	mov    %ecx,0x1244(%ebx)
  cell_full[i] = 1;
 4ca:	c7 04 95 40 15 00 00 	movl   $0x1,0x1540(,%edx,4)
 4d1:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 4d5:	ff 75 10             	pushl  0x10(%ebp)
 4d8:	ff 75 0c             	pushl  0xc(%ebp)
 4db:	ff 75 08             	pushl  0x8(%ebp)
 4de:	51                   	push   %ecx
 4df:	e8 dc 00 00 00       	call   5c0 <clone>
 4e4:	83 c4 10             	add    $0x10,%esp
}
 4e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4ea:	c9                   	leave  
 4eb:	c3                   	ret    
    return -1;
 4ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4f1:	eb f4                	jmp    4e7 <thread_create+0x81>

000004f3 <thread_join>:

int thread_join(){
 4f3:	f3 0f 1e fb          	endbr32 
 4f7:	55                   	push   %ebp
 4f8:	89 e5                	mov    %esp,%ebp
 4fa:	56                   	push   %esi
 4fb:	53                   	push   %ebx
 4fc:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 4ff:	8d 45 f4             	lea    -0xc(%ebp),%eax
 502:	50                   	push   %eax
 503:	e8 d0 00 00 00       	call   5d8 <join>
 508:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 50a:	83 c4 10             	add    $0x10,%esp
 50d:	bb 00 00 00 00       	mov    $0x0,%ebx
 512:	83 fb 3f             	cmp    $0x3f,%ebx
 515:	7f 14                	jg     52b <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 517:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 51a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 51d:	39 14 85 44 12 00 00 	cmp    %edx,0x1244(,%eax,4)
 524:	74 05                	je     52b <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 526:	83 c3 01             	add    $0x1,%ebx
 529:	eb e7                	jmp    512 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 52b:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 52e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 531:	39 0c 85 44 12 00 00 	cmp    %ecx,0x1244(,%eax,4)
 538:	75 26                	jne    560 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 53a:	83 ec 0c             	sub    $0xc,%esp
 53d:	ff 34 85 40 12 00 00 	pushl  0x1240(,%eax,4)
 544:	e8 35 03 00 00       	call   87e <free>
  cell_full[i] = 0;
 549:	c7 04 9d 40 15 00 00 	movl   $0x0,0x1540(,%ebx,4)
 550:	00 00 00 00 

  return out;
 554:	83 c4 10             	add    $0x10,%esp
}
 557:	89 f0                	mov    %esi,%eax
 559:	8d 65 f8             	lea    -0x8(%ebp),%esp
 55c:	5b                   	pop    %ebx
 55d:	5e                   	pop    %esi
 55e:	5d                   	pop    %ebp
 55f:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 560:	be ff ff ff ff       	mov    $0xffffffff,%esi
 565:	eb f0                	jmp    557 <thread_join+0x64>

00000567 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 567:	f3 0f 1e fb          	endbr32 
 56b:	55                   	push   %ebp
 56c:	89 e5                	mov    %esp,%ebp
 56e:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 571:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 577:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 57e:	5d                   	pop    %ebp
 57f:	c3                   	ret    

00000580 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 580:	f3 0f 1e fb          	endbr32 
 584:	55                   	push   %ebp
 585:	89 e5                	mov    %esp,%ebp
 587:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 58a:	b9 01 00 00 00       	mov    $0x1,%ecx
 58f:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 593:	b8 00 00 00 00       	mov    $0x0,%eax
 598:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 59d:	39 c1                	cmp    %eax,%ecx
 59f:	75 f2                	jne    593 <lock_acquire+0x13>
      ; // spin
    }
}
 5a1:	5d                   	pop    %ebp
 5a2:	c3                   	ret    

000005a3 <lock_release>:

void lock_release(lock_t *lock) {
 5a3:	f3 0f 1e fb          	endbr32 
 5a7:	55                   	push   %ebp
 5a8:	89 e5                	mov    %esp,%ebp
 5aa:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 5ad:	8b 42 04             	mov    0x4(%edx),%eax
 5b0:	83 c0 01             	add    $0x1,%eax
 5b3:	89 42 04             	mov    %eax,0x4(%edx)
}
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    

000005b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5b8:	b8 01 00 00 00       	mov    $0x1,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <clone>:
SYSCALL(clone)
 5c0:	b8 16 00 00 00       	mov    $0x16,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <exit>:
SYSCALL(exit)
 5c8:	b8 02 00 00 00       	mov    $0x2,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <wait>:
SYSCALL(wait)
 5d0:	b8 03 00 00 00       	mov    $0x3,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <join>:
SYSCALL(join)
 5d8:	b8 17 00 00 00       	mov    $0x17,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <pipe>:
SYSCALL(pipe)
 5e0:	b8 04 00 00 00       	mov    $0x4,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <read>:
SYSCALL(read)
 5e8:	b8 05 00 00 00       	mov    $0x5,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <write>:
SYSCALL(write)
 5f0:	b8 10 00 00 00       	mov    $0x10,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <close>:
SYSCALL(close)
 5f8:	b8 15 00 00 00       	mov    $0x15,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <kill>:
SYSCALL(kill)
 600:	b8 06 00 00 00       	mov    $0x6,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <exec>:
SYSCALL(exec)
 608:	b8 07 00 00 00       	mov    $0x7,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <open>:
SYSCALL(open)
 610:	b8 0f 00 00 00       	mov    $0xf,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <mknod>:
SYSCALL(mknod)
 618:	b8 11 00 00 00       	mov    $0x11,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <unlink>:
SYSCALL(unlink)
 620:	b8 12 00 00 00       	mov    $0x12,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <fstat>:
SYSCALL(fstat)
 628:	b8 08 00 00 00       	mov    $0x8,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <link>:
SYSCALL(link)
 630:	b8 13 00 00 00       	mov    $0x13,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <mkdir>:
SYSCALL(mkdir)
 638:	b8 14 00 00 00       	mov    $0x14,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <chdir>:
SYSCALL(chdir)
 640:	b8 09 00 00 00       	mov    $0x9,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <dup>:
SYSCALL(dup)
 648:	b8 0a 00 00 00       	mov    $0xa,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <getpid>:
SYSCALL(getpid)
 650:	b8 0b 00 00 00       	mov    $0xb,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <sbrk>:
SYSCALL(sbrk)
 658:	b8 0c 00 00 00       	mov    $0xc,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <sleep>:
SYSCALL(sleep)
 660:	b8 0d 00 00 00       	mov    $0xd,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <uptime>:
SYSCALL(uptime)
 668:	b8 0e 00 00 00       	mov    $0xe,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	83 ec 1c             	sub    $0x1c,%esp
 676:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 679:	6a 01                	push   $0x1
 67b:	8d 55 f4             	lea    -0xc(%ebp),%edx
 67e:	52                   	push   %edx
 67f:	50                   	push   %eax
 680:	e8 6b ff ff ff       	call   5f0 <write>
}
 685:	83 c4 10             	add    $0x10,%esp
 688:	c9                   	leave  
 689:	c3                   	ret    

0000068a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68a:	55                   	push   %ebp
 68b:	89 e5                	mov    %esp,%ebp
 68d:	57                   	push   %edi
 68e:	56                   	push   %esi
 68f:	53                   	push   %ebx
 690:	83 ec 2c             	sub    $0x2c,%esp
 693:	89 45 d0             	mov    %eax,-0x30(%ebp)
 696:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 698:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 69c:	0f 95 c2             	setne  %dl
 69f:	89 f0                	mov    %esi,%eax
 6a1:	c1 e8 1f             	shr    $0x1f,%eax
 6a4:	84 c2                	test   %al,%dl
 6a6:	74 42                	je     6ea <printint+0x60>
    neg = 1;
    x = -xx;
 6a8:	f7 de                	neg    %esi
    neg = 1;
 6aa:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6b1:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6b6:	89 f0                	mov    %esi,%eax
 6b8:	ba 00 00 00 00       	mov    $0x0,%edx
 6bd:	f7 f1                	div    %ecx
 6bf:	89 df                	mov    %ebx,%edi
 6c1:	83 c3 01             	add    $0x1,%ebx
 6c4:	0f b6 92 10 0a 00 00 	movzbl 0xa10(%edx),%edx
 6cb:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 6cf:	89 f2                	mov    %esi,%edx
 6d1:	89 c6                	mov    %eax,%esi
 6d3:	39 d1                	cmp    %edx,%ecx
 6d5:	76 df                	jbe    6b6 <printint+0x2c>
  if(neg)
 6d7:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 6db:	74 2f                	je     70c <printint+0x82>
    buf[i++] = '-';
 6dd:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 6e2:	8d 5f 02             	lea    0x2(%edi),%ebx
 6e5:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6e8:	eb 15                	jmp    6ff <printint+0x75>
  neg = 0;
 6ea:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 6f1:	eb be                	jmp    6b1 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 6f3:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 6f8:	89 f0                	mov    %esi,%eax
 6fa:	e8 71 ff ff ff       	call   670 <putc>
  while(--i >= 0)
 6ff:	83 eb 01             	sub    $0x1,%ebx
 702:	79 ef                	jns    6f3 <printint+0x69>
}
 704:	83 c4 2c             	add    $0x2c,%esp
 707:	5b                   	pop    %ebx
 708:	5e                   	pop    %esi
 709:	5f                   	pop    %edi
 70a:	5d                   	pop    %ebp
 70b:	c3                   	ret    
 70c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 70f:	eb ee                	jmp    6ff <printint+0x75>

00000711 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 711:	f3 0f 1e fb          	endbr32 
 715:	55                   	push   %ebp
 716:	89 e5                	mov    %esp,%ebp
 718:	57                   	push   %edi
 719:	56                   	push   %esi
 71a:	53                   	push   %ebx
 71b:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 71e:	8d 45 10             	lea    0x10(%ebp),%eax
 721:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 724:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 729:	bb 00 00 00 00       	mov    $0x0,%ebx
 72e:	eb 14                	jmp    744 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 730:	89 fa                	mov    %edi,%edx
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	e8 36 ff ff ff       	call   670 <putc>
 73a:	eb 05                	jmp    741 <printf+0x30>
      }
    } else if(state == '%'){
 73c:	83 fe 25             	cmp    $0x25,%esi
 73f:	74 25                	je     766 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 741:	83 c3 01             	add    $0x1,%ebx
 744:	8b 45 0c             	mov    0xc(%ebp),%eax
 747:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 74b:	84 c0                	test   %al,%al
 74d:	0f 84 23 01 00 00    	je     876 <printf+0x165>
    c = fmt[i] & 0xff;
 753:	0f be f8             	movsbl %al,%edi
 756:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 759:	85 f6                	test   %esi,%esi
 75b:	75 df                	jne    73c <printf+0x2b>
      if(c == '%'){
 75d:	83 f8 25             	cmp    $0x25,%eax
 760:	75 ce                	jne    730 <printf+0x1f>
        state = '%';
 762:	89 c6                	mov    %eax,%esi
 764:	eb db                	jmp    741 <printf+0x30>
      if(c == 'd'){
 766:	83 f8 64             	cmp    $0x64,%eax
 769:	74 49                	je     7b4 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 76b:	83 f8 78             	cmp    $0x78,%eax
 76e:	0f 94 c1             	sete   %cl
 771:	83 f8 70             	cmp    $0x70,%eax
 774:	0f 94 c2             	sete   %dl
 777:	08 d1                	or     %dl,%cl
 779:	75 63                	jne    7de <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 77b:	83 f8 73             	cmp    $0x73,%eax
 77e:	0f 84 84 00 00 00    	je     808 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 784:	83 f8 63             	cmp    $0x63,%eax
 787:	0f 84 b7 00 00 00    	je     844 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 78d:	83 f8 25             	cmp    $0x25,%eax
 790:	0f 84 cc 00 00 00    	je     862 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 796:	ba 25 00 00 00       	mov    $0x25,%edx
 79b:	8b 45 08             	mov    0x8(%ebp),%eax
 79e:	e8 cd fe ff ff       	call   670 <putc>
        putc(fd, c);
 7a3:	89 fa                	mov    %edi,%edx
 7a5:	8b 45 08             	mov    0x8(%ebp),%eax
 7a8:	e8 c3 fe ff ff       	call   670 <putc>
      }
      state = 0;
 7ad:	be 00 00 00 00       	mov    $0x0,%esi
 7b2:	eb 8d                	jmp    741 <printf+0x30>
        printint(fd, *ap, 10, 1);
 7b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7b7:	8b 17                	mov    (%edi),%edx
 7b9:	83 ec 0c             	sub    $0xc,%esp
 7bc:	6a 01                	push   $0x1
 7be:	b9 0a 00 00 00       	mov    $0xa,%ecx
 7c3:	8b 45 08             	mov    0x8(%ebp),%eax
 7c6:	e8 bf fe ff ff       	call   68a <printint>
        ap++;
 7cb:	83 c7 04             	add    $0x4,%edi
 7ce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7d1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7d4:	be 00 00 00 00       	mov    $0x0,%esi
 7d9:	e9 63 ff ff ff       	jmp    741 <printf+0x30>
        printint(fd, *ap, 16, 0);
 7de:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7e1:	8b 17                	mov    (%edi),%edx
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	6a 00                	push   $0x0
 7e8:	b9 10 00 00 00       	mov    $0x10,%ecx
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
 7f0:	e8 95 fe ff ff       	call   68a <printint>
        ap++;
 7f5:	83 c7 04             	add    $0x4,%edi
 7f8:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 7fb:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7fe:	be 00 00 00 00       	mov    $0x0,%esi
 803:	e9 39 ff ff ff       	jmp    741 <printf+0x30>
        s = (char*)*ap;
 808:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80b:	8b 30                	mov    (%eax),%esi
        ap++;
 80d:	83 c0 04             	add    $0x4,%eax
 810:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 813:	85 f6                	test   %esi,%esi
 815:	75 28                	jne    83f <printf+0x12e>
          s = "(null)";
 817:	be 06 0a 00 00       	mov    $0xa06,%esi
 81c:	8b 7d 08             	mov    0x8(%ebp),%edi
 81f:	eb 0d                	jmp    82e <printf+0x11d>
          putc(fd, *s);
 821:	0f be d2             	movsbl %dl,%edx
 824:	89 f8                	mov    %edi,%eax
 826:	e8 45 fe ff ff       	call   670 <putc>
          s++;
 82b:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 82e:	0f b6 16             	movzbl (%esi),%edx
 831:	84 d2                	test   %dl,%dl
 833:	75 ec                	jne    821 <printf+0x110>
      state = 0;
 835:	be 00 00 00 00       	mov    $0x0,%esi
 83a:	e9 02 ff ff ff       	jmp    741 <printf+0x30>
 83f:	8b 7d 08             	mov    0x8(%ebp),%edi
 842:	eb ea                	jmp    82e <printf+0x11d>
        putc(fd, *ap);
 844:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 847:	0f be 17             	movsbl (%edi),%edx
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	e8 1e fe ff ff       	call   670 <putc>
        ap++;
 852:	83 c7 04             	add    $0x4,%edi
 855:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 858:	be 00 00 00 00       	mov    $0x0,%esi
 85d:	e9 df fe ff ff       	jmp    741 <printf+0x30>
        putc(fd, c);
 862:	89 fa                	mov    %edi,%edx
 864:	8b 45 08             	mov    0x8(%ebp),%eax
 867:	e8 04 fe ff ff       	call   670 <putc>
      state = 0;
 86c:	be 00 00 00 00       	mov    $0x0,%esi
 871:	e9 cb fe ff ff       	jmp    741 <printf+0x30>
    }
  }
}
 876:	8d 65 f4             	lea    -0xc(%ebp),%esp
 879:	5b                   	pop    %ebx
 87a:	5e                   	pop    %esi
 87b:	5f                   	pop    %edi
 87c:	5d                   	pop    %ebp
 87d:	c3                   	ret    

0000087e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 87e:	f3 0f 1e fb          	endbr32 
 882:	55                   	push   %ebp
 883:	89 e5                	mov    %esp,%ebp
 885:	57                   	push   %edi
 886:	56                   	push   %esi
 887:	53                   	push   %ebx
 888:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 88b:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88e:	a1 20 0e 00 00       	mov    0xe20,%eax
 893:	eb 02                	jmp    897 <free+0x19>
 895:	89 d0                	mov    %edx,%eax
 897:	39 c8                	cmp    %ecx,%eax
 899:	73 04                	jae    89f <free+0x21>
 89b:	39 08                	cmp    %ecx,(%eax)
 89d:	77 12                	ja     8b1 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 89f:	8b 10                	mov    (%eax),%edx
 8a1:	39 c2                	cmp    %eax,%edx
 8a3:	77 f0                	ja     895 <free+0x17>
 8a5:	39 c8                	cmp    %ecx,%eax
 8a7:	72 08                	jb     8b1 <free+0x33>
 8a9:	39 ca                	cmp    %ecx,%edx
 8ab:	77 04                	ja     8b1 <free+0x33>
 8ad:	89 d0                	mov    %edx,%eax
 8af:	eb e6                	jmp    897 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b1:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8b4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8b7:	8b 10                	mov    (%eax),%edx
 8b9:	39 d7                	cmp    %edx,%edi
 8bb:	74 19                	je     8d6 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8bd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8c0:	8b 50 04             	mov    0x4(%eax),%edx
 8c3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8c6:	39 ce                	cmp    %ecx,%esi
 8c8:	74 1b                	je     8e5 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8ca:	89 08                	mov    %ecx,(%eax)
  freep = p;
 8cc:	a3 20 0e 00 00       	mov    %eax,0xe20
}
 8d1:	5b                   	pop    %ebx
 8d2:	5e                   	pop    %esi
 8d3:	5f                   	pop    %edi
 8d4:	5d                   	pop    %ebp
 8d5:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 8d6:	03 72 04             	add    0x4(%edx),%esi
 8d9:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 8dc:	8b 10                	mov    (%eax),%edx
 8de:	8b 12                	mov    (%edx),%edx
 8e0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 8e3:	eb db                	jmp    8c0 <free+0x42>
    p->s.size += bp->s.size;
 8e5:	03 53 fc             	add    -0x4(%ebx),%edx
 8e8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8eb:	8b 53 f8             	mov    -0x8(%ebx),%edx
 8ee:	89 10                	mov    %edx,(%eax)
 8f0:	eb da                	jmp    8cc <free+0x4e>

000008f2 <morecore>:

static Header*
morecore(uint nu)
{
 8f2:	55                   	push   %ebp
 8f3:	89 e5                	mov    %esp,%ebp
 8f5:	53                   	push   %ebx
 8f6:	83 ec 04             	sub    $0x4,%esp
 8f9:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 8fb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 900:	77 05                	ja     907 <morecore+0x15>
    nu = 4096;
 902:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 907:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 90e:	83 ec 0c             	sub    $0xc,%esp
 911:	50                   	push   %eax
 912:	e8 41 fd ff ff       	call   658 <sbrk>
  if(p == (char*)-1)
 917:	83 c4 10             	add    $0x10,%esp
 91a:	83 f8 ff             	cmp    $0xffffffff,%eax
 91d:	74 1c                	je     93b <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 91f:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 922:	83 c0 08             	add    $0x8,%eax
 925:	83 ec 0c             	sub    $0xc,%esp
 928:	50                   	push   %eax
 929:	e8 50 ff ff ff       	call   87e <free>
  return freep;
 92e:	a1 20 0e 00 00       	mov    0xe20,%eax
 933:	83 c4 10             	add    $0x10,%esp
}
 936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 939:	c9                   	leave  
 93a:	c3                   	ret    
    return 0;
 93b:	b8 00 00 00 00       	mov    $0x0,%eax
 940:	eb f4                	jmp    936 <morecore+0x44>

00000942 <malloc>:

void*
malloc(uint nbytes)
{
 942:	f3 0f 1e fb          	endbr32 
 946:	55                   	push   %ebp
 947:	89 e5                	mov    %esp,%ebp
 949:	53                   	push   %ebx
 94a:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 94d:	8b 45 08             	mov    0x8(%ebp),%eax
 950:	8d 58 07             	lea    0x7(%eax),%ebx
 953:	c1 eb 03             	shr    $0x3,%ebx
 956:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 959:	8b 0d 20 0e 00 00    	mov    0xe20,%ecx
 95f:	85 c9                	test   %ecx,%ecx
 961:	74 04                	je     967 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 963:	8b 01                	mov    (%ecx),%eax
 965:	eb 4b                	jmp    9b2 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 967:	c7 05 20 0e 00 00 24 	movl   $0xe24,0xe20
 96e:	0e 00 00 
 971:	c7 05 24 0e 00 00 24 	movl   $0xe24,0xe24
 978:	0e 00 00 
    base.s.size = 0;
 97b:	c7 05 28 0e 00 00 00 	movl   $0x0,0xe28
 982:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 985:	b9 24 0e 00 00       	mov    $0xe24,%ecx
 98a:	eb d7                	jmp    963 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 98c:	74 1a                	je     9a8 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 98e:	29 da                	sub    %ebx,%edx
 990:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 993:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 996:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 999:	89 0d 20 0e 00 00    	mov    %ecx,0xe20
      return (void*)(p + 1);
 99f:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9a2:	83 c4 04             	add    $0x4,%esp
 9a5:	5b                   	pop    %ebx
 9a6:	5d                   	pop    %ebp
 9a7:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9a8:	8b 10                	mov    (%eax),%edx
 9aa:	89 11                	mov    %edx,(%ecx)
 9ac:	eb eb                	jmp    999 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ae:	89 c1                	mov    %eax,%ecx
 9b0:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9b2:	8b 50 04             	mov    0x4(%eax),%edx
 9b5:	39 da                	cmp    %ebx,%edx
 9b7:	73 d3                	jae    98c <malloc+0x4a>
    if(p == freep)
 9b9:	39 05 20 0e 00 00    	cmp    %eax,0xe20
 9bf:	75 ed                	jne    9ae <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 9c1:	89 d8                	mov    %ebx,%eax
 9c3:	e8 2a ff ff ff       	call   8f2 <morecore>
 9c8:	85 c0                	test   %eax,%eax
 9ca:	75 e2                	jne    9ae <malloc+0x6c>
 9cc:	eb d4                	jmp    9a2 <malloc+0x60>
