
_test_13:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
   exit(); \
}

void worker(void *arg1, void *arg2);

unsigned int fib(unsigned int n) {
   0:	f3 0f 1e fb          	endbr32 
   4:	55                   	push   %ebp
   5:	89 e5                	mov    %esp,%ebp
   7:	56                   	push   %esi
   8:	53                   	push   %ebx
   9:	8b 5d 08             	mov    0x8(%ebp),%ebx
   if (n == 0) {
   c:	85 db                	test   %ebx,%ebx
   e:	74 05                	je     15 <fib+0x15>
      return 0;
   } else if (n == 1) {
  10:	83 fb 01             	cmp    $0x1,%ebx
  13:	75 09                	jne    1e <fib+0x1e>
      return 1;
   } else {
      return fib(n - 1) + fib(n - 2);
   }
}
  15:	89 d8                	mov    %ebx,%eax
  17:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1a:	5b                   	pop    %ebx
  1b:	5e                   	pop    %esi
  1c:	5d                   	pop    %ebp
  1d:	c3                   	ret    
      return fib(n - 1) + fib(n - 2);
  1e:	83 ec 0c             	sub    $0xc,%esp
  21:	8d 43 ff             	lea    -0x1(%ebx),%eax
  24:	50                   	push   %eax
  25:	e8 d6 ff ff ff       	call   0 <fib>
  2a:	89 c6                	mov    %eax,%esi
  2c:	83 eb 02             	sub    $0x2,%ebx
  2f:	89 1c 24             	mov    %ebx,(%esp)
  32:	e8 c9 ff ff ff       	call   0 <fib>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	8d 1c 06             	lea    (%esi,%eax,1),%ebx
  3d:	eb d6                	jmp    15 <fib+0x15>

0000003f <worker>:
   printf(1, "TEST PASSED\n");
   exit();
}

void
worker(void *arg1, void *arg2) {
  3f:	f3 0f 1e fb          	endbr32 
  43:	55                   	push   %ebp
  44:	89 e5                	mov    %esp,%ebp
  46:	83 ec 08             	sub    $0x8,%esp
   int tmp1 = *(int*)arg1;
   int tmp2 = *(int*)arg2;
  49:	8b 45 0c             	mov    0xc(%ebp),%eax
  4c:	8b 10                	mov    (%eax),%edx
   assert(tmp1 == 11);
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	83 38 0b             	cmpl   $0xb,(%eax)
  54:	75 5f                	jne    b5 <worker+0x76>
   assert(tmp2 == 22);
  56:	83 fa 16             	cmp    $0x16,%edx
  59:	0f 85 9f 00 00 00    	jne    fe <worker+0xbf>
   assert(global == 1);
  5f:	83 3d c8 0f 00 00 01 	cmpl   $0x1,0xfc8
  66:	0f 84 db 00 00 00    	je     147 <worker+0x108>
  6c:	6a 40                	push   $0x40
  6e:	68 58 0b 00 00       	push   $0xb58
  73:	68 62 0b 00 00       	push   $0xb62
  78:	6a 01                	push   $0x1
  7a:	e8 19 08 00 00       	call   898 <printf>
  7f:	83 c4 0c             	add    $0xc,%esp
  82:	68 a1 0b 00 00       	push   $0xba1
  87:	68 75 0b 00 00       	push   $0xb75
  8c:	6a 01                	push   $0x1
  8e:	e8 05 08 00 00       	call   898 <printf>
  93:	83 c4 08             	add    $0x8,%esp
  96:	68 89 0b 00 00       	push   $0xb89
  9b:	6a 01                	push   $0x1
  9d:	e8 f6 07 00 00       	call   898 <printf>
  a2:	83 c4 04             	add    $0x4,%esp
  a5:	ff 35 ec 0f 00 00    	pushl  0xfec
  ab:	e8 d7 06 00 00       	call   787 <kill>
  b0:	e8 9a 06 00 00       	call   74f <exit>
   assert(tmp1 == 11);
  b5:	6a 3e                	push   $0x3e
  b7:	68 58 0b 00 00       	push   $0xb58
  bc:	68 62 0b 00 00       	push   $0xb62
  c1:	6a 01                	push   $0x1
  c3:	e8 d0 07 00 00       	call   898 <printf>
  c8:	83 c4 0c             	add    $0xc,%esp
  cb:	68 6a 0b 00 00       	push   $0xb6a
  d0:	68 75 0b 00 00       	push   $0xb75
  d5:	6a 01                	push   $0x1
  d7:	e8 bc 07 00 00       	call   898 <printf>
  dc:	83 c4 08             	add    $0x8,%esp
  df:	68 89 0b 00 00       	push   $0xb89
  e4:	6a 01                	push   $0x1
  e6:	e8 ad 07 00 00       	call   898 <printf>
  eb:	83 c4 04             	add    $0x4,%esp
  ee:	ff 35 ec 0f 00 00    	pushl  0xfec
  f4:	e8 8e 06 00 00       	call   787 <kill>
  f9:	e8 51 06 00 00       	call   74f <exit>
   assert(tmp2 == 22);
  fe:	6a 3f                	push   $0x3f
 100:	68 58 0b 00 00       	push   $0xb58
 105:	68 62 0b 00 00       	push   $0xb62
 10a:	6a 01                	push   $0x1
 10c:	e8 87 07 00 00       	call   898 <printf>
 111:	83 c4 0c             	add    $0xc,%esp
 114:	68 96 0b 00 00       	push   $0xb96
 119:	68 75 0b 00 00       	push   $0xb75
 11e:	6a 01                	push   $0x1
 120:	e8 73 07 00 00       	call   898 <printf>
 125:	83 c4 08             	add    $0x8,%esp
 128:	68 89 0b 00 00       	push   $0xb89
 12d:	6a 01                	push   $0x1
 12f:	e8 64 07 00 00       	call   898 <printf>
 134:	83 c4 04             	add    $0x4,%esp
 137:	ff 35 ec 0f 00 00    	pushl  0xfec
 13d:	e8 45 06 00 00       	call   787 <kill>
 142:	e8 08 06 00 00       	call   74f <exit>
   assert(fib(2) == 1);
 147:	83 ec 0c             	sub    $0xc,%esp
 14a:	6a 02                	push   $0x2
 14c:	e8 af fe ff ff       	call   0 <fib>
 151:	83 c4 10             	add    $0x10,%esp
 154:	83 f8 01             	cmp    $0x1,%eax
 157:	74 49                	je     1a2 <worker+0x163>
 159:	6a 41                	push   $0x41
 15b:	68 58 0b 00 00       	push   $0xb58
 160:	68 62 0b 00 00       	push   $0xb62
 165:	6a 01                	push   $0x1
 167:	e8 2c 07 00 00       	call   898 <printf>
 16c:	83 c4 0c             	add    $0xc,%esp
 16f:	68 ad 0b 00 00       	push   $0xbad
 174:	68 75 0b 00 00       	push   $0xb75
 179:	6a 01                	push   $0x1
 17b:	e8 18 07 00 00       	call   898 <printf>
 180:	83 c4 08             	add    $0x8,%esp
 183:	68 89 0b 00 00       	push   $0xb89
 188:	6a 01                	push   $0x1
 18a:	e8 09 07 00 00       	call   898 <printf>
 18f:	83 c4 04             	add    $0x4,%esp
 192:	ff 35 ec 0f 00 00    	pushl  0xfec
 198:	e8 ea 05 00 00       	call   787 <kill>
 19d:	e8 ad 05 00 00       	call   74f <exit>
   assert(fib(3) == 2);
 1a2:	83 ec 0c             	sub    $0xc,%esp
 1a5:	6a 03                	push   $0x3
 1a7:	e8 54 fe ff ff       	call   0 <fib>
 1ac:	83 c4 10             	add    $0x10,%esp
 1af:	83 f8 02             	cmp    $0x2,%eax
 1b2:	74 49                	je     1fd <worker+0x1be>
 1b4:	6a 42                	push   $0x42
 1b6:	68 58 0b 00 00       	push   $0xb58
 1bb:	68 62 0b 00 00       	push   $0xb62
 1c0:	6a 01                	push   $0x1
 1c2:	e8 d1 06 00 00       	call   898 <printf>
 1c7:	83 c4 0c             	add    $0xc,%esp
 1ca:	68 b9 0b 00 00       	push   $0xbb9
 1cf:	68 75 0b 00 00       	push   $0xb75
 1d4:	6a 01                	push   $0x1
 1d6:	e8 bd 06 00 00       	call   898 <printf>
 1db:	83 c4 08             	add    $0x8,%esp
 1de:	68 89 0b 00 00       	push   $0xb89
 1e3:	6a 01                	push   $0x1
 1e5:	e8 ae 06 00 00       	call   898 <printf>
 1ea:	83 c4 04             	add    $0x4,%esp
 1ed:	ff 35 ec 0f 00 00    	pushl  0xfec
 1f3:	e8 8f 05 00 00       	call   787 <kill>
 1f8:	e8 52 05 00 00       	call   74f <exit>
   assert(fib(9) == 34);
 1fd:	83 ec 0c             	sub    $0xc,%esp
 200:	6a 09                	push   $0x9
 202:	e8 f9 fd ff ff       	call   0 <fib>
 207:	83 c4 10             	add    $0x10,%esp
 20a:	83 f8 22             	cmp    $0x22,%eax
 20d:	74 49                	je     258 <worker+0x219>
 20f:	6a 43                	push   $0x43
 211:	68 58 0b 00 00       	push   $0xb58
 216:	68 62 0b 00 00       	push   $0xb62
 21b:	6a 01                	push   $0x1
 21d:	e8 76 06 00 00       	call   898 <printf>
 222:	83 c4 0c             	add    $0xc,%esp
 225:	68 c5 0b 00 00       	push   $0xbc5
 22a:	68 75 0b 00 00       	push   $0xb75
 22f:	6a 01                	push   $0x1
 231:	e8 62 06 00 00       	call   898 <printf>
 236:	83 c4 08             	add    $0x8,%esp
 239:	68 89 0b 00 00       	push   $0xb89
 23e:	6a 01                	push   $0x1
 240:	e8 53 06 00 00       	call   898 <printf>
 245:	83 c4 04             	add    $0x4,%esp
 248:	ff 35 ec 0f 00 00    	pushl  0xfec
 24e:	e8 34 05 00 00       	call   787 <kill>
 253:	e8 f7 04 00 00       	call   74f <exit>
   assert(fib(15) == 610);
 258:	83 ec 0c             	sub    $0xc,%esp
 25b:	6a 0f                	push   $0xf
 25d:	e8 9e fd ff ff       	call   0 <fib>
 262:	83 c4 10             	add    $0x10,%esp
 265:	3d 62 02 00 00       	cmp    $0x262,%eax
 26a:	74 49                	je     2b5 <worker+0x276>
 26c:	6a 44                	push   $0x44
 26e:	68 58 0b 00 00       	push   $0xb58
 273:	68 62 0b 00 00       	push   $0xb62
 278:	6a 01                	push   $0x1
 27a:	e8 19 06 00 00       	call   898 <printf>
 27f:	83 c4 0c             	add    $0xc,%esp
 282:	68 d2 0b 00 00       	push   $0xbd2
 287:	68 75 0b 00 00       	push   $0xb75
 28c:	6a 01                	push   $0x1
 28e:	e8 05 06 00 00       	call   898 <printf>
 293:	83 c4 08             	add    $0x8,%esp
 296:	68 89 0b 00 00       	push   $0xb89
 29b:	6a 01                	push   $0x1
 29d:	e8 f6 05 00 00       	call   898 <printf>
 2a2:	83 c4 04             	add    $0x4,%esp
 2a5:	ff 35 ec 0f 00 00    	pushl  0xfec
 2ab:	e8 d7 04 00 00       	call   787 <kill>
 2b0:	e8 9a 04 00 00       	call   74f <exit>
   exit();
 2b5:	e8 95 04 00 00       	call   74f <exit>

000002ba <main>:
{
 2ba:	f3 0f 1e fb          	endbr32 
 2be:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2c2:	83 e4 f0             	and    $0xfffffff0,%esp
 2c5:	ff 71 fc             	pushl  -0x4(%ecx)
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	53                   	push   %ebx
 2cc:	51                   	push   %ecx
 2cd:	83 ec 10             	sub    $0x10,%esp
   ppid = getpid();
 2d0:	e8 02 05 00 00       	call   7d7 <getpid>
 2d5:	a3 ec 0f 00 00       	mov    %eax,0xfec
   assert(fib(28) == 317811);
 2da:	83 ec 0c             	sub    $0xc,%esp
 2dd:	6a 1c                	push   $0x1c
 2df:	e8 1c fd ff ff       	call   0 <fib>
 2e4:	83 c4 10             	add    $0x10,%esp
 2e7:	3d 73 d9 04 00       	cmp    $0x4d973,%eax
 2ec:	75 40                	jne    32e <main+0x74>
   int arg1 = 11, arg2 = 22;
 2ee:	c7 45 f4 0b 00 00 00 	movl   $0xb,-0xc(%ebp)
 2f5:	c7 45 f0 16 00 00 00 	movl   $0x16,-0x10(%ebp)
   for (int i = 0; i < num_threads; i++) {
 2fc:	bb 00 00 00 00       	mov    $0x0,%ebx
 301:	39 1d c4 0f 00 00    	cmp    %ebx,0xfc4
 307:	0f 8e b3 00 00 00    	jle    3c0 <main+0x106>
      int thread_pid = thread_create(worker, &arg1, &arg2);
 30d:	83 ec 04             	sub    $0x4,%esp
 310:	8d 45 f0             	lea    -0x10(%ebp),%eax
 313:	50                   	push   %eax
 314:	8d 45 f4             	lea    -0xc(%ebp),%eax
 317:	50                   	push   %eax
 318:	68 3f 00 00 00       	push   $0x3f
 31d:	e8 cb 02 00 00       	call   5ed <thread_create>
      assert(thread_pid > 0);
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	7e 4e                	jle    377 <main+0xbd>
   for (int i = 0; i < num_threads; i++) {
 329:	83 c3 01             	add    $0x1,%ebx
 32c:	eb d3                	jmp    301 <main+0x47>
   assert(fib(28) == 317811);
 32e:	6a 28                	push   $0x28
 330:	68 58 0b 00 00       	push   $0xb58
 335:	68 62 0b 00 00       	push   $0xb62
 33a:	6a 01                	push   $0x1
 33c:	e8 57 05 00 00       	call   898 <printf>
 341:	83 c4 0c             	add    $0xc,%esp
 344:	68 e1 0b 00 00       	push   $0xbe1
 349:	68 75 0b 00 00       	push   $0xb75
 34e:	6a 01                	push   $0x1
 350:	e8 43 05 00 00       	call   898 <printf>
 355:	83 c4 08             	add    $0x8,%esp
 358:	68 89 0b 00 00       	push   $0xb89
 35d:	6a 01                	push   $0x1
 35f:	e8 34 05 00 00       	call   898 <printf>
 364:	83 c4 04             	add    $0x4,%esp
 367:	ff 35 ec 0f 00 00    	pushl  0xfec
 36d:	e8 15 04 00 00       	call   787 <kill>
 372:	e8 d8 03 00 00       	call   74f <exit>
      assert(thread_pid > 0);
 377:	6a 2e                	push   $0x2e
 379:	68 58 0b 00 00       	push   $0xb58
 37e:	68 62 0b 00 00       	push   $0xb62
 383:	6a 01                	push   $0x1
 385:	e8 0e 05 00 00       	call   898 <printf>
 38a:	83 c4 0c             	add    $0xc,%esp
 38d:	68 f3 0b 00 00       	push   $0xbf3
 392:	68 75 0b 00 00       	push   $0xb75
 397:	6a 01                	push   $0x1
 399:	e8 fa 04 00 00       	call   898 <printf>
 39e:	83 c4 08             	add    $0x8,%esp
 3a1:	68 89 0b 00 00       	push   $0xb89
 3a6:	6a 01                	push   $0x1
 3a8:	e8 eb 04 00 00       	call   898 <printf>
 3ad:	83 c4 04             	add    $0x4,%esp
 3b0:	ff 35 ec 0f 00 00    	pushl  0xfec
 3b6:	e8 cc 03 00 00       	call   787 <kill>
 3bb:	e8 8f 03 00 00       	call   74f <exit>
   for (int i = 0; i < num_threads; i++) {
 3c0:	bb 00 00 00 00       	mov    $0x0,%ebx
 3c5:	39 1d c4 0f 00 00    	cmp    %ebx,0xfc4
 3cb:	7e 57                	jle    424 <main+0x16a>
      int join_pid = thread_join();
 3cd:	e8 a8 02 00 00       	call   67a <thread_join>
      assert(join_pid > 0);
 3d2:	85 c0                	test   %eax,%eax
 3d4:	7e 05                	jle    3db <main+0x121>
   for (int i = 0; i < num_threads; i++) {
 3d6:	83 c3 01             	add    $0x1,%ebx
 3d9:	eb ea                	jmp    3c5 <main+0x10b>
      assert(join_pid > 0);
 3db:	6a 33                	push   $0x33
 3dd:	68 58 0b 00 00       	push   $0xb58
 3e2:	68 62 0b 00 00       	push   $0xb62
 3e7:	6a 01                	push   $0x1
 3e9:	e8 aa 04 00 00       	call   898 <printf>
 3ee:	83 c4 0c             	add    $0xc,%esp
 3f1:	68 02 0c 00 00       	push   $0xc02
 3f6:	68 75 0b 00 00       	push   $0xb75
 3fb:	6a 01                	push   $0x1
 3fd:	e8 96 04 00 00       	call   898 <printf>
 402:	83 c4 08             	add    $0x8,%esp
 405:	68 89 0b 00 00       	push   $0xb89
 40a:	6a 01                	push   $0x1
 40c:	e8 87 04 00 00       	call   898 <printf>
 411:	83 c4 04             	add    $0x4,%esp
 414:	ff 35 ec 0f 00 00    	pushl  0xfec
 41a:	e8 68 03 00 00       	call   787 <kill>
 41f:	e8 2b 03 00 00       	call   74f <exit>
   printf(1, "TEST PASSED\n");
 424:	83 ec 08             	sub    $0x8,%esp
 427:	68 0f 0c 00 00       	push   $0xc0f
 42c:	6a 01                	push   $0x1
 42e:	e8 65 04 00 00       	call   898 <printf>
   exit();
 433:	e8 17 03 00 00       	call   74f <exit>

00000438 <strcpy>:
ptr_storage ptr_pairs[NPROC];
int cell_full[NPROC];

char*
strcpy(char *s, const char *t)
{
 438:	f3 0f 1e fb          	endbr32 
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	56                   	push   %esi
 440:	53                   	push   %ebx
 441:	8b 75 08             	mov    0x8(%ebp),%esi
 444:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 447:	89 f0                	mov    %esi,%eax
 449:	89 d1                	mov    %edx,%ecx
 44b:	83 c2 01             	add    $0x1,%edx
 44e:	89 c3                	mov    %eax,%ebx
 450:	83 c0 01             	add    $0x1,%eax
 453:	0f b6 09             	movzbl (%ecx),%ecx
 456:	88 0b                	mov    %cl,(%ebx)
 458:	84 c9                	test   %cl,%cl
 45a:	75 ed                	jne    449 <strcpy+0x11>
    ;
  return os;
}
 45c:	89 f0                	mov    %esi,%eax
 45e:	5b                   	pop    %ebx
 45f:	5e                   	pop    %esi
 460:	5d                   	pop    %ebp
 461:	c3                   	ret    

00000462 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 462:	f3 0f 1e fb          	endbr32 
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	8b 4d 08             	mov    0x8(%ebp),%ecx
 46c:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 46f:	0f b6 01             	movzbl (%ecx),%eax
 472:	84 c0                	test   %al,%al
 474:	74 0c                	je     482 <strcmp+0x20>
 476:	3a 02                	cmp    (%edx),%al
 478:	75 08                	jne    482 <strcmp+0x20>
    p++, q++;
 47a:	83 c1 01             	add    $0x1,%ecx
 47d:	83 c2 01             	add    $0x1,%edx
 480:	eb ed                	jmp    46f <strcmp+0xd>
  return (uchar)*p - (uchar)*q;
 482:	0f b6 c0             	movzbl %al,%eax
 485:	0f b6 12             	movzbl (%edx),%edx
 488:	29 d0                	sub    %edx,%eax
}
 48a:	5d                   	pop    %ebp
 48b:	c3                   	ret    

0000048c <strlen>:

uint
strlen(const char *s)
{
 48c:	f3 0f 1e fb          	endbr32 
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 496:	b8 00 00 00 00       	mov    $0x0,%eax
 49b:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 49f:	74 05                	je     4a6 <strlen+0x1a>
 4a1:	83 c0 01             	add    $0x1,%eax
 4a4:	eb f5                	jmp    49b <strlen+0xf>
    ;
  return n;
}
 4a6:	5d                   	pop    %ebp
 4a7:	c3                   	ret    

000004a8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4a8:	f3 0f 1e fb          	endbr32 
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	57                   	push   %edi
 4b0:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 4b3:	89 d7                	mov    %edx,%edi
 4b5:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bb:	fc                   	cld    
 4bc:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 4be:	89 d0                	mov    %edx,%eax
 4c0:	5f                   	pop    %edi
 4c1:	5d                   	pop    %ebp
 4c2:	c3                   	ret    

000004c3 <strchr>:

char*
strchr(const char *s, char c)
{
 4c3:	f3 0f 1e fb          	endbr32 
 4c7:	55                   	push   %ebp
 4c8:	89 e5                	mov    %esp,%ebp
 4ca:	8b 45 08             	mov    0x8(%ebp),%eax
 4cd:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 4d1:	0f b6 10             	movzbl (%eax),%edx
 4d4:	84 d2                	test   %dl,%dl
 4d6:	74 09                	je     4e1 <strchr+0x1e>
    if(*s == c)
 4d8:	38 ca                	cmp    %cl,%dl
 4da:	74 0a                	je     4e6 <strchr+0x23>
  for(; *s; s++)
 4dc:	83 c0 01             	add    $0x1,%eax
 4df:	eb f0                	jmp    4d1 <strchr+0xe>
      return (char*)s;
  return 0;
 4e1:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    

000004e8 <gets>:

char*
gets(char *buf, int max)
{
 4e8:	f3 0f 1e fb          	endbr32 
 4ec:	55                   	push   %ebp
 4ed:	89 e5                	mov    %esp,%ebp
 4ef:	57                   	push   %edi
 4f0:	56                   	push   %esi
 4f1:	53                   	push   %ebx
 4f2:	83 ec 1c             	sub    $0x1c,%esp
 4f5:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4f8:	bb 00 00 00 00       	mov    $0x0,%ebx
 4fd:	89 de                	mov    %ebx,%esi
 4ff:	83 c3 01             	add    $0x1,%ebx
 502:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 505:	7d 2e                	jge    535 <gets+0x4d>
    cc = read(0, &c, 1);
 507:	83 ec 04             	sub    $0x4,%esp
 50a:	6a 01                	push   $0x1
 50c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 50f:	50                   	push   %eax
 510:	6a 00                	push   $0x0
 512:	e8 58 02 00 00       	call   76f <read>
    if(cc < 1)
 517:	83 c4 10             	add    $0x10,%esp
 51a:	85 c0                	test   %eax,%eax
 51c:	7e 17                	jle    535 <gets+0x4d>
      break;
    buf[i++] = c;
 51e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 522:	88 04 37             	mov    %al,(%edi,%esi,1)
    if(c == '\n' || c == '\r')
 525:	3c 0a                	cmp    $0xa,%al
 527:	0f 94 c2             	sete   %dl
 52a:	3c 0d                	cmp    $0xd,%al
 52c:	0f 94 c0             	sete   %al
 52f:	08 c2                	or     %al,%dl
 531:	74 ca                	je     4fd <gets+0x15>
    buf[i++] = c;
 533:	89 de                	mov    %ebx,%esi
      break;
  }
  buf[i] = '\0';
 535:	c6 04 37 00          	movb   $0x0,(%edi,%esi,1)
  return buf;
}
 539:	89 f8                	mov    %edi,%eax
 53b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 53e:	5b                   	pop    %ebx
 53f:	5e                   	pop    %esi
 540:	5f                   	pop    %edi
 541:	5d                   	pop    %ebp
 542:	c3                   	ret    

00000543 <stat>:

int
stat(const char *n, struct stat *st)
{
 543:	f3 0f 1e fb          	endbr32 
 547:	55                   	push   %ebp
 548:	89 e5                	mov    %esp,%ebp
 54a:	56                   	push   %esi
 54b:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 54c:	83 ec 08             	sub    $0x8,%esp
 54f:	6a 00                	push   $0x0
 551:	ff 75 08             	pushl  0x8(%ebp)
 554:	e8 3e 02 00 00       	call   797 <open>
  if(fd < 0)
 559:	83 c4 10             	add    $0x10,%esp
 55c:	85 c0                	test   %eax,%eax
 55e:	78 24                	js     584 <stat+0x41>
 560:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 562:	83 ec 08             	sub    $0x8,%esp
 565:	ff 75 0c             	pushl  0xc(%ebp)
 568:	50                   	push   %eax
 569:	e8 41 02 00 00       	call   7af <fstat>
 56e:	89 c6                	mov    %eax,%esi
  close(fd);
 570:	89 1c 24             	mov    %ebx,(%esp)
 573:	e8 07 02 00 00       	call   77f <close>
  return r;
 578:	83 c4 10             	add    $0x10,%esp
}
 57b:	89 f0                	mov    %esi,%eax
 57d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 580:	5b                   	pop    %ebx
 581:	5e                   	pop    %esi
 582:	5d                   	pop    %ebp
 583:	c3                   	ret    
    return -1;
 584:	be ff ff ff ff       	mov    $0xffffffff,%esi
 589:	eb f0                	jmp    57b <stat+0x38>

0000058b <atoi>:

int
atoi(const char *s)
{
 58b:	f3 0f 1e fb          	endbr32 
 58f:	55                   	push   %ebp
 590:	89 e5                	mov    %esp,%ebp
 592:	53                   	push   %ebx
 593:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
 596:	ba 00 00 00 00       	mov    $0x0,%edx
  while('0' <= *s && *s <= '9')
 59b:	0f b6 01             	movzbl (%ecx),%eax
 59e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 5a1:	80 fb 09             	cmp    $0x9,%bl
 5a4:	77 12                	ja     5b8 <atoi+0x2d>
    n = n*10 + *s++ - '0';
 5a6:	8d 1c 92             	lea    (%edx,%edx,4),%ebx
 5a9:	8d 14 1b             	lea    (%ebx,%ebx,1),%edx
 5ac:	83 c1 01             	add    $0x1,%ecx
 5af:	0f be c0             	movsbl %al,%eax
 5b2:	8d 54 10 d0          	lea    -0x30(%eax,%edx,1),%edx
 5b6:	eb e3                	jmp    59b <atoi+0x10>
  return n;
}
 5b8:	89 d0                	mov    %edx,%eax
 5ba:	5b                   	pop    %ebx
 5bb:	5d                   	pop    %ebp
 5bc:	c3                   	ret    

000005bd <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5bd:	f3 0f 1e fb          	endbr32 
 5c1:	55                   	push   %ebp
 5c2:	89 e5                	mov    %esp,%ebp
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	8b 75 08             	mov    0x8(%ebp),%esi
 5c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5cc:	8b 45 10             	mov    0x10(%ebp),%eax
  char *dst;
  const char *src;

  dst = vdst;
 5cf:	89 f2                	mov    %esi,%edx
  src = vsrc;
  while(n-- > 0)
 5d1:	8d 58 ff             	lea    -0x1(%eax),%ebx
 5d4:	85 c0                	test   %eax,%eax
 5d6:	7e 0f                	jle    5e7 <memmove+0x2a>
    *dst++ = *src++;
 5d8:	0f b6 01             	movzbl (%ecx),%eax
 5db:	88 02                	mov    %al,(%edx)
 5dd:	8d 49 01             	lea    0x1(%ecx),%ecx
 5e0:	8d 52 01             	lea    0x1(%edx),%edx
  while(n-- > 0)
 5e3:	89 d8                	mov    %ebx,%eax
 5e5:	eb ea                	jmp    5d1 <memmove+0x14>
  return vdst;
}
 5e7:	89 f0                	mov    %esi,%eax
 5e9:	5b                   	pop    %ebx
 5ea:	5e                   	pop    %esi
 5eb:	5d                   	pop    %ebp
 5ec:	c3                   	ret    

000005ed <thread_create>:


int thread_create(void (*start_routine)(void *, void *), void *arg1, void *arg2) {
 5ed:	f3 0f 1e fb          	endbr32 
 5f1:	55                   	push   %ebp
 5f2:	89 e5                	mov    %esp,%ebp
 5f4:	53                   	push   %ebx
 5f5:	83 ec 10             	sub    $0x10,%esp

  void *curr_ptr = malloc(PGSIZE*2);
 5f8:	68 00 20 00 00       	push   $0x2000
 5fd:	e8 c7 04 00 00       	call   ac9 <malloc>
  void *user_stack = curr_ptr;

  if ((uint)user_stack % PGSIZE != 0) {
 602:	83 c4 10             	add    $0x10,%esp
 605:	89 c2                	mov    %eax,%edx
 607:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 60d:	74 22                	je     631 <thread_create+0x44>
    user_stack += (PGSIZE - ((uint)user_stack % PGSIZE));
 60f:	b9 00 10 00 00       	mov    $0x1000,%ecx
 614:	29 d1                	sub    %edx,%ecx
 616:	01 c1                	add    %eax,%ecx
  }

  int i;
  for (i = 0; i < NPROC; i++) {
 618:	ba 00 00 00 00       	mov    $0x0,%edx
 61d:	83 fa 3f             	cmp    $0x3f,%edx
 620:	7f 13                	jg     635 <thread_create+0x48>
    if (cell_full[i] != 1) { break; }
 622:	83 3c 95 00 13 00 00 	cmpl   $0x1,0x1300(,%edx,4)
 629:	01 
 62a:	75 09                	jne    635 <thread_create+0x48>
  for (i = 0; i < NPROC; i++) {
 62c:	83 c2 01             	add    $0x1,%edx
 62f:	eb ec                	jmp    61d <thread_create+0x30>
  void *user_stack = curr_ptr;
 631:	89 c1                	mov    %eax,%ecx
 633:	eb e3                	jmp    618 <thread_create+0x2b>
  }
  if (cell_full[i] == 1) {
 635:	83 3c 95 00 13 00 00 	cmpl   $0x1,0x1300(,%edx,4)
 63c:	01 
 63d:	74 34                	je     673 <thread_create+0x86>
    return -1;
  }

  ptr_pairs[i].orig_ptr = curr_ptr;
 63f:	8d 1c 52             	lea    (%edx,%edx,2),%ebx
 642:	c1 e3 02             	shl    $0x2,%ebx
 645:	89 83 00 10 00 00    	mov    %eax,0x1000(%ebx)
  ptr_pairs[i].offset_ptr = user_stack;
 64b:	89 8b 04 10 00 00    	mov    %ecx,0x1004(%ebx)
  cell_full[i] = 1;
 651:	c7 04 95 00 13 00 00 	movl   $0x1,0x1300(,%edx,4)
 658:	01 00 00 00 
  //   curr_ptrs->next->orig_ptr = curr_ptr;
  //   curr_ptrs->next->offset_ptr = user_stack;
  //   curr_ptrs->next->next = NULL;
  // }

  return clone(user_stack, start_routine, arg1, arg2);
 65c:	ff 75 10             	pushl  0x10(%ebp)
 65f:	ff 75 0c             	pushl  0xc(%ebp)
 662:	ff 75 08             	pushl  0x8(%ebp)
 665:	51                   	push   %ecx
 666:	e8 dc 00 00 00       	call   747 <clone>
 66b:	83 c4 10             	add    $0x10,%esp
}
 66e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 671:	c9                   	leave  
 672:	c3                   	ret    
    return -1;
 673:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 678:	eb f4                	jmp    66e <thread_create+0x81>

0000067a <thread_join>:

int thread_join(){
 67a:	f3 0f 1e fb          	endbr32 
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	56                   	push   %esi
 682:	53                   	push   %ebx
 683:	83 ec 1c             	sub    $0x1c,%esp
  void* diov;
  int out = join(&diov);
 686:	8d 45 f4             	lea    -0xc(%ebp),%eax
 689:	50                   	push   %eax
 68a:	e8 d0 00 00 00       	call   75f <join>
 68f:	89 c6                	mov    %eax,%esi
  // free(curr_ptrs->orig_ptr);
  // prev_ptrs->next = curr_ptrs->next;
  // free(curr_ptrs);

  int i;
  for (i = 0; i < NPROC; i++) {
 691:	83 c4 10             	add    $0x10,%esp
 694:	bb 00 00 00 00       	mov    $0x0,%ebx
 699:	83 fb 3f             	cmp    $0x3f,%ebx
 69c:	7f 14                	jg     6b2 <thread_join+0x38>
    if (ptr_pairs[i].offset_ptr == diov) { break; }
 69e:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 6a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 6a4:	39 14 85 04 10 00 00 	cmp    %edx,0x1004(,%eax,4)
 6ab:	74 05                	je     6b2 <thread_join+0x38>
  for (i = 0; i < NPROC; i++) {
 6ad:	83 c3 01             	add    $0x1,%ebx
 6b0:	eb e7                	jmp    699 <thread_join+0x1f>
  }
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 6b2:	8d 04 5b             	lea    (%ebx,%ebx,2),%eax
 6b5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6b8:	39 0c 85 04 10 00 00 	cmp    %ecx,0x1004(,%eax,4)
 6bf:	75 26                	jne    6e7 <thread_join+0x6d>

  free(ptr_pairs[i].orig_ptr);
 6c1:	83 ec 0c             	sub    $0xc,%esp
 6c4:	ff 34 85 00 10 00 00 	pushl  0x1000(,%eax,4)
 6cb:	e8 35 03 00 00       	call   a05 <free>
  cell_full[i] = 0;
 6d0:	c7 04 9d 00 13 00 00 	movl   $0x0,0x1300(,%ebx,4)
 6d7:	00 00 00 00 

  return out;
 6db:	83 c4 10             	add    $0x10,%esp
}
 6de:	89 f0                	mov    %esi,%eax
 6e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 6e3:	5b                   	pop    %ebx
 6e4:	5e                   	pop    %esi
 6e5:	5d                   	pop    %ebp
 6e6:	c3                   	ret    
  if (ptr_pairs[i].offset_ptr != diov) { return -1; }
 6e7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 6ec:	eb f0                	jmp    6de <thread_join+0x64>

000006ee <lock_init>:
      : "memory"
    );
    return value;
}

void lock_init(lock_t *lock) {
 6ee:	f3 0f 1e fb          	endbr32 
 6f2:	55                   	push   %ebp
 6f3:	89 e5                	mov    %esp,%ebp
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
  lock->ticket = 0;
 6f8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  lock->turn = 0;
 6fe:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
}
 705:	5d                   	pop    %ebp
 706:	c3                   	ret    

00000707 <lock_acquire>:

void lock_acquire(lock_t *lock) {
 707:	f3 0f 1e fb          	endbr32 
 70b:	55                   	push   %ebp
 70c:	89 e5                	mov    %esp,%ebp
 70e:	8b 55 08             	mov    0x8(%ebp),%edx
    __asm__ volatile("lock; xaddl %0, %1"
 711:	b9 01 00 00 00       	mov    $0x1,%ecx
 716:	f0 0f c1 0a          	lock xadd %ecx,(%edx)
 71a:	b8 00 00 00 00       	mov    $0x0,%eax
 71f:	f0 0f c1 42 04       	lock xadd %eax,0x4(%edx)

    int myturn = fetch_and_add(&lock->ticket, 1);
    while( fetch_and_add(&lock->turn, 0) != myturn ) { //changed
 724:	39 c1                	cmp    %eax,%ecx
 726:	75 f2                	jne    71a <lock_acquire+0x13>
      ; // spin
    }
}
 728:	5d                   	pop    %ebp
 729:	c3                   	ret    

0000072a <lock_release>:

void lock_release(lock_t *lock) {
 72a:	f3 0f 1e fb          	endbr32 
 72e:	55                   	push   %ebp
 72f:	89 e5                	mov    %esp,%ebp
 731:	8b 55 08             	mov    0x8(%ebp),%edx
    lock->turn = lock->turn + 1;
 734:	8b 42 04             	mov    0x4(%edx),%eax
 737:	83 c0 01             	add    $0x1,%eax
 73a:	89 42 04             	mov    %eax,0x4(%edx)
}
 73d:	5d                   	pop    %ebp
 73e:	c3                   	ret    

0000073f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 73f:	b8 01 00 00 00       	mov    $0x1,%eax
 744:	cd 40                	int    $0x40
 746:	c3                   	ret    

00000747 <clone>:
SYSCALL(clone)
 747:	b8 16 00 00 00       	mov    $0x16,%eax
 74c:	cd 40                	int    $0x40
 74e:	c3                   	ret    

0000074f <exit>:
SYSCALL(exit)
 74f:	b8 02 00 00 00       	mov    $0x2,%eax
 754:	cd 40                	int    $0x40
 756:	c3                   	ret    

00000757 <wait>:
SYSCALL(wait)
 757:	b8 03 00 00 00       	mov    $0x3,%eax
 75c:	cd 40                	int    $0x40
 75e:	c3                   	ret    

0000075f <join>:
SYSCALL(join)
 75f:	b8 17 00 00 00       	mov    $0x17,%eax
 764:	cd 40                	int    $0x40
 766:	c3                   	ret    

00000767 <pipe>:
SYSCALL(pipe)
 767:	b8 04 00 00 00       	mov    $0x4,%eax
 76c:	cd 40                	int    $0x40
 76e:	c3                   	ret    

0000076f <read>:
SYSCALL(read)
 76f:	b8 05 00 00 00       	mov    $0x5,%eax
 774:	cd 40                	int    $0x40
 776:	c3                   	ret    

00000777 <write>:
SYSCALL(write)
 777:	b8 10 00 00 00       	mov    $0x10,%eax
 77c:	cd 40                	int    $0x40
 77e:	c3                   	ret    

0000077f <close>:
SYSCALL(close)
 77f:	b8 15 00 00 00       	mov    $0x15,%eax
 784:	cd 40                	int    $0x40
 786:	c3                   	ret    

00000787 <kill>:
SYSCALL(kill)
 787:	b8 06 00 00 00       	mov    $0x6,%eax
 78c:	cd 40                	int    $0x40
 78e:	c3                   	ret    

0000078f <exec>:
SYSCALL(exec)
 78f:	b8 07 00 00 00       	mov    $0x7,%eax
 794:	cd 40                	int    $0x40
 796:	c3                   	ret    

00000797 <open>:
SYSCALL(open)
 797:	b8 0f 00 00 00       	mov    $0xf,%eax
 79c:	cd 40                	int    $0x40
 79e:	c3                   	ret    

0000079f <mknod>:
SYSCALL(mknod)
 79f:	b8 11 00 00 00       	mov    $0x11,%eax
 7a4:	cd 40                	int    $0x40
 7a6:	c3                   	ret    

000007a7 <unlink>:
SYSCALL(unlink)
 7a7:	b8 12 00 00 00       	mov    $0x12,%eax
 7ac:	cd 40                	int    $0x40
 7ae:	c3                   	ret    

000007af <fstat>:
SYSCALL(fstat)
 7af:	b8 08 00 00 00       	mov    $0x8,%eax
 7b4:	cd 40                	int    $0x40
 7b6:	c3                   	ret    

000007b7 <link>:
SYSCALL(link)
 7b7:	b8 13 00 00 00       	mov    $0x13,%eax
 7bc:	cd 40                	int    $0x40
 7be:	c3                   	ret    

000007bf <mkdir>:
SYSCALL(mkdir)
 7bf:	b8 14 00 00 00       	mov    $0x14,%eax
 7c4:	cd 40                	int    $0x40
 7c6:	c3                   	ret    

000007c7 <chdir>:
SYSCALL(chdir)
 7c7:	b8 09 00 00 00       	mov    $0x9,%eax
 7cc:	cd 40                	int    $0x40
 7ce:	c3                   	ret    

000007cf <dup>:
SYSCALL(dup)
 7cf:	b8 0a 00 00 00       	mov    $0xa,%eax
 7d4:	cd 40                	int    $0x40
 7d6:	c3                   	ret    

000007d7 <getpid>:
SYSCALL(getpid)
 7d7:	b8 0b 00 00 00       	mov    $0xb,%eax
 7dc:	cd 40                	int    $0x40
 7de:	c3                   	ret    

000007df <sbrk>:
SYSCALL(sbrk)
 7df:	b8 0c 00 00 00       	mov    $0xc,%eax
 7e4:	cd 40                	int    $0x40
 7e6:	c3                   	ret    

000007e7 <sleep>:
SYSCALL(sleep)
 7e7:	b8 0d 00 00 00       	mov    $0xd,%eax
 7ec:	cd 40                	int    $0x40
 7ee:	c3                   	ret    

000007ef <uptime>:
SYSCALL(uptime)
 7ef:	b8 0e 00 00 00       	mov    $0xe,%eax
 7f4:	cd 40                	int    $0x40
 7f6:	c3                   	ret    

000007f7 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7f7:	55                   	push   %ebp
 7f8:	89 e5                	mov    %esp,%ebp
 7fa:	83 ec 1c             	sub    $0x1c,%esp
 7fd:	88 55 f4             	mov    %dl,-0xc(%ebp)
  write(fd, &c, 1);
 800:	6a 01                	push   $0x1
 802:	8d 55 f4             	lea    -0xc(%ebp),%edx
 805:	52                   	push   %edx
 806:	50                   	push   %eax
 807:	e8 6b ff ff ff       	call   777 <write>
}
 80c:	83 c4 10             	add    $0x10,%esp
 80f:	c9                   	leave  
 810:	c3                   	ret    

00000811 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 811:	55                   	push   %ebp
 812:	89 e5                	mov    %esp,%ebp
 814:	57                   	push   %edi
 815:	56                   	push   %esi
 816:	53                   	push   %ebx
 817:	83 ec 2c             	sub    $0x2c,%esp
 81a:	89 45 d0             	mov    %eax,-0x30(%ebp)
 81d:	89 d6                	mov    %edx,%esi
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 81f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 823:	0f 95 c2             	setne  %dl
 826:	89 f0                	mov    %esi,%eax
 828:	c1 e8 1f             	shr    $0x1f,%eax
 82b:	84 c2                	test   %al,%dl
 82d:	74 42                	je     871 <printint+0x60>
    neg = 1;
    x = -xx;
 82f:	f7 de                	neg    %esi
    neg = 1;
 831:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 838:	bb 00 00 00 00       	mov    $0x0,%ebx
  do{
    buf[i++] = digits[x % base];
 83d:	89 f0                	mov    %esi,%eax
 83f:	ba 00 00 00 00       	mov    $0x0,%edx
 844:	f7 f1                	div    %ecx
 846:	89 df                	mov    %ebx,%edi
 848:	83 c3 01             	add    $0x1,%ebx
 84b:	0f b6 92 24 0c 00 00 	movzbl 0xc24(%edx),%edx
 852:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
  }while((x /= base) != 0);
 856:	89 f2                	mov    %esi,%edx
 858:	89 c6                	mov    %eax,%esi
 85a:	39 d1                	cmp    %edx,%ecx
 85c:	76 df                	jbe    83d <printint+0x2c>
  if(neg)
 85e:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 862:	74 2f                	je     893 <printint+0x82>
    buf[i++] = '-';
 864:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 869:	8d 5f 02             	lea    0x2(%edi),%ebx
 86c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 86f:	eb 15                	jmp    886 <printint+0x75>
  neg = 0;
 871:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 878:	eb be                	jmp    838 <printint+0x27>

  while(--i >= 0)
    putc(fd, buf[i]);
 87a:	0f be 54 1d d8       	movsbl -0x28(%ebp,%ebx,1),%edx
 87f:	89 f0                	mov    %esi,%eax
 881:	e8 71 ff ff ff       	call   7f7 <putc>
  while(--i >= 0)
 886:	83 eb 01             	sub    $0x1,%ebx
 889:	79 ef                	jns    87a <printint+0x69>
}
 88b:	83 c4 2c             	add    $0x2c,%esp
 88e:	5b                   	pop    %ebx
 88f:	5e                   	pop    %esi
 890:	5f                   	pop    %edi
 891:	5d                   	pop    %ebp
 892:	c3                   	ret    
 893:	8b 75 d0             	mov    -0x30(%ebp),%esi
 896:	eb ee                	jmp    886 <printint+0x75>

00000898 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 898:	f3 0f 1e fb          	endbr32 
 89c:	55                   	push   %ebp
 89d:	89 e5                	mov    %esp,%ebp
 89f:	57                   	push   %edi
 8a0:	56                   	push   %esi
 8a1:	53                   	push   %ebx
 8a2:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 8a5:	8d 45 10             	lea    0x10(%ebp),%eax
 8a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  state = 0;
 8ab:	be 00 00 00 00       	mov    $0x0,%esi
  for(i = 0; fmt[i]; i++){
 8b0:	bb 00 00 00 00       	mov    $0x0,%ebx
 8b5:	eb 14                	jmp    8cb <printf+0x33>
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 8b7:	89 fa                	mov    %edi,%edx
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
 8bc:	e8 36 ff ff ff       	call   7f7 <putc>
 8c1:	eb 05                	jmp    8c8 <printf+0x30>
      }
    } else if(state == '%'){
 8c3:	83 fe 25             	cmp    $0x25,%esi
 8c6:	74 25                	je     8ed <printf+0x55>
  for(i = 0; fmt[i]; i++){
 8c8:	83 c3 01             	add    $0x1,%ebx
 8cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 8ce:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
 8d2:	84 c0                	test   %al,%al
 8d4:	0f 84 23 01 00 00    	je     9fd <printf+0x165>
    c = fmt[i] & 0xff;
 8da:	0f be f8             	movsbl %al,%edi
 8dd:	0f b6 c0             	movzbl %al,%eax
    if(state == 0){
 8e0:	85 f6                	test   %esi,%esi
 8e2:	75 df                	jne    8c3 <printf+0x2b>
      if(c == '%'){
 8e4:	83 f8 25             	cmp    $0x25,%eax
 8e7:	75 ce                	jne    8b7 <printf+0x1f>
        state = '%';
 8e9:	89 c6                	mov    %eax,%esi
 8eb:	eb db                	jmp    8c8 <printf+0x30>
      if(c == 'd'){
 8ed:	83 f8 64             	cmp    $0x64,%eax
 8f0:	74 49                	je     93b <printf+0xa3>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8f2:	83 f8 78             	cmp    $0x78,%eax
 8f5:	0f 94 c1             	sete   %cl
 8f8:	83 f8 70             	cmp    $0x70,%eax
 8fb:	0f 94 c2             	sete   %dl
 8fe:	08 d1                	or     %dl,%cl
 900:	75 63                	jne    965 <printf+0xcd>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 902:	83 f8 73             	cmp    $0x73,%eax
 905:	0f 84 84 00 00 00    	je     98f <printf+0xf7>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 90b:	83 f8 63             	cmp    $0x63,%eax
 90e:	0f 84 b7 00 00 00    	je     9cb <printf+0x133>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 914:	83 f8 25             	cmp    $0x25,%eax
 917:	0f 84 cc 00 00 00    	je     9e9 <printf+0x151>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 91d:	ba 25 00 00 00       	mov    $0x25,%edx
 922:	8b 45 08             	mov    0x8(%ebp),%eax
 925:	e8 cd fe ff ff       	call   7f7 <putc>
        putc(fd, c);
 92a:	89 fa                	mov    %edi,%edx
 92c:	8b 45 08             	mov    0x8(%ebp),%eax
 92f:	e8 c3 fe ff ff       	call   7f7 <putc>
      }
      state = 0;
 934:	be 00 00 00 00       	mov    $0x0,%esi
 939:	eb 8d                	jmp    8c8 <printf+0x30>
        printint(fd, *ap, 10, 1);
 93b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 93e:	8b 17                	mov    (%edi),%edx
 940:	83 ec 0c             	sub    $0xc,%esp
 943:	6a 01                	push   $0x1
 945:	b9 0a 00 00 00       	mov    $0xa,%ecx
 94a:	8b 45 08             	mov    0x8(%ebp),%eax
 94d:	e8 bf fe ff ff       	call   811 <printint>
        ap++;
 952:	83 c7 04             	add    $0x4,%edi
 955:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 958:	83 c4 10             	add    $0x10,%esp
      state = 0;
 95b:	be 00 00 00 00       	mov    $0x0,%esi
 960:	e9 63 ff ff ff       	jmp    8c8 <printf+0x30>
        printint(fd, *ap, 16, 0);
 965:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 968:	8b 17                	mov    (%edi),%edx
 96a:	83 ec 0c             	sub    $0xc,%esp
 96d:	6a 00                	push   $0x0
 96f:	b9 10 00 00 00       	mov    $0x10,%ecx
 974:	8b 45 08             	mov    0x8(%ebp),%eax
 977:	e8 95 fe ff ff       	call   811 <printint>
        ap++;
 97c:	83 c7 04             	add    $0x4,%edi
 97f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
 982:	83 c4 10             	add    $0x10,%esp
      state = 0;
 985:	be 00 00 00 00       	mov    $0x0,%esi
 98a:	e9 39 ff ff ff       	jmp    8c8 <printf+0x30>
        s = (char*)*ap;
 98f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 992:	8b 30                	mov    (%eax),%esi
        ap++;
 994:	83 c0 04             	add    $0x4,%eax
 997:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        if(s == 0)
 99a:	85 f6                	test   %esi,%esi
 99c:	75 28                	jne    9c6 <printf+0x12e>
          s = "(null)";
 99e:	be 1c 0c 00 00       	mov    $0xc1c,%esi
 9a3:	8b 7d 08             	mov    0x8(%ebp),%edi
 9a6:	eb 0d                	jmp    9b5 <printf+0x11d>
          putc(fd, *s);
 9a8:	0f be d2             	movsbl %dl,%edx
 9ab:	89 f8                	mov    %edi,%eax
 9ad:	e8 45 fe ff ff       	call   7f7 <putc>
          s++;
 9b2:	83 c6 01             	add    $0x1,%esi
        while(*s != 0){
 9b5:	0f b6 16             	movzbl (%esi),%edx
 9b8:	84 d2                	test   %dl,%dl
 9ba:	75 ec                	jne    9a8 <printf+0x110>
      state = 0;
 9bc:	be 00 00 00 00       	mov    $0x0,%esi
 9c1:	e9 02 ff ff ff       	jmp    8c8 <printf+0x30>
 9c6:	8b 7d 08             	mov    0x8(%ebp),%edi
 9c9:	eb ea                	jmp    9b5 <printf+0x11d>
        putc(fd, *ap);
 9cb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
 9ce:	0f be 17             	movsbl (%edi),%edx
 9d1:	8b 45 08             	mov    0x8(%ebp),%eax
 9d4:	e8 1e fe ff ff       	call   7f7 <putc>
        ap++;
 9d9:	83 c7 04             	add    $0x4,%edi
 9dc:	89 7d e4             	mov    %edi,-0x1c(%ebp)
      state = 0;
 9df:	be 00 00 00 00       	mov    $0x0,%esi
 9e4:	e9 df fe ff ff       	jmp    8c8 <printf+0x30>
        putc(fd, c);
 9e9:	89 fa                	mov    %edi,%edx
 9eb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ee:	e8 04 fe ff ff       	call   7f7 <putc>
      state = 0;
 9f3:	be 00 00 00 00       	mov    $0x0,%esi
 9f8:	e9 cb fe ff ff       	jmp    8c8 <printf+0x30>
    }
  }
}
 9fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 a00:	5b                   	pop    %ebx
 a01:	5e                   	pop    %esi
 a02:	5f                   	pop    %edi
 a03:	5d                   	pop    %ebp
 a04:	c3                   	ret    

00000a05 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a05:	f3 0f 1e fb          	endbr32 
 a09:	55                   	push   %ebp
 a0a:	89 e5                	mov    %esp,%ebp
 a0c:	57                   	push   %edi
 a0d:	56                   	push   %esi
 a0e:	53                   	push   %ebx
 a0f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a12:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a15:	a1 e0 0f 00 00       	mov    0xfe0,%eax
 a1a:	eb 02                	jmp    a1e <free+0x19>
 a1c:	89 d0                	mov    %edx,%eax
 a1e:	39 c8                	cmp    %ecx,%eax
 a20:	73 04                	jae    a26 <free+0x21>
 a22:	39 08                	cmp    %ecx,(%eax)
 a24:	77 12                	ja     a38 <free+0x33>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a26:	8b 10                	mov    (%eax),%edx
 a28:	39 c2                	cmp    %eax,%edx
 a2a:	77 f0                	ja     a1c <free+0x17>
 a2c:	39 c8                	cmp    %ecx,%eax
 a2e:	72 08                	jb     a38 <free+0x33>
 a30:	39 ca                	cmp    %ecx,%edx
 a32:	77 04                	ja     a38 <free+0x33>
 a34:	89 d0                	mov    %edx,%eax
 a36:	eb e6                	jmp    a1e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a38:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a3b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a3e:	8b 10                	mov    (%eax),%edx
 a40:	39 d7                	cmp    %edx,%edi
 a42:	74 19                	je     a5d <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a44:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a47:	8b 50 04             	mov    0x4(%eax),%edx
 a4a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a4d:	39 ce                	cmp    %ecx,%esi
 a4f:	74 1b                	je     a6c <free+0x67>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a51:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a53:	a3 e0 0f 00 00       	mov    %eax,0xfe0
}
 a58:	5b                   	pop    %ebx
 a59:	5e                   	pop    %esi
 a5a:	5f                   	pop    %edi
 a5b:	5d                   	pop    %ebp
 a5c:	c3                   	ret    
    bp->s.size += p->s.ptr->s.size;
 a5d:	03 72 04             	add    0x4(%edx),%esi
 a60:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a63:	8b 10                	mov    (%eax),%edx
 a65:	8b 12                	mov    (%edx),%edx
 a67:	89 53 f8             	mov    %edx,-0x8(%ebx)
 a6a:	eb db                	jmp    a47 <free+0x42>
    p->s.size += bp->s.size;
 a6c:	03 53 fc             	add    -0x4(%ebx),%edx
 a6f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a72:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a75:	89 10                	mov    %edx,(%eax)
 a77:	eb da                	jmp    a53 <free+0x4e>

00000a79 <morecore>:

static Header*
morecore(uint nu)
{
 a79:	55                   	push   %ebp
 a7a:	89 e5                	mov    %esp,%ebp
 a7c:	53                   	push   %ebx
 a7d:	83 ec 04             	sub    $0x4,%esp
 a80:	89 c3                	mov    %eax,%ebx
  char *p;
  Header *hp;

  if(nu < 4096)
 a82:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 a87:	77 05                	ja     a8e <morecore+0x15>
    nu = 4096;
 a89:	bb 00 10 00 00       	mov    $0x1000,%ebx
  p = sbrk(nu * sizeof(Header));
 a8e:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 a95:	83 ec 0c             	sub    $0xc,%esp
 a98:	50                   	push   %eax
 a99:	e8 41 fd ff ff       	call   7df <sbrk>
  if(p == (char*)-1)
 a9e:	83 c4 10             	add    $0x10,%esp
 aa1:	83 f8 ff             	cmp    $0xffffffff,%eax
 aa4:	74 1c                	je     ac2 <morecore+0x49>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 aa6:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 aa9:	83 c0 08             	add    $0x8,%eax
 aac:	83 ec 0c             	sub    $0xc,%esp
 aaf:	50                   	push   %eax
 ab0:	e8 50 ff ff ff       	call   a05 <free>
  return freep;
 ab5:	a1 e0 0f 00 00       	mov    0xfe0,%eax
 aba:	83 c4 10             	add    $0x10,%esp
}
 abd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 ac0:	c9                   	leave  
 ac1:	c3                   	ret    
    return 0;
 ac2:	b8 00 00 00 00       	mov    $0x0,%eax
 ac7:	eb f4                	jmp    abd <morecore+0x44>

00000ac9 <malloc>:

void*
malloc(uint nbytes)
{
 ac9:	f3 0f 1e fb          	endbr32 
 acd:	55                   	push   %ebp
 ace:	89 e5                	mov    %esp,%ebp
 ad0:	53                   	push   %ebx
 ad1:	83 ec 04             	sub    $0x4,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ad4:	8b 45 08             	mov    0x8(%ebp),%eax
 ad7:	8d 58 07             	lea    0x7(%eax),%ebx
 ada:	c1 eb 03             	shr    $0x3,%ebx
 add:	83 c3 01             	add    $0x1,%ebx
  if((prevp = freep) == 0){
 ae0:	8b 0d e0 0f 00 00    	mov    0xfe0,%ecx
 ae6:	85 c9                	test   %ecx,%ecx
 ae8:	74 04                	je     aee <malloc+0x25>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aea:	8b 01                	mov    (%ecx),%eax
 aec:	eb 4b                	jmp    b39 <malloc+0x70>
    base.s.ptr = freep = prevp = &base;
 aee:	c7 05 e0 0f 00 00 e4 	movl   $0xfe4,0xfe0
 af5:	0f 00 00 
 af8:	c7 05 e4 0f 00 00 e4 	movl   $0xfe4,0xfe4
 aff:	0f 00 00 
    base.s.size = 0;
 b02:	c7 05 e8 0f 00 00 00 	movl   $0x0,0xfe8
 b09:	00 00 00 
    base.s.ptr = freep = prevp = &base;
 b0c:	b9 e4 0f 00 00       	mov    $0xfe4,%ecx
 b11:	eb d7                	jmp    aea <malloc+0x21>
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b13:	74 1a                	je     b2f <malloc+0x66>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b15:	29 da                	sub    %ebx,%edx
 b17:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 b1a:	8d 04 d0             	lea    (%eax,%edx,8),%eax
        p->s.size = nunits;
 b1d:	89 58 04             	mov    %ebx,0x4(%eax)
      }
      freep = prevp;
 b20:	89 0d e0 0f 00 00    	mov    %ecx,0xfe0
      return (void*)(p + 1);
 b26:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 b29:	83 c4 04             	add    $0x4,%esp
 b2c:	5b                   	pop    %ebx
 b2d:	5d                   	pop    %ebp
 b2e:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 b2f:	8b 10                	mov    (%eax),%edx
 b31:	89 11                	mov    %edx,(%ecx)
 b33:	eb eb                	jmp    b20 <malloc+0x57>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b35:	89 c1                	mov    %eax,%ecx
 b37:	8b 00                	mov    (%eax),%eax
    if(p->s.size >= nunits){
 b39:	8b 50 04             	mov    0x4(%eax),%edx
 b3c:	39 da                	cmp    %ebx,%edx
 b3e:	73 d3                	jae    b13 <malloc+0x4a>
    if(p == freep)
 b40:	39 05 e0 0f 00 00    	cmp    %eax,0xfe0
 b46:	75 ed                	jne    b35 <malloc+0x6c>
      if((p = morecore(nunits)) == 0)
 b48:	89 d8                	mov    %ebx,%eax
 b4a:	e8 2a ff ff ff       	call   a79 <morecore>
 b4f:	85 c0                	test   %eax,%eax
 b51:	75 e2                	jne    b35 <malloc+0x6c>
 b53:	eb d4                	jmp    b29 <malloc+0x60>
