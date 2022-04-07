
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   c:	83 ec 0c             	sub    $0xc,%esp
   f:	53                   	push   %ebx
  10:	e8 2f 03 00 00       	call   344 <strlen>
  15:	01 d8                	add    %ebx,%eax
  17:	83 c4 10             	add    $0x10,%esp
  1a:	39 d8                	cmp    %ebx,%eax
  1c:	72 0a                	jb     28 <fmtname+0x28>
  1e:	80 38 2f             	cmpb   $0x2f,(%eax)
  21:	74 05                	je     28 <fmtname+0x28>
  23:	83 e8 01             	sub    $0x1,%eax
  26:	eb f2                	jmp    1a <fmtname+0x1a>
    ;
  p++;
  28:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  2b:	83 ec 0c             	sub    $0xc,%esp
  2e:	53                   	push   %ebx
  2f:	e8 10 03 00 00       	call   344 <strlen>
  34:	83 c4 10             	add    $0x10,%esp
  37:	83 f8 0d             	cmp    $0xd,%eax
  3a:	76 09                	jbe    45 <fmtname+0x45>
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  return buf;
}
  3c:	89 d8                	mov    %ebx,%eax
  3e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  41:	5b                   	pop    %ebx
  42:	5e                   	pop    %esi
  43:	5d                   	pop    %ebp
  44:	c3                   	ret    
  memmove(buf, p, strlen(p));
  45:	83 ec 0c             	sub    $0xc,%esp
  48:	53                   	push   %ebx
  49:	e8 f6 02 00 00       	call   344 <strlen>
  4e:	83 c4 0c             	add    $0xc,%esp
  51:	50                   	push   %eax
  52:	53                   	push   %ebx
  53:	68 20 0e 00 00       	push   $0xe20
  58:	e8 18 04 00 00       	call   475 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  5d:	89 1c 24             	mov    %ebx,(%esp)
  60:	e8 df 02 00 00       	call   344 <strlen>
  65:	89 c6                	mov    %eax,%esi
  67:	89 1c 24             	mov    %ebx,(%esp)
  6a:	e8 d5 02 00 00       	call   344 <strlen>
  6f:	83 c4 0c             	add    $0xc,%esp
  72:	ba 0e 00 00 00       	mov    $0xe,%edx
  77:	29 f2                	sub    %esi,%edx
  79:	52                   	push   %edx
  7a:	6a 20                	push   $0x20
  7c:	05 20 0e 00 00       	add    $0xe20,%eax
  81:	50                   	push   %eax
  82:	e8 d9 02 00 00       	call   360 <memset>
  return buf;
  87:	83 c4 10             	add    $0x10,%esp
  8a:	bb 20 0e 00 00       	mov    $0xe20,%ebx
  8f:	eb ab                	jmp    3c <fmtname+0x3c>

00000091 <ls>:

void
ls(char *path)
{
  91:	f3 0f 1e fb          	endbr32 
  95:	55                   	push   %ebp
  96:	89 e5                	mov    %esp,%ebp
  98:	57                   	push   %edi
  99:	56                   	push   %esi
  9a:	53                   	push   %ebx
  9b:	81 ec 54 02 00 00    	sub    $0x254,%esp
  a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  a4:	6a 00                	push   $0x0
  a6:	53                   	push   %ebx
  a7:	e8 a3 05 00 00       	call   64f <open>
  ac:	83 c4 10             	add    $0x10,%esp
  af:	85 c0                	test   %eax,%eax
  b1:	0f 88 8c 00 00 00    	js     143 <ls+0xb2>
  b7:	89 c7                	mov    %eax,%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
  b9:	83 ec 08             	sub    $0x8,%esp
  bc:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  c2:	50                   	push   %eax
  c3:	57                   	push   %edi
  c4:	e8 9e 05 00 00       	call   667 <fstat>
  c9:	83 c4 10             	add    $0x10,%esp
  cc:	85 c0                	test   %eax,%eax
  ce:	0f 88 84 00 00 00    	js     158 <ls+0xc7>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
  d4:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  db:	0f bf f0             	movswl %ax,%esi
  de:	66 83 f8 01          	cmp    $0x1,%ax
  e2:	0f 84 8d 00 00 00    	je     175 <ls+0xe4>
  e8:	66 83 f8 02          	cmp    $0x2,%ax
  ec:	75 41                	jne    12f <ls+0x9e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
  ee:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
  f4:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  fa:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
 100:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 106:	83 ec 0c             	sub    $0xc,%esp
 109:	53                   	push   %ebx
 10a:	e8 f1 fe ff ff       	call   0 <fmtname>
 10f:	83 c4 08             	add    $0x8,%esp
 112:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 118:	ff b5 b0 fd ff ff    	pushl  -0x250(%ebp)
 11e:	56                   	push   %esi
 11f:	50                   	push   %eax
 120:	68 38 0a 00 00       	push   $0xa38
 125:	6a 01                	push   $0x1
 127:	e8 24 06 00 00       	call   750 <printf>
    break;
 12c:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 12f:	83 ec 0c             	sub    $0xc,%esp
 132:	57                   	push   %edi
 133:	e8 ff 04 00 00       	call   637 <close>
 138:	83 c4 10             	add    $0x10,%esp
}
 13b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13e:	5b                   	pop    %ebx
 13f:	5e                   	pop    %esi
 140:	5f                   	pop    %edi
 141:	5d                   	pop    %ebp
 142:	c3                   	ret    
    printf(2, "ls: cannot open %s\n", path);
 143:	83 ec 04             	sub    $0x4,%esp
 146:	53                   	push   %ebx
 147:	68 10 0a 00 00       	push   $0xa10
 14c:	6a 02                	push   $0x2
 14e:	e8 fd 05 00 00       	call   750 <printf>
    return;
 153:	83 c4 10             	add    $0x10,%esp
 156:	eb e3                	jmp    13b <ls+0xaa>
    printf(2, "ls: cannot stat %s\n", path);
 158:	83 ec 04             	sub    $0x4,%esp
 15b:	53                   	push   %ebx
 15c:	68 24 0a 00 00       	push   $0xa24
 161:	6a 02                	push   $0x2
 163:	e8 e8 05 00 00       	call   750 <printf>
    close(fd);
 168:	89 3c 24             	mov    %edi,(%esp)
 16b:	e8 c7 04 00 00       	call   637 <close>
    return;
 170:	83 c4 10             	add    $0x10,%esp
 173:	eb c6                	jmp    13b <ls+0xaa>
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 175:	83 ec 0c             	sub    $0xc,%esp
 178:	53                   	push   %ebx
 179:	e8 c6 01 00 00       	call   344 <strlen>
 17e:	83 c0 10             	add    $0x10,%eax
 181:	83 c4 10             	add    $0x10,%esp
 184:	3d 00 02 00 00       	cmp    $0x200,%eax
 189:	76 14                	jbe    19f <ls+0x10e>
      printf(1, "ls: path too long\n");
 18b:	83 ec 08             	sub    $0x8,%esp
 18e:	68 45 0a 00 00       	push   $0xa45
 193:	6a 01                	push   $0x1
 195:	e8 b6 05 00 00       	call   750 <printf>
      break;
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	eb 90                	jmp    12f <ls+0x9e>
    strcpy(buf, path);
 19f:	83 ec 08             	sub    $0x8,%esp
 1a2:	53                   	push   %ebx
 1a3:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
 1a9:	56                   	push   %esi
 1aa:	e8 41 01 00 00       	call   2f0 <strcpy>
    p = buf+strlen(buf);
 1af:	89 34 24             	mov    %esi,(%esp)
 1b2:	e8 8d 01 00 00       	call   344 <strlen>
 1b7:	01 c6                	add    %eax,%esi
    *p++ = '/';
 1b9:	8d 46 01             	lea    0x1(%esi),%eax
 1bc:	89 85 ac fd ff ff    	mov    %eax,-0x254(%ebp)
 1c2:	c6 06 2f             	movb   $0x2f,(%esi)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1c5:	83 c4 10             	add    $0x10,%esp
 1c8:	eb 19                	jmp    1e3 <ls+0x152>
        printf(1, "ls: cannot stat %s\n", buf);
 1ca:	83 ec 04             	sub    $0x4,%esp
 1cd:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1d3:	50                   	push   %eax
 1d4:	68 24 0a 00 00       	push   $0xa24
 1d9:	6a 01                	push   $0x1
 1db:	e8 70 05 00 00       	call   750 <printf>
        continue;
 1e0:	83 c4 10             	add    $0x10,%esp
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1e3:	83 ec 04             	sub    $0x4,%esp
 1e6:	6a 10                	push   $0x10
 1e8:	8d 85 d8 fd ff ff    	lea    -0x228(%ebp),%eax
 1ee:	50                   	push   %eax
 1ef:	57                   	push   %edi
 1f0:	e8 32 04 00 00       	call   627 <read>
 1f5:	83 c4 10             	add    $0x10,%esp
 1f8:	83 f8 10             	cmp    $0x10,%eax
 1fb:	0f 85 2e ff ff ff    	jne    12f <ls+0x9e>
      if(de.inum == 0)
 201:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 208:	00 
 209:	74 d8                	je     1e3 <ls+0x152>
      memmove(p, de.name, DIRSIZ);
 20b:	83 ec 04             	sub    $0x4,%esp
 20e:	6a 0e                	push   $0xe
 210:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 216:	50                   	push   %eax
 217:	ff b5 ac fd ff ff    	pushl  -0x254(%ebp)
 21d:	e8 53 02 00 00       	call   475 <memmove>
      p[DIRSIZ] = 0;
 222:	c6 46 0f 00          	movb   $0x0,0xf(%esi)
      if(stat(buf, &st) < 0){
 226:	83 c4 08             	add    $0x8,%esp
 229:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 22f:	50                   	push   %eax
 230:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 236:	50                   	push   %eax
 237:	e8 bf 01 00 00       	call   3fb <stat>
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	85 c0                	test   %eax,%eax
 241:	78 87                	js     1ca <ls+0x139>
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 243:	8b 9d d4 fd ff ff    	mov    -0x22c(%ebp),%ebx
 249:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
 24f:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 255:	0f b7 8d c4 fd ff ff 	movzwl -0x23c(%ebp),%ecx
 25c:	66 89 8d b0 fd ff ff 	mov    %cx,-0x250(%ebp)
 263:	83 ec 0c             	sub    $0xc,%esp
 266:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 26c:	50                   	push   %eax
 26d:	e8 8e fd ff ff       	call   0 <fmtname>
 272:	89 c2                	mov    %eax,%edx
 274:	83 c4 08             	add    $0x8,%esp
 277:	53                   	push   %ebx
 278:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 27e:	0f bf 85 b0 fd ff ff 	movswl -0x250(%ebp),%eax
 285:	50                   	push   %eax
 286:	52                   	push   %edx
 287:	68 38 0a 00 00       	push   $0xa38
 28c:	6a 01                	push   $0x1
 28e:	e8 bd 04 00 00       	call   750 <printf>
 293:	83 c4 20             	add    $0x20,%esp
 296:	e9 48 ff ff ff       	jmp    1e3 <ls+0x152>

0000029b <main>:

int
main(int argc, char *argv[])
{
 29b:	f3 0f 1e fb          	endbr32 
 29f:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2a3:	83 e4 f0             	and    $0xfffffff0,%esp
 2a6:	ff 71 fc             	pushl  -0x4(%ecx)
 2a9:	55                   	push   %ebp
 2aa:	89 e5                	mov    %esp,%ebp
 2ac:	57                   	push   %edi
 2ad:	56                   	push   %esi
 2ae:	53                   	push   %ebx
 2af:	51                   	push   %ecx
 2b0:	83 ec 08             	sub    $0x8,%esp
 2b3:	8b 31                	mov    (%ecx),%esi
 2b5:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
 2b8:	83 fe 01             	cmp    $0x1,%esi
 2bb:	7e 07                	jle    2c4 <main+0x29>
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 2bd:	bb 01 00 00 00       	mov    $0x1,%ebx
 2c2:	eb 23                	jmp    2e7 <main+0x4c>
    ls(".");
 2c4:	83 ec 0c             	sub    $0xc,%esp
 2c7:	68 58 0a 00 00       	push   $0xa58
 2cc:	e8 c0 fd ff ff       	call   91 <ls>
    exit();
 2d1:	e8 31 03 00 00       	call   607 <exit>
    ls(argv[i]);
 2d6:	83 ec 0c             	sub    $0xc,%esp
 2d9:	ff 34 9f             	pushl  (%edi,%ebx,4)
 2dc:	e8 b0 fd ff ff       	call   91 <ls>
  for(i=1; i<argc; i++)
 2e1:	83 c3 01             	add    $0x1,%ebx
 2e4:	83 c4 10             	add    $0x10,%esp
 2e7:	39 f3                	cmp    %esi,%ebx
 2e9:	7c eb                	jl     2d6 <main+0x3b>
  exit();
 2eb:	e8 17 03 00 00       	call   607 <exit>

000002f0 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 2f0:	f3 0f 1e fb          	endbr32 
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	56                   	push   %esi
 2f8:	53                   	push   %ebx
 2f9:	8b 75 08             	mov    0x8(%ebp),%esi
 2fc:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2ff:	89 f0                	mov    %esi,%eax
 301:	89 d1                	mov    %edx,%ecx
 303:	83 c2 01             	add    $0x1,%edx
 306:	89 c3                	mov    %eax,%ebx
 308:	83 c0 01             	add    $0x1,%eax
 30b:	0f b6 09             	movzbl (%ecx),%ecx
 30e:	88 0b                	mov    %cl,(%ebx)
 310:	84 c9                	test   %cl,%cl
 312:	75 ed                	jne    301 <strcpy+0x11>
    ;
  return os;
}
 314:	89 f0                	mov    %esi,%eax
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 31a:	f3 0f 1e fb          	endbr32 
 31e:	55                   	push   %ebp
 31f:	89 e5                	mov    %esp,%ebp
 321:	8b 4d 08             	mov    0x8(%ebp),%ecx
 324:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 327:	0f b6 01             	movzbl (%ecx),%eax
 32a:	84 c0                	test   %al,%al
 32c:	74 0c                	je     33a <strcmp+0x20>
 32e:	3a 02                	cmp    (%edx),%al
 330:	75 08                	jne    33a <strcmp+0x20>
    p++, q++;
 332:	83 c1 01             	add    $0x1,%ecx
 335:	83 c2 01             	add    $0x1,%edx
 338:	eb ed                	jmp    327 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 33a:	0f b6 c0             	movzbl %al,%eax
 33d:	0f b6 12             	movzbl (%edx),%edx
 340:	29 d0                	sub    %edx,%eax
}
 342:	5d                   	pop    %ebp
 343:	c3                   	ret    

00000344 <strlen>:

uint
strlen(const char *s)
{
 344:	f3 0f 1e fb          	endbr32 
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 34e:	b8 00 00 00 00       	mov    $0x0,%eax
 353:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 357:	74 05                	je     35e <strlen+0x1a>
 359:	83 c0 01             	add    $0x1,%eax
 35c:	eb f5                	jmp    353 <strlen+0xf>
    ;
  return n;
}
 35e:	5d                   	pop    %ebp
 35f:	c3                   	ret    

00000360 <memset>:

void*
memset(void *dst, int c, uint n)
{
 360:	f3 0f 1e fb          	endbr32 
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 36b:	89 d7                	mov    %edx,%edi
 36d:	8b 4d 10             	mov    0x10(%ebp),%ecx
 370:	8b 45 0c             	mov    0xc(%ebp),%eax
 373:	fc                   	cld    
 374:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 376:	89 d0                	mov    %edx,%eax
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    

0000037b <strchr>:

char*
strchr(const char *s, char c)
{
 37b:	f3 0f 1e fb          	endbr32 
 37f:	55                   	push   %ebp
 380:	89 e5                	mov    %esp,%ebp
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 389:	0f b6 10             	movzbl (%eax),%edx
 38c:	84 d2                	test   %dl,%dl
 38e:	74 09                	je     399 <strchr+0x1e>
    if(*s == c)
 390:	38 ca                	cmp    %cl,%dl
 392:	74 0a                	je     39e <strchr+0x23>
  for(; *s; s++)
 394:	83 c0 01             	add    $0x1,%eax
 397:	eb f0                	jmp    389 <strchr+0xe>
      return (char*)s;
  return 0;
 399:	b8 00 00 00 00       	mov    $0x0,%eax
}
 39e:	5d                   	pop    %ebp
 39f:	c3                   	ret    

000003a0 <gets>:

char*
gets(char *buf, int max)
{
 3a0:	f3 0f 1e fb          	endbr32 
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	57                   	push   %edi
 3a8:	56                   	push   %esi
 3a9:	53                   	push   %ebx
 3aa:	83 ec 1c             	sub    $0x1c,%esp
 3ad:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3b0:	bb 00 00 00 00       	mov    $0x0,%ebx
 3b5:	89 de                	mov    %ebx,%esi
 3b7:	83 c3 01             	add    $0x1,%ebx
 3ba:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3bd:	7d 2e                	jge    3ed <gets+0x4d>
    cc = read(0, &c, 1);
 3bf:	83 ec 04             	sub    $0x4,%esp
 3c2:	6a 01                	push   $0x1
 3c4:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3c7:	50                   	push   %eax
 3c8:	6a 00                	push   $0x0
 3ca:	e8 58 02 00 00       	call   627 <read>
    if(cc < 1)
 3cf:	83 c4 10             	add    $0x10,%esp
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 17                	jle    3ed <gets+0x4d>
      break;
    buf[i++] = c;
 3d6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3da:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 3dd:	3c 0a                	cmp    $0xa,%al
 3df:	0f 94 c2             	sete   %dl
 3e2:	3c 0d                	cmp    $0xd,%al
 3e4:	0f 94 c0             	sete   %al
 3e7:	08 c2                	or     %al,%dl
 3e9:	74 ca                	je     3b5 <gets+0x15>
    buf[i++] = c;
 3eb:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 3ed:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 3f1:	89 f8                	mov    %edi,%eax
 3f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f6:	5b                   	pop    %ebx
 3f7:	5e                   	pop    %esi
 3f8:	5f                   	pop    %edi
 3f9:	5d                   	pop    %ebp
 3fa:	c3                   	ret    

000003fb <stat>:

int
stat(const char *n, struct stat *st)
{
 3fb:	f3 0f 1e fb          	endbr32 
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	56                   	push   %esi
 403:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 404:	83 ec 08             	sub    $0x8,%esp
 407:	6a 00                	push   $0x0
 409:	ff 75 08             	pushl  0x8(%ebp)
 40c:	e8 3e 02 00 00       	call   64f <open>
  if(fd < 0)
 411:	83 c4 10             	add    $0x10,%esp
 414:	85 c0                	test   %eax,%eax
 416:	78 24                	js     43c <stat+0x41>
 418:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 41a:	83 ec 08             	sub    $0x8,%esp
 41d:	ff 75 0c             	pushl  0xc(%ebp)
 420:	50                   	push   %eax
 421:	e8 41 02 00 00       	call   667 <fstat>
 426:	89 c6                	mov    %eax,%esi
  close(fd);
 428:	89 1c 24             	mov    %ebx,(%esp)
 42b:	e8 07 02 00 00       	call   637 <close>
  return r;
 430:	83 c4 10             	add    $0x10,%esp
}
 433:	89 f0                	mov    %esi,%eax
 435:	8d 65 f8             	lea    -0x8(%ebp),%esp
 438:	5b                   	pop    %ebx
 439:	5e                   	pop    %esi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
    return -1;
 43c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 441:	eb f0                	jmp    433 <stat+0x38>

00000443 <atoi>:

int
atoi(const char *s)
{
 443:	f3 0f 1e fb          	endbr32 
 447:	55                   	push   %ebp
 448:	89 e5                	mov    %esp,%ebp
 44a:	53                   	push   %ebx
 44b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 44e:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 453:	0f b6 01             	movzbl (%ecx),%eax
 456:	8d 58 d0             	lea    -0x30(%eax),%ebx
 459:	80 fb 09             	cmp    $0x9,%bl
 45c:	77 12                	ja     470 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 45e:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 461:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 464:	83 c1 01             	add    $0x1,%ecx
 467:	0f be c0             	movsbl %al,%eax
 46a:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 46e:	eb e3                	jmp    453 <atoi+0x10>
  return n;
}
 470:	89 d0                	mov    %edx,%eax
 472:	5b                   	pop    %ebx
 473:	5d                   	pop    %ebp
 474:	c3                   	ret    

00000475 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 475:	f3 0f 1e fb          	endbr32 
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	56                   	push   %esi
 47d:	53                   	push   %ebx
 47e:	8b 75 08             	mov    0x8(%ebp),%esi
 481:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 484:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 487:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 489:	8d 58 ff             	lea    -0x1(%eax),%ebx
 48c:	85 c0                	test   %eax,%eax
 48e:	7e 0f                	jle    49f <memmove+0x2a>
    *dst++ = *src++;
 490:	0f b6 01             	movzbl (%ecx),%eax
 493:	88 02                	mov    %al,(%edx)
 495:	8d 49 01             	lea    0x1(%ecx),%ecx
 498:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 49b:	89 d8                	mov    %ebx,%eax
 49d:	eb ea                	jmp    489 <memmove+0x14>
  return vdst;
}
 49f:	89 f0                	mov    %esi,%eax
 4a1:	5b                   	pop    %ebx
 4a2:	5e                   	pop    %esi
 4a3:	5d                   	pop    %ebp
 4a4:	c3                   	ret    

000004a5 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 4a5:	f3 0f 1e fb          	endbr32 
 4a9:	55                   	push   %ebp
 4aa:	89 e5                	mov    %esp,%ebp
 4ac:	53                   	push   %ebx
 4ad:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 4b0:	68 00 20 00 00       	push   $0x2000
 4b5:	e8 c7 04 00 00       	call   981 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 4ba:	83 c4 10             	add    $0x10,%esp
 4bd:	89 c2                	mov    %eax,%edx
 4bf:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 4c5:	74 22                	je     4e9 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 4c7:	b9 00 10 00 00       	mov    $0x1000,%ecx
 4cc:	29 d1                	sub    %edx,%ecx
 4ce:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 4d0:	ba 00 00 00 00       	mov    $0x0,%edx
 4d5:	83 fa 3f             	cmp    $0x3f,%edx
 4d8:	7f 13                	jg     4ed <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 4da:	83 3c 95 40 11 00 00 	cmpl   $0x1,0x1140(,%edx,4)
 4e1:	01 
 4e2:	75 09                	jne    4ed <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 4e4:	83 c2 01             	add    $0x1,%edx
 4e7:	eb ec                	jmp    4d5 <thread_create+0x30>
  void *user_stack = curr_ptr;
 4e9:	89 c1                	mov    %eax,%ecx
 4eb:	eb e3                	jmp    4d0 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 4ed:	83 3c 95 40 11 00 00 	cmpl   $0x1,0x1140(,%edx,4)
 4f4:	01 
 4f5:	74 34                	je     52b <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 4f7:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 4fa:	c1 e3 02             	shl    $0x2,%ebx
 4fd:	89 83 40 0e 00 00    	mov    %eax,0xe40(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 503:	89 8b 44 0e 00 00    	mov    %ecx,0xe44(%ebx)
  cell_full[i] = 1;
 509:	c7 04 95 40 11 00 00 	movl   $0x1,0x1140(,%edx,4)
 510:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 514:	ff 75 10             	pushl  0x10(%ebp)
 517:	ff 75 0c             	pushl  0xc(%ebp)
 51a:	ff 75 08             	pushl  0x8(%ebp)
 51d:	51                   	push   %ecx
 51e:	e8 dc 00 00 00       	call   5ff <clone>
 523:	83 c4 10             	add    $0x10,%esp
}
 526:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 529:	c9                   	leave  
 52a:	c3                   	ret    
    return -1;
 52b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 530:	eb f4                	jmp    526 <thread_create+0x81>

00000532 <thread_join>:

int thread_join(){
 532:	f3 0f 1e fb          	endbr32 
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	56                   	push   %esi
 53a:	53                   	push   %ebx
 53b:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 53e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 541:	50                   	push   %eax
 542:	e8 d0 00 00 00       	call   617 <join>
 547:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 549:	83 c4 10             	add    $0x10,%esp
 54c:	bb 00 00 00 00       	mov    $0x0,%ebx
 551:	83 fb 3f             	cmp    $0x3f,%ebx
 554:	7f 14                	jg     56a <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 556:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 559:	8b 55 f4             	mov    -0xc(%ebp),%edx
 55c:	39 14 85 44 0e 00 00 	cmp    %edx,0xe44(,%eax,4)
 563:	74 05                	je     56a <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 565:	83 c3 01             	add    $0x1,%ebx
 568:	eb e7                	jmp    551 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 56a:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 56d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 570:	39 0c 85 44 0e 00 00 	cmp    %ecx,0xe44(,%eax,4)
 577:	75 26                	jne    59f <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 579:	83 ec 0c             	sub    $0xc,%esp
 57c:	ff 34 85 40 0e 00 00 	pushl  0xe40(,%eax,4)
 583:	e8 35 03 00 00       	call   8bd <free>
  cell_full[i] = 0;
 588:	c7 04 9d 40 11 00 00 	movl   $0x0,0x1140(,%ebx,4)
 58f:	00 00 00 00 

  return out;
 593:	83 c4 10             	add    $0x10,%esp
}
 596:	89 f0                	mov    %esi,%eax
 598:	8d 65 f8             	lea    -0x8(%ebp),%esp
 59b:	5b                   	pop    %ebx
 59c:	5e                   	pop    %esi
 59d:	5d                   	pop    %ebp
 59e:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 59f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 5a4:	eb f0                	jmp    596 <thread_join+0x64>

000005a6 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 5a6:	f3 0f 1e fb          	endbr32 
 5aa:	55                   	push   %ebp
 5ab:	89 e5                	mov    %esp,%ebp
 5ad:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 5b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 5b6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 5bd:	5d                   	pop    %ebp
 5be:	c3                   	ret    

000005bf <lock_acquire>:

void lock_acquire(lock_t *lock) {
 5bf:	f3 0f 1e fb          	endbr32 
 5c3:	55                   	push   %ebp
 5c4:	89 e5                	mov    %esp,%ebp
 5c6:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 5c9:	b9 01 00 00 00       	mov    $0x1,%ecx
 5ce:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 5d2:	b8 00 00 00 00       	mov    $0x0,%eax
 5d7:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 5dc:	39 c1                	cmp    %eax,%ecx
 5de:	75 f2                	jne    5d2 <lock_acquire+0x13>
      ; // spin
    }
}
 5e0:	5d                   	pop    %ebp
 5e1:	c3                   	ret    

000005e2 <lock_release>:

void lock_release(lock_t *lock) {
 5e2:	f3 0f 1e fb          	endbr32 
 5e6:	55                   	push   %ebp
 5e7:	89 e5                	mov    %esp,%ebp
 5e9:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 5ec:	8b 42 04             	mov    0x4(%edx),%eax
 5ef:	83 c0 01             	add    $0x1,%eax
 5f2:	89 42 04             	mov    %eax,0x4(%edx)
}
 5f5:	5d                   	pop    %ebp
 5f6:	c3                   	ret    

000005f7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5f7:	b8 01 00 00 00       	mov    $0x1,%eax
 5fc:	cd 40                	int    $0x40
 5fe:	c3                   	ret    

000005ff <clone>:
SYSCALL(clone)
 5ff:	b8 16 00 00 00       	mov    $0x16,%eax
 604:	cd 40                	int    $0x40
 606:	c3                   	ret    

00000607 <exit>:
SYSCALL(exit)
 607:	b8 02 00 00 00       	mov    $0x2,%eax
 60c:	cd 40                	int    $0x40
 60e:	c3                   	ret    

0000060f <wait>:
SYSCALL(wait)
 60f:	b8 03 00 00 00       	mov    $0x3,%eax
 614:	cd 40                	int    $0x40
 616:	c3                   	ret    

00000617 <join>:
SYSCALL(join)
 617:	b8 17 00 00 00       	mov    $0x17,%eax
 61c:	cd 40                	int    $0x40
 61e:	c3                   	ret    

0000061f <pipe>:
SYSCALL(pipe)
 61f:	b8 04 00 00 00       	mov    $0x4,%eax
 624:	cd 40                	int    $0x40
 626:	c3                   	ret    

00000627 <read>:
SYSCALL(read)
 627:	b8 05 00 00 00       	mov    $0x5,%eax
 62c:	cd 40                	int    $0x40
 62e:	c3                   	ret    

0000062f <write>:
SYSCALL(write)
 62f:	b8 10 00 00 00       	mov    $0x10,%eax
 634:	cd 40                	int    $0x40
 636:	c3                   	ret    

00000637 <close>:
SYSCALL(close)
 637:	b8 15 00 00 00       	mov    $0x15,%eax
 63c:	cd 40                	int    $0x40
 63e:	c3                   	ret    

0000063f <kill>:
SYSCALL(kill)
 63f:	b8 06 00 00 00       	mov    $0x6,%eax
 644:	cd 40                	int    $0x40
 646:	c3                   	ret    

00000647 <exec>:
SYSCALL(exec)
 647:	b8 07 00 00 00       	mov    $0x7,%eax
 64c:	cd 40                	int    $0x40
 64e:	c3                   	ret    

0000064f <open>:
SYSCALL(open)
 64f:	b8 0f 00 00 00       	mov    $0xf,%eax
 654:	cd 40                	int    $0x40
 656:	c3                   	ret    

00000657 <mknod>:
SYSCALL(mknod)
 657:	b8 11 00 00 00       	mov    $0x11,%eax
 65c:	cd 40                	int    $0x40
 65e:	c3                   	ret    

0000065f <unlink>:
SYSCALL(unlink)
 65f:	b8 12 00 00 00       	mov    $0x12,%eax
 664:	cd 40                	int    $0x40
 666:	c3                   	ret    

00000667 <fstat>:
SYSCALL(fstat)
 667:	b8 08 00 00 00       	mov    $0x8,%eax
 66c:	cd 40                	int    $0x40
 66e:	c3                   	ret    

0000066f <link>:
SYSCALL(link)
 66f:	b8 13 00 00 00       	mov    $0x13,%eax
 674:	cd 40                	int    $0x40
 676:	c3                   	ret    

00000677 <mkdir>:
SYSCALL(mkdir)
 677:	b8 14 00 00 00       	mov    $0x14,%eax
 67c:	cd 40                	int    $0x40
 67e:	c3                   	ret    

0000067f <chdir>:
SYSCALL(chdir)
 67f:	b8 09 00 00 00       	mov    $0x9,%eax
 684:	cd 40                	int    $0x40
 686:	c3                   	ret    

00000687 <dup>:
SYSCALL(dup)
 687:	b8 0a 00 00 00       	mov    $0xa,%eax
 68c:	cd 40                	int    $0x40
 68e:	c3                   	ret    

0000068f <getpid>:
SYSCALL(getpid)
 68f:	b8 0b 00 00 00       	mov    $0xb,%eax
 694:	cd 40                	int    $0x40
 696:	c3                   	ret    

00000697 <sbrk>:
SYSCALL(sbrk)
 697:	b8 0c 00 00 00       	mov    $0xc,%eax
 69c:	cd 40                	int    $0x40
 69e:	c3                   	ret    

0000069f <sleep>:
SYSCALL(sleep)
 69f:	b8 0d 00 00 00       	mov    $0xd,%eax
 6a4:	cd 40                	int    $0x40
 6a6:	c3                   	ret    

000006a7 <uptime>:
SYSCALL(uptime)
 6a7:	b8 0e 00 00 00       	mov    $0xe,%eax
 6ac:	cd 40                	int    $0x40
 6ae:	c3                   	ret    

000006af <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
 6b2:	83 ec 1c             	sub    $0x1c,%esp
 6b5:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 6b8:	6a 01                	push   $0x1
 6ba:	8d 55 f4             	lea    -0xc(%ebp),%edx
 6bd:	52                   	push   %edx
 6be:	50                   	push   %eax
 6bf:	e8 6b ff ff ff       	call   62f <write>
}
 6c4:	83 c4 10             	add    $0x10,%esp
 6c7:	c9                   	leave  
 6c8:	c3                   	ret    

000006c9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6c9:	55                   	push   %ebp
 6ca:	89 e5                	mov    %esp,%ebp
 6cc:	57                   	push   %edi
 6cd:	56                   	push   %esi
 6ce:	53                   	push   %ebx
 6cf:	83 ec 2c             	sub    $0x2c,%esp
 6d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6d5:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6d7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 6db:	0f 95 c2             	setne  %dl
 6de:	89 f0                	mov    %esi,%eax
 6e0:	c1 e8 1f             	shr    $0x1f,%eax
 6e3:	84 c2                	test   %al,%dl
 6e5:	74 42                	je     729 <printint+0x60>
    neg = 1;
    x = -xx;
 6e7:	f7 de                	neg    %esi
    neg = 1;
 6e9:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 6f0:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 6f5:	89 f0                	mov    %esi,%eax
 6f7:	ba 00 00 00 00       	mov    $0x0,%edx
 6fc:	f7 f1                	div    %ecx
 6fe:	89 df                	mov    %ebx,%edi
 700:	83 c3 01             	add    $0x1,%ebx
 703:	0f b6 92 64 0a 00 00 	movzbl 0xa64(%edx),%edx
 70a:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 70e:	89 f2                	mov    %esi,%edx
 710:	89 c6                	mov    %eax,%esi
 712:	39 d1                	cmp    %edx,%ecx
 714:	76 df                	jbe    6f5 <printint+0x2c>
  if(neg)
 716:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 71a:	74 2f                	je     74b <printint+0x82>
    buf[i++] = '-';
 71c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 721:	8d 5f 02             	lea    0x2(%edi),%ebx
 724:	8b 75 d0             	mov    -0x30(%ebp),%esi
 727:	eb 15                	jmp    73e <printint+0x75>
  neg = 0;
 729:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 730:	eb be                	jmp    6f0 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 732:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 737:	89 f0                	mov    %esi,%eax
 739:	e8 71 ff ff ff       	call   6af <putc>
  while(--i >= 0)
 73e:	83 eb 01             	sub    $0x1,%ebx
 741:	79 ef                	jns    732 <printint+0x69>
}
 743:	83 c4 2c             	add    $0x2c,%esp
 746:	5b                   	pop    %ebx
 747:	5e                   	pop    %esi
 748:	5f                   	pop    %edi
 749:	5d                   	pop    %ebp
 74a:	c3                   	ret    
 74b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 74e:	eb ee                	jmp    73e <printint+0x75>

00000750 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 750:	f3 0f 1e fb          	endbr32 
 754:	55                   	push   %ebp
 755:	89 e5                	mov    %esp,%ebp
 757:	57                   	push   %edi
 758:	56                   	push   %esi
 759:	53                   	push   %ebx
 75a:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 75d:	8d 45 10             	lea    0x10(%ebp),%eax
 760:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 763:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 768:	bb 00 00 00 00       	mov    $0x0,%ebx
 76d:	eb 14                	jmp    783 <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 76f:	89 fa                	mov    %edi,%edx
 771:	8b 45 08             	mov    0x8(%ebp),%eax
 774:	e8 36 ff ff ff       	call   6af <putc>
 779:	eb 05                	jmp    780 <printf+0x30>
      }
    } else if(state == '%'){
 77b:	83 fe 25             	cmp    $0x25,%esi
 77e:	74 25                	je     7a5 <printf+0x55>
  for(i = 0; fmt[i]; i++){
 780:	83 c3 01             	add    $0x1,%ebx
 783:	8b 45 0c             	mov    0xc(%ebp),%eax
 786:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 78a:	84 c0                	test   %al,%al
 78c:	0f 84 23 01 00 00    	je     8b5 <printf+0x165>
    c = fmt[i] & 0xff;
 792:	0f be f8             	movsbl %al,%edi
 795:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 798:	85 f6                	test   %esi,%esi
 79a:	75 df                	jne    77b <printf+0x2b>
      if(c == '%'){
 79c:	83 f8 25             	cmp    $0x25,%eax
 79f:	75 ce                	jne    76f <printf+0x1f>
        state = '%';
 7a1:	89 c6                	mov    %eax,%esi
 7a3:	eb db                	jmp    780 <printf+0x30>
      if(c == 'd'){
 7a5:	83 f8 64             	cmp    $0x64,%eax
 7a8:	74 49                	je     7f3 <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7aa:	83 f8 78             	cmp    $0x78,%eax
 7ad:	0f 94 c1             	sete   %cl
 7b0:	83 f8 70             	cmp    $0x70,%eax
 7b3:	0f 94 c2             	sete   %dl
 7b6:	08 d1                	or     %dl,%cl
 7b8:	75 63                	jne    81d <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7ba:	83 f8 73             	cmp    $0x73,%eax
 7bd:	0f 84 84 00 00 00    	je     847 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7c3:	83 f8 63             	cmp    $0x63,%eax
 7c6:	0f 84 b7 00 00 00    	je     883 <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 7cc:	83 f8 25             	cmp    $0x25,%eax
 7cf:	0f 84 cc 00 00 00    	je     8a1 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7d5:	ba 25 00 00 00       	mov    $0x25,%edx
 7da:	8b 45 08             	mov    0x8(%ebp),%eax
 7dd:	e8 cd fe ff ff       	call   6af <putc>
        putc(fd, c);
 7e2:	89 fa                	mov    %edi,%edx
 7e4:	8b 45 08             	mov    0x8(%ebp),%eax
 7e7:	e8 c3 fe ff ff       	call   6af <putc>
      }
      state = 0;
 7ec:	be 00 00 00 00       	mov    $0x0,%esi
 7f1:	eb 8d                	jmp    780 <printf+0x30>
        printint(fd, *ap, 10, 1);
 7f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 7f6:	8b 17                	mov    (%edi),%edx
 7f8:	83 ec 0c             	sub    $0xc,%esp
 7fb:	6a 01                	push   $0x1
 7fd:	b9 0a 00 00 00       	mov    $0xa,%ecx
 802:	8b 45 08             	mov    0x8(%ebp),%eax
 805:	e8 bf fe ff ff       	call   6c9 <printint>
        ap++;
 80a:	83 c7 04             	add    $0x4,%edi
 80d:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 810:	83 c4 10             	add    $0x10,%esp
      state = 0;
 813:	be 00 00 00 00       	mov    $0x0,%esi
 818:	e9 63 ff ff ff       	jmp    780 <printf+0x30>
        printint(fd, *ap, 16, 0);
 81d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 820:	8b 17                	mov    (%edi),%edx
 822:	83 ec 0c             	sub    $0xc,%esp
 825:	6a 00                	push   $0x0
 827:	b9 10 00 00 00       	mov    $0x10,%ecx
 82c:	8b 45 08             	mov    0x8(%ebp),%eax
 82f:	e8 95 fe ff ff       	call   6c9 <printint>
        ap++;
 834:	83 c7 04             	add    $0x4,%edi
 837:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 83a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 83d:	be 00 00 00 00       	mov    $0x0,%esi
 842:	e9 39 ff ff ff       	jmp    780 <printf+0x30>
        s = (char*)*ap;
 847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 84a:	8b 30                	mov    (%eax),%esi
        ap++;
 84c:	83 c0 04             	add    $0x4,%eax
 84f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 852:	85 f6                	test   %esi,%esi
 854:	75 28                	jne    87e <printf+0x12e>
          s = "(null)";
 856:	be 5a 0a 00 00       	mov    $0xa5a,%esi
 85b:	8b 7d 08             	mov    0x8(%ebp),%edi
 85e:	eb 0d                	jmp    86d <printf+0x11d>
          putc(fd, *s);
 860:	0f be d2             	movsbl %dl,%edx
 863:	89 f8                	mov    %edi,%eax
 865:	e8 45 fe ff ff       	call   6af <putc>
          s++;
 86a:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 86d:	0f b6 16             	movzbl (%esi),%edx
 870:	84 d2                	test   %dl,%dl
 872:	75 ec                	jne    860 <printf+0x110>
      state = 0;
 874:	be 00 00 00 00       	mov    $0x0,%esi
 879:	e9 02 ff ff ff       	jmp    780 <printf+0x30>
 87e:	8b 7d 08             	mov    0x8(%ebp),%edi
 881:	eb ea                	jmp    86d <printf+0x11d>
        putc(fd, *ap);
 883:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 886:	0f be 17             	movsbl (%edi),%edx
 889:	8b 45 08             	mov    0x8(%ebp),%eax
 88c:	e8 1e fe ff ff       	call   6af <putc>
        ap++;
 891:	83 c7 04             	add    $0x4,%edi
 894:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 897:	be 00 00 00 00       	mov    $0x0,%esi
 89c:	e9 df fe ff ff       	jmp    780 <printf+0x30>
        putc(fd, c);
 8a1:	89 fa                	mov    %edi,%edx
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	e8 04 fe ff ff       	call   6af <putc>
      state = 0;
 8ab:	be 00 00 00 00       	mov    $0x0,%esi
 8b0:	e9 cb fe ff ff       	jmp    780 <printf+0x30>
    }
  }
}
 8b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8b8:	5b                   	pop    %ebx
 8b9:	5e                   	pop    %esi
 8ba:	5f                   	pop    %edi
 8bb:	5d                   	pop    %ebp
 8bc:	c3                   	ret    

000008bd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8bd:	f3 0f 1e fb          	endbr32 
 8c1:	55                   	push   %ebp
 8c2:	89 e5                	mov    %esp,%ebp
 8c4:	57                   	push   %edi
 8c5:	56                   	push   %esi
 8c6:	53                   	push   %ebx
 8c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8ca:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8cd:	a1 30 0e 00 00       	mov    0xe30,%eax
 8d2:	eb 02                	jmp    8d6 <free+0x19>
 8d4:	89 d0                	mov    %edx,%eax
 8d6:	39 c8                	cmp    %ecx,%eax
 8d8:	73 04                	jae    8de <free+0x21>
 8da:	39 08                	cmp    %ecx,(%eax)
 8dc:	77 12                	ja     8f0 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8de:	8b 10                	mov    (%eax),%edx
 8e0:	39 c2                	cmp    %eax,%edx
 8e2:	77 f0                	ja     8d4 <free+0x17>
 8e4:	39 c8                	cmp    %ecx,%eax
 8e6:	72 08                	jb     8f0 <free+0x33>
 8e8:	39 ca                	cmp    %ecx,%edx
 8ea:	77 04                	ja     8f0 <free+0x33>
 8ec:	89 d0                	mov    %edx,%eax
 8ee:	eb e6                	jmp    8d6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	39 d7                	cmp    %edx,%edi
 8fa:	74 19                	je     915 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8fc:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8ff:	8b 50 04             	mov    0x4(%eax),%edx
 902:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 905:	39 ce                	cmp    %ecx,%esi
 907:	74 1b                	je     924 <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 909:	89 08                	mov    %ecx,(%eax)
  freep = p;
 90b:	a3 30 0e 00 00       	mov    %eax,0xe30
}
 910:	5b                   	pop    %ebx
 911:	5e                   	pop    %esi
 912:	5f                   	pop    %edi
 913:	5d                   	pop    %ebp
 914:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 915:	03 72 04             	add    0x4(%edx),%esi
 918:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 91b:	8b 10                	mov    (%eax),%edx
 91d:	8b 12                	mov    (%edx),%edx
 91f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 922:	eb db                	jmp    8ff <free+0x42>
    p->s.size += bp->s.size;
 924:	03 53 fc             	add    -0x4(%ebx),%edx
 927:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 92a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 92d:	89 10                	mov    %edx,(%eax)
 92f:	eb da                	jmp    90b <free+0x4e>

00000931 <morecore>:

static Header*
morecore(uint nu)
{
 931:	55                   	push   %ebp
 932:	89 e5                	mov    %esp,%ebp
 934:	53                   	push   %ebx
 935:	83 ec 04             	sub    $0x4,%esp
 938:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 93a:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 93f:	77 05                	ja     946 <morecore+0x15>
    nu = 4096;
 941:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 946:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 94d:	83 ec 0c             	sub    $0xc,%esp
 950:	50                   	push   %eax
 951:	e8 41 fd ff ff       	call   697 <sbrk>
  if(p == (char*)-1)
 956:	83 c4 10             	add    $0x10,%esp
 959:	83 f8 ff             	cmp    $0xffffffff,%eax
 95c:	74 1c                	je     97a <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 95e:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 961:	83 c0 08             	add    $0x8,%eax
 964:	83 ec 0c             	sub    $0xc,%esp
 967:	50                   	push   %eax
 968:	e8 50 ff ff ff       	call   8bd <free>
  return freep;
 96d:	a1 30 0e 00 00       	mov    0xe30,%eax
 972:	83 c4 10             	add    $0x10,%esp
}
 975:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 978:	c9                   	leave  
 979:	c3                   	ret    
    return 0;
 97a:	b8 00 00 00 00       	mov    $0x0,%eax
 97f:	eb f4                	jmp    975 <morecore+0x44>

00000981 <malloc>:

void*
malloc(uint nbytes)
{
 981:	f3 0f 1e fb          	endbr32 
 985:	55                   	push   %ebp
 986:	89 e5                	mov    %esp,%ebp
 988:	53                   	push   %ebx
 989:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 98c:	8b 45 08             	mov    0x8(%ebp),%eax
 98f:	8d 58 07             	lea    0x7(%eax),%ebx
 992:	c1 eb 03             	shr    $0x3,%ebx
 995:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 998:	8b 0d 30 0e 00 00    	mov    0xe30,%ecx
 99e:	85 c9                	test   %ecx,%ecx
 9a0:	74 04                	je     9a6 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a2:	8b 01                	mov    (%ecx),%eax
 9a4:	eb 4b                	jmp    9f1 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 9a6:	c7 05 30 0e 00 00 34 	movl   $0xe34,0xe30
 9ad:	0e 00 00 
 9b0:	c7 05 34 0e 00 00 34 	movl   $0xe34,0xe34
 9b7:	0e 00 00 
    base.s.size = 0;
 9ba:	c7 05 38 0e 00 00 00 	movl   $0x0,0xe38
 9c1:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 9c4:	b9 34 0e 00 00       	mov    $0xe34,%ecx
 9c9:	eb d7                	jmp    9a2 <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 9cb:	74 1a                	je     9e7 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 9cd:	29 da                	sub    %ebx,%edx
 9cf:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9d2:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 9d5:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 9d8:	89 0d 30 0e 00 00    	mov    %ecx,0xe30
      return (void*)(p + 1);
 9de:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9e1:	83 c4 04             	add    $0x4,%esp
 9e4:	5b                   	pop    %ebx
 9e5:	5d                   	pop    %ebp
 9e6:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 9e7:	8b 10                	mov    (%eax),%edx
 9e9:	89 11                	mov    %edx,(%ecx)
 9eb:	eb eb                	jmp    9d8 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ed:	89 c1                	mov    %eax,%ecx
 9ef:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 9f1:	8b 50 04             	mov    0x4(%eax),%edx
 9f4:	39 da                	cmp    %ebx,%edx
 9f6:	73 d3                	jae    9cb <malloc+0x4a>
    if(p == freep)
 9f8:	39 05 30 0e 00 00    	cmp    %eax,0xe30
 9fe:	75 ed                	jne    9ed <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 a00:	89 d8                	mov    %ebx,%eax
 a02:	e8 2a ff ff ff       	call   931 <morecore>
 a07:	85 c0                	test   %eax,%eax
 a09:	75 e2                	jne    9ed <malloc+0x6c>
 a0b:	eb d4                	jmp    9e1 <malloc+0x60>
