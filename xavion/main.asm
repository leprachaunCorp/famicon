	.inesprg 2	; 1x 16KB PRG code
	.ineschr 1	; 1x  8KB CHR data
	.inesmap 0	; mapper 0 = NROM, no bank swapping
	.inesmir 0	; background mirroring



;Bank 0 - $8000番地から始まるプログラムROM領域。ここにプログラムを入れる。
;Bank 1 - 割り込みテープル。$FFFA番地から始まる。
;         今回はPRGが３２KBのためBank3から背景データ、１６KBの場合はBank2を利用
;Bank 3 - スプライトと背景データを入れるバンク。VRAMの$0000番地から始まる。
;ファミコン世界ではRAMはファミコンハード本体の中にあるデータが読み書き可能な領域、 ROMはカセットの中にある読み取りしかできない領域



	.rsset $0000	;RAM領域
reg0	.rs 1	; 仮想レジスタ1
reg1	.rs 1	; 仮想レジスタ2
reg2	.rs 1	; 仮想レジスタ3
reg3	.rs 1	; 仮想レジスタ4
reg4	.rs 1	; 仮想レジスタ5
reg5	.rs 1	; 仮想レジスタ6
reg6	.rs 1	; 仮想レジスタ7
reg7	.rs 1	; 仮想レジスタ8

seed	.rs 1;ランダム用
rand	.rs 1	;ランダム用
nextPPUAddr	.rs 1;弾用スプライトのメモリ位置
ballXAddr	.rs 1;弾用X軸
cooldown	.rs 1;弾用間隔

nextPPUAddrm	.rs 1;敵用スプライトのメモリ位置
enemiesXAddr	.rs 1;敵用スプライトのX軸
secEnemies	.rs 1;敵用間隔
nextSecEnemies	.rs 1;敵用間隔
maxCPUTamaSprites	.rs 1;弾用MAXスプライト
maxEnemySprites	.rs 1;敵用MAXスプライト
maxEnemyTamaSprites	.rs 1;敵の弾用MAXスプライト
maxEnemyDataLow	.rs 1;敵用スプライトアドレスLOW
maxEnemyDataHigh	.rs 1;敵用スプライトアドレスHIGH
mutekiMode .rs 1;コナミコマンド用
mutekiAddr .rs 1;コナミコマンド用
mutekiLast .rs 1;コナミコマンド用
mutekiTmp .rs 1;コナミコマンド用
tmp .rs 1;ちょっとした用

currentEnemyLo	.rs 1;今表示する適用アドレスLOW
currentEnemyHi	.rs 1;今表示する適用アドレスHIGH
currentEnemyData	.rs 1;今表示する適用データ
currentEnemyType	.rs 1;今表示する適用TYPE
currentEnemyColor	.rs 1;今表示する適用色
currentEnemyMove	.rs 1;今表示する適用方向
currentEnemySpeed	.rs 1;今表示する適用スピード
currentEnemyVector	.rs 1;今表示する適用ベクター
currentEnemyVectorMove	.rs 1;今表示する適用ベクター方向
currentEnemyVectorMoveWhich	.rs 1;今表示する適用ベクター方向フラグ
currentEnemyVectorShoot	.rs 1;今表示する適弾用ベクター

enemyDatabase0	.rs 1;今表示中する適用各種データ保持
enemyDatabase1	.rs 1
enemyDatabase2	.rs 1
enemyDatabase3	.rs 1
enemyDatabase4	.rs 1
enemyDatabase5	.rs 1
enemyDatabase6	.rs 1
enemyDatabase7	.rs 1
enemyVector0	.rs 1;今表示中する適用各種ベクター値保持
enemyVector1	.rs 1
enemyVector2	.rs 1
enemyVector3	.rs 1
enemyVector4	.rs 1
enemyVector5	.rs 1
enemyVector6	.rs 1
enemyVector7	.rs 1
enemyTamaPPUAddr	.rs 1

curHitTamaAddr	.rs	1;今表示中弾命中アドレス
curHitEnemyAddr	.rs	1;今表示中命敵中アドレス
tama_w	.rs 1;弾の幅
enemy_w	.rs 1;敵の幅

jiki_cooldown	.rs 1;自機間隔
jiki_heart	.rs 1;自機残基数
jiki_shownum .rs 1;自機表示用数字
jiki_hitflg .rs 1;自機当たり判定フラグ

ctrl_1		.rs 1;コンロトーラー１データ保持
ctrl_2		.rs 1;コンロトーラー２データ保持

Scroll_X	.rs 1;スクロールX値
Scroll_Y	.rs 1;スクロールY値
scroll_flg .rs 1;スクロールフラグ
score	.rs 1;スコア

pointerLo	.rs 1;一時保存ポインターLOW
pointerHi	.rs 1;一時保存ポインターHIGH
titleDelFlg	.rs 1;タイトル削除フラグ
waitFlg	.rs 1;待ちフラグ

gamestate	.rs 1;ゲームの状態フラグ
STATE_TITLE		= $00;ゲームの状態定数
STATE_PLAYING	= $01
STATE_GAMEOVER	= $02

note	=$91;音用保存用
note2=	$90
wait = $95;待ち用変数
MusicIndex = $96;音用インデックス
wait2 = $97
wait3 = $98
makeSound = $99;音鳴らす用

;各音階
DO	=	0
DOS	=	1
RE	=	2
RES 	=	3
MI 	=	4
FA 	=	5
FAS 	=	6
SO 	=	7
SOS 	=	8
RA 	=	9
RAS 	=	10
SI 	=	11
DO2 	=	12
DOS2 	=	13
RE2 	=	14
RES2 	=	15
MI2 	=	16
FA2 	=	17
FAS2 	=	18
SO2 	=	19
SOS2 	=	20
RA2 	=	21
RAS2 	=	22
SI2 	=	23
DO3 	=	24
DOS3 	=	25
RE3 	=	26
RES3 	=	27
MI3 	=	28
FA3 	=	29
FAS3 	=	30
SO3  	=	31
SOS3 	=	32
RA3  	=	33
RAS3 	=	34
SI3 	=	35
DO4 	=	36
DOS4 	=	37
RE4 	=	38
RES4 	=	39
MI4 	=	40
FA4 	=	41
FAS4 	=	42
SO4 	=	43
SOS4 	=	44
RA4 	=	45
RAS4 	=	46
SI4 	=	47
ST 	=	48
END 	=	49
REST 	=	50

;********** スプライト用RAMメモリー開始位置 **********;
	.bank 0
	.org $0200
Sprite0_Y:     .db  0   ; スプライト#1 Y座標
Sprite0_T:     .db  0   ; スプライト#1 ナンバー
Sprite0_S:     .db  0   ; スプライト#1 属性
Sprite0_X:     .db  0   ; スプライト#1 X座標
Sprite1_Y:     .db  0   ; スプライト#1 Y座標
Sprite1_T:     .db  0   ; スプライト#1 ナンバー
Sprite1_S:     .db  0   ; スプライト#1 属性
Sprite1_X:     .db  0   ; スプライト#1 X座標
Sprite2_Y:     .db  0
Sprite2_T:     .db  0
Sprite2_S:     .db  0
Sprite2_X:     .db  0
Sprite3_Y:     .db  0
Sprite3_T:     .db  0
Sprite3_S:     .db  0
Sprite3_X:     .db  0
Sprite4_Y:     .db  0
Sprite4_T:     .db  0
Sprite4_S:     .db  0
Sprite4_X:     .db  0
Tama0_Y:     .db  0  
Tama0_T:     .db  0  
Tama0_S:     .db  0  
Tama0_X:     .db  0  
Tama1_Y:     .db  0  
Tama1_T:     .db  0  
Tama1_S:     .db  0  
Tama1_X:     .db  0  
Tama2_Y:     .db  0  
Tama2_T:     .db  0  
Tama2_S:     .db  0  
Tama2_X:     .db  0  
Tama3_Y:     .db  0  
Tama3_T:     .db  0  
Tama3_S:     .db  0  
Tama3_X:     .db  0  ;32
Tama4_Y:     .db  0  
Tama4_T:     .db  0  
Tama4_S:     .db  0  
Tama4_X:     .db  0  
Tama5_Y:     .db  0  
Tama5_T:     .db  0  
Tama5_S:     .db  0  
Tama5_X:     .db  0  
ETama0_Y:	.db	0
ETama0_T:	.db	0
ETama0_S:	.db	0
ETama0_X:	.db	0
ETama1_Y:	.db	0
ETama1_T:	.db	0
ETama1_S:	.db	0
ETama1_X:	.db	0
ETama2_Y:	.db	0
ETama2_T:	.db	0
ETama2_S:	.db	0
ETama2_X:	.db	0
ETama3_Y:	.db	0
ETama3_T:	.db	0
ETama3_S:	.db	0
ETama3_X:	.db	0
ETama4_Y:	.db	0
ETama4_T:	.db	0
ETama4_S:	.db	0
ETama4_X:	.db	0
ETama5_Y:	.db	0
ETama5_T:	.db	0
ETama5_S:	.db	0
ETama5_X:	.db	0
ETama6_Y:	.db	0
ETama6_T:	.db	0
ETama6_S:	.db	0
ETama6_X:	.db	0
ETama7_Y:	.db	0
ETama7_T:	.db	0
ETama7_S:	.db	0
ETama7_X:	.db	0 ;64

Enemy00_Y:	.db	0
Enemy00_T:	.db	0
Enemy00_S:	.db 0
Enemy00_X:	.db 0
Enemy01_Y:	.db	0
Enemy01_T:	.db	0
Enemy01_S:	.db 0
Enemy01_X:	.db 0
Enemy02_Y:	.db	0
Enemy02_T:	.db	0
Enemy02_S:	.db 0
Enemy02_X:	.db 0
Enemy03_Y:	.db	0
Enemy03_T:	.db	0
Enemy03_S:	.db 0
Enemy03_X:	.db 0
Enemy04_Y:	.db	0
Enemy04_T:	.db	0
Enemy04_S:	.db 0
Enemy04_X:	.db 0
Enemy05_Y:	.db	0
Enemy05_T:	.db	0
Enemy05_S:	.db 0
Enemy05_X:	.db 0
Enemy06_Y:	.db	0
Enemy06_T:	.db	0
Enemy06_S:	.db 0
Enemy06_X:	.db 0
Enemy07_Y:	.db	0
Enemy07_T:	.db	0
Enemy07_S:	.db 0
Enemy07_X:	.db 0   ;32+64=96
;96+16=112
;112+16=128



;********** プログラムROMメモリー領域 **********;
	.bank 0
	.org $8000	;ここからプログラム領域なので初期化とかする（ROM領域）

vblankwait:; vblank待ちPPU表示の準備
	BIT $2002
	BPL vblankwait
	RTS

;各種リセット
RESET:
    sei; disable IRQs
    cld; disable decimal mode
    ldx #%01000000
    stx $4017
    ldx #$FF
    txs
    ldx #$00
    stx $2000 ; disable NMI
    stx $2001 ; disable rendering
    stx $4010 ; disable dmc

    jsr vblankwait

clear_memory:
  lda #$00
  sta $0000, x
  sta $0100, x
  sta $0300, x
  sta $0400, x
  sta $0500, x
  sta $0600, x
  sta $0700, x
  lda #$FE; move all sprites off the screen
  sta $0200, x
  inx
  bne clear_memory


LoadPalettes:
	LDA $2002				; read PPU status to reset the high/low latch
	LDA #$3F
	STA $2006				; write the high byte of $3F00 address
	LDA #$00
	STA $2006				; write the low byte of $3F00 address
	LDX #$00				; start out at 0
LoadPalettesLoop:
	LDA palette, x			; load data from address (palette + the value in x)
	STA $2007				; write to PPU
	INX						; X = X + 1
	CPX #$20             	; Compare X to hex $10, decimal 16 - copying 16 bytes = 4 sprites
	BNE LoadPalettesLoop  	; Branch to LoadPalettesLoop if compare was Not Equal to zero
							; if compare was equal to 32, keep going down


ClearPPU:
	LDA #$FF				; We use FF sprite, which is blank on the chr file
	LDX #$00
ClearPPULoop:
	STA $0200, X			; Set ppu address to zero ($0200 + x)
	INX
	CPX #$FF
	BNE ClearPPULoop		; If X != FF repeat, will clear $0200-$02FF
	LDX #$00
ClearPPULoop2:
	STA $0300, X			; Set ppu address to zero ($0300 + x)
	INX
	CPX #$FF
	BNE ClearPPULoop2		; If X != FF repeat, will clear $0300-$03FF


;その他各種変数の初期化
InitVals:
	lda #$be
	sta seed	;ランダムシードの初期化
	lda #$ba
	sta seed + 1
	lda #0
	sta nextPPUAddr
	lda #$0
	sta nextPPUAddrm

	lda #$00
	sta cooldown
	sta jiki_cooldown

	lda #$51
	sta secEnemies
	lda #$00
	sta nextSecEnemies
	lda #8
	sta tama_w
	lda #8
	sta enemy_w

	lda #3
	sta jiki_heart
	lda #$33
	sta jiki_shownum
	lda #0
	sta jiki_hitflg
	sta score
	lda #$0
	sta reg0
	sta reg1
	sta reg2
	sta reg3
	sta reg4
	sta reg5
	sta reg6
	sta reg7
	sta currentEnemyLo
	sta currentEnemyHi
	sta mutekiMode
	lda #1
	sta titleDelFlg
	lda #$14
	sta maxCPUTamaSprites
	lda #$20
	sta maxEnemySprites
	sta maxEnemyTamaSprites
	lda #$FF
	sta maxEnemyDataLow
	lda #$2
	sta maxEnemyDataHigh
	lda #STATE_TITLE
	sta gamestate
	lda #0
	sta waitFlg
	sta scroll_flg

	;自機の初期位置
	lda	#$10
	sta	$0200
	sta	$0203
	lda	#$05
	sta	$0201
	lda	#$00
	sta	$0202


;タイトル表示
InitTitle:
	lda #LOW(gameTitleBg)
	sta pointerLo
	lda #HIGH(gameTitleBg)
	sta pointerHi
	lda $2002
	lda	#$20
	sta	$2006
	lda	#$00
	sta	$2006
	ldx #$00
	ldy #$00
	ldx #$00
    ldy #$00
.loopTtl:
	lda [pointerLo], y
	sta $2007
	iny
	bne .loopTtl
	inc pointerHi
	inx
	cpx #$04
	bne .loopTtl

	;タイトル色付け用パレット設定
	lda #$23
	sta $2006
	lda #$C0
	sta $2006
	ldx #$00
	lda #%10101010				; ４つともパレット3番
.loadAttrib
	sta $2007
	; 64回(全キャラクター分)ループする(実際のタイル数より少ないのはファミコンが４つで１つのパレットを使う仕様のため)
	inx
	cpx #64
	bne .loadAttrib


;PPUの表示用初期化
PPUInit:
	lda #0	
	sta Scroll_X
	lda #230
	sta Scroll_Y
	lda	#%10000000	; enable NMI, sprites from Pattern Table 0
	sta	$2000
	lda	#%00000000	; disable sprites
	sta	$2001

	lda	#$00		; set the low byte (00) of the RAM address ちなみに読み込みアドレスが逆なのはファミコンCPUがリトルエンディアンだから。しってた？
	sta	$2003
	lda	#$02		; set the high byte (02) of the RAM address
	sta	$4014		; start the transfer



;こちらが実はメインルーチンです。メインプログラムを無限ループしNMI表示用割り込み待ちでゲームを進める
main:
	JMP main


;表示用割り込み
NMI:
	lda #$00
	sta $2003       ; set the low byte (00) of the RAM address
	lda #$02
	sta $4014       ; set the high byte (02) of the RAM address, start the transfer


	;PPUの基本設定
	lda #%10010000	; Enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
	sta $2000
	lda #%00011110	; Enable sprites, enable background, no clipping on left side
	sta $2001
	;スクロール位置は最初は０
	lda #$00		; Tell the ppu there is no background scrolling
	sta $2005
	sta $2005
	;ゲーム状態による分岐
	lda gamestate
	cmp #STATE_PLAYING
	bne skipSprite0Check

;--------------------------------------
;こちらが上部を固定させて下の部分だけスクロールさせるための仕掛けで最初のスプライトとバックグラウンド（黒以外）の当たり位置から表示を変更させる！
WaitNotSprite0:
	bit $2002
	bvs WaitNotSprite0        ;wait until out of vBlank

WaitSprite0:
	bit $2002
	bmi skipSprite0Check    ; if vBlank is detected, we missed the sprite 0 hit somehow.
	                        ; jump out of the loop in that case.実はいらない
	bvc WaitSprite0         ; wait until sprite 0 is hit　

	;ネットでこうしろと書いてある
	lda #0
	asl a
	asl a
	sta $2006;PPUADDR

	lda <Scroll_Y
	sta $2005;PPUSCROLL

	and #$F8
	asl a
	asl a
	sta tmp

	lda <Scroll_X
	sta $2005;PPUSCROLL       

	lsr a
	lsr a
	lsr a
	ora tmp
	;Wait for HBlank.
	ldx #06     ;How long to wait. Play around with this value 
loopScrollWait:
	dex
	bne loopScrollWait
	sta $2006;PPUADDR
;--------------------------------------


;固定表示後の描写はこちらから
	lda Scroll_X
	sta $2005
	lda Scroll_Y
	sta $2005

	lda Scroll_Y
	cmp #$40
	bne skipSprite0Check
	lda #230
	sta Scroll_Y

skipSprite0Check:
	lda scroll_flg
	cmp #0
	beq .scrolladd
	dec scroll_flg
	jmp .noscrolladd
.scrolladd
    dec Scroll_Y
	inc scroll_flg
.noscrolladd
	;コントローラー１の情報読み取り
	jsr ReadController1

;;;;;;;;;;;;;;;;;;;;;;;
;ゲームエンジン
;　〇ちょっとしたコツ
;　・比較の結果のブランチ
;　　cmp num or cpx num or cpy num
;　　BNE(!=NUM)　BEQ(==NUM)　BCC(<=NUM)　BCS(>=NUM)　BMI(<0)　BPL(>=0)
;　・BNE、BEQなどアドレスジャンプは256バイト以上の長さのジャンプはできない
GameEngine:
	;当たり音ならすかならさないか
	jsr PlayHit2
	;ゲーム状態による分岐
	lda gamestate
	cmp #STATE_TITLE
	beq RunTitle
	lda gamestate
	cmp #STATE_PLAYING
	beq RunPlaying
	lda gamestate
	cmp #STATE_GAMEOVER
	beq RunGameOver


;ゲーム中の場合
RunPlaying:
	lda cooldown
	cmp #$ff
	bne .jmpCooldown
	lda #$10
	sta cooldown
.jmpCooldown:
	inc cooldown
	lda cooldown
	cmp #$ff
	bne .jmpJikicooldown
	lda #$00
	sta jiki_cooldown
.jmpJikicooldown:
	inc jiki_cooldown

	;HitCheckCPUTamaStart:
	jsr HitCheckCPUTama

	;HitCheckCPUStart:
	jsr HitCheckCPU

	;HadDamageToShip:
	jsr IFHitByEnemy

	;EnemiesSection:
	jsr Isspawnenemies

	;ProjectSection:
	jsr ProjectileTravel
	jsr PlayBGM	;BGMを流す

	;CheckPadSection:
	jsr CheckPad
	jsr CheckMuteki

GameEngineDone:

	RTI             ; return from interrupt





;********** SUBROUTINES **********;
;  .bank 0
;  .org $9000

;;;;;;;;;;;;;;;;;;;;;;;
;各ゲーム状態
;タイトル時
RunTitle:
	lda #%00000000
	sta $4015

	lda #%00001110
	sta $2001

	jsr TitleIncreaseCooldown

	lda ctrl_1
	and #%00010000
	beq GameEngineDone

	; start game
	lda #STATE_PLAYING
	sta gamestate

	lda #%00000000 ; disable NMI
	sta $2000
	lda #%00000000 ; disable rendering
	sta $2001

	lda #230
	sta Scroll_Y

	jsr Starinit
	jsr LoadSpaceship
	jsr ShowJikiNum
	jsr ShowScore
	jsr EnemiesInit

	lda #%10000000
	sta $2000

	jmp GameEngineDone


;ゲームオーバー時
RunGameOver:
	lda waitFlg
	cmp #0
	bne .releaseStartbCheck
	lda ctrl_1
	and #%00010000
	bne .wait
	jmp GameEngineDone
.releaseStartbCheck
	lda waitFlg
	cmp #$6f
	beq .endState
.wait
	inc waitFlg
	jmp GameEngineDone
.endState
	lda #STATE_TITLE
	sta gamestate
	lda #0
	sta waitFlg
	jmp RESET


;ゲームオーバーメッセージ表示
InitGameOverMsg:
	lda $2002
	lda	#$22
	sta	$2006
	lda	#$0B
	sta	$2006
	ldx #0
.loopWriteGO:
	lda gameEndMessage,x
	sta $2007
	inx
	cpx #$09
	bne .loopWriteGO
	rts


;ゲーム時左右操作
CheckPad:
	lda jiki_heart
	cmp #0
	beq .loopend
	jmp .checkloop
.loopend:
	rts
.checkloop
	lda ctrl_1
	and #%10000000
	beq .tamawo_utsu_end
	jsr SpawnProjectile
.tamawo_utsu_end
	lda ctrl_1
	and #%00000010
	beq .hidari_idou_end
	ldx Sprite1_X
	cpx #6
	bcs .delMoreSp
	jmp .hidari_idou_end
.delMoreSp
	dec Sprite1_X
	dec Sprite2_X
	dec Sprite3_X
	dec Sprite4_X
	dec Sprite1_X
	dec Sprite2_X
	dec Sprite3_X
	dec Sprite4_X
.hidari_idou_end
	lda ctrl_1
	and #%00000001
	beq .migi_idou_end
	ldx Sprite1_X
	cpx #238
	bcc .addMoreSp
	jmp .migi_idou_end
.addMoreSp
	inc Sprite1_X
	inc Sprite2_X
	inc Sprite3_X
	inc Sprite4_X
	inc Sprite1_X
	inc Sprite2_X
	inc Sprite3_X
	inc Sprite4_X
.migi_idou_end
	lda ctrl_1
	and #%00001000
	beq .up_idou_end
	ldx Sprite1_Y
	cpx #80
	bcs .delMoreSpy
	jmp .hidari_idou_end
.delMoreSpy
	dec Sprite1_Y
	dec Sprite2_Y
	dec Sprite3_Y
	dec Sprite4_Y
.up_idou_end
	lda ctrl_1
	and #%00000100
	beq .down_idou_end
	ldx Sprite1_Y
	cpx #210
	bcc .addMoreSpy
	jmp .down_idou_end
.addMoreSpy
	inc Sprite1_Y
	inc Sprite2_Y
	inc Sprite3_Y
	inc Sprite4_Y
.down_idou_end
	rts


;Title変更
TitleIncreaseCooldown:
	lda cooldown
	cmp #$9f
	bne .jmpCooldownTtl
.delTitleSt:
	lda #%00000110
	sta $2001
	lda #LOW(gameTitleBg)
	sta pointerLo
	lda #HIGH(gameTitleBg)
	sta pointerHi
	lda $2002
	lda	#$22
	sta	$2006
	lda	#$20
	sta	$2006
	ldx #$02
	inc pointerHi
	inc pointerHi
	lda titleDelFlg
	cmp #1
	beq .delValStart
	lda #1
	sta cooldown
	sta titleDelFlg
	ldy #$20
	jmp .loop
.delValStart
	lda #2
	sta titleDelFlg
	lda #$90
	sta cooldown
	ldy #$40
.loop:
	lda [pointerLo],y
	sta $2007
	iny
	bne .loop
.jmpCooldownTtl:
	inc cooldown
	rts


;;;;;;;;;;;;;;;;;;;;;;;
;Controller
ReadController1:
	lda #$01
	sta $4016
	lda #$00
	sta $4016
	ldx #$08
.readCtrl1Loop:
	lda $4016
	lsr A
	rol ctrl_1 ;A,B,Select,Start,Up,Down,Left,Right（各ビットの位置とその意味）
	dex
	bne .readCtrl1Loop
	rts


;;;;;;;;;;;;;;;;;;;;;;;
;各スプライト描写
;自機
LoadSpaceship:
    ldx #$00				
.loadSpritesLoop
    lda spaceshipSprites, x
    sta Sprite1_Y, x		
    inx
    cpx #$10				
    bne .loadSpritesLoop	
    						
    rts


;自機の弾
SpawnProjectile:
	lda cooldown
	cmp #$10
	bcs .jmpnext
	rts	;jmp ReadADone
.jmpnext
	ldx #$00		
	stx cooldown
	ldx Sprite2_X	
	dex				
	dex
	stx ballXAddr	
	ldx #$00
	ldy nextPPUAddr
	cpy maxCPUTamaSprites ;玉４の次のスプライト
	beq .resetPPUAddr
	jmp .shootProj
.resetPPUAddr:
	ldy #0;#low(Tama0_Y)
	sty nextPPUAddr
.shootProj:
	lda Sprite1_Y		
	sta Tama0_Y, Y		
	iny
	inx
	lda projectile, X	
	sta Tama0_Y, Y		
	iny
	inx
	lda projectile, X	
	sta Tama0_Y, Y		
	iny					
	lda ballXAddr
	sta Tama0_Y, Y
	iny					
	sty nextPPUAddr
	rts;


;自機の弾移動と削除
ProjectileTravel:
	ldx #0
.loopProject
	lda Tama0_Y,x
	tay
	dey
	dey
	dey
	tya
	sta Tama0_Y,x
	txa
	clc
	adc #$04
	tax
	cpx maxCPUTamaSprites
	bcc .loopProject
	ldx #0
.loopProjectE
	lda ETama0_Y,x
	tay
	iny
	iny
	iny
	tya
	sta ETama0_Y,x
	txa
	clc
	adc #$04
	tax
	cpx maxEnemyTamaSprites
	bcc .loopProjectE
	ldx #0
.loopChkProject
	lda Tama0_Y,x
	cmp #$10
	bcc .despawnProjectile
.loopChkMidProject:
	txa
	clc
	adc #$04
	tax
	cpx maxCPUTamaSprites
	bcc .loopChkProject
	ldx #0
.loopChkProjectE
	lda ETama0_Y,x
	cmp #$DF
	bcs .despawnProjectileE
.loopChkMidProjectE:
	txa
	clc
	adc #$04
	tax
	cpx maxEnemyTamaSprites
	bcc .loopChkProjectE
	rts	
;弾削除
.despawnProjectile:
	pha
	lda #$FF
	sta Tama0_Y,x
	sta Tama0_Y+1,x
	sta Tama0_Y+2,x
	sta Tama0_Y+3,x
	pla
	jmp .loopChkMidProject
.despawnProjectileE:
	pha
	lda #$FF
	sta ETama0_Y,x
	sta ETama0_Y+1,x
	sta ETama0_Y+2,x
	sta ETama0_Y+3,x
	pla
	jmp .loopChkMidProjectE


;敵初期化
EnemiesInit:
	lda #low(EnemyDB)
	sta pointerLo
	lda #high(EnemyDB)
	sta pointerHi
	rts


;敵が表示されている間隔待ちあとに敵表示
Isspawnenemies:
	inc nextSecEnemies
	ldy nextSecEnemies
	cpy secEnemies
	beq .spawnEnemies
	jsr EnemiesTravelInit
	rts
.resetPPUAddrm:
	LDY #0
	STY nextPPUAddrm
.spawnEnemies:
	ldy #0
    sty nextSecEnemies
    jsr Prng
	sta enemiesXAddr
	ldy nextPPUAddrm
	cpy maxEnemySprites
	bcs .resetPPUAddrm
.enemiesShow:
	lda #0
	sta currentEnemyType
	sta currentEnemyColor
	sta currentEnemyMove
	ldy currentEnemyLo
	lda [pointerLo], y
	cmp #$ff
	bne .notRestEnemy
	inc currentEnemyLo
	iny
	cpy maxEnemyDataLow ;現在登録されている敵出現リストの長さ
	bcs .isMaxDataLow
	rts
.isMaxDataLow:
	lda #0
	sta currentEnemyLo
	inc pointerHi
	inc currentEnemyHi
	ldx currentEnemyHi
	cpx maxEnemyDataHigh ;;現在登録されている敵出現リストの長さがFFを超えた場合
	bcc .setSprite
	lda #0
	sta currentEnemyLo
	sta currentEnemyHi
	;難易度アップ
	lda secEnemies;#$58
	cmp #$20
	bcc .nomoreFaster
	SEC
	sbc #$10
	sta secEnemies
.nomoreFaster
	jsr EnemiesInit
	rts
.notRestEnemy
	jsr InitCurrentData
	sta currentEnemyData
	asl a
	rol currentEnemySpeed
	asl a
	rol currentEnemySpeed
	asl a
	rol currentEnemyMove
	asl a
	rol currentEnemyMove
	asl a
	rol currentEnemyColor
	asl a
	rol currentEnemyColor
	asl a
	rol currentEnemyType
	asl a
	rol currentEnemyType
.checkDataLimit:
	inc currentEnemyLo
	iny
	cpy maxEnemyDataLow ;現在登録されている敵出現リストの長さ
	bcc .setSprite
	lda #0
	sta currentEnemyLo
	inc pointerHi
	inc currentEnemyHi
	ldx currentEnemyHi
	cpx maxEnemyDataHigh ;;現在登録されている敵出現リストの長さがFFを超えた場合
	bcc .setSprite
	lda #0
	sta currentEnemyLo
	sta currentEnemyHi
	;難易度アップ
	lda secEnemies;#$58
	cmp #$20
	bcc .nomoreFaster
	SEC
	sbc #$10
	sta secEnemies
	jsr EnemiesInit
	rts
.setSprite
	lda currentEnemyData
	ldx nextPPUAddrm
	cpx #$00
	beq .sprite0
	cpx #$04
	beq .sprite1
	cpx #$08
	beq .sprite2
	cpx #$0c
	beq .sprite3
	cpx #$10
	beq .sprite4
	cpx #$14
	beq .sprite5
	cpx #$18
	beq .sprite6
	cpx #$1c
	beq .sprite7
	rts
.sprite0
	sta enemyDatabase0
	lda #0
	sta enemyVector0
	jmp .nextSprite
.sprite1
	sta enemyDatabase1
	lda #0
	sta enemyVector1
	jmp .nextSprite
.sprite2
	sta enemyDatabase2
	lda #0
	sta enemyVector2
	jmp .nextSprite
.sprite3
	sta enemyDatabase3
	lda #0
	sta enemyVector3
	jmp .nextSprite
.sprite4
	sta enemyDatabase4
	lda #0
	sta enemyVector4
	jmp .nextSprite
.sprite5
	sta enemyDatabase5
	lda #0
	sta enemyVector5
	jmp .nextSprite
.sprite6
	sta enemyDatabase6
	lda #0
	sta enemyVector6
	jmp .nextSprite
.sprite7
	sta enemyDatabase7
	lda #0
	sta enemyVector7
.nextSprite
	ldy nextPPUAddrm
	lda #10
	sta Enemy00_Y,y
	iny
	ldx currentEnemyType
	cpx #0
	beq .meteor
	cpx #1
	beq .fighter
	cpx #2
	beq .fighter2
.meteor:
	lda #$02
	sta Enemy00_Y,y
	jmp .whichPalette
.fighter:
	lda #$03
	sta Enemy00_Y,y
	jmp .whichPalette
.fighter2:
	lda #$04
	sta Enemy00_Y,y
.whichPalette
	lda currentEnemyColor
	iny
	sta Enemy00_Y,y
	iny
	lda enemiesXAddr
	sta Enemy00_Y,y
	iny
	sty nextPPUAddrm
	jsr EnemiesTravelInit
	rts


;敵移動
EnemiesTravelInit:
	ldx #0
	lda #0
EnemiesMove:
	pha
	lda Enemy00_Y+1,x
	cmp #$ff
	bne .dataExists
	pla
	clc
	adc #$04
	tax
	cpx maxEnemySprites
	bne EnemiesMove
	ldy #0
	jmp .checkMTravelEnd
.dataExists:
	pla
	jsr GetCurrentEnemyData
	ldy currentEnemyMove
	cpy #0
	beq .movefall
	ldy currentEnemyVectorMoveWhich
	cpy #0
	beq .setWhichMove
	cpy #1
	beq .moveleft
	jmp .moveright
.setWhichMove
	pha
	txa
	pha
	jsr Prng
	ror A
	bcc .isLeftMovingSet
	pla
	tax
	pla
	inc currentEnemyVectorMoveWhich
	inc currentEnemyVectorMoveWhich
	jmp .moveright
.isLeftMovingSet
	pla
	tax
	pla
	inc currentEnemyVectorMoveWhich
	jmp .moveleft
.movefall:
	pha
	jsr ShootByEnemy
	jsr SetCurrentEnemyData
	pla
	ldy currentEnemySpeed
.speedTill0:
	dey
	inc Enemy00_Y,x
	cpy #0
	bne .speedTill0
	inc Enemy00_Y,x
	clc
	adc #$04
	tax
	cpx maxEnemySprites
	bne EnemiesMove
	ldy #0
.checkMTravelEnd:
	ldx Enemy00_Y,y
	cpx #$df
	beq .despawnEnemies
.checkMTravelMid:
	clc
	adc #$04
	tay
	cpy maxEnemySprites
	bne .checkMTravelEnd
	rts
.despawnEnemies:
	lda #$FF
	sta Enemy00_Y, y
	sta Enemy00_Y+1, y
	sta Enemy00_Y+2, y
	sta Enemy00_Y+3, y
	jmp .checkMTravelMid
.moveleft:
	pha
	lda currentEnemyData
	ldy currentEnemyVectorMove
	cpy #0
	bne .rotatevalleft
	inc currentEnemyVectorMove
	pla
	jmp .movefall
.rotatevalleft:
	dec currentEnemyVectorMove
	dec Enemy00_Y+3, x
	pla
	jmp .movefall
.moveright:
	pha
	lda currentEnemyData
	ldy currentEnemyVectorMove
	cpy #0
	bne .rotatevalright
	inc currentEnemyVectorMove
	pla
	jmp .movefall
.rotatevalright:
	dec currentEnemyVectorMove
	inc Enemy00_Y+3, x
	pla
	jmp .movefall


;敵の弾発射
ShootByEnemy:
	pha
	ldy currentEnemyVectorShoot
	cpy #0
	beq .shootable
	jmp .shootEnemyEnd
.shootable
	; ShootAble?
	lda currentEnemyType
	cmp #0
	beq .shootEnemyEnd
	lda Sprite1_X
	clc
	;adc #8
	cmp Enemy00_Y+3,x
	bcc .shootEnemyEnd
	lda Enemy00_Y+3,x
	clc
	adc #8
	cmp Sprite2_X
	bcc .shootEnemyEnd
	ldy enemyTamaPPUAddr
	cpy maxEnemyTamaSprites	;玉MAXの次のスプライト
	bcs .resetEnemyTamaPPUAddr
	jmp .shootEProj
.resetEnemyTamaPPUAddr:
	ldy #0
	sty enemyTamaPPUAddr
.shootEProj:
	inc currentEnemyVectorShoot
	lda Enemy00_Y,x
	sta ETama0_Y, y
	iny
	lda #$01
	sta ETama0_Y, y
	iny
	lda #%00000001
	sta ETama0_Y, Y
	iny
	lda Enemy00_Y+3,x
	CLC
	ADC #4
	sta ETama0_Y, Y
	iny
	sty enemyTamaPPUAddr
	
	ldy currentEnemyVectorMoveWhich
	cpy #1
	beq .isLeftMovingTo
	dec currentEnemyVectorMoveWhich
	jmp .shootEnemyEnd
.isLeftMovingTo
	inc currentEnemyVectorMoveWhich
.shootEnemyEnd:
	ldy #0
	pla
	rts


;敵情報の初期化
InitCurrentData:
	pha
	lda #0
	sta currentEnemySpeed
	sta currentEnemyMove
	sta currentEnemyColor
	sta currentEnemyType
	sta currentEnemyVectorMove
	sta currentEnemyVectorMoveWhich
	sta currentEnemyVectorShoot
	pla
	rts


;敵の現情報すべての取得
GetCurrentEnemyData:
	pha
	cpx #$00
	beq .spriteE0
	cpx #$04
	beq .spriteE1
	cpx #$08
	beq .spriteE2
	cpx #$0c
	beq .spriteE3
	cpx #$10
	beq .spriteE4
	cpx #$14
	beq .spriteE5
	cpx #$18
	beq .spriteE6
	cpx #$1c
	beq .spriteE7
	rts
.spriteE0
	lda enemyVector0
	sta currentEnemyVector
	lda enemyDatabase0
	jmp .setCurrentData
.spriteE1
	lda enemyVector1
	sta currentEnemyVector
	lda enemyDatabase1
	jmp .setCurrentData
.spriteE2
	lda enemyVector2
	sta currentEnemyVector
	lda enemyDatabase2
	jmp .setCurrentData
.spriteE3
	lda enemyVector3
	sta currentEnemyVector
	lda enemyDatabase3
	jmp .setCurrentData
.spriteE4
	lda enemyVector4
	sta currentEnemyVector
	lda enemyDatabase4
	jmp .setCurrentData
.spriteE5
	lda enemyVector5
	sta currentEnemyVector
	lda enemyDatabase5
	jmp .setCurrentData
.spriteE6
	lda enemyVector6
	sta currentEnemyVector
	lda enemyDatabase6
	jmp .setCurrentData
.spriteE7
	lda enemyVector7
	sta currentEnemyVector
	lda enemyDatabase7
.setCurrentData:
	sta currentEnemyData
	jsr InitCurrentData
	asl a
	rol currentEnemySpeed
	asl a
	rol currentEnemySpeed
	asl a
	rol currentEnemyMove
	asl a
	rol currentEnemyMove
	asl a
	rol currentEnemyColor
	asl a
	rol currentEnemyColor
	asl a
	rol currentEnemyType
	asl a
	rol currentEnemyType
	
	lda currentEnemyVector
	asl a
	rol currentEnemyVectorMove
	asl a
	rol currentEnemyVectorMove
	asl a
	rol currentEnemyVectorMoveWhich
	asl a
	rol currentEnemyVectorMoveWhich
	asl a
	rol currentEnemyVectorShoot
	asl a
	rol currentEnemyVectorShoot
	pla
	rts


;敵情報の各保存
SetCurrentEnemyData:
	lda #0
	sta currentEnemyVector
	lda currentEnemyVectorShoot
	lsr a
	ror currentEnemyVector
	lsr a
	ror currentEnemyVector
	lda currentEnemyVectorMoveWhich
	lsr a
	ror currentEnemyVector
	lsr a
	ror currentEnemyVector
	lda currentEnemyVectorMove
	lsr a
	ror currentEnemyVector
	lsr a
	ror currentEnemyVector
	lda currentEnemyVector
	
	cpx #$00
	beq .spriteES0
	cpx #$04
	beq .spriteES1
	cpx #$08
	beq .spriteES2
	cpx #$0c
	beq .spriteES3
	cpx #$10
	beq .spriteES4
	cpx #$14
	beq .spriteES5
	cpx #$18
	beq .spriteES6
	cpx #$1c
	beq .spriteES7
	rts
.spriteES0
	sta enemyVector0
	jmp .retSCED
.spriteES1
	sta enemyVector1
	jmp .retSCED
.spriteES2
	sta enemyVector2
	jmp .retSCED
.spriteES3
	sta enemyVector3
	jmp .retSCED
.spriteES4
	sta enemyVector4
	jmp .retSCED
.spriteES5
	sta enemyVector5
	jmp .retSCED
.spriteES6
	sta enemyVector6
	jmp .retSCED
.spriteES7
	sta enemyVector7
.retSCED:
	rts


;;;;;;;;;;;;;;;;;;;;;;;
;当たり判定
;敵にあったった場合の点滅
IFHitByEnemy:
	lda jiki_hitflg	;当たった場合２がセットされ２の場合は非表示、１の場合は表示
	cmp #0
	bne .ifHitflgOn
	rts
.ifHitflgOn:
	lda jiki_cooldown
	cmp #$20
	bcs .delJikiTenmetsu
	rts
.delJikiTenmetsu:
	ldy #0
	lda jiki_hitflg
	cmp #$1
	beq .showJiki
	iny
	iny
	lda #%00000001
	sta Sprite1_Y,y
	iny
	iny
	iny
	iny
	lda #%01000011
	sta Sprite1_Y,y
	iny
	iny
	iny
	iny
	lda #%00000001
	sta Sprite1_Y,y
	iny
	iny
	iny
	iny
	lda #%01000001
	sta Sprite1_Y,y
	iny
	dec jiki_hitflg
	lda #0
	sta jiki_cooldown
	rts
.showJiki:
	lda #$d0
	iny
	iny
	lda #%00000000
	sta Sprite1_Y,y
	iny
	iny
	iny
	iny
	lda #%01000000
	sta Sprite1_Y,y
	iny
	iny
	iny
	iny
	lda #%00000000
	sta Sprite1_Y,y
	iny
	iny
	iny
	iny
	lda #%01000000
	sta Sprite1_Y,y
	iny
	dec jiki_hitflg
	rts


;自機のたま当たり判定
HitCheckCPUTama:
	ldx #0
	ldy #0
	stx curHitTamaAddr
	sty curHitEnemyAddr
.nextHitCPUTama:
	lda Tama0_Y,x		;tama y軸
	cmp #$FF
	beq .nextTamaInc
	lda Enemy00_Y,y		;tama y軸
	cmp #$FF
	beq .nextEnemyIncInTama
	
	lda Tama0_Y,x		;tama y軸
	clc
	adc #2
	cmp Enemy00_Y,y		;enemy y軸
	bcc .nextEnemyIncInTama

	lda Enemy00_Y,y		;enemy y軸
	clc
	adc #8
	cmp Tama0_Y,x		;enemy y軸
	bcc .nextEnemyIncInTama
	
	lda Tama0_X,x		;tama y軸
	clc
	adc #2
	cmp Enemy00_X,y		;enemy y軸
	bcc .nextEnemyIncInTama

	lda Enemy00_X,y		;enemy y軸
	clc
	adc #8
	cmp Tama0_X,x		;enemy y軸
	bcc .nextEnemyIncInTama
	jmp .delTamaEnemy
.delTamaEnemy:
	;Then hit
	lda #$FF
	sta Tama0_Y, x
	sta Tama0_T, x
	sta Tama0_S, x
	sta Tama0_X, x
	sta Enemy00_Y, y
	sta Enemy00_T, y
	sta Enemy00_S, y
	sta Enemy00_X, y
	jsr AddScore
	jsr ShowScore
	jsr HitSound1
	rts
.nextTamaInc:
	ldy #0
	inx
	inx
	inx
	inx
	cpx maxCPUTamaSprites
	bne .nextHitCPUTama
	rts
.nextEnemyIncInTama:
	iny
	iny
	iny
	iny
	cpy maxEnemySprites
	beq .nextTamaInc
	jmp .nextHitCPUTama


;敵との当たり判定
HitCheckCPU:
	ldx #0
	ldy #0
	sty curHitTamaAddr
.nextEnemy:
	lda Enemy00_Y+1,x		;tama y軸
	cmp #$ff
	beq .nextEnemyInc
	
	lda Enemy00_Y,x		;tama y軸
	clc
	adc enemy_w
	cmp Sprite1_Y		;enemy y軸
	bcc .nextEnemyInc

	lda Sprite1_Y		;enemy y軸
	clc
	adc #16
	cmp Enemy00_Y,x		;enemy y軸
	bcc .nextEnemyInc
	
	lda Enemy00_X,x		;tama y軸
	clc
	adc enemy_w
	cmp Sprite1_X		;enemy y軸
	bcc .nextEnemyInc

	lda Sprite1_X		;enemy y軸
	clc
	adc #16
	cmp Enemy00_X,x		;enemy y軸
	bcc .nextEnemyInc

	;Then hit
	lda #$FF
	sta Enemy00_Y, x
	sta Enemy00_T, x
	sta Enemy00_S, x
	sta Enemy00_X, x
	
	;rts ;無敵モード
	lda mutekiMode
	cmp #1
	bne .notMuteki1
	rts
.notMuteki1:
	jmp .hitAction
.nextEnemyInc:
	lda curHitTamaAddr
	clc
	adc #$04
	sta curHitTamaAddr
	lda curHitTamaAddr
	tax
	cpx maxEnemySprites
	bne .nextEnemy
	ldx #0
	ldy #0
	sty curHitTamaAddr
.nextEnemyTama:
	lda ETama0_Y+1,x		;tama y軸
	cmp #$ff
	beq .nextEnemyTamaInc

	lda ETama0_Y,x		
	clc
	adc #0
	cmp Sprite3_Y		
	bcc .nextEnemyTamaInc

	lda Sprite1_Y		
	clc
	adc #16
	cmp ETama0_Y,x		
	bcc .nextEnemyTamaInc
	
	lda ETama0_X,x		
	clc
	adc #0
	cmp Sprite1_X		
	bcc .nextEnemyTamaInc

	lda Sprite1_X		
	clc
	adc #16
	cmp ETama0_X,x		
	bcc .nextEnemyTamaInc

	;Then hit
	lda #$FF
	sta ETama0_Y, x
	sta ETama0_T, x
	sta ETama0_S, x
	sta ETama0_X, x
	
	;rts ;無敵モード
	lda mutekiMode
	cmp #1
	bne .notMuteki
	rts
.notMuteki:
	jmp .hitAction
.nextEnemyTamaInc:
	lda curHitTamaAddr
	clc
	adc #$04
	sta curHitTamaAddr
	lda curHitTamaAddr
	tax
	cpx maxEnemyTamaSprites
	bne .nextEnemyTama
	rts 
.hitAction:
	dec jiki_heart
	lda jiki_heart
	cmp #0
	bne .decJikisu
	lda #$FF
	ldy #0
.delJiki ;自機の非表示
	sta Sprite1_Y,y
	iny
	cpy #16
	bne .delJiki
	lda #STATE_GAMEOVER
	sta gamestate

	jsr .decJikisu
	lda #%00010000 ; disable NMI
	sta $2000
	lda #%00000000 ; disable rendering
	sta $2001
	jsr InitGameOverMsg
	lda #%10010000
	sta $2000
;	lda #%00011110
;	sta $2001
	rts
.decJikisu:
	lda #%00010000 ; disable NMI
	sta $2000
	lda #%00000000 ; disable rendering
	sta $2001

	lda #20
	sta jiki_cooldown
	lda #$30
	sta jiki_shownum
	lda #2
	sta jiki_hitflg
	ldx jiki_heart
	lda #1
	sta <makeSound
	lda #26
	sta <wait2
.loopJikinum:
	inc jiki_shownum
	dex
	cpx #$0
	bne .loopJikinum
	jsr ShowJikiNum

	lda #%10010000
	sta $2000
;	lda #%00011110
;	sta $2001
	rts




;;;;;;;;;;;;;;;;;;;;;;;
;バックグラウンド描写
;タイトルBG
Titleinit:
	lda $2002
	lda	#$20
	sta	$2006
	lda	#$00
	sta	$2006
	ldx	#$00
	ldy	#$00
.loadNametableBG1
	ldx bgStars, y;		Starテーブルの値をXに読み込む
.loadNametableBG2
	sta $2007
	dex
	bne .loadNametableBG2
	tya
	and #1					; A AND 1
	adc #1					; Aに1加算して1か2に
	sta $2007				; $2007に属性の値を読み込む
	lda #$00        ; 0番(真っ黒)
	iny					; Y加算
	cpy #20
	bne .loadNametableBG1
    rts


;ゲーム画面の星BG
Starinit:
    jsr vblankwait

	lda #LOW(backgroundStar)
	sta pointerLo
	lda #HIGH(backgroundStar)
	sta pointerHi
	lda $2002
	lda	#$20
	sta	$2006
	lda	#$00
	sta	$2006
	ldx #$00
	ldy #$00
.loopBgstar:
	lda [pointerLo], y            ; store into the accumulator the value at address ($02 $01) + y
	sta $2007            ; write that byte of nametable data to the PPU
	iny
	bne .loopBgstar
	inc pointerHi
	inx
	cpx #$04
	bne .loopBgstar

    jsr vblankwait

	lda $2002
	lda #$23
	sta $2006
	lda #$C0
	sta $2006
	ldx #$00    ; Xレジスタクリア
	lda #%00000000				; ４つともパレット2番
.loadAttribBGS
	sta $2007				; $2007に属性の値($0か$55)を読み込む
	inx
	cpx #64
	bne .loadAttribBGS

	lda #LOW(backgroundStar)
	sta pointerLo
	lda #HIGH(backgroundStar)
	sta pointerHi
	lda $2002
	lda	#$28
	sta	$2006
	lda	#$00
	sta	$2006
	ldx #$00
	ldy #$00
	ldx #$00
    ldy #$0                 ; initialize y to 0 for inner loop ($00 to $FF) (4 x 256 = 1024 bytes, a whole nametable)
.loopBgstar2:
	lda [pointerLo], y            ; store into the accumulator the value at address ($02 $01) + y
	sta $2007            ; write that byte of nametable data to the PPU
	iny
	bne .loopBgstar2
	inc pointerHi
	inx
	cpx #$04
	bne .loopBgstar2

	lda $2002
	lda #$2B
	sta $2006
	lda #$C0
	sta $2006
	ldx #$00    ; Xレジスタクリア
	lda #%00000000				; ４つともパレット0番
.loadAttribBGS2
	sta $2007				; $2007に属性の値($0か$55)を読み込む
	inx
	cpx #64
	bne .loadAttribBGS2
    rts


;自機数表示
ShowJikiNum:
	lda $2002
	lda	#$20
	sta	$2006
	lda	#$45
	sta	$2006
.loopWrite:
	lda jikiNumSprites			; load data from address (palette + the value in x)
	sta $2007
	lda jikiNumSprites+1			; load data from address (palette + the value in x)
	sta $2007
	lda jiki_shownum
	sta $2007
	rts

ShowScore:
	lda #%00000000 ; disable NMI
	sta $2000
	lda #%00000000 ; disable rendering
	sta $2001

	lda $2002
	lda	#$20
	sta	$2006
	lda	#$53
	sta	$2006
	lda reg7
	clc
	adc	#$30
	sta $2007
	lda reg6
	clc
	adc	#$30
	sta $2007
	lda reg5
	clc
	adc	#$30
	sta $2007
	lda reg4
	clc
	adc	#$30
	sta $2007
	lda reg3
	clc
	adc	#$30
	sta $2007
	lda reg2
	clc
	adc	#$30
	sta $2007
	lda #0
	clc
	adc	#$30
	sta $2007
	lda #0
	clc
	adc	#$30
	sta $2007

	lda #%10000000
	sta $2000
	rts


;得点
AddScore:
	inc reg2
	lda reg2
	cmp #10
	beq .nextReg3
	rts
.nextReg3
	lda #0
	sta reg2
	inc reg3
	lda reg3
	cmp #10
	beq .nextReg4
	rts
.nextReg4
	lda #0
	sta reg3
	inc reg4
	lda reg4
	cmp #10
	beq .nextReg5
	rts
.nextReg5
	lda #0
	sta reg4
	inc reg5
	lda reg5
	cmp #10
	beq .nextReg6
	rts
.nextReg6
	lda #0
	sta reg5
	inc reg6
	lda reg6
	cmp #10
	beq .nextReg7
	rts
.nextReg7
	lda #0
	sta reg6
	inc reg7
	lda reg7
	cmp #10
	beq .nextReg8
	rts
.nextReg8
	dec reg7
	rts


;乱数生成
Prng:
	ldx #$08
	lda seed+0
prng_1:
	asl A
	rol seed+1
	bcc prng_2
	eor #$2D
prng_2:
	dex
	bne prng_1
	sta seed+0
	cmp #$00 ; reload flags
	rts




;;;;;;;;;;;;;;;;;;;;;;;;;;
;music
PlayBGM:
	inc <wait
	lda <wait
	cmp #7
	bcs .snd
	jmp .nosound
.snd:
	lda #0
	sta <wait
	inc <MusicIndex
	lda <MusicIndex
	tax
	lda Music,x
	sta <note
	lda <MusicIndex
	cmp #$40
	bcs .reset2
	jmp .noreset
.reset2:
	lda #0
	sta <MusicIndex
.noreset:
	jsr SoundPlay
.nosound:
	rts


;ゲームミュージック
SoundPlay:
	lda <note
	cmp #REST
	beq .return
	lda #%00001111
	sta $4015
	lda #%00011111	; Duty比2b・1:連続1b・1:音量1b・エンベロープまたは音量の長さ:0～15 4b
	sta $4000
	lda #%00101011	; スイープ有効1b・変化率3b・方向1b・変化量3b
	sta $4001
	ldx <note
	lda scale_lo,x
	sta $4002
	lda scale_hi,x
	ora #%11111000	; 上位5bit(bit3～bit7)が音の長さ・周波数(上位3ビット) 
	sta $4003
.return
	rts


;当たり音
HitSound1:
	lda #%00001111
	sta $4015
	lda	#%01011111
	sta	$400C
	ldx RA
	lda	scale_lo,x
	sta	$400E
	lda	scale_hi,x
	ora #%11111000	; 上位5bit(bit3～bit7)が音の長さ・周波数(上位3ビット) 
	sta	$400F
	rts


;パワーアップ音
PowerupSound:
	lda #%00000111
	sta $4015
	lda	#%10111111
	sta	$4004
	lda	#%10101011
	sta	$4005
	ldx DO2
	lda	scale_lo,x
	sta	$4006
	lda	scale_hi,x
	ora #%11111000
	sta	$4007
	rts


;当たり音２
PlayHit2:
	lda <makeSound
	cmp #1
	bne .nosound2
	inc <wait2
	lda <wait2
	cmp #26
	bcs .sndhit
	jmp .nosound2
.sndhit:
	lda <wait3
	cmp #1
	beq .nextSound
	lda #0
	sta <wait2
	inc <wait3
	jsr HitSound2
	rts
.nextSound
	jsr HitSound2_1
	lda #0
	sta <wait3
	sta <wait2
	sta <makeSound
.nosound2:
	rts


;当たり音２
HitSound2:
	lda #%00000111
	sta $4015
	lda	#%10111111
	sta	$4004
	lda	#%11001100
	sta	$4005
	ldx FA
	lda	scale_lo,x
	sta	$4006
	lda	scale_hi,x
	ora #%11111000	; 上位5bit(bit3～bit7)が音の長さ・周波数(上位3ビット) 
	sta	$4007
	rts
HitSound2_1:
	lda #%00000001
	sta $4015
	lda	#%10111111
	sta	$4004
	lda	#%11001100
	sta	$4005
	ldx FA
	lda	scale_lo,x
	sta	$4006
	lda	scale_hi,x
	ora #%11111000	; 上位5bit(bit3～bit7)が音の長さ・周波数(上位3ビット) 
	sta	$4007
	rts


;当たり音３
HitSound3:
	lda #%00000111
	sta $4015
	lda	#%10111111
	sta	$4004
	lda	#%11001100
	sta	$4005
	ldx RE
	lda	scale_lo,x
	sta	$4006
	lda	scale_hi,x
	ora #%11111000	; 上位5bit(bit3～bit7)が音の長さ・周波数(上位3ビット) 
	sta	$4007
	rts


;無敵確認
CheckMuteki:
	lda ctrl_1
	cmp mutekiLast
	beq .retMuteki
	ldy mutekiAddr
	ldx mutekiDB,y
	stx mutekiTmp
	cmp mutekiTmp
	bne .resetMuteki
	sta mutekiLast
	cmp #%10000000
	beq .setMuteki
	inc mutekiAddr
	rts
.resetMuteki
	lda #0
	sta mutekiAddr
.retMuteki:
	rts
.setMuteki:
	lda mutekiMode
	cmp #1
	beq .undoMuteki
	inc mutekiMode
	lda #%00000010
	sta Sprite1_S
	lda #%01000010
	sta Sprite2_S
	lda #%00000010
	sta Sprite3_S
	lda #%01000010
	sta Sprite4_S
	jmp .resetMuteki
.undoMuteki:
	dec mutekiMode
	lda #%00000000
	sta Sprite1_S
	lda #%01000000
	sta Sprite2_S
	lda #%00000000
	sta Sprite3_S
	lda #%01000000
	sta Sprite4_S
	jmp .resetMuteki




;********** 各種画像データ **********;
    .bank 3
    .org $E000

; 星テーブルデータ(20個)
bgStars:
    .db 60,45,35,60,90,65,45,20,90,10,30,40,65,25,65,35,50,35,40,35


;星BGデータ
backgroundStar:
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$02,$04,$04,$04,$04
	.db $04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04
	.db $04,$04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04

	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$02,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$01,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04
	.db $04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04,$04


;各パレット
palette:
	.db $00,$14,$37,$1D,  $00,$11,$31,$21,  $00,$11,$31,$1D,  $00,$11,$31,$21	; Background palette
	.db $0F,$11,$31,$21,  $0F,$17,$28,$39,  $0f,$05,$26,$30,  $0f,$13,$23,$33	; Sprite palette
	;	spaceship/proj.   enemies 


;ゲームタイトルBG
;$2000から$3BF(960)バイト書き込むことにします。960という数は、BGのタイル数が横32x縦30=960だからです。 左上から右下という順に横方向に敷き詰めます。
gameTitleBg:
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$c0,$c1,$c2,$c3,$c4,$c5,$c6,$c7,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$d0,$d1,$d2,$d3,$d4,$d5,$d6,$d7,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$50,$52,$45,$53,$53,$00,$53,$54,$41,$52,$54,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00


;終わりメッセージ
gameEndMessage:
	.db $47,$41,$4d,$45,$00,$4f,$56,$45,$52


;自機スプライト
spaceshipSprites:
    ;   vert tile attr       horiz
    .db $D0, $00, %00000000, $80	;sprite 0
	.db $D0, $00, %01000000, $88	;sprite 1
    .db $D8, $10, %00000000, $80	;sprite 2
	.db $D8, $10, %01000000, $88	;sprite 3


;自機数スプライト
jikiNumSprites:
	.db $03, $58, $33, $00


;自機弾スプライト
projectile:
	.db $CA, $01, %00000000


;各スプライト意味
	;	vert tile attr       horiz
;	.db $10, $02, $00000001	 ; Here will go X
	;attribute
	;76543210
	;|||   ||
	;|||   ++- Color Palette of sprite.  Choose which set of 4 from the 16 colors to use
	;|||
	;||+------ Priority (0: in front of background; 1: behind background)
	;|+------- Flip sprite horizontally
	;+-------- Flip sprite vertically


;ミュージックスケール
scale_hi:
	.db	3,3,2,2,2,2,2,2,2,1,1,1
	.db	1,1,1,1,1,1,1,1,1,0,0,0
	.db	0,0,0,0,0,0,0,0,0,0,0,0
	.db	0,0,0,0,0,0,0,0,0,0,0,0


;ミュージック
scale_lo:
	.db  83, 38,248,206,165,127, 92, 58, 26,252,223,196
	.db 171,147,124,103, 82, 63, 45, 28, 12,253,238,225
	.db 212,200,189,178,168,159,150,141,133,126,118,112
	.db 105, 99, 94, 88, 83, 79, 74, 70, 66, 62, 58, 55


;ミュージック
Music:
	.db  RE2, RE2, RE2, RE2, RE2, MI2, FA2,REST,REST, MI2, MI2, MI2, MI2, MI2, FA2, SO2
	.db  FA2, FA2, FA2, FA2, SO2, RA2,REST, SO2,REST,REST, SO2, RA2,REST, RA2,REST,REST
	.db  RA2, SO2, SO2, SO2, RE2, RE2, RE2, RE2, RE2, MI2, MI2, MI2, FA2,REST, FA2,REST
	.db  FA2, MI2, MI2, FA2, SO2, SO2, FA2, SO2, SO2, FA2, MI2, MI2, RE2,REST, RE2,REST


;敵表示とその意味（speed2b,move2b,color2b,type2b）
EnemyDB:
	.db  %00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111
	.db  %00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111,%00000100,%11111111
	.db  %00010001,%11111111,%00010001,%11111111,%00010001,%11111111,%00010001,%11111111,%00010001,%00000100,%00010001,%00000100,%00010001,%00000100,%00010001,%00000100
	.db  %00010001,%11111111,%00010001,%11111111,%00010001,%11111111,%00010001,%11111111,%00010001,%00000100,%00010001,%00000100,%00010001,%00000100,%00010001,%00000100
	.db  %00101010,%11111111,%00101010,%11111111,%00101010,%11111111,%00101010,%11111111,%00101010,%00000100,%00101010,%00000100,%00101010,%00000100,%00101010,%00000100
	.db  %00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010
	.db  %00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010
	.db  %00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00010001,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010,%00101010
	.db  %10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100
	.db  %10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100,%10000100
	.db  %10010001,%10000100,%10010001,%10000100,%10010001,%10000100,%10010001,%10000100,%10010001,%10000100,%10010001,%10000100,%10010001,%10000100,%10010001,%10000100
	.db  %10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010
	.db  %10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010
	.db  %10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010
	.db  %10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10010001,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010,%10101010

	.db  %11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111
	.db  %11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111,%11000100,%11111111
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100
	.db  %11101010,%11010001,%11101010,%11010001,%11101010,%11010001,%11101010,%11010001,%11101010,%11000100,%11101010,%11000100,%11101010,%11000100,%11101010,%11000100
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010
	.db  %11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100
	.db  %11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100,%11000100
	.db  %11010001,%11000100,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100,%11010001,%11000100
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010
	.db  %11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11010001,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010,%11101010


;無敵用コマンド
mutekiDB:
	.db %00001000,%00000000,%00001000,%00000000,%00000100,%00000000,%00000100,%00000000,%00000010,%00000000,%00000001,%00000000,%00000010,%00000000,%00000001,%00000000,%01000000,%00000000,%10000000
	;  rol ctrl_1 ;A,B,Select,Start,Up,Down,Left,Right



;********** 初期化等の最後のおまじない **********;
	.org $FFFA		;First of the three vectors starts here
	.dw NMI			;When an NMI happens (once per frame if enabled) the processor will jump to the label NMI:
	.dw RESET		;When the processor first turns on or is reset, it will jump to the label RESET:
	.dw 0			;External interrupt IRQ is not used in this tutorial


;ビットマップ画像の読み込み
	.bank 4
	.org $0000
	.incbin "chr.chr"	;Includes 8KB graphics file



