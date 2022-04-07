
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
       0:	f3 0f 1e fb          	endbr32 
       4:	55                   	push   %ebp
       5:	89 e5                	mov    %esp,%ebp
       7:	56                   	push   %esi
       8:	53                   	push   %ebx
       9:	8b 5d 08             	mov    0x8(%ebp),%ebx
       c:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
       f:	83 ec 08             	sub    $0x8,%esp
      12:	68 18 11 00 00       	push   $0x1118
      17:	6a 02                	push   $0x2
      19:	e8 3d 0e 00 00       	call   e5b <printf>
  memset(buf, 0, nbuf);
      1e:	83 c4 0c             	add    $0xc,%esp
      21:	56                   	push   %esi
      22:	6a 00                	push   $0x0
      24:	53                   	push   %ebx
      25:	e8 41 0a 00 00       	call   a6b <memset>
  gets(buf, nbuf);
      2a:	83 c4 08             	add    $0x8,%esp
      2d:	56                   	push   %esi
      2e:	53                   	push   %ebx
      2f:	e8 77 0a 00 00       	call   aab <gets>
  if(buf[0] == 0) // EOF
      34:	83 c4 10             	add    $0x10,%esp
      37:	80 3b 00             	cmpb   $0x0,(%ebx)
      3a:	74 0c                	je     48 <getcmd+0x48>
    return -1;
  return 0;
      3c:	b8 00 00 00 00       	mov    $0x0,%eax
}
      41:	8d 65 f8             	lea    -0x8(%ebp),%esp
      44:	5b                   	pop    %ebx
      45:	5e                   	pop    %esi
      46:	5d                   	pop    %ebp
      47:	c3                   	ret    
    return -1;
      48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      4d:	eb f2                	jmp    41 <getcmd+0x41>

0000004f <panic>:
  exit();
}

void
panic(char *s)
{
      4f:	f3 0f 1e fb          	endbr32 
      53:	55                   	push   %ebp
      54:	89 e5                	mov    %esp,%ebp
      56:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
      59:	ff 75 08             	pushl  0x8(%ebp)
      5c:	68 b5 11 00 00       	push   $0x11b5
      61:	6a 02                	push   $0x2
      63:	e8 f3 0d 00 00       	call   e5b <printf>
  exit();
      68:	e8 a5 0c 00 00       	call   d12 <exit>

0000006d <fork1>:
}

int
fork1(void)
{
      6d:	f3 0f 1e fb          	endbr32 
      71:	55                   	push   %ebp
      72:	89 e5                	mov    %esp,%ebp
      74:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
      77:	e8 86 0c 00 00       	call   d02 <fork>
  if(pid == -1)
      7c:	83 f8 ff             	cmp    $0xffffffff,%eax
      7f:	74 02                	je     83 <fork1+0x16>
    panic("fork");
  return pid;
}
      81:	c9                   	leave  
      82:	c3                   	ret    
    panic("fork");
      83:	83 ec 0c             	sub    $0xc,%esp
      86:	68 1b 11 00 00       	push   $0x111b
      8b:	e8 bf ff ff ff       	call   4f <panic>

00000090 <runcmd>:
{
      90:	f3 0f 1e fb          	endbr32 
      94:	55                   	push   %ebp
      95:	89 e5                	mov    %esp,%ebp
      97:	53                   	push   %ebx
      98:	83 ec 14             	sub    $0x14,%esp
      9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
      9e:	85 db                	test   %ebx,%ebx
      a0:	74 0f                	je     b1 <runcmd+0x21>
  switch(cmd->type){
      a2:	8b 03                	mov    (%ebx),%eax
      a4:	83 f8 05             	cmp    $0x5,%eax
      a7:	77 0d                	ja     b6 <runcmd+0x26>
      a9:	3e ff 24 85 d0 11 00 	notrack jmp *0x11d0(,%eax,4)
      b0:	00 
    exit();
      b1:	e8 5c 0c 00 00       	call   d12 <exit>
    panic("runcmd");
      b6:	83 ec 0c             	sub    $0xc,%esp
      b9:	68 20 11 00 00       	push   $0x1120
      be:	e8 8c ff ff ff       	call   4f <panic>
    if(ecmd->argv[0] == 0)
      c3:	8b 43 04             	mov    0x4(%ebx),%eax
      c6:	85 c0                	test   %eax,%eax
      c8:	74 27                	je     f1 <runcmd+0x61>
    exec(ecmd->argv[0], ecmd->argv);
      ca:	8d 53 04             	lea    0x4(%ebx),%edx
      cd:	83 ec 08             	sub    $0x8,%esp
      d0:	52                   	push   %edx
      d1:	50                   	push   %eax
      d2:	e8 7b 0c 00 00       	call   d52 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      d7:	83 c4 0c             	add    $0xc,%esp
      da:	ff 73 04             	pushl  0x4(%ebx)
      dd:	68 27 11 00 00       	push   $0x1127
      e2:	6a 02                	push   $0x2
      e4:	e8 72 0d 00 00       	call   e5b <printf>
    break;
      e9:	83 c4 10             	add    $0x10,%esp
  exit();
      ec:	e8 21 0c 00 00       	call   d12 <exit>
      exit();
      f1:	e8 1c 0c 00 00       	call   d12 <exit>
    close(rcmd->fd);
      f6:	83 ec 0c             	sub    $0xc,%esp
      f9:	ff 73 14             	pushl  0x14(%ebx)
      fc:	e8 41 0c 00 00       	call   d42 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     101:	83 c4 08             	add    $0x8,%esp
     104:	ff 73 10             	pushl  0x10(%ebx)
     107:	ff 73 08             	pushl  0x8(%ebx)
     10a:	e8 4b 0c 00 00       	call   d5a <open>
     10f:	83 c4 10             	add    $0x10,%esp
     112:	85 c0                	test   %eax,%eax
     114:	78 0b                	js     121 <runcmd+0x91>
    runcmd(rcmd->cmd);
     116:	83 ec 0c             	sub    $0xc,%esp
     119:	ff 73 04             	pushl  0x4(%ebx)
     11c:	e8 6f ff ff ff       	call   90 <runcmd>
      printf(2, "open %s failed\n", rcmd->file);
     121:	83 ec 04             	sub    $0x4,%esp
     124:	ff 73 08             	pushl  0x8(%ebx)
     127:	68 37 11 00 00       	push   $0x1137
     12c:	6a 02                	push   $0x2
     12e:	e8 28 0d 00 00       	call   e5b <printf>
      exit();
     133:	e8 da 0b 00 00       	call   d12 <exit>
    if(fork1() == 0)
     138:	e8 30 ff ff ff       	call   6d <fork1>
     13d:	85 c0                	test   %eax,%eax
     13f:	74 10                	je     151 <runcmd+0xc1>
    wait();
     141:	e8 d4 0b 00 00       	call   d1a <wait>
    runcmd(lcmd->right);
     146:	83 ec 0c             	sub    $0xc,%esp
     149:	ff 73 08             	pushl  0x8(%ebx)
     14c:	e8 3f ff ff ff       	call   90 <runcmd>
      runcmd(lcmd->left);
     151:	83 ec 0c             	sub    $0xc,%esp
     154:	ff 73 04             	pushl  0x4(%ebx)
     157:	e8 34 ff ff ff       	call   90 <runcmd>
    if(pipe(p) < 0)
     15c:	83 ec 0c             	sub    $0xc,%esp
     15f:	8d 45 f0             	lea    -0x10(%ebp),%eax
     162:	50                   	push   %eax
     163:	e8 c2 0b 00 00       	call   d2a <pipe>
     168:	83 c4 10             	add    $0x10,%esp
     16b:	85 c0                	test   %eax,%eax
     16d:	78 3a                	js     1a9 <runcmd+0x119>
    if(fork1() == 0){
     16f:	e8 f9 fe ff ff       	call   6d <fork1>
     174:	85 c0                	test   %eax,%eax
     176:	74 3e                	je     1b6 <runcmd+0x126>
    if(fork1() == 0){
     178:	e8 f0 fe ff ff       	call   6d <fork1>
     17d:	85 c0                	test   %eax,%eax
     17f:	74 6b                	je     1ec <runcmd+0x15c>
    close(p[0]);
     181:	83 ec 0c             	sub    $0xc,%esp
     184:	ff 75 f0             	pushl  -0x10(%ebp)
     187:	e8 b6 0b 00 00       	call   d42 <close>
    close(p[1]);
     18c:	83 c4 04             	add    $0x4,%esp
     18f:	ff 75 f4             	pushl  -0xc(%ebp)
     192:	e8 ab 0b 00 00       	call   d42 <close>
    wait();
     197:	e8 7e 0b 00 00       	call   d1a <wait>
    wait();
     19c:	e8 79 0b 00 00       	call   d1a <wait>
    break;
     1a1:	83 c4 10             	add    $0x10,%esp
     1a4:	e9 43 ff ff ff       	jmp    ec <runcmd+0x5c>
      panic("pipe");
     1a9:	83 ec 0c             	sub    $0xc,%esp
     1ac:	68 47 11 00 00       	push   $0x1147
     1b1:	e8 99 fe ff ff       	call   4f <panic>
      close(1);
     1b6:	83 ec 0c             	sub    $0xc,%esp
     1b9:	6a 01                	push   $0x1
     1bb:	e8 82 0b 00 00       	call   d42 <close>
      dup(p[1]);
     1c0:	83 c4 04             	add    $0x4,%esp
     1c3:	ff 75 f4             	pushl  -0xc(%ebp)
     1c6:	e8 c7 0b 00 00       	call   d92 <dup>
      close(p[0]);
     1cb:	83 c4 04             	add    $0x4,%esp
     1ce:	ff 75 f0             	pushl  -0x10(%ebp)
     1d1:	e8 6c 0b 00 00       	call   d42 <close>
      close(p[1]);
     1d6:	83 c4 04             	add    $0x4,%esp
     1d9:	ff 75 f4             	pushl  -0xc(%ebp)
     1dc:	e8 61 0b 00 00       	call   d42 <close>
      runcmd(pcmd->left);
     1e1:	83 c4 04             	add    $0x4,%esp
     1e4:	ff 73 04             	pushl  0x4(%ebx)
     1e7:	e8 a4 fe ff ff       	call   90 <runcmd>
      close(0);
     1ec:	83 ec 0c             	sub    $0xc,%esp
     1ef:	6a 00                	push   $0x0
     1f1:	e8 4c 0b 00 00       	call   d42 <close>
      dup(p[0]);
     1f6:	83 c4 04             	add    $0x4,%esp
     1f9:	ff 75 f0             	pushl  -0x10(%ebp)
     1fc:	e8 91 0b 00 00       	call   d92 <dup>
      close(p[0]);
     201:	83 c4 04             	add    $0x4,%esp
     204:	ff 75 f0             	pushl  -0x10(%ebp)
     207:	e8 36 0b 00 00       	call   d42 <close>
      close(p[1]);
     20c:	83 c4 04             	add    $0x4,%esp
     20f:	ff 75 f4             	pushl  -0xc(%ebp)
     212:	e8 2b 0b 00 00       	call   d42 <close>
      runcmd(pcmd->right);
     217:	83 c4 04             	add    $0x4,%esp
     21a:	ff 73 08             	pushl  0x8(%ebx)
     21d:	e8 6e fe ff ff       	call   90 <runcmd>
    if(fork1() == 0)
     222:	e8 46 fe ff ff       	call   6d <fork1>
     227:	85 c0                	test   %eax,%eax
     229:	0f 85 bd fe ff ff    	jne    ec <runcmd+0x5c>
      runcmd(bcmd->cmd);
     22f:	83 ec 0c             	sub    $0xc,%esp
     232:	ff 73 04             	pushl  0x4(%ebx)
     235:	e8 56 fe ff ff       	call   90 <runcmd>

0000023a <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     23a:	f3 0f 1e fb          	endbr32 
     23e:	55                   	push   %ebp
     23f:	89 e5                	mov    %esp,%ebp
     241:	53                   	push   %ebx
     242:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     245:	6a 54                	push   $0x54
     247:	e8 40 0e 00 00       	call   108c <malloc>
     24c:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     24e:	83 c4 0c             	add    $0xc,%esp
     251:	6a 54                	push   $0x54
     253:	6a 00                	push   $0x0
     255:	50                   	push   %eax
     256:	e8 10 08 00 00       	call   a6b <memset>
  cmd->type = EXEC;
     25b:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     261:	89 d8                	mov    %ebx,%eax
     263:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     266:	c9                   	leave  
     267:	c3                   	ret    

00000268 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     268:	f3 0f 1e fb          	endbr32 
     26c:	55                   	push   %ebp
     26d:	89 e5                	mov    %esp,%ebp
     26f:	53                   	push   %ebx
     270:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     273:	6a 18                	push   $0x18
     275:	e8 12 0e 00 00       	call   108c <malloc>
     27a:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     27c:	83 c4 0c             	add    $0xc,%esp
     27f:	6a 18                	push   $0x18
     281:	6a 00                	push   $0x0
     283:	50                   	push   %eax
     284:	e8 e2 07 00 00       	call   a6b <memset>
  cmd->type = REDIR;
     289:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     28f:	8b 45 08             	mov    0x8(%ebp),%eax
     292:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     295:	8b 45 0c             	mov    0xc(%ebp),%eax
     298:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     29b:	8b 45 10             	mov    0x10(%ebp),%eax
     29e:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     2a1:	8b 45 14             	mov    0x14(%ebp),%eax
     2a4:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     2a7:	8b 45 18             	mov    0x18(%ebp),%eax
     2aa:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     2ad:	89 d8                	mov    %ebx,%eax
     2af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2b2:	c9                   	leave  
     2b3:	c3                   	ret    

000002b4 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     2b4:	f3 0f 1e fb          	endbr32 
     2b8:	55                   	push   %ebp
     2b9:	89 e5                	mov    %esp,%ebp
     2bb:	53                   	push   %ebx
     2bc:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2bf:	6a 0c                	push   $0xc
     2c1:	e8 c6 0d 00 00       	call   108c <malloc>
     2c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2c8:	83 c4 0c             	add    $0xc,%esp
     2cb:	6a 0c                	push   $0xc
     2cd:	6a 00                	push   $0x0
     2cf:	50                   	push   %eax
     2d0:	e8 96 07 00 00       	call   a6b <memset>
  cmd->type = PIPE;
     2d5:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     2db:	8b 45 08             	mov    0x8(%ebp),%eax
     2de:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     2e1:	8b 45 0c             	mov    0xc(%ebp),%eax
     2e4:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     2e7:	89 d8                	mov    %ebx,%eax
     2e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2ec:	c9                   	leave  
     2ed:	c3                   	ret    

000002ee <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     2ee:	f3 0f 1e fb          	endbr32 
     2f2:	55                   	push   %ebp
     2f3:	89 e5                	mov    %esp,%ebp
     2f5:	53                   	push   %ebx
     2f6:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2f9:	6a 0c                	push   $0xc
     2fb:	e8 8c 0d 00 00       	call   108c <malloc>
     300:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     302:	83 c4 0c             	add    $0xc,%esp
     305:	6a 0c                	push   $0xc
     307:	6a 00                	push   $0x0
     309:	50                   	push   %eax
     30a:	e8 5c 07 00 00       	call   a6b <memset>
  cmd->type = LIST;
     30f:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     315:	8b 45 08             	mov    0x8(%ebp),%eax
     318:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     31b:	8b 45 0c             	mov    0xc(%ebp),%eax
     31e:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     321:	89 d8                	mov    %ebx,%eax
     323:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     326:	c9                   	leave  
     327:	c3                   	ret    

00000328 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     328:	f3 0f 1e fb          	endbr32 
     32c:	55                   	push   %ebp
     32d:	89 e5                	mov    %esp,%ebp
     32f:	53                   	push   %ebx
     330:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     333:	6a 08                	push   $0x8
     335:	e8 52 0d 00 00       	call   108c <malloc>
     33a:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     33c:	83 c4 0c             	add    $0xc,%esp
     33f:	6a 08                	push   $0x8
     341:	6a 00                	push   $0x0
     343:	50                   	push   %eax
     344:	e8 22 07 00 00       	call   a6b <memset>
  cmd->type = BACK;
     349:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     34f:	8b 45 08             	mov    0x8(%ebp),%eax
     352:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     355:	89 d8                	mov    %ebx,%eax
     357:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     35a:	c9                   	leave  
     35b:	c3                   	ret    

0000035c <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     35c:	f3 0f 1e fb          	endbr32 
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	57                   	push   %edi
     364:	56                   	push   %esi
     365:	53                   	push   %ebx
     366:	83 ec 0c             	sub    $0xc,%esp
     369:	8b 75 0c             	mov    0xc(%ebp),%esi
     36c:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *s;
  int ret;

  s = *ps;
     36f:	8b 45 08             	mov    0x8(%ebp),%eax
     372:	8b 18                	mov    (%eax),%ebx
  while(s < es && strchr(whitespace, *s))
     374:	39 f3                	cmp    %esi,%ebx
     376:	73 1d                	jae    395 <gettoken+0x39>
     378:	83 ec 08             	sub    $0x8,%esp
     37b:	0f be 03             	movsbl (%ebx),%eax
     37e:	50                   	push   %eax
     37f:	68 3c 18 00 00       	push   $0x183c
     384:	e8 fd 06 00 00       	call   a86 <strchr>
     389:	83 c4 10             	add    $0x10,%esp
     38c:	85 c0                	test   %eax,%eax
     38e:	74 05                	je     395 <gettoken+0x39>
    s++;
     390:	83 c3 01             	add    $0x1,%ebx
     393:	eb df                	jmp    374 <gettoken+0x18>
  if(q)
     395:	85 ff                	test   %edi,%edi
     397:	74 02                	je     39b <gettoken+0x3f>
    *q = s;
     399:	89 1f                	mov    %ebx,(%edi)
  ret = *s;
     39b:	0f b6 03             	movzbl (%ebx),%eax
     39e:	0f be f8             	movsbl %al,%edi
  switch(*s){
     3a1:	3c 3c                	cmp    $0x3c,%al
     3a3:	7f 27                	jg     3cc <gettoken+0x70>
     3a5:	3c 3b                	cmp    $0x3b,%al
     3a7:	7d 13                	jge    3bc <gettoken+0x60>
     3a9:	84 c0                	test   %al,%al
     3ab:	74 12                	je     3bf <gettoken+0x63>
     3ad:	78 41                	js     3f0 <gettoken+0x94>
     3af:	3c 26                	cmp    $0x26,%al
     3b1:	74 09                	je     3bc <gettoken+0x60>
     3b3:	7c 3b                	jl     3f0 <gettoken+0x94>
     3b5:	83 e8 28             	sub    $0x28,%eax
     3b8:	3c 01                	cmp    $0x1,%al
     3ba:	77 34                	ja     3f0 <gettoken+0x94>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     3bc:	83 c3 01             	add    $0x1,%ebx
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     3bf:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     3c3:	74 77                	je     43c <gettoken+0xe0>
    *eq = s;
     3c5:	8b 45 14             	mov    0x14(%ebp),%eax
     3c8:	89 18                	mov    %ebx,(%eax)
     3ca:	eb 70                	jmp    43c <gettoken+0xe0>
  switch(*s){
     3cc:	3c 3e                	cmp    $0x3e,%al
     3ce:	75 0d                	jne    3dd <gettoken+0x81>
    s++;
     3d0:	8d 43 01             	lea    0x1(%ebx),%eax
    if(*s == '>'){
     3d3:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
     3d7:	74 0a                	je     3e3 <gettoken+0x87>
    s++;
     3d9:	89 c3                	mov    %eax,%ebx
     3db:	eb e2                	jmp    3bf <gettoken+0x63>
  switch(*s){
     3dd:	3c 7c                	cmp    $0x7c,%al
     3df:	75 0f                	jne    3f0 <gettoken+0x94>
     3e1:	eb d9                	jmp    3bc <gettoken+0x60>
      s++;
     3e3:	83 c3 02             	add    $0x2,%ebx
      ret = '+';
     3e6:	bf 2b 00 00 00       	mov    $0x2b,%edi
     3eb:	eb d2                	jmp    3bf <gettoken+0x63>
      s++;
     3ed:	83 c3 01             	add    $0x1,%ebx
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     3f0:	39 f3                	cmp    %esi,%ebx
     3f2:	73 37                	jae    42b <gettoken+0xcf>
     3f4:	83 ec 08             	sub    $0x8,%esp
     3f7:	0f be 03             	movsbl (%ebx),%eax
     3fa:	50                   	push   %eax
     3fb:	68 3c 18 00 00       	push   $0x183c
     400:	e8 81 06 00 00       	call   a86 <strchr>
     405:	83 c4 10             	add    $0x10,%esp
     408:	85 c0                	test   %eax,%eax
     40a:	75 26                	jne    432 <gettoken+0xd6>
     40c:	83 ec 08             	sub    $0x8,%esp
     40f:	0f be 03             	movsbl (%ebx),%eax
     412:	50                   	push   %eax
     413:	68 34 18 00 00       	push   $0x1834
     418:	e8 69 06 00 00       	call   a86 <strchr>
     41d:	83 c4 10             	add    $0x10,%esp
     420:	85 c0                	test   %eax,%eax
     422:	74 c9                	je     3ed <gettoken+0x91>
    ret = 'a';
     424:	bf 61 00 00 00       	mov    $0x61,%edi
     429:	eb 94                	jmp    3bf <gettoken+0x63>
     42b:	bf 61 00 00 00       	mov    $0x61,%edi
     430:	eb 8d                	jmp    3bf <gettoken+0x63>
     432:	bf 61 00 00 00       	mov    $0x61,%edi
     437:	eb 86                	jmp    3bf <gettoken+0x63>

  while(s < es && strchr(whitespace, *s))
    s++;
     439:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     43c:	39 f3                	cmp    %esi,%ebx
     43e:	73 18                	jae    458 <gettoken+0xfc>
     440:	83 ec 08             	sub    $0x8,%esp
     443:	0f be 03             	movsbl (%ebx),%eax
     446:	50                   	push   %eax
     447:	68 3c 18 00 00       	push   $0x183c
     44c:	e8 35 06 00 00       	call   a86 <strchr>
     451:	83 c4 10             	add    $0x10,%esp
     454:	85 c0                	test   %eax,%eax
     456:	75 e1                	jne    439 <gettoken+0xdd>
  *ps = s;
     458:	8b 45 08             	mov    0x8(%ebp),%eax
     45b:	89 18                	mov    %ebx,(%eax)
  return ret;
}
     45d:	89 f8                	mov    %edi,%eax
     45f:	8d 65 f4             	lea    -0xc(%ebp),%esp
     462:	5b                   	pop    %ebx
     463:	5e                   	pop    %esi
     464:	5f                   	pop    %edi
     465:	5d                   	pop    %ebp
     466:	c3                   	ret    

00000467 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     467:	f3 0f 1e fb          	endbr32 
     46b:	55                   	push   %ebp
     46c:	89 e5                	mov    %esp,%ebp
     46e:	57                   	push   %edi
     46f:	56                   	push   %esi
     470:	53                   	push   %ebx
     471:	83 ec 0c             	sub    $0xc,%esp
     474:	8b 7d 08             	mov    0x8(%ebp),%edi
     477:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     47a:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     47c:	39 f3                	cmp    %esi,%ebx
     47e:	73 1d                	jae    49d <peek+0x36>
     480:	83 ec 08             	sub    $0x8,%esp
     483:	0f be 03             	movsbl (%ebx),%eax
     486:	50                   	push   %eax
     487:	68 3c 18 00 00       	push   $0x183c
     48c:	e8 f5 05 00 00       	call   a86 <strchr>
     491:	83 c4 10             	add    $0x10,%esp
     494:	85 c0                	test   %eax,%eax
     496:	74 05                	je     49d <peek+0x36>
    s++;
     498:	83 c3 01             	add    $0x1,%ebx
     49b:	eb df                	jmp    47c <peek+0x15>
  *ps = s;
     49d:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     49f:	0f b6 03             	movzbl (%ebx),%eax
     4a2:	84 c0                	test   %al,%al
     4a4:	75 0d                	jne    4b3 <peek+0x4c>
     4a6:	b8 00 00 00 00       	mov    $0x0,%eax
}
     4ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4ae:	5b                   	pop    %ebx
     4af:	5e                   	pop    %esi
     4b0:	5f                   	pop    %edi
     4b1:	5d                   	pop    %ebp
     4b2:	c3                   	ret    
  return *s && strchr(toks, *s);
     4b3:	83 ec 08             	sub    $0x8,%esp
     4b6:	0f be c0             	movsbl %al,%eax
     4b9:	50                   	push   %eax
     4ba:	ff 75 10             	pushl  0x10(%ebp)
     4bd:	e8 c4 05 00 00       	call   a86 <strchr>
     4c2:	83 c4 10             	add    $0x10,%esp
     4c5:	85 c0                	test   %eax,%eax
     4c7:	74 07                	je     4d0 <peek+0x69>
     4c9:	b8 01 00 00 00       	mov    $0x1,%eax
     4ce:	eb db                	jmp    4ab <peek+0x44>
     4d0:	b8 00 00 00 00       	mov    $0x0,%eax
     4d5:	eb d4                	jmp    4ab <peek+0x44>

000004d7 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     4d7:	f3 0f 1e fb          	endbr32 
     4db:	55                   	push   %ebp
     4dc:	89 e5                	mov    %esp,%ebp
     4de:	57                   	push   %edi
     4df:	56                   	push   %esi
     4e0:	53                   	push   %ebx
     4e1:	83 ec 1c             	sub    $0x1c,%esp
     4e4:	8b 7d 0c             	mov    0xc(%ebp),%edi
     4e7:	8b 75 10             	mov    0x10(%ebp),%esi
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     4ea:	eb 28                	jmp    514 <parseredirs+0x3d>
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     4ec:	83 ec 0c             	sub    $0xc,%esp
     4ef:	68 4c 11 00 00       	push   $0x114c
     4f4:	e8 56 fb ff ff       	call   4f <panic>
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     4f9:	83 ec 0c             	sub    $0xc,%esp
     4fc:	6a 00                	push   $0x0
     4fe:	6a 00                	push   $0x0
     500:	ff 75 e0             	pushl  -0x20(%ebp)
     503:	ff 75 e4             	pushl  -0x1c(%ebp)
     506:	ff 75 08             	pushl  0x8(%ebp)
     509:	e8 5a fd ff ff       	call   268 <redircmd>
     50e:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     511:	83 c4 20             	add    $0x20,%esp
  while(peek(ps, es, "<>")){
     514:	83 ec 04             	sub    $0x4,%esp
     517:	68 69 11 00 00       	push   $0x1169
     51c:	56                   	push   %esi
     51d:	57                   	push   %edi
     51e:	e8 44 ff ff ff       	call   467 <peek>
     523:	83 c4 10             	add    $0x10,%esp
     526:	85 c0                	test   %eax,%eax
     528:	74 76                	je     5a0 <parseredirs+0xc9>
    tok = gettoken(ps, es, 0, 0);
     52a:	6a 00                	push   $0x0
     52c:	6a 00                	push   $0x0
     52e:	56                   	push   %esi
     52f:	57                   	push   %edi
     530:	e8 27 fe ff ff       	call   35c <gettoken>
     535:	89 c3                	mov    %eax,%ebx
    if(gettoken(ps, es, &q, &eq) != 'a')
     537:	8d 45 e0             	lea    -0x20(%ebp),%eax
     53a:	50                   	push   %eax
     53b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     53e:	50                   	push   %eax
     53f:	56                   	push   %esi
     540:	57                   	push   %edi
     541:	e8 16 fe ff ff       	call   35c <gettoken>
     546:	83 c4 20             	add    $0x20,%esp
     549:	83 f8 61             	cmp    $0x61,%eax
     54c:	75 9e                	jne    4ec <parseredirs+0x15>
    switch(tok){
     54e:	83 fb 3c             	cmp    $0x3c,%ebx
     551:	74 a6                	je     4f9 <parseredirs+0x22>
     553:	83 fb 3e             	cmp    $0x3e,%ebx
     556:	74 25                	je     57d <parseredirs+0xa6>
     558:	83 fb 2b             	cmp    $0x2b,%ebx
     55b:	75 b7                	jne    514 <parseredirs+0x3d>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     55d:	83 ec 0c             	sub    $0xc,%esp
     560:	6a 01                	push   $0x1
     562:	68 01 02 00 00       	push   $0x201
     567:	ff 75 e0             	pushl  -0x20(%ebp)
     56a:	ff 75 e4             	pushl  -0x1c(%ebp)
     56d:	ff 75 08             	pushl  0x8(%ebp)
     570:	e8 f3 fc ff ff       	call   268 <redircmd>
     575:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     578:	83 c4 20             	add    $0x20,%esp
     57b:	eb 97                	jmp    514 <parseredirs+0x3d>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     57d:	83 ec 0c             	sub    $0xc,%esp
     580:	6a 01                	push   $0x1
     582:	68 01 02 00 00       	push   $0x201
     587:	ff 75 e0             	pushl  -0x20(%ebp)
     58a:	ff 75 e4             	pushl  -0x1c(%ebp)
     58d:	ff 75 08             	pushl  0x8(%ebp)
     590:	e8 d3 fc ff ff       	call   268 <redircmd>
     595:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     598:	83 c4 20             	add    $0x20,%esp
     59b:	e9 74 ff ff ff       	jmp    514 <parseredirs+0x3d>
    }
  }
  return cmd;
}
     5a0:	8b 45 08             	mov    0x8(%ebp),%eax
     5a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5a6:	5b                   	pop    %ebx
     5a7:	5e                   	pop    %esi
     5a8:	5f                   	pop    %edi
     5a9:	5d                   	pop    %ebp
     5aa:	c3                   	ret    

000005ab <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     5ab:	f3 0f 1e fb          	endbr32 
     5af:	55                   	push   %ebp
     5b0:	89 e5                	mov    %esp,%ebp
     5b2:	57                   	push   %edi
     5b3:	56                   	push   %esi
     5b4:	53                   	push   %ebx
     5b5:	83 ec 30             	sub    $0x30,%esp
     5b8:	8b 75 08             	mov    0x8(%ebp),%esi
     5bb:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     5be:	68 6c 11 00 00       	push   $0x116c
     5c3:	57                   	push   %edi
     5c4:	56                   	push   %esi
     5c5:	e8 9d fe ff ff       	call   467 <peek>
     5ca:	83 c4 10             	add    $0x10,%esp
     5cd:	85 c0                	test   %eax,%eax
     5cf:	75 1d                	jne    5ee <parseexec+0x43>
     5d1:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     5d3:	e8 62 fc ff ff       	call   23a <execcmd>
     5d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     5db:	83 ec 04             	sub    $0x4,%esp
     5de:	57                   	push   %edi
     5df:	56                   	push   %esi
     5e0:	50                   	push   %eax
     5e1:	e8 f1 fe ff ff       	call   4d7 <parseredirs>
     5e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     5e9:	83 c4 10             	add    $0x10,%esp
     5ec:	eb 3b                	jmp    629 <parseexec+0x7e>
    return parseblock(ps, es);
     5ee:	83 ec 08             	sub    $0x8,%esp
     5f1:	57                   	push   %edi
     5f2:	56                   	push   %esi
     5f3:	e8 97 01 00 00       	call   78f <parseblock>
     5f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     5fb:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     5fe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     601:	8d 65 f4             	lea    -0xc(%ebp),%esp
     604:	5b                   	pop    %ebx
     605:	5e                   	pop    %esi
     606:	5f                   	pop    %edi
     607:	5d                   	pop    %ebp
     608:	c3                   	ret    
      panic("syntax");
     609:	83 ec 0c             	sub    $0xc,%esp
     60c:	68 6e 11 00 00       	push   $0x116e
     611:	e8 39 fa ff ff       	call   4f <panic>
    ret = parseredirs(ret, ps, es);
     616:	83 ec 04             	sub    $0x4,%esp
     619:	57                   	push   %edi
     61a:	56                   	push   %esi
     61b:	ff 75 d4             	pushl  -0x2c(%ebp)
     61e:	e8 b4 fe ff ff       	call   4d7 <parseredirs>
     623:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     626:	83 c4 10             	add    $0x10,%esp
  while(!peek(ps, es, "|)&;")){
     629:	83 ec 04             	sub    $0x4,%esp
     62c:	68 83 11 00 00       	push   $0x1183
     631:	57                   	push   %edi
     632:	56                   	push   %esi
     633:	e8 2f fe ff ff       	call   467 <peek>
     638:	83 c4 10             	add    $0x10,%esp
     63b:	85 c0                	test   %eax,%eax
     63d:	75 41                	jne    680 <parseexec+0xd5>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     63f:	8d 45 e0             	lea    -0x20(%ebp),%eax
     642:	50                   	push   %eax
     643:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     646:	50                   	push   %eax
     647:	57                   	push   %edi
     648:	56                   	push   %esi
     649:	e8 0e fd ff ff       	call   35c <gettoken>
     64e:	83 c4 10             	add    $0x10,%esp
     651:	85 c0                	test   %eax,%eax
     653:	74 2b                	je     680 <parseexec+0xd5>
    if(tok != 'a')
     655:	83 f8 61             	cmp    $0x61,%eax
     658:	75 af                	jne    609 <parseexec+0x5e>
    cmd->argv[argc] = q;
     65a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     65d:	8b 55 d0             	mov    -0x30(%ebp),%edx
     660:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     664:	8b 45 e0             	mov    -0x20(%ebp),%eax
     667:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     66b:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     66e:	83 fb 09             	cmp    $0x9,%ebx
     671:	7e a3                	jle    616 <parseexec+0x6b>
      panic("too many args");
     673:	83 ec 0c             	sub    $0xc,%esp
     676:	68 75 11 00 00       	push   $0x1175
     67b:	e8 cf f9 ff ff       	call   4f <panic>
  cmd->argv[argc] = 0;
     680:	8b 45 d0             	mov    -0x30(%ebp),%eax
     683:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     68a:	00 
  cmd->eargv[argc] = 0;
     68b:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     692:	00 
  return ret;
     693:	e9 66 ff ff ff       	jmp    5fe <parseexec+0x53>

00000698 <parsepipe>:
{
     698:	f3 0f 1e fb          	endbr32 
     69c:	55                   	push   %ebp
     69d:	89 e5                	mov    %esp,%ebp
     69f:	57                   	push   %edi
     6a0:	56                   	push   %esi
     6a1:	53                   	push   %ebx
     6a2:	83 ec 14             	sub    $0x14,%esp
     6a5:	8b 75 08             	mov    0x8(%ebp),%esi
     6a8:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     6ab:	57                   	push   %edi
     6ac:	56                   	push   %esi
     6ad:	e8 f9 fe ff ff       	call   5ab <parseexec>
     6b2:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     6b4:	83 c4 0c             	add    $0xc,%esp
     6b7:	68 88 11 00 00       	push   $0x1188
     6bc:	57                   	push   %edi
     6bd:	56                   	push   %esi
     6be:	e8 a4 fd ff ff       	call   467 <peek>
     6c3:	83 c4 10             	add    $0x10,%esp
     6c6:	85 c0                	test   %eax,%eax
     6c8:	75 0a                	jne    6d4 <parsepipe+0x3c>
}
     6ca:	89 d8                	mov    %ebx,%eax
     6cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6cf:	5b                   	pop    %ebx
     6d0:	5e                   	pop    %esi
     6d1:	5f                   	pop    %edi
     6d2:	5d                   	pop    %ebp
     6d3:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     6d4:	6a 00                	push   $0x0
     6d6:	6a 00                	push   $0x0
     6d8:	57                   	push   %edi
     6d9:	56                   	push   %esi
     6da:	e8 7d fc ff ff       	call   35c <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     6df:	83 c4 08             	add    $0x8,%esp
     6e2:	57                   	push   %edi
     6e3:	56                   	push   %esi
     6e4:	e8 af ff ff ff       	call   698 <parsepipe>
     6e9:	83 c4 08             	add    $0x8,%esp
     6ec:	50                   	push   %eax
     6ed:	53                   	push   %ebx
     6ee:	e8 c1 fb ff ff       	call   2b4 <pipecmd>
     6f3:	89 c3                	mov    %eax,%ebx
     6f5:	83 c4 10             	add    $0x10,%esp
  return cmd;
     6f8:	eb d0                	jmp    6ca <parsepipe+0x32>

000006fa <parseline>:
{
     6fa:	f3 0f 1e fb          	endbr32 
     6fe:	55                   	push   %ebp
     6ff:	89 e5                	mov    %esp,%ebp
     701:	57                   	push   %edi
     702:	56                   	push   %esi
     703:	53                   	push   %ebx
     704:	83 ec 14             	sub    $0x14,%esp
     707:	8b 75 08             	mov    0x8(%ebp),%esi
     70a:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     70d:	57                   	push   %edi
     70e:	56                   	push   %esi
     70f:	e8 84 ff ff ff       	call   698 <parsepipe>
     714:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     716:	83 c4 10             	add    $0x10,%esp
     719:	83 ec 04             	sub    $0x4,%esp
     71c:	68 8a 11 00 00       	push   $0x118a
     721:	57                   	push   %edi
     722:	56                   	push   %esi
     723:	e8 3f fd ff ff       	call   467 <peek>
     728:	83 c4 10             	add    $0x10,%esp
     72b:	85 c0                	test   %eax,%eax
     72d:	74 1a                	je     749 <parseline+0x4f>
    gettoken(ps, es, 0, 0);
     72f:	6a 00                	push   $0x0
     731:	6a 00                	push   $0x0
     733:	57                   	push   %edi
     734:	56                   	push   %esi
     735:	e8 22 fc ff ff       	call   35c <gettoken>
    cmd = backcmd(cmd);
     73a:	89 1c 24             	mov    %ebx,(%esp)
     73d:	e8 e6 fb ff ff       	call   328 <backcmd>
     742:	89 c3                	mov    %eax,%ebx
     744:	83 c4 10             	add    $0x10,%esp
     747:	eb d0                	jmp    719 <parseline+0x1f>
  if(peek(ps, es, ";")){
     749:	83 ec 04             	sub    $0x4,%esp
     74c:	68 86 11 00 00       	push   $0x1186
     751:	57                   	push   %edi
     752:	56                   	push   %esi
     753:	e8 0f fd ff ff       	call   467 <peek>
     758:	83 c4 10             	add    $0x10,%esp
     75b:	85 c0                	test   %eax,%eax
     75d:	75 0a                	jne    769 <parseline+0x6f>
}
     75f:	89 d8                	mov    %ebx,%eax
     761:	8d 65 f4             	lea    -0xc(%ebp),%esp
     764:	5b                   	pop    %ebx
     765:	5e                   	pop    %esi
     766:	5f                   	pop    %edi
     767:	5d                   	pop    %ebp
     768:	c3                   	ret    
    gettoken(ps, es, 0, 0);
     769:	6a 00                	push   $0x0
     76b:	6a 00                	push   $0x0
     76d:	57                   	push   %edi
     76e:	56                   	push   %esi
     76f:	e8 e8 fb ff ff       	call   35c <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     774:	83 c4 08             	add    $0x8,%esp
     777:	57                   	push   %edi
     778:	56                   	push   %esi
     779:	e8 7c ff ff ff       	call   6fa <parseline>
     77e:	83 c4 08             	add    $0x8,%esp
     781:	50                   	push   %eax
     782:	53                   	push   %ebx
     783:	e8 66 fb ff ff       	call   2ee <listcmd>
     788:	89 c3                	mov    %eax,%ebx
     78a:	83 c4 10             	add    $0x10,%esp
  return cmd;
     78d:	eb d0                	jmp    75f <parseline+0x65>

0000078f <parseblock>:
{
     78f:	f3 0f 1e fb          	endbr32 
     793:	55                   	push   %ebp
     794:	89 e5                	mov    %esp,%ebp
     796:	57                   	push   %edi
     797:	56                   	push   %esi
     798:	53                   	push   %ebx
     799:	83 ec 10             	sub    $0x10,%esp
     79c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     79f:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     7a2:	68 6c 11 00 00       	push   $0x116c
     7a7:	56                   	push   %esi
     7a8:	53                   	push   %ebx
     7a9:	e8 b9 fc ff ff       	call   467 <peek>
     7ae:	83 c4 10             	add    $0x10,%esp
     7b1:	85 c0                	test   %eax,%eax
     7b3:	74 4b                	je     800 <parseblock+0x71>
  gettoken(ps, es, 0, 0);
     7b5:	6a 00                	push   $0x0
     7b7:	6a 00                	push   $0x0
     7b9:	56                   	push   %esi
     7ba:	53                   	push   %ebx
     7bb:	e8 9c fb ff ff       	call   35c <gettoken>
  cmd = parseline(ps, es);
     7c0:	83 c4 08             	add    $0x8,%esp
     7c3:	56                   	push   %esi
     7c4:	53                   	push   %ebx
     7c5:	e8 30 ff ff ff       	call   6fa <parseline>
     7ca:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     7cc:	83 c4 0c             	add    $0xc,%esp
     7cf:	68 a8 11 00 00       	push   $0x11a8
     7d4:	56                   	push   %esi
     7d5:	53                   	push   %ebx
     7d6:	e8 8c fc ff ff       	call   467 <peek>
     7db:	83 c4 10             	add    $0x10,%esp
     7de:	85 c0                	test   %eax,%eax
     7e0:	74 2b                	je     80d <parseblock+0x7e>
  gettoken(ps, es, 0, 0);
     7e2:	6a 00                	push   $0x0
     7e4:	6a 00                	push   $0x0
     7e6:	56                   	push   %esi
     7e7:	53                   	push   %ebx
     7e8:	e8 6f fb ff ff       	call   35c <gettoken>
  cmd = parseredirs(cmd, ps, es);
     7ed:	83 c4 0c             	add    $0xc,%esp
     7f0:	56                   	push   %esi
     7f1:	53                   	push   %ebx
     7f2:	57                   	push   %edi
     7f3:	e8 df fc ff ff       	call   4d7 <parseredirs>
}
     7f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7fb:	5b                   	pop    %ebx
     7fc:	5e                   	pop    %esi
     7fd:	5f                   	pop    %edi
     7fe:	5d                   	pop    %ebp
     7ff:	c3                   	ret    
    panic("parseblock");
     800:	83 ec 0c             	sub    $0xc,%esp
     803:	68 8c 11 00 00       	push   $0x118c
     808:	e8 42 f8 ff ff       	call   4f <panic>
    panic("syntax - missing )");
     80d:	83 ec 0c             	sub    $0xc,%esp
     810:	68 97 11 00 00       	push   $0x1197
     815:	e8 35 f8 ff ff       	call   4f <panic>

0000081a <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     81a:	f3 0f 1e fb          	endbr32 
     81e:	55                   	push   %ebp
     81f:	89 e5                	mov    %esp,%ebp
     821:	53                   	push   %ebx
     822:	83 ec 04             	sub    $0x4,%esp
     825:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     828:	85 db                	test   %ebx,%ebx
     82a:	74 3b                	je     867 <nulterminate+0x4d>
    return 0;

  switch(cmd->type){
     82c:	8b 03                	mov    (%ebx),%eax
     82e:	83 f8 05             	cmp    $0x5,%eax
     831:	77 34                	ja     867 <nulterminate+0x4d>
     833:	3e ff 24 85 e8 11 00 	notrack jmp *0x11e8(,%eax,4)
     83a:	00 
     83b:	b8 00 00 00 00       	mov    $0x0,%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     840:	83 7c 83 04 00       	cmpl   $0x0,0x4(%ebx,%eax,4)
     845:	74 20                	je     867 <nulterminate+0x4d>
      *ecmd->eargv[i] = 0;
     847:	8b 54 83 2c          	mov    0x2c(%ebx,%eax,4),%edx
     84b:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     84e:	83 c0 01             	add    $0x1,%eax
     851:	eb ed                	jmp    840 <nulterminate+0x26>
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     853:	83 ec 0c             	sub    $0xc,%esp
     856:	ff 73 04             	pushl  0x4(%ebx)
     859:	e8 bc ff ff ff       	call   81a <nulterminate>
    *rcmd->efile = 0;
     85e:	8b 43 0c             	mov    0xc(%ebx),%eax
     861:	c6 00 00             	movb   $0x0,(%eax)
    break;
     864:	83 c4 10             	add    $0x10,%esp
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     867:	89 d8                	mov    %ebx,%eax
     869:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     86c:	c9                   	leave  
     86d:	c3                   	ret    
    nulterminate(pcmd->left);
     86e:	83 ec 0c             	sub    $0xc,%esp
     871:	ff 73 04             	pushl  0x4(%ebx)
     874:	e8 a1 ff ff ff       	call   81a <nulterminate>
    nulterminate(pcmd->right);
     879:	83 c4 04             	add    $0x4,%esp
     87c:	ff 73 08             	pushl  0x8(%ebx)
     87f:	e8 96 ff ff ff       	call   81a <nulterminate>
    break;
     884:	83 c4 10             	add    $0x10,%esp
     887:	eb de                	jmp    867 <nulterminate+0x4d>
    nulterminate(lcmd->left);
     889:	83 ec 0c             	sub    $0xc,%esp
     88c:	ff 73 04             	pushl  0x4(%ebx)
     88f:	e8 86 ff ff ff       	call   81a <nulterminate>
    nulterminate(lcmd->right);
     894:	83 c4 04             	add    $0x4,%esp
     897:	ff 73 08             	pushl  0x8(%ebx)
     89a:	e8 7b ff ff ff       	call   81a <nulterminate>
    break;
     89f:	83 c4 10             	add    $0x10,%esp
     8a2:	eb c3                	jmp    867 <nulterminate+0x4d>
    nulterminate(bcmd->cmd);
     8a4:	83 ec 0c             	sub    $0xc,%esp
     8a7:	ff 73 04             	pushl  0x4(%ebx)
     8aa:	e8 6b ff ff ff       	call   81a <nulterminate>
    break;
     8af:	83 c4 10             	add    $0x10,%esp
     8b2:	eb b3                	jmp    867 <nulterminate+0x4d>

000008b4 <parsecmd>:
{
     8b4:	f3 0f 1e fb          	endbr32 
     8b8:	55                   	push   %ebp
     8b9:	89 e5                	mov    %esp,%ebp
     8bb:	56                   	push   %esi
     8bc:	53                   	push   %ebx
  es = s + strlen(s);
     8bd:	8b 5d 08             	mov    0x8(%ebp),%ebx
     8c0:	83 ec 0c             	sub    $0xc,%esp
     8c3:	53                   	push   %ebx
     8c4:	e8 86 01 00 00       	call   a4f <strlen>
     8c9:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     8cb:	83 c4 08             	add    $0x8,%esp
     8ce:	53                   	push   %ebx
     8cf:	8d 45 08             	lea    0x8(%ebp),%eax
     8d2:	50                   	push   %eax
     8d3:	e8 22 fe ff ff       	call   6fa <parseline>
     8d8:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     8da:	83 c4 0c             	add    $0xc,%esp
     8dd:	68 36 11 00 00       	push   $0x1136
     8e2:	53                   	push   %ebx
     8e3:	8d 45 08             	lea    0x8(%ebp),%eax
     8e6:	50                   	push   %eax
     8e7:	e8 7b fb ff ff       	call   467 <peek>
  if(s != es){
     8ec:	8b 45 08             	mov    0x8(%ebp),%eax
     8ef:	83 c4 10             	add    $0x10,%esp
     8f2:	39 d8                	cmp    %ebx,%eax
     8f4:	75 12                	jne    908 <parsecmd+0x54>
  nulterminate(cmd);
     8f6:	83 ec 0c             	sub    $0xc,%esp
     8f9:	56                   	push   %esi
     8fa:	e8 1b ff ff ff       	call   81a <nulterminate>
}
     8ff:	89 f0                	mov    %esi,%eax
     901:	8d 65 f8             	lea    -0x8(%ebp),%esp
     904:	5b                   	pop    %ebx
     905:	5e                   	pop    %esi
     906:	5d                   	pop    %ebp
     907:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     908:	83 ec 04             	sub    $0x4,%esp
     90b:	50                   	push   %eax
     90c:	68 aa 11 00 00       	push   $0x11aa
     911:	6a 02                	push   $0x2
     913:	e8 43 05 00 00       	call   e5b <printf>
    panic("syntax");
     918:	c7 04 24 6e 11 00 00 	movl   $0x116e,(%esp)
     91f:	e8 2b f7 ff ff       	call   4f <panic>

00000924 <main>:
{
     924:	f3 0f 1e fb          	endbr32 
     928:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     92c:	83 e4 f0             	and    $0xfffffff0,%esp
     92f:	ff 71 fc             	pushl  -0x4(%ecx)
     932:	55                   	push   %ebp
     933:	89 e5                	mov    %esp,%ebp
     935:	51                   	push   %ecx
     936:	83 ec 04             	sub    $0x4,%esp
  while((fd = open("console", O_RDWR)) >= 0){
     939:	83 ec 08             	sub    $0x8,%esp
     93c:	6a 02                	push   $0x2
     93e:	68 b9 11 00 00       	push   $0x11b9
     943:	e8 12 04 00 00       	call   d5a <open>
     948:	83 c4 10             	add    $0x10,%esp
     94b:	85 c0                	test   %eax,%eax
     94d:	78 21                	js     970 <main+0x4c>
    if(fd >= 3){
     94f:	83 f8 02             	cmp    $0x2,%eax
     952:	7e e5                	jle    939 <main+0x15>
      close(fd);
     954:	83 ec 0c             	sub    $0xc,%esp
     957:	50                   	push   %eax
     958:	e8 e5 03 00 00       	call   d42 <close>
      break;
     95d:	83 c4 10             	add    $0x10,%esp
     960:	eb 0e                	jmp    970 <main+0x4c>
    if(fork1() == 0)
     962:	e8 06 f7 ff ff       	call   6d <fork1>
     967:	85 c0                	test   %eax,%eax
     969:	74 76                	je     9e1 <main+0xbd>
    wait();
     96b:	e8 aa 03 00 00       	call   d1a <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     970:	83 ec 08             	sub    $0x8,%esp
     973:	6a 64                	push   $0x64
     975:	68 60 18 00 00       	push   $0x1860
     97a:	e8 81 f6 ff ff       	call   0 <getcmd>
     97f:	83 c4 10             	add    $0x10,%esp
     982:	85 c0                	test   %eax,%eax
     984:	78 70                	js     9f6 <main+0xd2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     986:	80 3d 60 18 00 00 63 	cmpb   $0x63,0x1860
     98d:	75 d3                	jne    962 <main+0x3e>
     98f:	80 3d 61 18 00 00 64 	cmpb   $0x64,0x1861
     996:	75 ca                	jne    962 <main+0x3e>
     998:	80 3d 62 18 00 00 20 	cmpb   $0x20,0x1862
     99f:	75 c1                	jne    962 <main+0x3e>
      buf[strlen(buf)-1] = 0;  // chop \n
     9a1:	83 ec 0c             	sub    $0xc,%esp
     9a4:	68 60 18 00 00       	push   $0x1860
     9a9:	e8 a1 00 00 00       	call   a4f <strlen>
     9ae:	c6 80 5f 18 00 00 00 	movb   $0x0,0x185f(%eax)
      if(chdir(buf+3) < 0)
     9b5:	c7 04 24 63 18 00 00 	movl   $0x1863,(%esp)
     9bc:	e8 c9 03 00 00       	call   d8a <chdir>
     9c1:	83 c4 10             	add    $0x10,%esp
     9c4:	85 c0                	test   %eax,%eax
     9c6:	79 a8                	jns    970 <main+0x4c>
        printf(2, "cannot cd %s\n", buf+3);
     9c8:	83 ec 04             	sub    $0x4,%esp
     9cb:	68 63 18 00 00       	push   $0x1863
     9d0:	68 c1 11 00 00       	push   $0x11c1
     9d5:	6a 02                	push   $0x2
     9d7:	e8 7f 04 00 00       	call   e5b <printf>
     9dc:	83 c4 10             	add    $0x10,%esp
      continue;
     9df:	eb 8f                	jmp    970 <main+0x4c>
      runcmd(parsecmd(buf));
     9e1:	83 ec 0c             	sub    $0xc,%esp
     9e4:	68 60 18 00 00       	push   $0x1860
     9e9:	e8 c6 fe ff ff       	call   8b4 <parsecmd>
     9ee:	89 04 24             	mov    %eax,(%esp)
     9f1:	e8 9a f6 ff ff       	call   90 <runcmd>
  exit();
     9f6:	e8 17 03 00 00       	call   d12 <exit>

000009fb <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
     9fb:	f3 0f 1e fb          	endbr32 
     9ff:	55                   	push   %ebp
     a00:	89 e5                	mov    %esp,%ebp
     a02:	56                   	push   %esi
     a03:	53                   	push   %ebx
     a04:	8b 75 08             	mov    0x8(%ebp),%esi
     a07:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     a0a:	89 f0                	mov    %esi,%eax
     a0c:	89 d1                	mov    %edx,%ecx
     a0e:	83 c2 01             	add    $0x1,%edx
     a11:	89 c3                	mov    %eax,%ebx
     a13:	83 c0 01             	add    $0x1,%eax
     a16:	0f b6 09             	movzbl (%ecx),%ecx
     a19:	88 0b                	mov    %cl,(%ebx)
     a1b:	84 c9                	test   %cl,%cl
     a1d:	75 ed                	jne    a0c <strcpy+0x11>
    ;
  return os;
}
     a1f:	89 f0                	mov    %esi,%eax
     a21:	5b                   	pop    %ebx
     a22:	5e                   	pop    %esi
     a23:	5d                   	pop    %ebp
     a24:	c3                   	ret    

00000a25 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a25:	f3 0f 1e fb          	endbr32 
     a29:	55                   	push   %ebp
     a2a:	89 e5                	mov    %esp,%ebp
     a2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
     a2f:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
     a32:	0f b6 01             	movzbl (%ecx),%eax
     a35:	84 c0                	test   %al,%al
     a37:	74 0c                	je     a45 <strcmp+0x20>
     a39:	3a 02                	cmp    (%edx),%al
     a3b:	75 08                	jne    a45 <strcmp+0x20>
    p++, q++;
     a3d:	83 c1 01             	add    $0x1,%ecx
     a40:	83 c2 01             	add    $0x1,%edx
     a43:	eb ed                	jmp    a32 <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
     a45:	0f b6 c0             	movzbl %al,%eax
     a48:	0f b6 12             	movzbl (%edx),%edx
     a4b:	29 d0                	sub    %edx,%eax
}
     a4d:	5d                   	pop    %ebp
     a4e:	c3                   	ret    

00000a4f <strlen>:

uint
strlen(const char *s)
{
     a4f:	f3 0f 1e fb          	endbr32 
     a53:	55                   	push   %ebp
     a54:	89 e5                	mov    %esp,%ebp
     a56:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     a59:	b8 00 00 00 00       	mov    $0x0,%eax
     a5e:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
     a62:	74 05                	je     a69 <strlen+0x1a>
     a64:	83 c0 01             	add    $0x1,%eax
     a67:	eb f5                	jmp    a5e <strlen+0xf>
    ;
  return n;
}
     a69:	5d                   	pop    %ebp
     a6a:	c3                   	ret    

00000a6b <memset>:

void*
memset(void *dst, int c, uint n)
{
     a6b:	f3 0f 1e fb          	endbr32 
     a6f:	55                   	push   %ebp
     a70:	89 e5                	mov    %esp,%ebp
     a72:	57                   	push   %edi
     a73:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     a76:	89 d7                	mov    %edx,%edi
     a78:	8b 4d 10             	mov    0x10(%ebp),%ecx
     a7b:	8b 45 0c             	mov    0xc(%ebp),%eax
     a7e:	fc                   	cld    
     a7f:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     a81:	89 d0                	mov    %edx,%eax
     a83:	5f                   	pop    %edi
     a84:	5d                   	pop    %ebp
     a85:	c3                   	ret    

00000a86 <strchr>:

char*
strchr(const char *s, char c)
{
     a86:	f3 0f 1e fb          	endbr32 
     a8a:	55                   	push   %ebp
     a8b:	89 e5                	mov    %esp,%ebp
     a8d:	8b 45 08             	mov    0x8(%ebp),%eax
     a90:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     a94:	0f b6 10             	movzbl (%eax),%edx
     a97:	84 d2                	test   %dl,%dl
     a99:	74 09                	je     aa4 <strchr+0x1e>
    if(*s == c)
     a9b:	38 ca                	cmp    %cl,%dl
     a9d:	74 0a                	je     aa9 <strchr+0x23>
  for(; *s; s++)
     a9f:	83 c0 01             	add    $0x1,%eax
     aa2:	eb f0                	jmp    a94 <strchr+0xe>
      return (char*)s;
  return 0;
     aa4:	b8 00 00 00 00       	mov    $0x0,%eax
}
     aa9:	5d                   	pop    %ebp
     aaa:	c3                   	ret    

00000aab <gets>:

char*
gets(char *buf, int max)
{
     aab:	f3 0f 1e fb          	endbr32 
     aaf:	55                   	push   %ebp
     ab0:	89 e5                	mov    %esp,%ebp
     ab2:	57                   	push   %edi
     ab3:	56                   	push   %esi
     ab4:	53                   	push   %ebx
     ab5:	83 ec 1c             	sub    $0x1c,%esp
     ab8:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     abb:	bb 00 00 00 00       	mov    $0x0,%ebx
     ac0:	89 de                	mov    %ebx,%esi
     ac2:	83 c3 01             	add    $0x1,%ebx
     ac5:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     ac8:	7d 2e                	jge    af8 <gets+0x4d>
    cc = read(0, &c, 1);
     aca:	83 ec 04             	sub    $0x4,%esp
     acd:	6a 01                	push   $0x1
     acf:	8d 45 e7             	lea    -0x19(%ebp),%eax
     ad2:	50                   	push   %eax
     ad3:	6a 00                	push   $0x0
     ad5:	e8 58 02 00 00       	call   d32 <read>
    if(cc < 1)
     ada:	83 c4 10             	add    $0x10,%esp
     add:	85 c0                	test   %eax,%eax
     adf:	7e 17                	jle    af8 <gets+0x4d>
      break;
    buf[i++] = c;
     ae1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     ae5:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
     ae8:	3c 0a                	cmp    $0xa,%al
     aea:	0f 94 c2             	sete   %dl
     aed:	3c 0d                	cmp    $0xd,%al
     aef:	0f 94 c0             	sete   %al
     af2:	08 c2                	or     %al,%dl
     af4:	74 ca                	je     ac0 <gets+0x15>
    buf[i++] = c;
     af6:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
     af8:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
     afc:	89 f8                	mov    %edi,%eax
     afe:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b01:	5b                   	pop    %ebx
     b02:	5e                   	pop    %esi
     b03:	5f                   	pop    %edi
     b04:	5d                   	pop    %ebp
     b05:	c3                   	ret    

00000b06 <stat>:

int
stat(const char *n, struct stat *st)
{
     b06:	f3 0f 1e fb          	endbr32 
     b0a:	55                   	push   %ebp
     b0b:	89 e5                	mov    %esp,%ebp
     b0d:	56                   	push   %esi
     b0e:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b0f:	83 ec 08             	sub    $0x8,%esp
     b12:	6a 00                	push   $0x0
     b14:	ff 75 08             	pushl  0x8(%ebp)
     b17:	e8 3e 02 00 00       	call   d5a <open>
  if(fd < 0)
     b1c:	83 c4 10             	add    $0x10,%esp
     b1f:	85 c0                	test   %eax,%eax
     b21:	78 24                	js     b47 <stat+0x41>
     b23:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     b25:	83 ec 08             	sub    $0x8,%esp
     b28:	ff 75 0c             	pushl  0xc(%ebp)
     b2b:	50                   	push   %eax
     b2c:	e8 41 02 00 00       	call   d72 <fstat>
     b31:	89 c6                	mov    %eax,%esi
  close(fd);
     b33:	89 1c 24             	mov    %ebx,(%esp)
     b36:	e8 07 02 00 00       	call   d42 <close>
  return r;
     b3b:	83 c4 10             	add    $0x10,%esp
}
     b3e:	89 f0                	mov    %esi,%eax
     b40:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b43:	5b                   	pop    %ebx
     b44:	5e                   	pop    %esi
     b45:	5d                   	pop    %ebp
     b46:	c3                   	ret    
    return -1;
     b47:	be ff ff ff ff       	mov    $0xffffffff,%esi
     b4c:	eb f0                	jmp    b3e <stat+0x38>

00000b4e <atoi>:

int
atoi(const char *s)
{
     b4e:	f3 0f 1e fb          	endbr32 
     b52:	55                   	push   %ebp
     b53:	89 e5                	mov    %esp,%ebp
     b55:	53                   	push   %ebx
     b56:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
     b59:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
     b5e:	0f b6 01             	movzbl (%ecx),%eax
     b61:	8d 58 d0             	lea    -0x30(%eax),%ebx
     b64:	80 fb 09             	cmp    $0x9,%bl
     b67:	77 12                	ja     b7b <atoi+0x2d>
    n = n*10 + *s++ - '0';
     b69:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
     b6c:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
     b6f:	83 c1 01             	add    $0x1,%ecx
     b72:	0f be c0             	movsbl %al,%eax
     b75:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
     b79:	eb e3                	jmp    b5e <atoi+0x10>
  return n;
}
     b7b:	89 d0                	mov    %edx,%eax
     b7d:	5b                   	pop    %ebx
     b7e:	5d                   	pop    %ebp
     b7f:	c3                   	ret    

00000b80 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     b80:	f3 0f 1e fb          	endbr32 
     b84:	55                   	push   %ebp
     b85:	89 e5                	mov    %esp,%ebp
     b87:	56                   	push   %esi
     b88:	53                   	push   %ebx
     b89:	8b 75 08             	mov    0x8(%ebp),%esi
     b8c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     b8f:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
     b92:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
     b94:	8d 58 ff             	lea    -0x1(%eax),%ebx
     b97:	85 c0                	test   %eax,%eax
     b99:	7e 0f                	jle    baa <memmove+0x2a>
    *dst++ = *src++;
     b9b:	0f b6 01             	movzbl (%ecx),%eax
     b9e:	88 02                	mov    %al,(%edx)
     ba0:	8d 49 01             	lea    0x1(%ecx),%ecx
     ba3:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
     ba6:	89 d8                	mov    %ebx,%eax
     ba8:	eb ea                	jmp    b94 <memmove+0x14>
  return vdst;
}
     baa:	89 f0                	mov    %esi,%eax
     bac:	5b                   	pop    %ebx
     bad:	5e                   	pop    %esi
     bae:	5d                   	pop    %ebp
     baf:	c3                   	ret    

00000bb0 <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
     bb0:	f3 0f 1e fb          	endbr32 
     bb4:	55                   	push   %ebp
     bb5:	89 e5                	mov    %esp,%ebp
     bb7:	53                   	push   %ebx
     bb8:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
     bbb:	68 00 20 00 00       	push   $0x2000
     bc0:	e8 c7 04 00 00       	call   108c <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
     bc5:	83 c4 10             	add    $0x10,%esp
     bc8:	89 c2                	mov    %eax,%edx
     bca:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
     bd0:	74 22                	je     bf4 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
     bd2:	b9 00 10 00 00       	mov    $0x1000,%ecx
     bd7:	29 d1                	sub    %edx,%ecx
     bd9:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
     bdb:	ba 00 00 00 00       	mov    $0x0,%edx
     be0:	83 fa 3f             	cmp    $0x3f,%edx
     be3:	7f 13                	jg     bf8 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
     be5:	83 3c 95 e0 1b 00 00 	cmpl   $0x1,0x1be0(,%edx,4)
     bec:	01 
     bed:	75 09                	jne    bf8 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
     bef:	83 c2 01             	add    $0x1,%edx
     bf2:	eb ec                	jmp    be0 <thread_create+0x30>
  void *user_stack = curr_ptr;
     bf4:	89 c1                	mov    %eax,%ecx
     bf6:	eb e3                	jmp    bdb <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
     bf8:	83 3c 95 e0 1b 00 00 	cmpl   $0x1,0x1be0(,%edx,4)
     bff:	01 
     c00:	74 34                	je     c36 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
     c02:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
     c05:	c1 e3 02             	shl    $0x2,%ebx
     c08:	89 83 e0 18 00 00    	mov    %eax,0x18e0(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
     c0e:	89 8b e4 18 00 00    	mov    %ecx,0x18e4(%ebx)
  cell_full[i] = 1;
     c14:	c7 04 95 e0 1b 00 00 	movl   $0x1,0x1be0(,%edx,4)
     c1b:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
     c1f:	ff 75 10             	pushl  0x10(%ebp)
     c22:	ff 75 0c             	pushl  0xc(%ebp)
     c25:	ff 75 08             	pushl  0x8(%ebp)
     c28:	51                   	push   %ecx
     c29:	e8 dc 00 00 00       	call   d0a <clone>
     c2e:	83 c4 10             	add    $0x10,%esp
}
     c31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c34:	c9                   	leave  
     c35:	c3                   	ret    
    return -1;
     c36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     c3b:	eb f4                	jmp    c31 <thread_create+0x81>

00000c3d <thread_join>:

int thread_join(){
     c3d:	f3 0f 1e fb          	endbr32 
     c41:	55                   	push   %ebp
     c42:	89 e5                	mov    %esp,%ebp
     c44:	56                   	push   %esi
     c45:	53                   	push   %ebx
     c46:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
     c49:	8d 45 f4             	lea    -0xc(%ebp),%eax
     c4c:	50                   	push   %eax
     c4d:	e8 d0 00 00 00       	call   d22 <join>
     c52:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
     c54:	83 c4 10             	add    $0x10,%esp
     c57:	bb 00 00 00 00       	mov    $0x0,%ebx
     c5c:	83 fb 3f             	cmp    $0x3f,%ebx
     c5f:	7f 14                	jg     c75 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
     c61:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
     c64:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c67:	39 14 85 e4 18 00 00 	cmp    %edx,0x18e4(,%eax,4)
     c6e:	74 05                	je     c75 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
     c70:	83 c3 01             	add    $0x1,%ebx
     c73:	eb e7                	jmp    c5c <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
     c75:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
     c78:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     c7b:	39 0c 85 e4 18 00 00 	cmp    %ecx,0x18e4(,%eax,4)
     c82:	75 26                	jne    caa <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
     c84:	83 ec 0c             	sub    $0xc,%esp
     c87:	ff 34 85 e0 18 00 00 	pushl  0x18e0(,%eax,4)
     c8e:	e8 35 03 00 00       	call   fc8 <free>
  cell_full[i] = 0;
     c93:	c7 04 9d e0 1b 00 00 	movl   $0x0,0x1be0(,%ebx,4)
     c9a:	00 00 00 00 

  return out;
     c9e:	83 c4 10             	add    $0x10,%esp
}
     ca1:	89 f0                	mov    %esi,%eax
     ca3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ca6:	5b                   	pop    %ebx
     ca7:	5e                   	pop    %esi
     ca8:	5d                   	pop    %ebp
     ca9:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
     caa:	be ff ff ff ff       	mov    $0xffffffff,%esi
     caf:	eb f0                	jmp    ca1 <thread_join+0x64>

00000cb1 <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
     cb1:	f3 0f 1e fb          	endbr32 
     cb5:	55                   	push   %ebp
     cb6:	89 e5                	mov    %esp,%ebp
     cb8:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
     cbb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
     cc1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
     cc8:	5d                   	pop    %ebp
     cc9:	c3                   	ret    

00000cca <lock_acquire>:

void lock_acquire(lock_t *lock) {
     cca:	f3 0f 1e fb          	endbr32 
     cce:	55                   	push   %ebp
     ccf:	89 e5                	mov    %esp,%ebp
     cd1:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
     cd4:	b9 01 00 00 00       	mov    $0x1,%ecx
     cd9:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
     cdd:	b8 00 00 00 00       	mov    $0x0,%eax
     ce2:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
     ce7:	39 c1                	cmp    %eax,%ecx
     ce9:	75 f2                	jne    cdd <lock_acquire+0x13>
      ; // spin
    }
}
     ceb:	5d                   	pop    %ebp
     cec:	c3                   	ret    

00000ced <lock_release>:

void lock_release(lock_t *lock) {
     ced:	f3 0f 1e fb          	endbr32 
     cf1:	55                   	push   %ebp
     cf2:	89 e5                	mov    %esp,%ebp
     cf4:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
     cf7:	8b 42 04             	mov    0x4(%edx),%eax
     cfa:	83 c0 01             	add    $0x1,%eax
     cfd:	89 42 04             	mov    %eax,0x4(%edx)
}
     d00:	5d                   	pop    %ebp
     d01:	c3                   	ret    

00000d02 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d02:	b8 01 00 00 00       	mov    $0x1,%eax
     d07:	cd 40                	int    $0x40
     d09:	c3                   	ret    

00000d0a <clone>:
SYSCALL(clone)
     d0a:	b8 16 00 00 00       	mov    $0x16,%eax
     d0f:	cd 40                	int    $0x40
     d11:	c3                   	ret    

00000d12 <exit>:
SYSCALL(exit)
     d12:	b8 02 00 00 00       	mov    $0x2,%eax
     d17:	cd 40                	int    $0x40
     d19:	c3                   	ret    

00000d1a <wait>:
SYSCALL(wait)
     d1a:	b8 03 00 00 00       	mov    $0x3,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <join>:
SYSCALL(join)
     d22:	b8 17 00 00 00       	mov    $0x17,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <pipe>:
SYSCALL(pipe)
     d2a:	b8 04 00 00 00       	mov    $0x4,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <read>:
SYSCALL(read)
     d32:	b8 05 00 00 00       	mov    $0x5,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <write>:
SYSCALL(write)
     d3a:	b8 10 00 00 00       	mov    $0x10,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <close>:
SYSCALL(close)
     d42:	b8 15 00 00 00       	mov    $0x15,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <kill>:
SYSCALL(kill)
     d4a:	b8 06 00 00 00       	mov    $0x6,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <exec>:
SYSCALL(exec)
     d52:	b8 07 00 00 00       	mov    $0x7,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <open>:
SYSCALL(open)
     d5a:	b8 0f 00 00 00       	mov    $0xf,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <mknod>:
SYSCALL(mknod)
     d62:	b8 11 00 00 00       	mov    $0x11,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <unlink>:
SYSCALL(unlink)
     d6a:	b8 12 00 00 00       	mov    $0x12,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <fstat>:
SYSCALL(fstat)
     d72:	b8 08 00 00 00       	mov    $0x8,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <link>:
SYSCALL(link)
     d7a:	b8 13 00 00 00       	mov    $0x13,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <mkdir>:
SYSCALL(mkdir)
     d82:	b8 14 00 00 00       	mov    $0x14,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <chdir>:
SYSCALL(chdir)
     d8a:	b8 09 00 00 00       	mov    $0x9,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <dup>:
SYSCALL(dup)
     d92:	b8 0a 00 00 00       	mov    $0xa,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    

00000d9a <getpid>:
SYSCALL(getpid)
     d9a:	b8 0b 00 00 00       	mov    $0xb,%eax
     d9f:	cd 40                	int    $0x40
     da1:	c3                   	ret    

00000da2 <sbrk>:
SYSCALL(sbrk)
     da2:	b8 0c 00 00 00       	mov    $0xc,%eax
     da7:	cd 40                	int    $0x40
     da9:	c3                   	ret    

00000daa <sleep>:
SYSCALL(sleep)
     daa:	b8 0d 00 00 00       	mov    $0xd,%eax
     daf:	cd 40                	int    $0x40
     db1:	c3                   	ret    

00000db2 <uptime>:
SYSCALL(uptime)
     db2:	b8 0e 00 00 00       	mov    $0xe,%eax
     db7:	cd 40                	int    $0x40
     db9:	c3                   	ret    

00000dba <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     dba:	55                   	push   %ebp
     dbb:	89 e5                	mov    %esp,%ebp
     dbd:	83 ec 1c             	sub    $0x1c,%esp
     dc0:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
     dc3:	6a 01                	push   $0x1
     dc5:	8d 55 f4             	lea    -0xc(%ebp),%edx
     dc8:	52                   	push   %edx
     dc9:	50                   	push   %eax
     dca:	e8 6b ff ff ff       	call   d3a <write>
}
     dcf:	83 c4 10             	add    $0x10,%esp
     dd2:	c9                   	leave  
     dd3:	c3                   	ret    

00000dd4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     dd4:	55                   	push   %ebp
     dd5:	89 e5                	mov    %esp,%ebp
     dd7:	57                   	push   %edi
     dd8:	56                   	push   %esi
     dd9:	53                   	push   %ebx
     dda:	83 ec 2c             	sub    $0x2c,%esp
     ddd:	89 45 d0             	mov    %eax,-0x30(%ebp)
     de0:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     de2:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     de6:	0f 95 c2             	setne  %dl
     de9:	89 f0                	mov    %esi,%eax
     deb:	c1 e8 1f             	shr    $0x1f,%eax
     dee:	84 c2                	test   %al,%dl
     df0:	74 42                	je     e34 <printint+0x60>
    neg = 1;
    x = -xx;
     df2:	f7 de                	neg    %esi
    neg = 1;
     df4:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     dfb:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
     e00:	89 f0                	mov    %esi,%eax
     e02:	ba 00 00 00 00       	mov    $0x0,%edx
     e07:	f7 f1                	div    %ecx
     e09:	89 df                	mov    %ebx,%edi
     e0b:	83 c3 01             	add    $0x1,%ebx
     e0e:	0f b6 92 08 12 00 00 	movzbl 0x1208(%edx),%edx
     e15:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
     e19:	89 f2                	mov    %esi,%edx
     e1b:	89 c6                	mov    %eax,%esi
     e1d:	39 d1                	cmp    %edx,%ecx
     e1f:	76 df                	jbe    e00 <printint+0x2c>
  if(neg)
     e21:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
     e25:	74 2f                	je     e56 <printint+0x82>
    buf[i++] = '-';
     e27:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
     e2c:	8d 5f 02             	lea    0x2(%edi),%ebx
     e2f:	8b 75 d0             	mov    -0x30(%ebp),%esi
     e32:	eb 15                	jmp    e49 <printint+0x75>
  neg = 0;
     e34:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     e3b:	eb be                	jmp    dfb <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
     e3d:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
     e42:	89 f0                	mov    %esi,%eax
     e44:	e8 71 ff ff ff       	call   dba <putc>
  while(--i >= 0)
     e49:	83 eb 01             	sub    $0x1,%ebx
     e4c:	79 ef                	jns    e3d <printint+0x69>
}
     e4e:	83 c4 2c             	add    $0x2c,%esp
     e51:	5b                   	pop    %ebx
     e52:	5e                   	pop    %esi
     e53:	5f                   	pop    %edi
     e54:	5d                   	pop    %ebp
     e55:	c3                   	ret    
     e56:	8b 75 d0             	mov    -0x30(%ebp),%esi
     e59:	eb ee                	jmp    e49 <printint+0x75>

00000e5b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
     e5b:	f3 0f 1e fb          	endbr32 
     e5f:	55                   	push   %ebp
     e60:	89 e5                	mov    %esp,%ebp
     e62:	57                   	push   %edi
     e63:	56                   	push   %esi
     e64:	53                   	push   %ebx
     e65:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
     e68:	8d 45 10             	lea    0x10(%ebp),%eax
     e6b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
     e6e:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
     e73:	bb 00 00 00 00       	mov    $0x0,%ebx
     e78:	eb 14                	jmp    e8e <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
     e7a:	89 fa                	mov    %edi,%edx
     e7c:	8b 45 08             	mov    0x8(%ebp),%eax
     e7f:	e8 36 ff ff ff       	call   dba <putc>
     e84:	eb 05                	jmp    e8b <printf+0x30>
      }
    } else if(state == '%'){
     e86:	83 fe 25             	cmp    $0x25,%esi
     e89:	74 25                	je     eb0 <printf+0x55>
  for(i = 0; fmt[i]; i++){
     e8b:	83 c3 01             	add    $0x1,%ebx
     e8e:	8b 45 0c             	mov    0xc(%ebp),%eax
     e91:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
     e95:	84 c0                	test   %al,%al
     e97:	0f 84 23 01 00 00    	je     fc0 <printf+0x165>
    c = fmt[i] & 0xff;
     e9d:	0f be f8             	movsbl %al,%edi
     ea0:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
     ea3:	85 f6                	test   %esi,%esi
     ea5:	75 df                	jne    e86 <printf+0x2b>
      if(c == '%'){
     ea7:	83 f8 25             	cmp    $0x25,%eax
     eaa:	75 ce                	jne    e7a <printf+0x1f>
        state = '%';
     eac:	89 c6                	mov    %eax,%esi
     eae:	eb db                	jmp    e8b <printf+0x30>
      if(c == 'd'){
     eb0:	83 f8 64             	cmp    $0x64,%eax
     eb3:	74 49                	je     efe <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     eb5:	83 f8 78             	cmp    $0x78,%eax
     eb8:	0f 94 c1             	sete   %cl
     ebb:	83 f8 70             	cmp    $0x70,%eax
     ebe:	0f 94 c2             	sete   %dl
     ec1:	08 d1                	or     %dl,%cl
     ec3:	75 63                	jne    f28 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     ec5:	83 f8 73             	cmp    $0x73,%eax
     ec8:	0f 84 84 00 00 00    	je     f52 <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     ece:	83 f8 63             	cmp    $0x63,%eax
     ed1:	0f 84 b7 00 00 00    	je     f8e <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     ed7:	83 f8 25             	cmp    $0x25,%eax
     eda:	0f 84 cc 00 00 00    	je     fac <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     ee0:	ba 25 00 00 00       	mov    $0x25,%edx
     ee5:	8b 45 08             	mov    0x8(%ebp),%eax
     ee8:	e8 cd fe ff ff       	call   dba <putc>
        putc(fd, c);
     eed:	89 fa                	mov    %edi,%edx
     eef:	8b 45 08             	mov    0x8(%ebp),%eax
     ef2:	e8 c3 fe ff ff       	call   dba <putc>
      }
      state = 0;
     ef7:	be 00 00 00 00       	mov    $0x0,%esi
     efc:	eb 8d                	jmp    e8b <printf+0x30>
        printint(fd, *ap, 10, 1);
     efe:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     f01:	8b 17                	mov    (%edi),%edx
     f03:	83 ec 0c             	sub    $0xc,%esp
     f06:	6a 01                	push   $0x1
     f08:	b9 0a 00 00 00       	mov    $0xa,%ecx
     f0d:	8b 45 08             	mov    0x8(%ebp),%eax
     f10:	e8 bf fe ff ff       	call   dd4 <printint>
        ap++;
     f15:	83 c7 04             	add    $0x4,%edi
     f18:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     f1b:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f1e:	be 00 00 00 00       	mov    $0x0,%esi
     f23:	e9 63 ff ff ff       	jmp    e8b <printf+0x30>
        printint(fd, *ap, 16, 0);
     f28:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     f2b:	8b 17                	mov    (%edi),%edx
     f2d:	83 ec 0c             	sub    $0xc,%esp
     f30:	6a 00                	push   $0x0
     f32:	b9 10 00 00 00       	mov    $0x10,%ecx
     f37:	8b 45 08             	mov    0x8(%ebp),%eax
     f3a:	e8 95 fe ff ff       	call   dd4 <printint>
        ap++;
     f3f:	83 c7 04             	add    $0x4,%edi
     f42:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     f45:	83 c4 10             	add    $0x10,%esp
      state = 0;
     f48:	be 00 00 00 00       	mov    $0x0,%esi
     f4d:	e9 39 ff ff ff       	jmp    e8b <printf+0x30>
        s = (char*)*ap;
     f52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f55:	8b 30                	mov    (%eax),%esi
        ap++;
     f57:	83 c0 04             	add    $0x4,%eax
     f5a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
     f5d:	85 f6                	test   %esi,%esi
     f5f:	75 28                	jne    f89 <printf+0x12e>
          s = "(null)";
     f61:	be 00 12 00 00       	mov    $0x1200,%esi
     f66:	8b 7d 08             	mov    0x8(%ebp),%edi
     f69:	eb 0d                	jmp    f78 <printf+0x11d>
          putc(fd, *s);
     f6b:	0f be d2             	movsbl %dl,%edx
     f6e:	89 f8                	mov    %edi,%eax
     f70:	e8 45 fe ff ff       	call   dba <putc>
          s++;
     f75:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
     f78:	0f b6 16             	movzbl (%esi),%edx
     f7b:	84 d2                	test   %dl,%dl
     f7d:	75 ec                	jne    f6b <printf+0x110>
      state = 0;
     f7f:	be 00 00 00 00       	mov    $0x0,%esi
     f84:	e9 02 ff ff ff       	jmp    e8b <printf+0x30>
     f89:	8b 7d 08             	mov    0x8(%ebp),%edi
     f8c:	eb ea                	jmp    f78 <printf+0x11d>
        putc(fd, *ap);
     f8e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
     f91:	0f be 17             	movsbl (%edi),%edx
     f94:	8b 45 08             	mov    0x8(%ebp),%eax
     f97:	e8 1e fe ff ff       	call   dba <putc>
        ap++;
     f9c:	83 c7 04             	add    $0x4,%edi
     f9f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
     fa2:	be 00 00 00 00       	mov    $0x0,%esi
     fa7:	e9 df fe ff ff       	jmp    e8b <printf+0x30>
        putc(fd, c);
     fac:	89 fa                	mov    %edi,%edx
     fae:	8b 45 08             	mov    0x8(%ebp),%eax
     fb1:	e8 04 fe ff ff       	call   dba <putc>
      state = 0;
     fb6:	be 00 00 00 00       	mov    $0x0,%esi
     fbb:	e9 cb fe ff ff       	jmp    e8b <printf+0x30>
    }
  }
}
     fc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fc3:	5b                   	pop    %ebx
     fc4:	5e                   	pop    %esi
     fc5:	5f                   	pop    %edi
     fc6:	5d                   	pop    %ebp
     fc7:	c3                   	ret    

00000fc8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     fc8:	f3 0f 1e fb          	endbr32 
     fcc:	55                   	push   %ebp
     fcd:	89 e5                	mov    %esp,%ebp
     fcf:	57                   	push   %edi
     fd0:	56                   	push   %esi
     fd1:	53                   	push   %ebx
     fd2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
     fd5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     fd8:	a1 c4 18 00 00       	mov    0x18c4,%eax
     fdd:	eb 02                	jmp    fe1 <free+0x19>
     fdf:	89 d0                	mov    %edx,%eax
     fe1:	39 c8                	cmp    %ecx,%eax
     fe3:	73 04                	jae    fe9 <free+0x21>
     fe5:	39 08                	cmp    %ecx,(%eax)
     fe7:	77 12                	ja     ffb <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     fe9:	8b 10                	mov    (%eax),%edx
     feb:	39 c2                	cmp    %eax,%edx
     fed:	77 f0                	ja     fdf <free+0x17>
     fef:	39 c8                	cmp    %ecx,%eax
     ff1:	72 08                	jb     ffb <free+0x33>
     ff3:	39 ca                	cmp    %ecx,%edx
     ff5:	77 04                	ja     ffb <free+0x33>
     ff7:	89 d0                	mov    %edx,%eax
     ff9:	eb e6                	jmp    fe1 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
     ffb:	8b 73 fc             	mov    -0x4(%ebx),%esi
     ffe:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1001:	8b 10                	mov    (%eax),%edx
    1003:	39 d7                	cmp    %edx,%edi
    1005:	74 19                	je     1020 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1007:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    100a:	8b 50 04             	mov    0x4(%eax),%edx
    100d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1010:	39 ce                	cmp    %ecx,%esi
    1012:	74 1b                	je     102f <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1014:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1016:	a3 c4 18 00 00       	mov    %eax,0x18c4
}
    101b:	5b                   	pop    %ebx
    101c:	5e                   	pop    %esi
    101d:	5f                   	pop    %edi
    101e:	5d                   	pop    %ebp
    101f:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
    1020:	03 72 04             	add    0x4(%edx),%esi
    1023:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1026:	8b 10                	mov    (%eax),%edx
    1028:	8b 12                	mov    (%edx),%edx
    102a:	89 53 f8             	mov    %edx,-0x8(%ebx)
    102d:	eb db                	jmp    100a <free+0x42>
    p->s.size += bp->s.size;
    102f:	03 53 fc             	add    -0x4(%ebx),%edx
    1032:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    1035:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1038:	89 10                	mov    %edx,(%eax)
    103a:	eb da                	jmp    1016 <free+0x4e>

0000103c <morecore>:

static Header*
morecore(uint nu)
{
    103c:	55                   	push   %ebp
    103d:	89 e5                	mov    %esp,%ebp
    103f:	53                   	push   %ebx
    1040:	83 ec 04             	sub    $0x4,%esp
    1043:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
    1045:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    104a:	77 05                	ja     1051 <morecore+0x15>
    nu = 4096;
    104c:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
    1051:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    1058:	83 ec 0c             	sub    $0xc,%esp
    105b:	50                   	push   %eax
    105c:	e8 41 fd ff ff       	call   da2 <sbrk>
  if(p == (char*)-1)
    1061:	83 c4 10             	add    $0x10,%esp
    1064:	83 f8 ff             	cmp    $0xffffffff,%eax
    1067:	74 1c                	je     1085 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1069:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    106c:	83 c0 08             	add    $0x8,%eax
    106f:	83 ec 0c             	sub    $0xc,%esp
    1072:	50                   	push   %eax
    1073:	e8 50 ff ff ff       	call   fc8 <free>
  return freep;
    1078:	a1 c4 18 00 00       	mov    0x18c4,%eax
    107d:	83 c4 10             	add    $0x10,%esp
}
    1080:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1083:	c9                   	leave  
    1084:	c3                   	ret    
    return 0;
    1085:	b8 00 00 00 00       	mov    $0x0,%eax
    108a:	eb f4                	jmp    1080 <morecore+0x44>

0000108c <malloc>:

void*
malloc(uint nbytes)
{
    108c:	f3 0f 1e fb          	endbr32 
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	53                   	push   %ebx
    1094:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1097:	8b 45 08             	mov    0x8(%ebp),%eax
    109a:	8d 58 07             	lea    0x7(%eax),%ebx
    109d:	c1 eb 03             	shr    $0x3,%ebx
    10a0:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
    10a3:	8b 0d c4 18 00 00    	mov    0x18c4,%ecx
    10a9:	85 c9                	test   %ecx,%ecx
    10ab:	74 04                	je     10b1 <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10ad:	8b 01                	mov    (%ecx),%eax
    10af:	eb 4b                	jmp    10fc <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
    10b1:	c7 05 c4 18 00 00 c8 	movl   $0x18c8,0x18c4
    10b8:	18 00 00 
    10bb:	c7 05 c8 18 00 00 c8 	movl   $0x18c8,0x18c8
    10c2:	18 00 00 
    base.s.size = 0;
    10c5:	c7 05 cc 18 00 00 00 	movl   $0x0,0x18cc
    10cc:	00 00 00 
    base.s.ptr = freep = prevp = &base;
    10cf:	b9 c8 18 00 00       	mov    $0x18c8,%ecx
    10d4:	eb d7                	jmp    10ad <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    10d6:	74 1a                	je     10f2 <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    10d8:	29 da                	sub    %ebx,%edx
    10da:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    10dd:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
    10e0:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
    10e3:	89 0d c4 18 00 00    	mov    %ecx,0x18c4
      return (void*)(p + 1);
    10e9:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    10ec:	83 c4 04             	add    $0x4,%esp
    10ef:	5b                   	pop    %ebx
    10f0:	5d                   	pop    %ebp
    10f1:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
    10f2:	8b 10                	mov    (%eax),%edx
    10f4:	89 11                	mov    %edx,(%ecx)
    10f6:	eb eb                	jmp    10e3 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    10f8:	89 c1                	mov    %eax,%ecx
    10fa:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
    10fc:	8b 50 04             	mov    0x4(%eax),%edx
    10ff:	39 da                	cmp    %ebx,%edx
    1101:	73 d3                	jae    10d6 <malloc+0x4a>
    if(p == freep)
    1103:	39 05 c4 18 00 00    	cmp    %eax,0x18c4
    1109:	75 ed                	jne    10f8 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
    110b:	89 d8                	mov    %ebx,%eax
    110d:	e8 2a ff ff ff       	call   103c <morecore>
    1112:	85 c0                	test   %eax,%eax
    1114:	75 e2                	jne    10f8 <malloc+0x6c>
    1116:	eb d4                	jmp    10ec <malloc+0x60>
