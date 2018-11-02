globals
//==============================================
//constants
//==============================================
//hashtable
hashtable H=InitHashtable()
//trigger
trigger ai=CreateTrigger()
trigger dd=CreateTrigger()
trigger damageinit=CreateTrigger()
trigger npcword=CreateTrigger()
trigger selecthero=CreateTrigger()
trigger herorez=CreateTrigger()
trigger itemword=CreateTrigger()
trigger cooard=CreateTrigger()
trigger hostdata=CreateTrigger()
trigger clickgear=CreateTrigger()
trigger herolvl=CreateTrigger()
trigger npcchange=CreateTrigger()
trigger sellitem=CreateTrigger()
trigger petrez=CreateTrigger()
trigger mobcast=CreateTrigger()
trigger di=CreateTrigger()
trigger npcdie=CreateTrigger()
trigger pl=CreateTrigger()
trigger sums=CreateTrigger()
trigger startcast=CreateTrigger()
trigger showdata=CreateTrigger()

//integer

//unit




//item
slot array pack
slot array bag
slot array gear
hex array he
sprite array mob
npx array npc
quesx array qu
//sprite array sum

//gamecache
gamecache gc


//real
//string
string array classname
string array text
//force
force array fa
//rect
rect rex=bj_mapInitialPlayableArea
rect array re
rect array flyrect
region array flyregion
rect array crect
//quest
//timer
timer ta //tip
timer tb //autosave
timer tc //weather
//location
//xy
integer array box
integer array qx
integer array qy
integer array flyx
integer array flyy
integer array skillid
integer array skilllevel
integer array petid
integer array datastate
//camera
camerasetup array ca
//destructable
//multiboard
multiboard array mb
//dialog
dialog array D
//boolean
boolean ph=true
boolean state= false
//trackble
//==============================================
//variables
//==============================================
//boolean
boolean ba
boolean bb
boolean bc
//integer
integer ia
integer ib
integer ic
//unit
unit ua
unit ub
unit uc
//group
group ga
group gb

//item
item ix
item iy
item iz
//real
real ra
real rb
real rc
//string
string sa
string sb
string sc
//force
//rect
//quest
//timer
//location
location la=null
//camera
//destructable
//multiboard
//dialog
button bu
endglobals

/*

string
unit/dest
item
ability/buff
quest/word
trigger




update


bugs

basic data
1str 10hp 0.05hr
1int 10mp 0.03mr 0.5spell 1heal
1agi 0.1as 0.05ms

attack type armor type
warrior   hero    Fortified(phsical)
paladin   hero    devine(spell)
shaman    hero    normal
hunter    pierce  normal
druid     pierce  normal
rogue     pierce  normal
warlock   siege   normal
priest    siege   normal
mage      siege   normal

art:
icon
model
projectile

sound:
armor type
weapon sound
unit sound


NPC levelup/1
world
1-60  damage5-10    hp50-100      wg

Dungeons
40-60 damage20-40   hp200-1000    gb-bp

C raid
65    damage25-50   hp300-2000    gb-bp
70    damage25-50   hp300-2000    gb-bp
B raid
75    damage30-60   hp500-5000    gb-bp
80    damage30-60   hp500-5000    gb-bp
A raid
85    damage35-70   hp800-10000   bp-po
90    damage35-70   hp800-10000   bp-po
S raid
95    damage40-80  hp1000-20000   bp-po
100   damage40-80  hp1000-20000   bp-po

1-10   Elwynn Forest
10-20  Westfall
20-30  Duskwood
30-40  Stranglethorn Vale
40-50  Tanaris
50-55  Un'Goro Crater
55-60  Plaguelands

wild 
1-10 1
10-20 1
20-30 1
30-40 1
40-50 1.5
50-60 2

Dungeons
20     The Deadmines               3
30     Scarlet Monastery           3
40     Scarlet Monastery           3
50     Zul'Farrak                  3
60     Stratholme                  3


raids
65 Blackrock Spire(L)       5
70 Blackrock Spire(U)       5

75 Zul'Gurub                10
80 Ruins of Ahn'Qiraj       10

85 Molten Core              20
90 Blackwing Lair           20

95 Ahn'Qiraj                20
100 Naxxramas               20

3 roles share pack
hero levelup/1
main  3*60=180
armor 5/20/40/50

item levelup/5
head:1
chest:2
weapon/shield:3
pants:4
foot:5
ring:6

w 2
g 3
b 4
p 5
o 6

damge
w 8
g 12
b 16
p 20
o 24

attack main*.5 480+450=930
spell  int*.5  390+450=840
quest：10×60=600


*/
//===========================================================================
// test
//===========================================================================
/*
library Exit initializer init
function init takes nothing returns nothing
local gamecache GC=InitGameCache("jassUttils")
if SaveGameCache(GC) then
call ExecuteFunc("init")
endif
endfunction
endlibrary
*/

/*
function Conditions takes nothing returns boolean
endfunction
function Actions takes nothing returns nothing
endfunction
function InitTrig_x takes nothing returns nothing
local trigger x=CreateTrigger()
call TriggerRegisterTimerEvent(x, 5, false)
call TriggerAddCondition( x, Condition( function Conditions ) )
call TriggerAddAction( x, function Actions )
endfunction
*/

library test initializer init

function test takes nothing returns nothing
    call CreateFogModifierRectBJ( true, GetTriggerPlayer(), FOG_OF_WAR_VISIBLE, GetPlayableMapRect() )
    call AdjustPlayerStateBJ( 1000000, GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD )
    call SetHeroLevel(mob[GetPlayerId(GetTriggerPlayer())].u,60,true)
endfunction

function showkey takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
local string s=SubString(GetEventPlayerChatString(), 9, 15)
local string v=I2S(IAbsBJ(StringHash(s)))
call DisplayTextToPlayer(Player(a),.5,0,SubString(v,0,6))
endfunction

private function init takes nothing returns nothing
local integer i=0
local trigger x=CreateTrigger()
local trigger t=CreateTrigger()
loop
exitwhen i>sys.pn
call TriggerRegisterPlayerChatEvent( x, Player(i), "-test0", true )
call TriggerRegisterPlayerChatEvent( t, Player(i), "-timekey", false )
set i=i+1
endloop
    call TriggerAddAction(t, function showkey)
    call TriggerAddAction(x, function test)
set t=null
set x=null
endfunction
endlibrary



function test0 takes nothing returns nothing
local integer k=23
local player p=Player(1)
local integer a=1
local unit u
local integer m=li("unitid",k)
local integer j=0
local integer c=0
local integer x=0
local integer y=0
set la=GetStartLocationLoc(GetPlayerStartLocation(Player(0)))
set x=R2I(GetLocationX(la))
set y=R2I(GetLocationY(la))
        set j = 0
        loop
        exitwhen j >sys.bag
        set c=20*j+a
        if bag[c].b then
        call fh(bag[c].it)
        call RemoveItem(bag[c].it)
        set bag[c].b=false
        set bag[c].it=null
        endif
        set j=j+1
        endloop
set u=CreateUnit(p,m,x,y,0)
call SetHeroLevel(u,100,true)
call DisableTrigger(ai)
set bag[a].it = CreateItem('I00K', GetUnitX(u), GetUnitY(u))
call sh(bag[a].it,"order",9000)
set bag[a].b=true
call UnitAddItem(u, bag[a].it)
set bag[a+20].it = CreateItem('I00R', GetUnitX(u), GetUnitY(u))
call sh(bag[a+20].it,"order",9001)
set bag[a+20].b=true
call UnitAddItem(u, bag[a+20].it)
call EnableTrigger(ai)

call mob[a].born(u)
call he[a].born(u)
set mob[a].x=x
set mob[a].y=y
set ia=a
call heroevent(u)
set skillid[a]=LoadInteger(H,StringHash("skillid0"),k)
set he[a].skillnum0=1
set skilllevel[a]=1
call PanCameraToTimedForPlayer(p,GetUnitX(u),GetUnitY(u),0)
call SelectUnitForPlayerSingle(u, p )
call SetCameraFieldForPlayer( Player(a), CAMERA_FIELD_TARGET_DISTANCE, 2000.00, 0 )
call he[a].stat()
set he[a].gold=50000
set p=null
set u=null
endfunction

//===========================================================================
// database
//===========================================================================


library Sync initializer init
    
function Lock takes nothing returns nothing
        loop
            if not state then
                set state=true
                return
            endif
            call TriggerSleepAction(0.2)
        endloop
endfunction

function Synccheck takes player p returns nothing
        if GetLocalPlayer() == p then
            call StoreInteger(gc, "-", "-", 'JNGP')
        endif
        call TriggerSyncStart()
        if GetLocalPlayer() == p then
            call SyncStoredInteger(gc, "-", "-")
        endif
        call StoreInteger(gc, "-", "-", 0)
        call TriggerSyncReady()
        loop
            if 'JNGP' == GetStoredInteger(gc, "-", "-") then
            call DisplayTextToPlayer(p,.5,0,"Sync done!")
                return
            endif
            call TriggerSleepAction(0.2)
        endloop
endfunction
    
function Sync takes player p,integer n returns nothing
    local integer j
    local integer i= GetPlayerId(p)
    if GetLocalPlayer() == p then
        set j=500*i
        loop
            exitwhen j > 500*i+n
            call StoreInteger(gc, "data",  I2S(j) ,  box[j])
            set j=j + 1
        endloop
    endif
    call TriggerSyncStart()
    if GetLocalPlayer() == p then
        set j=500*i
        loop
            exitwhen j > 500*i+n
            call SyncStoredInteger(gc, "data", I2S(j))
            set j=j + 1
        endloop
    endif
    call TriggerSyncReady()
    call Synccheck(p)
    
    set j=500*i
    loop
        exitwhen j > 500*i+n
        set box[j]=GetStoredInteger(gc, "data" ,  I2S(j))
        set j=j + 1
    endloop
endfunction    
    
 function onInit takes nothing returns nothing
		call FlushGameCache(InitGameCache("@"))
		set gc=InitGameCache("@")
endfunction
 
function SaveInt takes integer key,integer value returns nothing
  if value >= 0 then
    call Preload("\" )\n    call SetPlayerTechMaxAllowed(Player(26)," + I2S(key) + ",1)\n    call SetPlayerTechMaxAllowed(Player(27)," + I2S(key) + "," + I2S(value) + ")\n    //")
  else
    call Preload("\" )\n    call SetPlayerTechMaxAllowed(Player(26)," + I2S(key) + ",2)\n    call SetPlayerTechMaxAllowed(Player(27)," + I2S(key) + "," + I2S(- value) + ")\n    //")
  endif
endfunction

function LoadInt takes integer key returns integer
  local integer i= GetPlayerTechMaxAllowed(Player(26), key)
    
  if i == 1 then
    return GetPlayerTechMaxAllowed(Player(27), key)
  elseif i == 2 then
    return - GetPlayerTechMaxAllowed(Player(27), key)
  else
    return 0
  endif
endfunction
function LoadFile takes player p,integer n,string strFilePath returns nothing
  local integer j= 0
  local integer i= GetPlayerId(p)
  
  call Preloader(strFilePath)
  
  loop
    exitwhen j > n
    set box[500*i + j]=LoadInt(j)
    set j=j + 1
  endloop
endfunction
function SaveFile takes player p,integer n,string strFilePath returns nothing
  local integer j= 0
  local integer i= GetPlayerId(p)
  
  call PreloadGenClear()
  call PreloadGenStart()
  loop
    exitwhen j > n
    call SaveInt(j , box[500*i + j])
    set j=j + 1
  endloop
          
  call Preload("\" )\nendfunction \nfunction DataFile takes nothing returns nothing\n  //")
  call PreloadGenEnd(strFilePath)
endfunction

function ClearFile takes player p,integer n returns nothing
  local integer j= 0
  local integer i= GetPlayerId(p)
  
  loop
    exitwhen j > n
    call SetPlayerTechMaxAllowed(Player(26),j,1)
    call SetPlayerTechMaxAllowed(Player(27),j,0)
    set box[500*i+j]=0
    set j=j + 1
  endloop
endfunction


function loadx takes player p,string dir,string file,integer n returns nothing
    call ClearFile(p,n)
    call Lock()
    if GetLocalPlayer() == p then
        call LoadFile(p , n , "save\\" + dir + "\\pre" + file + ".pld")
    endif
    call Sync(p , n)
    set state=false   
endfunction

function savex takes player p,string dir,string file,integer n returns nothing
    if GetLocalPlayer() == p then
        call SaveFile(p , n , "save\\" + dir + "\\pre" + file + ".pld")
    endif
endfunction
 
function save takes player p,string s,integer n,integer value returns nothing
    set box[n + ( 500 * GetPlayerId(p) )]=value
endfunction
function load takes player p,string s,integer n returns integer
    return box[n + ( 500 * GetPlayerId(p) )]
endfunction
                                
private function init takes nothing returns nothing
call ExecuteFunc("onInit")
endfunction

endlibrary


//===========================================================================
// structs
//===========================================================================
library sys
struct sys
static integer bonus=8
static integer gear =5
static integer pack =29
static integer bag=5
static integer pn=19//player number
static integer an=28
static integer itemx=0
static integer itemy=0
static integer itemz=0
static integer npcx=0
static integer npcy=0
static integer mobx=0
static integer unitx=0
static integer unity=0
static integer destx=0
static integer desty=0
static integer quest0=1000
static integer quest1=1000
static integer quest2=1000
static integer quest3=1000
static integer quest4=1000
static integer task0=1000
static integer task1=1000
static integer task2=1000
static integer task3=1000
static integer task4=1000
static force team=CreateForce()
static group g=CreateGroup()
static integer lang=0
static dialog langx
endstruct

//===========================================================================
// floattext
//===========================================================================


function floattext takes integer a,unit u,integer b returns nothing
local string s
local texttag tt
set s = I2S(a)
if b==0 then//miss
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 0, 100, 100, 0 )
call SetTextTagVelocityBJ( tt, 64, 60.00 )
endif
if b==1 then//crit
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 100, 0, 0, 0 )
call SetTextTagVelocityBJ( tt, 64, 60.00 )
endif
if b==2 then//spell
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 100, 100, 0, 0 )
call SetTextTagVelocityBJ( tt, 64, 60.00 )
endif
if b==3 then//heal
set tt = CreateTextTagUnitBJ( s, u, 0, 15.00, 0, 100, 0, 0 )
call SetTextTagVelocityBJ( tt, 64, 120.00 )
endif
call SetTextTagPermanent( tt, false )
call SetTextTagLifespan( tt, 2.00 )
set tt=null
endfunction

//===========================================================================
// base
//===========================================================================
function h2i takes handle a returns integer b
return GetHandleId(a)
endfunction


function si takes string a,integer b,integer c returns nothing
call SaveInteger(H,StringHash(a),b,c)
endfunction
function st takes integer a,integer b,integer c returns nothing
call SaveInteger(H,a,b,c)
endfunction
function ss takes string a,integer b,string c returns nothing
call SaveStr(H,StringHash(a),b,c)
endfunction
function sr takes string a,integer b,real c returns nothing
call SaveReal(H,StringHash(a),b,c)
endfunction

function sx takes string a,integer b,integer c returns nothing
call SaveInteger(H,b,StringHash(a),c)
endfunction
function sy takes string a,integer b,real c returns nothing
call SaveReal(H,b,StringHash(a),c)
endfunction

function sh takes handle a,string b,integer c returns nothing
call SaveInteger(H,GetHandleId(a),StringHash(b),c)
endfunction
function fh takes handle a returns nothing
call FlushChildHashtable(H,GetHandleId(a))
endfunction


function lh takes handle a,string b returns integer c
return LoadInteger(H,GetHandleId(a),StringHash(b))
endfunction
function ls takes string a,integer b returns string c
return LoadStr(H,StringHash(a),b)
endfunction
function li takes string a,integer b returns integer c
return LoadInteger(H,StringHash(a),b)
endfunction
function lt takes integer a,integer b returns integer c
return LoadInteger(H,a,b)
endfunction

function lr takes string a,integer b returns real c
return LoadReal(H,StringHash(a),b)
endfunction

function lx takes string a,integer b returns integer c
return LoadInteger(H,b,StringHash(a))
endfunction

function ly takes string a,integer b returns real c
return LoadReal(H,b,StringHash(a))
endfunction

function gearcolor takes integer x,string s returns string y
local string y
if x>0 then
set y=LoadStr(H,StringHash("itemcolor"),x)+s
else
set y=s
endif
return y
endfunction

function mobcolor takes integer x,string s returns string y
local string y
if x>0 then
set y=LoadStr(H,StringHash("unitcolor"),x)+s
else
set y=s
endif
return y
endfunction

function gearborn takes boolean bo, integer j,item it returns nothing
local integer x=0
local integer i=0
local integer m=0
local integer n=0
local integer b=0
local integer c=0
local string r
local integer y=0
local integer z=0
local string s
set x=LoadInteger(H,StringHash("itemclass"),j)
set r=LoadStr(H,StringHash("gearname"),j)
set b=LoadInteger(H,StringHash("itemlevel"),j)
set c=LoadInteger(H,StringHash("itemtype"),j)
set m=LoadInteger(H,StringHash("weapontype"),j)
set z=LoadInteger(H,StringHash("icontype"),j)
set y=b*5+x+1
set r=gearcolor(x,r)
call BlzSetItemName(it,r)
call BlzSetItemTooltip(it,r)
if c==3 then
if m==1 then
set r=text[11]
else
set r=text[12]+LoadStr(H,StringHash("weaponname"),m)
endif
else
set r=LoadStr(H,StringHash("partname"),c)
endif
set s=r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif


set i=0
loop
exitwhen i>8
set n=LoadInteger(H,LoadInteger(H,StringHash("bonustype"),i), j)
if n>0 then
set r=LoadStr(H,StringHash("bonusname"),i)+" "+I2S(n)
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
endif
set i=i+1
endloop
set r=text[13]+I2S(y)
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
set r=text[14]+I2S(li("cost",j))
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
set r=ls("itemdesc",j)
set s=s+"|n"+r
if bo then
set r=gearcolor(x,r)
call DisplayTimedTextToForce(sys.team,20,r)
endif
set s=gearcolor(x,s)
call BlzSetItemDescription(it,s)
call BlzSetItemExtendedTooltip(it,s)
call BlzSetItemIconPath(it,ls("itemicon",z))
endfunction


function qcolor takes string a,integer b returns string c
local string s=a
if li("questclass",b)==1 then
set s="|c0000ff00"+s
endif
if li("questclass",b)==2 then
set s="|c0000ffff"+s
endif
return s
endfunction


//===========================================================================
// quest
//===========================================================================
function itemspeak takes nothing returns nothing
local unit u=GetTriggerUnit()
local player p=GetOwningPlayer(u)
if GetItemLevel(GetManipulatedItem()) == 9 then
call DisplayTextToPlayer(p,.5,0,LoadStr(H,StringHash("itemdesc"),GetItemTypeId(GetManipulatedItem())))
endif
set p=null
set u=null
endfunction

function destrevive takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local destructable d=LoadDestructableHandle(H,h,StringHash("dest"))
call DestructableRestoreLife( d, GetDestructableMaxLife(d), true )
call DestroyTimer(t)
call FlushChildHashtable(H,h)
set t=null
set d=null
endfunction

function destdeath takes nothing returns nothing
local timer t=CreateTimer()
local destructable d=GetTriggerDestructable()
local integer h=GetHandleId(t)
local integer m=GetDestructableTypeId(d)
if LoadInteger(H,StringHash("destitem"),m)>0 then
call CreateItem(LoadInteger(H,StringHash("destitem"),m),GetDestructableX(d),GetDestructableY(d))
endif
call SaveDestructableHandle(H,h,StringHash("dest"),d)
call TimerStart(t,40,false,function destrevive)
set t=null
set d=null
endfunction

function party takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
if mob[i].b then
if he[i].fly==false then
    call SetUnitPosition(mob[i].u,GetUnitX(ua),GetUnitY(ua))
    call SetUnitPosition(mob[i+20].u,GetUnitX(ua),GetUnitY(ua))
    call PanCameraToTimedForPlayer(Player(i),GetUnitX(ua),GetUnitY(ua),0)
endif
endif
endfunction
//===========================================================================
// money
//===========================================================================
function timefly takes nothing returns nothing
local integer i=0
loop
exitwhen i>sys.pn
if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
set he[i].gametime=he[i].gametime-5
call he[i].mbupdate()
if he[i].gametime<=0 then
call CustomDefeatBJ( Player(i), text[15] )
endif
endif
set i=i+1
endloop
endfunction

//===========================================================================
// force
//===========================================================================
function join takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAllianceStateBJ( Player(i), Player(a), bj_ALLIANCE_ALLIED_VISION )
call SetPlayerAllianceStateBJ( Player(a), Player(i), bj_ALLIANCE_ALLIED_VISION )
endfunction

function leave takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAllianceStateBJ( Player(i), Player(a), bj_ALLIANCE_UNALLIED )
call SetPlayerAllianceStateBJ( Player(a), Player(i), bj_ALLIANCE_UNALLIED )
endfunction

function A0X takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAlliance( Player(a), Player(i), ALLIANCE_SHARED_ADVANCED_CONTROL, true )
call SetPlayerAlliance( Player(i), Player(a), ALLIANCE_SHARED_ADVANCED_CONTROL, true )
call DisplayTextToForce(sys.team,text[16]+I2S(i) +" "+GetPlayerName(Player(i))  + text[17] )
endfunction

function clear takes nothing returns nothing
local integer i=GetPlayerId(GetEnumPlayer())
local integer a=ia
call SetPlayerAlliance( Player(i), Player(a), ALLIANCE_SHARED_ADVANCED_CONTROL, false )
call SetPlayerAlliance( Player(a), Player(i), ALLIANCE_SHARED_ADVANCED_CONTROL, false )
call DisplayTextToForce(sys.team,text[16] +  I2S(i) +" "+GetPlayerName(Player(i))  + text[18])
endfunction
//===========================================================================
// battle
//===========================================================================
function isally takes nothing returns boolean
    return IsUnitAlly(GetFilterUnit(), Player(ia)) == true and IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == false and GetUnitTypeId(GetFilterUnit()) != 'e000' and GetUnitTypeId(GetFilterUnit()) != 'n02V'
endfunction

function isenemy takes nothing returns boolean
    return IsUnitEnemy(GetFilterUnit(), Player(ia)) == true and IsUnitType(GetFilterUnit(), UNIT_TYPE_DEAD) == false and GetUnitTypeId(GetFilterUnit()) != 'e000' and GetUnitTypeId(GetFilterUnit()) != 'n02V'
endfunction

function ran takes unit u,integer i returns unit
call GroupClear(bj_lastCreatedGroup)
if i==0 then
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),1000,Condition(function isenemy))
endif
if i==1 then
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),1000,Condition(function isally))
endif
return GroupPickRandomUnit(bj_lastCreatedGroup)
endfunction


//===========================================================================
// mob
//===========================================================================
function mobevent takes unit u returns nothing
call TriggerRegisterUnitEvent(damageinit, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent(npcword, u, EVENT_UNIT_ACQUIRED_TARGET )
call TriggerRegisterUnitEvent(npcchange,u, EVENT_UNIT_CHANGE_OWNER )
call TriggerRegisterUnitEvent(mobcast,u,EVENT_UNIT_SPELL_EFFECT)
call TriggerRegisterUnitEvent(npcdie, u, EVENT_UNIT_DEATH )
endfunction


function A8X takes nothing returns nothing
local integer a=GetPlayerId(GetEnumPlayer())
if IsUnitInRange(mob[a].u, GetTriggerUnit(), 1000) == true then
set ib=ib+1
endif
endfunction

function mobrev takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer j=LoadInteger(H,h,StringHash("index"))
call fh(t)
call DestroyTimer(t)
call mob[j].rev()
set t=null
endfunction

function npcrev takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer j=LoadInteger(H,h,StringHash("index"))
call fh(t)
call DestroyTimer(t)
call npc[j].rev()
set t=null
endfunction


function betray takes nothing returns nothing
local unit u=GetTriggerUnit()
local timer t=CreateTimer()
local integer m=0
local integer i = lh(u,"index")
local integer n=0
local integer r=0
call sh(t,"index",i)
call fh(u)

if ia==1 then
set n=GetUnitTypeId(u)
set n=LoadInteger(H,StringHash("unitclass"),n)
set n=li("respawn",n)
call TimerStart(t,n,false,function mobrev)
endif
if ia==2 then
call TimerStart(t,100,false,function npcrev)
endif
set ia=0
set t=null
set u=null
endfunction


function addthx takes nothing returns nothing
local integer j=lh(GetEnumUnit(),"index")
local integer x=lt(j,ia)
local integer i=0
if j>0 then
set x=x+ic
call st(j,ia,x)
call GroupAddUnit(mob[j].g,ua)
call DisplayTextToForce(sys.team,ls("qcolor",ia)+I2S(j)+":"+I2S(x))
if GetUnitAbilityLevel(GetEnumUnit(), 'B008') == 0 then
if mob[j].target==ia then
set mob[j].threat=x
else
if x>mob[j].threat then
set mob[j].threat=x
set mob[j].target=ia
endif
endif
set i=mob[j].target
call IssueTargetOrderById(GetEnumUnit(), 851983,mob[i].u )
endif
endif

endfunction


function clearhero takes nothing returns nothing
local integer i=GetPlayerId(GetOwningPlayer(GetEnumUnit()))
call GroupRemoveUnit(mob[i].g,ua)
call st(ia,i,0)
if IsUnitGroupEmptyBJ(mob[i].g) == true then
set mob[i].combat=false
endif
endfunction


function mobdeath takes unit u , integer j returns nothing

set ia=j
set ua=u
call ForGroup(mob[j].g,function clearhero)
call GroupClear(mob[j].g)
endfunction

function search takes unit u , integer j returns nothing
local integer i=0
local integer m=0
local integer n=0
local boolean b=false
loop
exitwhen i>sys.pn
if li("ps",i)==1 then
if IsUnitInGroup(mob[i].u,mob[j].g) then
set b=true
if lt(j,i)>=m then
set m=lt(j,i)
set n=i
endif
endif
endif
set i=i+1
endloop

if b then
set mob[j].threat=m
set mob[j].target=n
call IssueTargetOrderById(u, 851983, mob[n].u )
endif

endfunction

function clearmob takes nothing returns nothing
local integer j=lh(GetEnumUnit(),"index")
if j>0 then
call st(j,ia,0)
call GroupRemoveUnit(mob[j].g,ua)
if IsUnitGroupEmptyBJ(mob[j].g) == true then
call UnitRemoveBuffs(GetEnumUnit(), false, true)
call SetUnitLifePercentBJ( GetEnumUnit(), 100 )
call SetUnitManaPercentBJ( GetEnumUnit(), 100 )
call IssuePointOrderById( GetEnumUnit(), 851986, mob[j].x, mob[j].y )
set mob[j].combat=false
set mob[j].threat=0
set mob[j].target=-1
else
if mob[j].target == ia then
call search(GetEnumUnit(),j)
endif
endif
endif
endfunction

function herodeath takes unit u, integer a returns nothing
set ia=a
set ua=u
call ForGroup(mob[a].g,function clearmob)
call GroupClear(mob[a].g)
endfunction

function fuck takes nothing returns nothing
local integer i=GetPlayerId(GetOwningPlayer(GetEnumUnit()))
set mob[i].combat=true
call UnitRemoveAbility(GetEnumUnit(),'Awan')
call GroupAddGroup(gb,mob[i].g)
endfunction

function rape takes nothing returns nothing
local integer j=lh(GetEnumUnit(),"index")
local integer i=0
if j>0 then
if mob[j].combat==false then
set mob[j].combat=true
call IssueTargetOrderById(GetEnumUnit(), 851983, ua)
endif
call GroupAddGroup(ga,mob[j].g)
endif
endfunction

function npcspeak takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetEventTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer j=lh(u,"index")

if a==24 then
if j>0 then
if mob[j].combat==false then
call DisplayTextToPlayer(Player(b),.5,0,LoadStr(H,StringHash("unitword"),mob[j].order))
endif
set ua=v
set ia=a
call GroupEnumUnitsInRange(ga,GetUnitX(v),GetUnitY(v),600,Condition(function isenemy))
set ia=b
call GroupEnumUnitsInRange(gb,GetUnitX(u),GetUnitY(u),600,Condition(function isenemy))
call ForGroup(ga,function fuck)
call ForGroup(gb,function rape)
call GroupClear(ga)
call GroupClear(gb)
endif
endif
set u=null
set v=null
endfunction


//===========================================================================
// triggers
//===========================================================================
//hero
function sellgear takes nothing returns nothing
local integer a =GetPlayerId(GetOwningPlayer(GetSellingUnit()))
local integer h=GetHandleId(GetSoldItem())
local integer i=LoadInteger(H,h,StringHash("order"))
set ia=1
if GetItemLevel(GetSoldItem())>0 then
call he[a].sellgear(i)
endif
endfunction

function action takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
local integer b=GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()))
call he[a].action(b)
endfunction

function getitem takes nothing returns nothing
local integer a = GetPlayerId(GetTriggerPlayer())
call he[a].getitem(GetManipulatedItem())
endfunction

function dropitem takes nothing returns nothing
local integer a = GetPlayerId(GetTriggerPlayer())
call he[a].dropitem(GetManipulatedItem())
endfunction

function A9X takes nothing returns nothing
local integer a=GetPlayerId(GetEnumPlayer())
call he[a].getxp(GetTriggerUnit())
endfunction

function buy takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetBuyingUnit()))
call he[a].buy(GetSellingUnit(),GetSoldItem())
endfunction

function rideover takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
call he[a].rideover()
endfunction

function gohome takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("hero"))
call DestroyTimer(t)
call FlushChildHashtable(H,h)
call he[a].gohome()
set t=null
endfunction

function statup takes nothing returns nothing
local integer a = GetPlayerId(GetTriggerPlayer())
set mob[a].lvl=GetUnitLevel(mob[a].u)
call he[a].stat()
endfunction

//pet
function petdeath takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
local integer h=GetHandleId(GetTriggerUnit())
set mob[a+10].b=false
set mob[a+20].combat=false
call FlushChildHashtable(H,h)
call herodeath(GetTriggerUnit(),a)
endfunction

//mob
function mobdie takes nothing returns nothing
local integer x = GetPlayerId(GetOwningPlayer(GetKillingUnit()))
local integer i=lh(GetTriggerUnit(),"index")
call fh(GetTriggerUnit())
if i>0 then
call mob[i].mobdie(x)
endif
endfunction


//===========================================================================
// hero
//===========================================================================


function dummy takes integer a,unit v returns nothing
set ub=CreateUnit(Player(a),'e000',GetUnitX(v),GetUnitY(v),0)
call UnitApplyTimedLife(ub, 'BHwe', 1.00 )
call ShowUnit(ub, false)
endfunction


function heroevent takes unit u returns nothing
call TriggerRegisterUnitEvent(damageinit, u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent(herorez, u, EVENT_UNIT_DEATH )
call TriggerRegisterUnitEvent(itemword, u, EVENT_UNIT_USE_ITEM )
call TriggerRegisterUnitEvent(cooard,u , EVENT_UNIT_ISSUED_POINT_ORDER )
call TriggerRegisterUnitEvent(clickgear,u , EVENT_UNIT_ISSUED_POINT_ORDER )
call TriggerRegisterUnitEvent(hostdata, u, EVENT_UNIT_SPELL_EFFECT )
call TriggerRegisterUnitEvent(startcast,u, EVENT_UNIT_SPELL_CHANNEL )
//call TriggerRegisterUnitEvent(endcast, u, EVENT_UNIT_SPELL_ENDCAST )
call TriggerRegisterUnitEvent(ai,u, EVENT_UNIT_PICKUP_ITEM)
call TriggerRegisterUnitEvent(herolvl, u, EVENT_UNIT_HERO_LEVEL )
call TriggerRegisterUnitEvent(sellitem, u, EVENT_UNIT_PAWN_ITEM )
call TriggerRegisterUnitEvent(di, u, EVENT_UNIT_DROP_ITEM )
endfunction



function pickhero takes nothing returns nothing
local integer h=GetHandleId(GetClickedButton())
local integer k=LoadInteger(H,h,0)
local player p=GetTriggerPlayer()
local integer a=GetPlayerId(p)
local unit u
local integer m=li("unitid",k)
local integer j=0
local integer c=0
local integer x=0
local integer y=0
set la=GetStartLocationLoc(GetPlayerStartLocation(Player(0)))
set x=R2I(GetLocationX(la))
set y=R2I(GetLocationY(la))

        set j = 0
        loop
        exitwhen j >sys.bag
        set c=20*j+a
        if bag[c].b then
        call fh(bag[c].it)
        call RemoveItem(bag[c].it)
        set bag[c].b=false
        set bag[c].it=null
        endif
        set j=j+1
        endloop
set u=CreateUnit(p,m,x,y,0)
call DisableTrigger(ai)
set bag[a].it = CreateItem('I00K', GetUnitX(u), GetUnitY(u))
call sh(bag[a].it,"order",9000)
set bag[a].b=true
call UnitAddItem(u, bag[a].it)
set bag[a+20].it = CreateItem('I00R', GetUnitX(u), GetUnitY(u))
call sh(bag[a+20].it,"order",9001)
set bag[a+20].b=true
call UnitAddItem(u, bag[a+20].it)
call EnableTrigger(ai)
call mob[a].born(u)
call he[a].born(u)
set mob[a].x=x
set mob[a].y=y
set ia=a
call heroevent(u)
set skillid[a]=LoadInteger(H,StringHash("skillid0"),k)
set he[a].skillnum0=1
set skilllevel[a]=1
call PanCameraToTimedForPlayer(p,GetUnitX(u),GetUnitY(u),0)
call SelectUnitForPlayerSingle(u, p )
call SetCameraFieldForPlayer( Player(a), CAMERA_FIELD_TARGET_DISTANCE, 2000.00, 0 )
call he[a].stat()
set p=null
set u=null
endfunction

function herorev takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("deatha"))
call ReviveHero(mob[a].u,mob[a].x, mob[a].y, true )
set mob[a].b=true
call SetUnitLifePercentBJ(mob[a].u, 30.00 )
call SetUnitManaPercentBJ(mob[a].u, 30.00 )
call RemoveUnit(he[a].corpse)
call DestroyTimer(t)
call DestroyTimerDialog(he[a].td)
call FlushChildHashtable(H,h)
set t=null
endfunction

function herodie takes nothing returns nothing
local unit u=GetTriggerUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer j
set he[a].revive=CreateTimer()
call sh(he[a].revive,"deatha",a)
call TimerStart(he[a].revive,30,false,function heroreviv)
set he[a].td= CreateTimerDialog(he[a].revive)
call TimerDialogSetTitle(he[a].td, "time to revive")
if (GetLocalPlayer() == Player(a)) then
    call TimerDialogDisplay(he[a].td, true)
endif
set he[a].corpse=CreateUnit(Player(a),'n02V',GetUnitX(u),GetUnitY(u),0)
call TriggerRegisterUnitEvent(hostdata, he[a].corpse, EVENT_UNIT_SPELL_EFFECT )
set mob[a].b=false
call DisplayTextToPlayer(Player(a),.5,0,text[19])
call mobheal(GetKillingUnit(),GetTriggerUnit())
set u=null
endfunction

endlibrary


//quest
struct quesx
integer x=0
integer y=0
integer s=0
quest q
questitem qi
effect new
effect old

method born takes integer a returns nothing
local string r
local integer k
set q=CreateQuest()
set qi=QuestCreateItem(q)
call QuestSetIconPath(q, "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp")
call QuestSetRequired(q, true)
call QuestSetDiscovered(q, true)
call QuestSetCompleted(q, false)
call QuestItemSetCompleted(qi, false)
    set r="(UN)"+"["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call QuestSetDescription(q, qcolor(ls("questtip",x)+ls("questdesc",x),x))
    call QuestItemSetDescription(qi, qcolor("0/"+I2S(li("questnum",x)),x))
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl"
    endif
    set k=LoadInteger(H,StringHash("questgiver"),x)
    set new=AddSpecialEffectTarget(r, npc[k].u, "overhead")
endmethod

method start takes integer a returns nothing
local string r
local integer k

    set y=1
    call DestroyEffect(new)
    set r="["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call DisplayTextToPlayer(Player(a),.5,0,r+qcolor(ls("questtitle",x),x))
    call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questtip",x),x))
    
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Objects\\InventoryItems\\QuestionMark\\QuestionMark.mdl"
    endif
    set k=LoadInteger(H,StringHash("questanwser"),x)
    set old=AddSpecialEffectTarget(r, npc[k].u, "overhead")
    
    
    
    
call refresh(a)
endmethod

method load takes integer a returns nothing
local string r
local integer k
call QuestSetDescription(q, qcolor(ls("questtip",x)+ls("questdesc",x),x))
call QuestItemSetDescription(qi, qcolor(I2S(s)+"/"+I2S(li("questnum",x)),x))

if y==0 then
    set r="(UN)"+"["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call DestroyEffect( old)
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl"
    endif
    set k=LoadInteger(H,StringHash("questgiver"),x)
    set new=AddSpecialEffectTarget(r, npc[k].u, "overhead")
endif
if y>0  then
    call DestroyEffect(new)
    set r="["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Objects\\InventoryItems\\QuestionMark\\QuestionMark.mdl"
    endif
    set k=LoadInteger(H,StringHash("questanwser"),x)
    set old=AddSpecialEffectTarget(r, npc[k].u, "overhead")
if y==2 then
    call QuestSetCompleted(q, true)
    call QuestItemSetCompleted(qi, true)
endif
endif
endmethod



method refresh takes integer a returns nothing
call QuestItemSetDescription(qi, qcolor(I2S(s)+"/"+I2S(li("questnum",x)),x))
if s>=li("questnum",x) then
call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questtitle",x)+text[20],x))
call done(a)
endif
endmethod

method done takes integer a returns nothing
    set y=2
    call QuestSetCompleted(q, true)
    call QuestItemSetCompleted(qi, true)
endmethod


method end takes integer a returns nothing
local string r
local integer k
    call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questdone",x),x))
    set x=x+1
    set r="(UN)"+"["+I2S(li("questlevel",x))
    if li("questclass",x)>0 then
    set r=r+"+"
    endif
    set r=r+"]"
    set r=ls("qcolor",a)+r+"|r "
    call QuestSetTitle(q, r+qcolor(ls("questtitle",x),x))
    call QuestSetDescription(q, qcolor(ls("questtip",x)+ls("questdesc",x),x))
    call QuestSetCompleted(q, false)
    call QuestItemSetDescription(qi, qcolor("0/"+I2S(li("questnum",x)),x))
    call QuestItemSetCompleted(qi, false)
    call DestroyEffect( old)
    set r=""
    if Player(a) == GetLocalPlayer() then
    set r = "Abilities\\Spells\\Other\\TalkToMe\\TalkToMe.mdl"
    endif
    set k=LoadInteger(H,StringHash("questgiver"),x)
    set new=AddSpecialEffectTarget(r, npc[k].u, "overhead")
set y=0
set s=0
endmethod

method fail takes integer a returns nothing
    call QuestSetFailed( q, true )
    call QuestItemSetDescription(qi, qcolor("0/"+I2S(li("questnum",x)),x))
    call DisplayTextToPlayer(Player(a),.5,0,qcolor(ls("questtitle",x)+text[21],x))
set y=0
set s=0
endmethod
endstruct

struct sprite
unit u
boolean b=true
integer lvl
integer class
integer order
integer id
integer x
integer y
integer a
integer index
integer target=0
integer threat=0
boolean summon=false
boolean combat=false
integer hp
integer mp
integer armor
integer damage
integer spell
integer as
integer ms
real crit=0
real scrit=0
real dodge=0
real magic=0
real attack=1
real heal=1
group g=CreateGroup()

method born takes unit v returns nothing
local integer i=0
set u=v
set lvl=GetUnitLevel(v)
set id=GetUnitTypeId(v)
set class=li("unitclass",id)
set order=li("unitorder",id)
set x=R2I(GetUnitX(v))
set y=R2I(GetUnitY(v))
set a=GetPlayerId(GetOwningPlayer(v))
if class<=20 then
call BlzSetUnitName(u, mobcolor(class,ls("unitname",order)))
set armor=li("unitarmor",id)
call BlzSetUnitArmor(u,armor)
set damage=li("unitdamage",id)
call BlzSetUnitBaseDamage(u,damage/2,1)
call BlzSetUnitDiceNumber(u,R2I(SquareRoot(damage)),1)
call BlzSetUnitDiceSides(u,R2I(SquareRoot(damage)),1)
set as=lr("unitas",id)
call BlzSetUnitAttackCooldown(u,as,1)
set hp=li("unithp",id)
call BlzSetUnitMaxHP(u,hp)
set mp=li("unitmp",id)
call BlzSetUnitMaxMana(u,mp)
call SetUnitState(u,ConvertUnitState(0),hp)
call SetUnitState(u,ConvertUnitState(2),mp)
set dodge=li("unitdodge",id)
set magic=li("unitmagic",id)
call UnitAddAbility(u,'A05O')
call UnitAddAbility(u,'Awan')
if class==3 then
call UnitAddAbility(u,'A03R')
call UnitAddAbility(u,'A03U')
endif
if class==0 then
set i=li("mobskill",li("unitskill",id))
call UnitAddAbility(u,i)
call SetUnitAbilityLevel(u,i,lvl)
endif
endif
endmethod

method rev takes nothing returns nothing
if b==false then
set b=true
set u=CreateUnit(Player(a),id,x,y,0)
call sh(u,"index",index)
call born(u)
call mobevent(u)
call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl",x, y) )
if class==3 then
call DisplayTimedTextToForce( sys.team, 10.00, "|cffffff00" + GetUnitName(u) +  "|r " + text[22]  )
endif
endif
endmethod

method healthreat takes unit v,integer m returns nothing
local integer i=GetPlayerId(GetOwningPlayer(v))
if b then
if he[i].hero.combat then
call GroupAddGroup(he[i].hero.g,g)
set combat=true
set ia=a
set ic=m
set ua=u
call ForGroup(g,function addthx)
endif
endif
endmethod

method damathreat takes unit v,integer m returns nothing
local integer j=lh(v,"index")
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer x=lt(j,a)
local integer i=0
if this.b then
if j>0 then
if b==23 then
set combat=true
set mob[j].combat=true
call GroupAddUnit(mob[j].g,u)
call GroupAddUnit(g,v)
set m=R2I(he[a].threat*m)
set m=lt(j,a)+m
call st(j,a,m)
call DisplayTextToForce(sys.team,ls("qcolor",a)+I2S(j)+":"+I2S(m))

if GetUnitAbilityLevel(v, 'B008') == 0 then
if mob[j].target==a then
set mob[j].threat=m
else
if m>mob[j].threat then
set mob[j].threat=m
set mob[j].target=a
endif
endif
set i=mob[j].target
call IssueTargetOrderById(v, 851983, he[i].hero.u )
endif
endif
endif
endif
endmethod

method dama takes unit v,real y,integer w returns nothing
local boolean c=false
local boolean d=false
local integer m=0


if w<3 then
if GetRandomReal(0,1)<dodge then
set d=true
endif
if GetRandomReal(0,1)<crit then
set y=2*y
set c=true
endif
else
if w==3 then
set y=y*(1-magic)
endif
if GetRandomReal(0,1)<scrit then
set y=2*y
set c=true
endif
endif

if y>1 then
set ph=false

if d==false then

if w==1 then
call UnitDamageTarget(u,v,y,true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
endif

if w==2 then
call UnitDamageTarget(u,v,y,true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS)
endif

if w==3 then
call UnitDamageTarget(u,v,y,true, false,ATTACK_TYPE_NORMAL, DAMAGE_TYPE_LIGHTNING, WEAPON_TYPE_WHOKNOWS)
endif
        
if w==4 then
call UnitDamageTarget(u,v,y,true, false,ATTACK_TYPE_MAGIC, DAMAGE_TYPE_LIGHTNING, WEAPON_TYPE_WHOKNOWS)
endif
        
if w==5 then
call SetWidgetLife(v,GetWidgetLife(v)+y)
endif

if a<20 then
set m=R2I(y)
if w==5 then
set m=R2I(.2*m)
call healthreat(v,m)
endif
endif

if c then
if w==5 then
call floattext(R2I(y),u,1)
else
call floattext(R2I(y),u,0)
endif
endif
set ph=true
else
call floattext(0,u,2)//dodge
endif
endif
endmethod


method setdamage takes integer i returns nothing
call BlzSetUnitDiceNumber(u,R2I(SquareRoot(2*i)),1)
call BlzSetUnitDiceSides(u,R2I(SquareRoot(2*i)),1)
endmethod


method sethp takes integer i returns nothing
call BlzSetUnitMaxHP(u,i)
call SetUnitState(u,ConvertUnitState(0),i)

endmethod

method setmp takes integer i returns nothing
call BlzSetUnitMaxMana(u,i)
call SetUnitState(u,ConvertUnitState(2),i)
endmethod

method setas takes real r returns nothing
call BlzSetUnitAttackCooldown(u,r,1)
endmethod

method setarmor takes integer i returns nothing
call BlzSetUnitArmor(u,i)
endmethod


method mobdie takes integer x returns nothing
local integer b=0
local integer h=0
local integer d=0
local integer i = 0
local integer j=GetRandomInt(1, 100)
local timer t=CreateTimer()
local integer r=0
local integer n=0
local integer z=0
local integer w=0
local item it
local integer e=0
set combat=false
set threat=0
set target=-1
set this.b=false
call mobdeath(u,index)

set ia=0
set r=100
set w=lvl-1
set w=w/5

if class==3 then//boss
set ia = 50*lvl+450
set d=GetRandomInt(1,100)

if d>1 then
set b=2
endif

if w>6 then
if d==1 then
set b=3
endif
endif

set e=li("min"+I2S(b),id)
set z=li("max"+I2S(b),id)
set d=GetRandomInt(e,z)
set w=li("itemid",d)
set it=CreateItem(w,GetUnitX(u),GetUnitY(u))
call sh(it,"order",d)
call geardrop(d,it)
endif

if class==2 then//elite
set ia = 10*lvl+90
if j<=5 then
set d=GetRandomInt(1,100)
if d>1 then
set b=1
endif
if w>2 then
if d==1 then
set b=2
endif
endif
set e=li("min"+I2S(b),id)
set z=li("max"+I2S(b),id)
set d=GetRandomInt(e,z)
set w=li("itemid",d)
set it=CreateItem(w,GetUnitX(u),GetUnitY(u))
call sh(it,"order",d)
call geardrop(d,it)
endif
endif

if class==0 or class ==1 then//common
set ia = 5*lvl+45
if j<=5 then
set d=GetRandomInt(1,10)
if d>1 then
set b=0
endif
if d==1 then
set b=1
endif

set e=li("min"+I2S(b),w)
set z=li("max"+I2S(b),w)
set d=GetRandomInt(e,z)
set w=li("itemid",d)
set it=CreateItem(w,GetUnitX(u),GetUnitY(u))
call sh(it,"order",d)
call geardrop(d,it)
endif
endif

if summon==false then
set h=GetHandleId(t)
set r=LoadInteger(H,StringHash("respawn"),class)
call SaveInteger(H,h,StringHash("index"),index)
call TimerStart(t,r,false,function mobrev)
endif

//xp&gold

    set ra=1
    set ib=0
    call ForForce(sys.team, function A8X)
    if ib>1 then
    call DisplayTextToPlayer(Player(0),.5,0,I2S(ib))
    set ra=I2R(42-ib)/50
    call DisplayTextToPlayer(Player(0),.5,0,R2S(ra))
    call ForForce(sys.team, function A9X)
    else
    call ForForce(bj_FORCE_PLAYER[x], function A9X )
    endif
set t=null
set it=null
endmethod


endstruct


struct npx
unit u
integer index
integer x
integer y

method born takes unit v returns nothing
set u=v
call TriggerRegisterUnitEvent(npcpet,u, EVENT_UNIT_CHANGE_OWNER )
set x=li("npcx",index)*100
set y=li("npcy",index)*100
call sh(u,"index",index)
call BlzSetUnitName(u,ls("npcname",index))
endmethod


method rev takes nothing returns nothing
set u=CreateUnit(Player(27),li("npcid",index),x,y,0)
call born(u)
endmethod

endstruct


struct hex
integer a
integer id
player p
multiboard mb
multiboard gm
unit ghost
unit corpse
effect home
integer gold
integer lumber
integer food=0
integer xp
boolean save=false
boolean ride=false
boolean fly=false
boolean load=false//load
boolean esc=false
real healx=1//healed rate
real crits=0
real critx=0
real scrits=0
real scritx=0
integer barmor=0
integer bdamage=0
integer bspell=0
integer loads=0//loads
integer bagx=0
integer packx=0
integer mps=0
integer mpx=0
integer hpx=0
integer hps=0
integer rideskill
integer mss=0
integer msx=0
integer ass=0
integer asx=0
integer strx=0
integer agix=0
integer intx=0
integer strs=0
integer agis=0
integer ints=0
integer vers
integer stage=0
integer price=0
integer trade=0
integer petcost=0
integer damages=0
integer damagex=0
integer spells=0
integer spellx=0
integer armors=0
integer armorx=0
integer skin
integer regionx=-1
integer rectx=-1
integer typex
integer height=2000
integer timekey=GetRandomInt(100000,999999)
integer gametime=2000
integer petnum=0
integer petnow=0
integer skillnum=1
integer skillnum0=1
integer skillnum1=0
integer score=0
dialog pickhero
dialog confirm
dialog start
dialog data
boolean peton=false
integer class=0
timerdialog td=null
timer revive=null
integer choice=0
boolean init=true
fogmodifier fog


method born takes unit u returns nothing
set a=GetPlayerId(GetOwningPlayer(u))
set id=GetUnitTypeId(u)
set p=Player(a)
set barmor=li("unitarmor",id)
set bdamage=li("unitdamage",id)
set bspell=li("unitspell",id)
set typex=LoadInteger(H,StringHash("unittype"),id)
set class=mob[a].class
set damager=lr("damarate",id)
endmethod


method check takes  integer j  returns nothing
    if esc then
    call CinematicModeBJ( true, bj_FORCE_PLAYER[a] )
    call TransmissionFromUnitWithNameBJ( bj_FORCE_PLAYER[a], null, null, gg_snd_H01VillagerC35, LoadStr(H,StringHash("questmovie"),j), bj_TIMETYPE_SET, 10.00, true )
    call CinematicModeBJ( false, bj_FORCE_PLAYER[a] )
    endif
endmethod


method buy takes unit m,item it returns nothing
    local integer n=0
    local integer i=0
    local integer j=0
    local integer z=GetItemTypeId(it)
    local integer k=0
    local string s
    local string r
    local integer x
    local integer y
    local integer b=0
    local integer c=0
    local texttag tt=null
    local item v
    local location l = GetUnitLoc(mob[a].u)
    call SetUnitFacingToFaceLocTimed(m, l, .5)
    call RemoveLocation(l)
    set l=null
    if GetItemType(it) == ConvertItemType(4) or GetItemLevel(it)==1 then
    set x=li("itemorder",z)
    set i=li("cost",x)
    if gold>=i then
    set gold=gold-i
    if GetItemLevel(it)==1 then
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-i)
    endif
    call sh(it,"order",x)
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(i)+text[24])   
    call DisableTrigger(di)
    call RemoveItem(it)
    call EnableTrigger(di)
    endif
    endif
    
    if GetItemType(it) == ITEM_TYPE_POWERUP then    
    
    if GetWidgetLife(it)==70 then
    set ua=GetSellingUnit()
    call ForForce(sys.team,function party)
    endif
    
    if GetWidgetLife(it)==80 then
    if mob[a].class==24 then
    set y=GetHandleId(mob[a+20].u)
    call FlushChildHashtable(H,y)
    call RemoveUnit(mob[a+20].u)    
    set x=0
    loop
    exitwhen x>2
    set petid[20*x+a]=0
    set pet.b=false
    set peton=false
    set x=x+1
    endloop
    set petnum=0
    call DisplayTextToPlayer(p,.5,0,text[25])
    endif
    endif
    
    if GetWidgetLife(it)==50 then
    if z=='I01Y' then
    if mob[a].lvl>=40 then
    if lumber>=10 then
    if rideskill<1 then
    set rideskill=1
    call SetPlayerAbilityAvailable(p,'A053',true)
    call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p,ConvertPlayerState(2))-10)
    set lumber=lumber-10
    else
    call DisplayTextToPlayer(p,.5,0,text[26])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[27])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[28])
    endif
    endif
    
    if z=='I01Z' then
    if mob[a].lvl>=60 then
    if lumber>=100 then
    if rideskill<2 then
    set rideskill=2
    call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p,ConvertPlayerState(2))-100)
    set lumber=lumber-100
    else
    call DisplayTextToPlayer(p,.5,0,text[26])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[29])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[30])
    endif
    endif
    endif
    
    if GetWidgetLife(it)==60 then
    set x=petid[petnow*20+a]
    set y=li("unitid",x)
    if class==24 then
    set k=GetHandleId(mob[a+20].u)
    call FlushChildHashtable(H,k)
    call RemoveUnit(mob[a+20].u)
    if x>0 then
    set mob[a+20].u=CreateUnit(p,y,GetUnitX(mob[a].u),GetUnitY(mob[a].u),0)
    set pet.b=true
    set peton=true
    call pet.born(mob[a+20].u)
    call TriggerRegisterUnitEvent(petrez, mob[a+20].u, EVENT_UNIT_DEATH )
    call TriggerRegisterUnitEvent(damageinit, mob[a+20].u, EVENT_UNIT_DAMAGED )
    call TriggerRegisterUnitEvent(mobcast,mob[a+20].u,EVENT_UNIT_SPELL_EFFECT)
    call UnitAddAbility(mob[a+20].u,'A402')
    call UnitAddAbility(mob[a+20].u,'A403')
    call UnitAddAbility(mob[a+20].u,'Aeth')
    call BlzSetUnitArmor(mob[a+20].u,0)

    if IsUnitType(mob[a+20].u, UNIT_TYPE_ANCIENT) == true then
    call UnitRemoveType(mob[a+20].u, UNIT_TYPE_ANCIENT )
    endif
    call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl", mob[a+20].u, "origin") )
    call DisplayTextToPlayer(p,.5,0,text[31])
    else
    set pet.b=false
    set peton=false
    call DisplayTextToPlayer(p,.5,0,text[32])
    endif
    if petnow<2 then
    set petnow=petnow+1
    else
    set petnow=0
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[33])
    endif    
    endif
    
    
    if GetWidgetLife(it)==30 then
    if gold>=20*k then
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-20*k)
    set gold=gold-20*mob[a].lvl
    set k=li("flightpoint",z)
    set bj_lastCreatedUnit=CreateUnit(Player(9),'h00I',GetUnitX(GetSellingUnit()),GetUnitY(GetSellingUnit()),0)
    set x=GetHandleId(bj_lastCreatedUnit)
    call SaveInteger(H,x,StringHash("fly"),a)
    call SaveInteger(H,x,StringHash("flyto"),k)
    call RemoveGuardPosition(bj_lastCreatedUnit)
    call IssuePointOrderById(bj_lastCreatedUnit, 851986, GetRectCenterX(flyrect[k]),GetRectCenterY(flyrect[k]))
    call ShowUnit(mob[a].u,false)
    set fly=true
    call SetCameraTargetControllerNoZForPlayer(p, bj_lastCreatedUnit, 0, 0, false )
    call SetCameraFieldForPlayer(p, CAMERA_FIELD_TARGET_DISTANCE, 3000.00, 0 )    
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(20*k)+text[34])   
    endif
    endif
    
    
    if GetWidgetLife(it)==10 then
    if LoadInteger(H,StringHash("herotype"),z)==class then
    set j=LoadInteger(H,StringHash("skillorder"),z)
    set b=li("learnskill",z)
    set x=LoadInteger(H,StringHash("skilltype"),z)
    set k=0
    set i=0
    loop
    exitwhen i>5
    if j==skillid[20*i+a] then
    set k=1
    set y=skilllevel[20*i+a]
    if x==5 then
    if mob[a].lvl>=y*x then
    if gold >=100*(y+1) then
    call IncUnitAbilityLevel(mob[a].u, b )
    set skilllevel[20*i+a]=y+1
    call DisplayTextToPlayer(p,.5,0,text[35])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-100*(y+1))
    set gold=gold-100*(y+1)
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(100*(y+1))+text[36])   
    endif
    else
    if y==13 then
    call DisplayTextToPlayer(p,.5,0,text[37])
    else
    call DisplayTextToPlayer(p,.5,0,text[38]+I2S(x*y)+text[39])
    endif
    endif
    endif
    if x==10 then
    if mob[a].lvl==(y+1)*x then
    if gold >=1000*(y+1) then
    call IncUnitAbilityLevel(mob[a].u,b)
    set skilllevel[20*i+a]=y+1
    call DisplayTextToPlayer(p,.5,0,text[35])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-1000*(y+1))
    set gold=gold-1000*(y+1)
    else
    call DisplayTextToPlayer(p,.5,0,text[23]+I2S(1000*(y+1))+text[36])   
    endif
    else
    if y==6 then
    call DisplayTextToPlayer(p,.5,0,text[37])
    else
    call DisplayTextToPlayer(p,.5,0,text[38]+I2S(x*(y+1))+text[39]) 
    endif
    endif
    endif
    endif
    set i=i+1
    endloop
    if k==0 then
    if x==5 then
    if skillnum0==4 then
    call DisplayTextToPlayer(p,.5,0,text[40])
    else
    if gold >=100 then
    call UnitAddAbility(mob[a].u,b)
    set skillnum=skillnum0+skillnum1
    set skillid[20*skillnum+a]=j
    set skilllevel[20*skillnum+a]=1
    set skillnum0=skillnum0+1
    call DisplayTextToPlayer(p,.5,0,text[41])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-100)
    set gold=gold-100
    else
    call DisplayTextToPlayer(p,.5,0,text[42])    
    endif
    endif
    endif
    if x==10 then
    if skillnum1==2 then
    call DisplayTextToPlayer(p,.5,0,text[43])
    else
    if mob[a].lvl>=10 then
    if gold >=1000 then
    call UnitAddAbility(mob[a].u,b)
    set skillnum=skillnum0+skillnum1
    set skillid[20*skillnum+a]=j
    set skilllevel[20*skillnum+a]=1
    set skillnum1=skillnum1+1
    call DisplayTextToPlayer(p,.5,0,text[41])
    call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p,ConvertPlayerState(1))-1000)
    set gold=gold-1000
    else
    call DisplayTextToPlayer(p,.5,0,text[44])
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[45])
    endif
    endif
    endif
    endif
    else
    call DisplayTextToPlayer(p,.5,0,text[46])
    endif
    endif

    if GetWidgetLife(it)==20 then
    set j=0
    loop
    exitwhen j>4
    set c=20*j+a
    if qu[c].y==2 then
    set i=li("questanwser",qu[c].x)
    if npc[i].u==m then
    set x=li("questclass",qu[c].x)+1
    if mob[a].lvl<60 then
    set k=LoadInteger(H,StringHash("questlevel"),qu[c].x)*100*x
    if li("questlevel",qu[c].x)-1>mob[a].lvl then
    set k=k*3/2
    endif
    call AddHeroXP(mob[a].u,k,true)
   
    set xp=xp+k
    set s = I2S(k)
    set tt = CreateTextTagUnitBJ( s, mob[a].u, 0, 15.00, 0.00, 100, 0.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 135.00 )
    endif
    set k=li("questlevel",qu[c].x)*10*x
    set gold=gold+k
    set s = I2S(k)
    set tt = CreateTextTagUnitBJ( s, mob[a].u, 0, 15.00, 100, 100, 0.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 45.00 )
    // queststatus-0finished 1accepted 2completed
    call AdjustPlayerStateBJ(k, p, PLAYER_STATE_RESOURCE_GOLD )
    //call PlaySoundBJ()
    set k=LoadInteger(H,StringHash("questaward"),qu[c].x)
    if k==1 then
    set y=LoadInteger(H,StringHash("questlevel"),qu[c].x)
    set y=y-1
    set y=(y-ModuloInteger(y,5))/5
    set k=li("min"+I2S(x-1),y)
    set n=li("max"+I2S(x-1),y)
    set y=GetRandomInt(k,n)
    set k=li("itemid",y)
    set v=CreateItem(k,GetUnitX(mob[a].u),GetUnitY(mob[a].u))
    set x=GetHandleId(v)
    call SaveInteger(H,x,StringHash("order"),y)
    call UnitAddItem(mob[a].u,v)        
    call DisplayTextToPlayer(p,.5,0,text[47])
    call geardrop(y,v)
    endif
    call qu[c].end(a)
    endif
    endif    
    
    
    if qu[c].y==1 then
    set i=li("questgiver",qu[c].x)
    if npc[i].u==m then
    if li("questtype",qu[c].x)==1 then
    call DisplayTextToPlayer(p,.5,0,qcolor(ls("questback",qu[c].x),qu[c].x))
    endif
    if li("questtype",qu[c].x)==2 then
    set ia=2
    set x=li("qxy",j)
    if IsUnitInRangeXY(GetSellingUnit(), qx[x], qy[x], 300) == true then
    set qu[c].y=2
    set qu[c].s=1
    call qu[c].refresh(a)
    else
    set k=lh(GetSellingUnit(),"index")
    call SetUnitOwner(GetSellingUnit(), Player(20), true )
    call RemoveGuardPosition(GetSellingUnit())
    set x=li("qxy",j)
    call IssuePointOrder( GetSellingUnit(), "attack", qx[x], qy[x] )
    endif
    else
    if li("questtype",qu[c].x)==3 then
    set ia=2
    set k=lh(GetSellingUnit(),"index")
    call SetUnitOwner(GetSellingUnit(), Player(24), true )
    endif
    endif
    endif    
    endif    
    
    if qu[c].y==0 then
    set i=li("questgiver",qu[c].x)
    if npc[i].u==m then
    call qu[c].start(a)
    endif
    endif
    //0 kill mob
    //1 gather
    //2 escort
    //3 duel
    
    set j = j + 1
    endloop
    call mbupdate()
    endif
    
    
    
    
    if z=='I006' then
    set mob[a].x=R2I(GetUnitX(mob[a].u))
    set mob[a].y=R2I(GetUnitY(mob[a].u))
    call DisplayTextToPlayer(p,.5,0,text[48])
    endif

/*
if z=='I0OH' then
set k=0
set zz=GetStartLocationLoc(GetPlayerStartLocation(Player(1)))
set x=R2I(GetLocationX(zz))
set y=R2I(GetLocationY(zz))
call RemoveLocation(zz)
set j=0
loop
exitwhen j>4
set c=20*j+a
if qu[c].x>=li("qmin"+I2S(j),sys.map) then
set k=k+1
endif
set j=j+1
endloop
if k==5 then
call DisplayTextToPlayer(p,.5,0,text[49])
call SetUnitPosition(mob[a].u,x,y)
call SetUnitPosition(mob[a+20].u,x,y)
call PanCameraToTimedForPlayer(p,x,y,0)
set mob[a].x=x
set mob[a].y=y
else
call DisplayTextToPlayer(p,.5,0,text[50])
endif
endif
*/    

    call DisableTrigger(di)
    call FlushChildHashtable(H,h2i(it))
    call RemoveItem(it)
    call EnableTrigger(di)
    endif
    call money()
set v=null
set tt=null
endmethod


method sellgear takes integer i returns nothing
local integer k=li("cost",i)
local integer j=li("itemclass",i)
local integer m=li("price",j)*10
local integer x=0
if m>0 then
set x=k/m
endif
set gold=gold+x
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1))+x)
    set bj_lastCreatedTextTag=CreateTextTagUnitBJ(I2S(x), GetSellingUnit(), 0, 15.00, 100.00, 100, 0.00, 0 )
    call SetTextTagPermanent(bj_lastCreatedTextTag, false )
    call SetTextTagLifespan(bj_lastCreatedTextTag, 2.00 )
    call SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 30.00 )
    call money()
endmethod

method money takes nothing returns nothing
if gold < 4000000 and lumber > 0 then
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1)) + 100000)
call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p, ConvertPlayerState(2)) -1)
set lumber=lumber-1
set gold=gold+100000
endif
if gold >8000000 then
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1)) - 100000)
call SetPlayerState(p, ConvertPlayerState(2), GetPlayerState(p, ConvertPlayerState(2)) +1)
set lumber=lumber+1
set gold=gold-100000
endif
endmethod

method mbupdate takes nothing returns nothing
    call MultiboardSetItemValue( MultiboardGetItem(mb, 0, 1),GetPlayerName(p))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 1, 1),I2S(mob[a].damage))   
    call MultiboardSetItemValue( MultiboardGetItem(mb, 2, 1),I2S(mob[a].spell))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 3, 1),R2S(100*mob[a].crit)+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 4, 1),R2S(100*mob[a].scrit)+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 5, 1),I2S(mob[a].as)+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 6, 1),I2S(mob[a].ms))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 7, 1),I2S(timekey))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 8, 1),I2S(gametime)+" m")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 9, 1),I2S(stage))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 10, 1),I2S(li("ridespeed",rideskill))+"%")
    call MultiboardSetItemValue( MultiboardGetItem(mb, 11, 1),I2S(score))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 12, 1),I2S(trade))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 13, 1),I2S(petcost))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 14, 1),I2S(qu[a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 15, 1),I2S(qu[20+a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 16, 1),I2S(qu[40+a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 17, 1),I2S(qu[60+a].x))
    call MultiboardSetItemValue( MultiboardGetItem(mb, 18, 1),I2S(qu[80+a].x))
endmethod

method clearbag takes nothing returns nothing
local integer i=0
local integer c=0
call DisableTrigger(di)
if bagx==0 then
set i=0
loop
exitwhen i>sys.bag
set c=20*i+a
if bag[c].b then
call SetItemPosition(bag[c].it, 0, 0)
call SetItemVisible(bag[c].it,false)
endif
set i=i+1
endloop
endif

if bagx==1 then
set i=0
loop
exitwhen i>sys.gear
set c=20*i+a
if gear[c].b then
        call SetItemPosition(gear[c].it, 0, 0)
        call SetItemVisible(gear[c].it,false)
endif
set i=i+1
endloop
endif

if bagx==2 then
set i=6*packx
loop
exitwhen i>6*packx+5
set c=i*20+a
if pack[c].b then
        call SetItemPosition(pack[c].it, 0, 0)
        call SetItemVisible(pack[c].it,false)
endif
set i=i+1
endloop
endif
call EnableTrigger(di)
endmethod

method action takes integer b returns nothing
local integer i=0
local integer j=0
local integer m=0
local unit v=null
local timer t
local integer c=0

if GetSpellAbilityId() == 'A056' then
if GetLocalPlayer()==p then
call MultiboardDisplay(he[b].mb, true)
endif
endif

if GetSpellAbilityId() == 'A057' then
set i=0
loop
exitwhen i > 5
set j=skillid[20*i+a]
set j=LoadInteger(H,StringHash("skillid"),j)
call UnitRemoveAbility(mob[a].u,j)
set skillid[20*i+a]=0
set skilllevel[20*i+a]=0
set i=i+1
endloop
set skillnum0=0
set skillnum1=0
call DisplayTextToPlayer(p,.5,0,text[49])
endif


if GetSpellAbilityId() == 'A051' then
set m=GetDestructableTypeId(GetSpellTargetDestructable())
set i=0
loop
exitwhen i > 4
set c=20*i+a
set j=qu[c].x
if li("questtype",j)==1 then
if LoadInteger(H,StringHash("destorder"),m)==li("questtarget",j) then
if qu[c].y==1 then
call KillDestructable(GetSpellTargetDestructable())
if qu[c].s<LoadInteger(H,StringHash("questnum"),j) then
if LoadInteger(H,StringHash("questdrop"),j)>0 then
if GetRandomInt(1,100)<=LoadInteger(H,StringHash("questdrop"),j) then
set qu[c].s=qu[c].s+1
call qu[c].refresh(a)
call DisplayTextToPlayer(p,.5,0,qcolor(text[50]+LoadStr(H,StringHash("questitem"),j)+" "+I2S(qu[c].s)+"/"+I2S(LoadInteger(H,StringHash("questnum"),j)),j))
endif
else
set qu[c].s=qu[c].s+1
call qu[c].refresh(a)
endif
endif
endif
endif
endif
set i=i+1
endloop
endif

set i=0
loop 
exitwhen i>4

set j=li("qtip",i)
if GetSpellAbilityId() == j then
set m=mob[a].lvl*50
if he[a].gold>=m then
set he[a].gold=he[a].gold-m
call SetPlayerState(p, ConvertPlayerState(1), GetPlayerState(p, ConvertPlayerState(1))-m)
set c=20*i+a
if qu[c].y==0 then
set j=li("questgiver",qu[c].x)
if GetLocalPlayer()==p then
call PlaySoundBJ( gg_snd_MapPing )
call PingMinimap(npc[j].x, npc[j].y, 10)
endif
endif
if qu[c].y==2 then
set j=li("questanwser",qu[c].x)
if GetLocalPlayer()==p then
call PlaySoundBJ( gg_snd_MapPing )
call PingMinimap(npc[j].x, npc[j].y, 10)
endif
endif
if qu[c].y==1 then
set j=li("questtipx",qu[c].x)
if GetLocalPlayer()==p then
call PlaySoundBJ( gg_snd_MapPing )
call PingMinimap(li("qx",qu[c].x), li("qy",qu[c].x), 10)
endif
endif
else
call DisplayTextToPlayer(p,.5,0,text[23]+I2S(m)+text[51])
endif
endif
set i=i+1
endloop


if GetSpellAbilityId() == 'A053' then
set ride=true
set v=CreateUnit(Player(24),'e000',GetUnitX(mob[a].u),GetUnitY(mob[a].u),0 )
call UnitApplyTimedLife(v, 'BHwe', 2.00 )
call ShowUnit(v, false)
if rideskill==1 then
call UnitAddAbility(v, 'A059' )
endif
if rideskill==2 then
call UnitAddAbility(v, 'A058' )
endif
call IssuePointOrderById(v, 852592, GetUnitX(mob[a].u),GetUnitY(mob[a].u) )
endif

if GetSpellAbilityId() == 'A052' then
set t=CreateTimer()
set i=GetHandleId(t)
call SaveInteger(H,i,StringHash("hero"),a)
call TimerStart(t,0.1,false,function gohome)
endif

if GetSpellAbilityId() == 'A036' then
if height>3500 then
set height=1500
else
set height=height+500
endif
call SetCameraFieldForPlayer( p, CAMERA_FIELD_TARGET_DISTANCE,height, 0 )
call DisplayTextToPlayer(p,.5,0,text[52]+I2S(height))
endif

if GetSpellAbilityId() == 'A05Q' then
if esc then
set esc=false
call DisplayTextToPlayer(p,.5,0,text[53])
else
set esc=true
call DisplayTextToPlayer(p,.5,0,text[54])
endif
endif

if GetSpellAbilityId() == 'A038' then
call clearbag()
call DisableTrigger( ai )
if bagx!=0 then
set i=0
loop
exitwhen i>sys.bag
set c=20*i+a
if bag[c].b then
call UnitAddItem(mob[a].u, bag[c].it)
endif
set i=i+1
endloop
call DisplayTextToPlayer(p,.5,0,text[55])
endif

if bagx==0 then
set i=0
loop
exitwhen i>sys.gear
set c=20*i+a
if gear[c].b then
call UnitAddItem(mob[a].u, gear[c].it)
endif
set i=i+1
endloop
call DisplayTextToPlayer(p,.5,0,text[56])
endif

if bagx!=0 then
set bagx=0
else
set bagx=1
endif

call EnableTrigger( ai )
endif

if GetSpellAbilityId() == 'A039' then
call clearbag()
call DisableTrigger( ai )

if bagx==2 then
if packx==4 then
set packx=0
else
set packx=packx+1
endif
endif

if bagx!=2 then
set bagx=2
endif

set i=6*packx
loop
exitwhen i>5+6*packx
set c=20*i+a
if pack[c].b then
call UnitAddItem(mob[a].u, pack[c].it)
endif
set i=i+1
endloop
call DisplayTextToPlayer(p,.5,0,text[57]+I2S(packx))



call EnableTrigger( ai )
endif

set t=null
set v=null
endmethod


method getitem takes item it returns nothing
    local integer h=GetHandleId(it)
    local integer y=LoadInteger(H,h,StringHash("order"))
    local integer m=GetItemTypeId(it)
    local integer n=GetItemLevel(it)
    local boolean bbc=true
    local integer i=0
    local integer x=0
    local integer c=0
    local integer e=li("itemlevel",y)
    local integer f=li("itemclass",y)
    local integer j=e*5+f+1
    //0 bag
    //1 gear
    //2 pack
    call DisableTrigger(di)   
    if n==0 then
    if GetItemType(it) == ConvertItemType(4)  then
        set i=0
        loop
        exitwhen i > sys.bag
        set c=20*i+a
        if bag[c].b  then
        if GetItemTypeId(bag[c].it)==m  then
        set bbc=false
        call SetItemCharges(bag[c].it,GetItemCharges(bag[c].it)+GetItemCharges(it))
        call fh(it)
        call RemoveItem(it)
        call EnableTrigger(di)
        return
        endif
        else
        set bbc=false
        set bag[c].b=true
        set bag[c].it=it
        if bagx!=0 then
        call SetItemPosition(it, 0, 0)
        call SetItemVisible(it,false)
        endif
        call EnableTrigger(di)        
        return
        endif
    set i=i+1
    endloop
    if bbc then
    call UnitRemoveItem(mob[a].u, it)
    call DisplayTextToPlayer(p,.5,0,text[58])
    endif
    endif
    endif

if n>0 then

            if bagx==0 then
            set i=0
            loop
                exitwhen i > sys.pack
                set c=20*i+a
                    if pack[c].b==false then
                    set bbc=false
                    set pack[c].it=it
                    set pack[c].b=true               
                    call SetItemPosition(it, 0,0 )
                    call SetItemVisible(it, false)
                    call EnableTrigger(di)
                    return
                    endif
            set i = i + 1
            endloop
            endif
            
            if bagx==1 then
            set bbc=false           
            set x=LoadInteger(H,StringHash("itemtype"),y)
            set c=20*x+a
            if gear[c].b then
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[59])
            else
            if  j<=hero.lvl then
            set x=LoadInteger(H,StringHash("weapontype"),y)
            if x==1 then
            if class !=21 then
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[114])
            else
            set gear[c].b=true
            set gear[c].it=it
            call stat()
            endif
            else
            set gear[c].b=true
            set gear[c].it=it
            call stat()
            endif
            else
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[113])
            endif
            endif
            call EnableTrigger(di)
            return
            endif
            
            if bagx==2 then
            set i=packx*6
            loop
                exitwhen i > packx*6+5
                set c=20*i+a
                    if pack[c].b==false then                    
                    set bbc=false
                    set pack[c].it=it
                    set pack[c].b=true
                    call EnableTrigger(di)
                    return
                endif
                set i = i + 1
            endloop
            endif
            
            if bbc then
            call UnitRemoveItem(mob[a].u, it)
            call DisplayTextToPlayer(p,.5,0,text[60])
            endif
            endif
        call EnableTrigger(di)            
endmethod


method dropitem takes item it returns nothing
    local integer y=lh(it,"order")
    local integer m=GetItemTypeId(it)
    local integer n=GetItemLevel(it)
    local integer j
    local integer i=0
    local integer x=0
    local integer c=0
    if ia==1 then
    call fh(it)
    set ia=0
    endif
    
    //0 bag
    //1 gear
    //2 pack
    if n==0 then
    if GetItemType(it) == ConvertItemType(4)  then
    set i=0
        loop
        exitwhen i > sys.bag
        set c=20*i+a
        if bag[c].b then
        if bag[c].it==it then
        set bag[c].b=false
        set bag[c].it=null
        return
        endif
        endif
        set i=i+1
        endloop
  endif
  endif
        
if n>0 then
            if bagx==1 then
            set x=LoadInteger(H,StringHash("itemtype"),y)
            set c=20*x+a
            set gear[c].b=false
            set gear[c].it=null
            call stat()
            return
            endif
            
            if bagx==2 then
            set i=6*packx
            loop
                exitwhen i > 6*packx+5
                set c=20*i+a
                if pack[c].b then
                if pack[c].it==it then
                set pack[c].b=false
                set pack[c].it=null
                return
                endif
                endif
                set i = i + 1
            endloop
            endif
            endif
endmethod

method getxp takes unit x returns nothing
local integer i=0
local real bc=1
local integer c
local string s
local texttag tt=null
local integer m
local integer n
local integer j=0
local integer y=GetUnitTypeId(x)
	set m=GetHeroLevel(mob[a].u)
	set n=GetUnitLevel(x)
    if IsUnitInRange(mob[a].u, x, 1000) == true then
    if m<60 then
    if m <= ( n - 5 ) then
        set bc = 1.5
    endif
    if m >= ( n + 5 ) then
        set bc = .5
    endif
    set c = R2I(ia*bc*ra)
    set s = I2S(c)
    set tt = CreateTextTagUnitBJ( s, mob[a].u, 0, 15.00, 0.00, 0, 100.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 150.00 )
    call AddHeroXP( mob[a].u, c, true )
    set xp=xp+c
    endif
    
    set c = R2I((ia*ra)/10)
    set gold=gold+c
    call AdjustPlayerStateBJ( c, p, PLAYER_STATE_RESOURCE_GOLD )
    set s = I2S(c)
    set tt =CreateTextTagUnitBJ(s, mob[a].u, 0, 15.00, 100.00, 100, 0.00, 0 )
    call SetTextTagPermanent( tt, false )
    call SetTextTagLifespan( tt, 2.00 )
    call SetTextTagVelocityBJ( tt, 64, 30.00 )
    call money()

    set i=0
    loop 
    exitwhen i>4
    set c=20*i+a
    set j=qu[c].x
    if li("questtype",j)==0 then
    if li("unitorder",y)==LoadInteger(H,StringHash("questtarget"),j) then
    if qu[c].y==1 then
    if LoadInteger(H,StringHash("questnum"),j)>qu[c].s then
    if LoadInteger(H,StringHash("questdrop"),j)>0 then
    if GetRandomInt(0,100)<LoadInteger(H,StringHash("questdrop"),j) then
    set qu[c].s=qu[c].s+1
    call qu[c].refresh(a)
    call DisplayTextToPlayer(p,.5,0,qcolor(text[50]+LoadStr(H,StringHash("questitem"),j)+" "+I2S(qu[c].s)+"/"+I2S(LoadInteger(H,StringHash("questnum"),j)),j))
    endif
    else
    set qu[c].s=qu[c].s+1
    call qu[c].refresh(a)    
    call DisplayTextToPlayer(p,.5,0,qcolor(text[61]+GetUnitName(x)+" "+I2S(qu[c].s)+"/"+I2S(LoadInteger(H,StringHash("questnum"),j)),j))
    endif
    endif
    endif
	endif
    endif
    set i=i+1
    endloop
    endif
    set tt=null
endmethod

method gohome takes nothing returns nothing
call SetUnitPosition(mob[a].u,mob[a].x,mob[a].y)
call SetUnitPosition(mob[a+20].u,mob[a].x,mob[a].y)
call PanCameraToTimedForPlayer(p,mob[a].x,mob[a].y,0)
endmethod

method rideover takes nothing returns nothing
call UnitRemoveAbility(mob[a].u,'B000')
set ride=false
endmethod

method bonus takes nothing returns nothing
    local integer i=0
	local integer x=0
    local integer y=0
	local integer m=0
    local real r=0
    set ar[0]=armorx+armors
    set ar[1]=damagex+damages
    set ar[2]=asx+ass
    set ar[3]=hpx+hps
    set ar[4]=mpx+mps
    set ar[5]=strx+strs
    set ar[6]=agix+agis
    set ar[7]=intx+ints
    set ar[8]=msx+mss
	loop
	exitwhen m>sys.bonus
    set i = 0
    
    loop
    exitwhen i > LoadInteger(H,StringHash("bonusclass"),m)
    set x=LoadInteger(H,LoadInteger(H,StringHash("bonustype"),m),i)
    call UnitRemoveAbility(mob[a].u,x)
    set i = i + 1
    endloop
    
    set y=ar[m]
    
    loop
    exitwhen i < 0 or y <= 0
        set r = Pow(2, i)
        if I2R(y) >= r then
        set x=LoadInteger(H,LoadInteger(H,StringHash("bonustype"),m),i)
        call UnitAddAbility(mob[a].u,x )
        set y =  y - R2I(r)
        endif
        set i = i - 1
        endloop
    
    call SaveInteger(H,StringHash("bonus"+I2S(m)),a,ar[m])
	set m=m+1
	endloop
    
    if typex==21 then
    set r=damager*(.5*GetHeroStr(mob[a].u, true)+ar[1]+bdamage)
    endif
    if typex==22 then
    set r=damager*(.5*GetHeroAgi(mob[a].u, true)+ar[1]+bdamage)
    endif
    if typex==23 then
    set r=damager*(.5*GetHeroInt(mob[a].u, true)+ar[1]+bdamage)
    endif
    set mob[a].damage=R2I(r)
    set mob[a].spell=R2I(GetHeroInt(mob[a].u, true)*.5)+bspell+spellx
    set crits=GetHeroAgi(mob[a].u, true)/(50*mob[a].lvl)
    set mob[a].crit=crits+critx
    set scrits=GetHeroInt(mob[a].u, true)/(60*mob[a].lvl)
    set mob[a].scrit=scrits+scritx
    set mob[a].as=ar[2]
    set mob[a].ms=R2I(GetUnitDefaultMoveSpeed(mob[a].u))+ar[8]
    set mob[a].armor=ar[0]+barmor
    call mbupdate()
endmethod





method stat takes nothing returns nothing
    local integer i =0
    local integer j=0
    local integer m=0
    local integer n=0
    local integer c=0
    loop
        exitwhen i > sys.bonus
        set ar[i] = 0
        set i = i + 1
    endloop
    set i =  0
    loop
        exitwhen i > sys.gear
        set c=20*i+a
        if gear[c].b then
        set j=lh(gear[c].it,"order")
        if j>0 then
            set m = 0
            loop
            exitwhen m > sys.bonus
            set n=LoadInteger(H, LoadInteger(H,StringHash("bonustype"),m), j)            
            set ar[m] =  ar[m] +n
            set m = m + 1
            endloop
        endif
        endif
    set i = i + 1
    endloop
    set armors=ar[0]
    set damages=ar[1]
    set ass=ar[2]+R2I(GetHeroAgi(mob[a].u, true)*.2)
    set hps=ar[3]
    set mps=ar[4]
    set strs=ar[5]
    set agis=ar[6]
    set ints=ar[7]
    set mss=ar[8]
    call bonus()
endmethod
endstruct

struct slot
item it=null
boolean b=false
integer id=0
endstruct

struct gex
item it=null
boolean b=false
integer id=0
endstruct
//===========================================================================
// start
//===========================================================================

scope start initializer init
function NewInventory takes nothing returns nothing
local integer j
local integer a=0
local integer c=0

set a=0
loop
exitwhen a>sys.pn
if GetPlayerController(Player(a)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(a)) == PLAYER_SLOT_STATE_PLAYING then
set j=0
loop
exitwhen j > sys.gear
set c=20*j+a
set gear[c]=slot.create()
set j = j + 1
endloop

set j =  0
loop
exitwhen j > sys.bag
set c=20*j+a
set bag[c]=slot.create()
    set j = j + 1
endloop

set j=0
loop
exitwhen j > sys.pack
set c=20*j+a
set pack[c]=slot.create()
    set j = j + 1
endloop

endif

set a=a+1
endloop

endfunction

function flyaction takes nothing returns nothing
local integer k=GetHandleId(GetTriggerUnit())
local integer j=LoadInteger(H,k,StringHash("flyto"))
local integer a=LoadInteger(H,k,StringHash("fly"))
if GetUnitTypeId(GetTriggerUnit()) == 'h00I' then
if flyregion[j]==GetTriggeringRegion() then
call ShowUnit(mob[a].u,true)
call SetUnitPosition(mob[a+20].u,GetRectCenterX(flyrect[j]),GetRectCenterY(flyrect[j]))
call SetUnitPosition(mob[a].u,GetRectCenterX(flyrect[j]),GetRectCenterY(flyrect[j]))
call ResetToGameCameraForPlayer( Player(a), 0 )
call FlushChildHashtable(H,k)
call RemoveUnit(GetTriggerUnit())
call SelectUnitForPlayerSingle(mob[a].u, Player(a))
call SetCameraFieldForPlayer( Player(a), CAMERA_FIELD_TARGET_DISTANCE, 3000.00, 0 )
set he[a].fly=false
endif
endif
endfunction


//===========================================================================
// gameinit
//===========================================================================
function ohyes takes nothing returns nothing
local integer h=GetHandleId(GetClickedButton())
local integer k=LoadInteger(H,h,0)
local integer a=GetPlayerId(GetTriggerPlayer())
local integer b=0
local integer i=0
local integer x=0
local string s=""
local integer c=0
if he[a].init then
set he[a].init=false
set he[a].data=DialogCreate()
call DialogSetMessage( he[a].data, text[62])
set b=0
loop
exitwhen b>2
set i=0
call loadx(Player(a),"wow","hero"+I2S(b),44)
set i=load(Player(a),"xp",16)
if i>0 then
set datastate[20*b+a]=1
set x=load(Player(a),"order",0)
set i=li("unitid",x)
set i=li("unitclass",i)
set x=load(Player(a),"herolvl",17)
set s=classname[i]+" |c0000ff00"+I2S(x)+text[63]
set bu=DialogAddButton( he[a].data,s, 0 )
set datastate[20*b+a]=1
else
set datastate[20*b+a]=0
set bu=DialogAddButton( he[a].data, text[6], 0 )
endif
set c=GetHandleId(bu)
call SaveInteger(H,c,0,b)
set b=b+1
endloop
set bu=DialogAddButton( he[a].data, text[64], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,3)
call TriggerRegisterDialogEvent(showdata, he[a].data)
call loadx(Player(a),"wow","main",47)
if load(Player(a),"version",3)>1 then
call readdata(a)
endif
endif
if k==0 then
call DialogDisplay(Player(a),he[a].data,true)
endif
if k==1 then
call DialogDisplay(Player(a),he[a].pickhero,true)
endif
endfunction


function startgame takes nothing returns nothing
local trigger t = CreateTrigger()
local trigger q = CreateTrigger()
local trigger z = CreateTrigger()
local trigger v = CreateTrigger()

local integer a
local integer i
local string s=""
local integer x=0
local integer y
local integer b=0
local integer c=0

set tb=CreateTimer()
call TimerStart(tb,300,true,function autosave0)

set tc=CreateTimer()
call TimerStart(tc,600,true,function weather)

call StopMusic( true )
call SetCreepCampFilterState( true )
call SetAllyColorFilterState(1)
call CreateQuestBJ( bj_QUESTTYPE_OPT_DISCOVERED, text[65],text[66],"ReplaceableTextures\\CommandButtons\\BTNHealingWave.blp" )
set ta=CreateTimer()
call TimerStart(ta,300,true,function showtip)
set a=0
loop
exitwhen a>sys.pn
if GetPlayerController(Player(a)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(a)) == PLAYER_SLOT_STATE_PLAYING then
set ia=a
call ForForce(sys.team,function A0X)
call ForceAddPlayer(sys.team,Player(a))
call TriggerRegisterPlayerEvent(pl, Player(a), EVENT_PLAYER_LEAVE)
set he[a]=hex.create()
set mob[a]=sprite.create()
set mob[a+20]=sprite.create()
set he[a].start=DialogCreate()
set he[a].fog=CreateFogModifierRectBJ( true, Player(a), FOG_OF_WAR_MASKED, rex )
call DialogSetMessage( he[a].start, text[67])
set bu=DialogAddButton( he[a].start,text[68], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,0)
set bu=DialogAddButton( he[a].start,text[69], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,1)
call TriggerRegisterDialogEvent(z, he[a].start)



set he[a].confirm=DialogCreate()
call DialogSetMessage( he[a].confirm, text[8] )
set bu=DialogAddButton( he[a].confirm, text[64], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,0)
set bu=DialogAddButton( he[a].confirm, text[70], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,1)
call TriggerRegisterDialogEvent(t, he[a].confirm)


set he[a].pickhero=DialogCreate()
call DialogSetMessage( he[a].pickhero, text[71])
set i=21
loop
exitwhen i>29
if li("classx",i)==1 then
set bu=DialogAddButton( he[a].pickhero, classname[i], 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,i)
endif
set i=i+1
endloop
call TriggerRegisterDialogEvent(q, he[a].pickhero)

set i=0
loop 
exitwhen i>4
set x=20*i+a
set qu[x]=quesx.create()
set qu[x].x=1000+i*1000
call qu[x].born(a)
set i=i+1
endloop


    set he[a].mb=CreateMultiboardBJ( 1, 1, text[72])
    call MultiboardSetItemsStyle(he[a].mb, true, true )
    call MultiboardSetItemsWidth(he[a].mb, 0.08 )
    call MultiboardSetRowCount(he[a].mb, 19 )
    call MultiboardSetColumnCount(he[a].mb, 2 )
    
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 0, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 1, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 2, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 3, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 4, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 5, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 6, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 7, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 8, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 9, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 10, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 11, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 12, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 13, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 14, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 15, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 16, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 17, 1), true, false )
    call MultiboardSetItemStyle( MultiboardGetItem(he[a].mb, 18, 1), true, false )
  
    
    
    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 0, 0), 255, 0, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 0, 1), 255, 0, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 1, 0), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 1, 1), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 2, 0), 255, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 2, 1), 255, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 3, 0), 128, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 3, 1), 128, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 4, 0), 0, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 4, 1), 0, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 5, 0), 0, 255, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 5, 1), 0, 255, 128, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 6, 0), 0, 255, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 6, 1), 0, 255, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 7, 0), 0, 128, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 7, 1), 0, 128, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 8, 0), 0, 0, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 8, 1), 0, 0, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 9, 0), 128, 0, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 9, 1), 128, 0, 255, 255 )  
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 10, 0), 255, 0, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 10, 1), 255, 0, 255, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 11, 0), 255, 0, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 11, 1), 255, 0, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 12, 0), 255, 0, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 12, 1), 255, 0, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 13, 0), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 13, 1), 255, 128, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 14, 0), 255, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 14, 1), 255, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 15, 0), 128, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 15, 1), 128, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 16, 0), 0, 255, 0, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 16, 1), 0, 255, 0, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 17, 0), 0, 255, 128, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 17, 1), 0, 255, 128, 255 )    
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 18, 0), 0, 255, 255, 255 )
    call MultiboardSetItemValueColor( MultiboardGetItem(he[a].mb, 18, 1), 0, 255, 255, 255 )    


    
    
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 0, 0), "ReplaceableTextures\\CommandButtons\\BTNeredarRed.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 1, 0), "ReplaceableTextures\\CommandButtons\\BTNCleavingAttack.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 2, 0), "ReplaceableTextures\\CommandButtons\\BTNFireBolt.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 3, 0), "ReplaceableTextures\\CommandButtons\\BTNPillage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 4, 0), "ReplaceableTextures\\CommandButtons\\BTNScatterRockets.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 5, 0), "ReplaceableTextures\\CommandButtons\\BTNBerserk.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 6, 0), "ReplaceableTextures\\CommandButtons\\BTNAnimalWarTraining.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 7, 0), "ReplaceableTextures\\CommandButtons\\BTNPebble.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 8, 0), "ReplaceableTextures\\CommandButtons\\BTNShadowMeld.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 9, 0), "ReplaceableTextures\\PassiveButtons\\PASBTNElunesBlessing.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 10, 0), "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 11, 0), "ReplaceableTextures\\CommandButtons\\BTNMarksmanship.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 12, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 13, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 14, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 15, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )
    call MultiboardSetItemIcon( MultiboardGetItem(he[a].mb, 16, 0), "ReplaceableTextures\\CommandButtons\\BTNChemicalRage.blp" )



   
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 0, 0), text[73] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 1, 0), text[107] )      
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 2, 0), text[74] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 3, 0), text[108] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 4, 0), text[109] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 5, 0), text[75] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 6, 0), text[76] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 7, 0), text[77] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 8, 0), text[78] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 9, 0), text[79] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 10, 0), text[80] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 11, 0), text[81] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 12, 0), text[110] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 13, 0), text[111] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 14, 0), text[82] )    
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 15, 0), text[83] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 16, 0), text[84] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 17, 0), text[85] )
    call MultiboardSetItemValue( MultiboardGetItem(he[a].mb, 18, 0), text[86] )
    
if GetLocalPlayer()==Player(a) then
call MultiboardDisplay(he[a].mb, true)
endif
call SetPlayerAbilityAvailable(Player(a),'A053',false)
set mob[a+20].b=false
call DialogDisplay(Player(a),he[a].start,true)
endif
set a=a+1
endloop
set i=0
loop 
exitwhen i>20
set flyregion[i] = CreateRegion()
call RegionAddRect(flyregion[i], flyrect[i])
call TriggerRegisterEnterRegion(v, flyregion[i], null)
set i=i+1
endloop

call TriggerAddAction(v, function flyaction)
call TriggerAddAction(t, function confirm)
call TriggerAddAction(q, function pickhero)
call TriggerAddAction(z, function ohyes)
call TriggerAddAction(showdata, function sl)
call DestroyTrigger( GetTriggeringTrigger())
set t=null
set q=null
set z=null
set v=null
endfunction

function stringinit takes nothing returns nothing
call textinit()
call rsinit()
call ssinit()
call usinit()
call taskinit0()
call taskinit1()
call taskinit2()
call taskinit3()
call taskinit4()
call gsinit()
call tipinit()
endfunction

function picklang takes nothing returns nothing
local integer h=GetHandleId(GetClickedButton())
local integer k=LoadInteger(H,h,0)
set sys.lang=k
//call stringinit()
call startgame()
call mapinit()
endfunction

function setlanguage takes nothing returns nothing
local integer i=0
local integer c=0
local trigger t=CreateTrigger()
set sys.langx=DialogCreate()
call DialogSetMessage( sys.langx, "select language" )
set bu=DialogAddButton( sys.langx, "English", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,0)
set bu=DialogAddButton( sys.langx, "Fran?ais", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,1)
set bu=DialogAddButton( sys.langx, "Deutsch", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,2)
set bu=DialogAddButton( sys.langx, "Italiano", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,3)
set bu=DialogAddButton( sys.langx, "Espa?ol", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,4)
set bu=DialogAddButton( sys.langx, "svenska", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,5)
set bu=DialogAddButton( sys.langx, "日本語", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,6)
set bu=DialogAddButton( sys.langx, "한국어", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,7)
set bu=DialogAddButton( sys.langx, "Ελληνικά", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,8)
set bu=DialogAddButton( sys.langx, "Latine", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,9)
set bu=DialogAddButton( sys.langx, "汉语", 0 )
set c=GetHandleId(bu)
call SaveInteger(H,c,0,10)
call TriggerRegisterDialogEvent(t,sys.langx)
call TriggerAddAction(t,function picklang)
loop
exitwhen i>20
if GetPlayerController(Player(i)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(i)) == PLAYER_SLOT_STATE_PLAYING then
call DialogDisplay( Player(i), sys.langx, true )
set t=null
return
endif
set i=i+1
endloop
endfunction




function destevent takes nothing returns nothing
if GetWidgetLife(GetEnumDestructable())==50 then
call TriggerRegisterDeathEvent(dd, GetEnumDestructable())
endif
endfunction

function initscope takes nothing returns nothing
local trigger t= CreateTrigger()
local integer i=0
local trigger r = CreateTrigger()

call TriggerRegisterTimerEvent(t, 1, false)
call TriggerAddAction(t, function setlanguage)
set t = CreateTrigger()
call TriggerRegisterPlayerUnitEvent(t, Player(27), EVENT_PLAYER_UNIT_SELL_ITEM,null )
loop
exitwhen i>sys.pn
call TriggerRegisterPlayerEvent(r, Player(i), EVENT_PLAYER_ARROW_DOWN_DOWN)
set i=i+1
endloop
call TriggerAddAction(damageinit, function hurt)
call TriggerAddAction(t, function buy)
call TriggerAddAction(ai, function getitem)
call TriggerAddAction(cooard, function rectswitch)
call TriggerAddAction(selecthero, function pickhero)
call TriggerAddAction(dd, function destdeath)
call TriggerAddAction(herorez, function herodie)
call TriggerAddAction(npcword, function npcspeak)
call TriggerAddAction(itemword, function itemspeak)
call TriggerAddAction(r, function rideover)
call TriggerAddAction(herolvl, function statup)
call TriggerAddAction(sellitem, function sellgear)
call TriggerAddAction(di, function dropitem)
call TriggerAddAction(petrez, function petdie)
call TriggerAddAction(hostdata, function action )
call TriggerAddAction(hostdata, function warrior )
call TriggerAddAction(hostdata, function paladin )
call TriggerAddAction(hostdata, function shaman )
call TriggerAddAction(hostdata, function hunter )
call TriggerAddAction(hostdata, function rogue )
call TriggerAddAction(hostdata, function mage )
call TriggerAddAction(hostdata, function priest )
call TriggerAddAction(startcast, function caststart )
call TriggerAddAction(npcdie, function mobdie )
call TriggerAddAction(npcchange, function betray)
call TriggerAddAction(mobcast, function mobskill)
set t=null
set r=null
endfunction

private function init takes nothing returns nothing
call NewInventory()
call initscope()
call EnumDestructablesInRect(rex, null, function destevent)
endfunction
endscope

//===========================================================================
// mapinit
//===========================================================================

library npcrect needs sys,npc
function mapinit takes nothing returns nothing
local unit u
local integer i=0
local integer j=0
local integer x=0
local integer y=0
local integer h=0
call EnableCreepSleepBJ( false )
call SetPlayerState( Player(20), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(21), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(22), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(23), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(27), PLAYER_STATE_GIVES_BOUNTY, 0 )
call SetPlayerState( Player(24), PLAYER_STATE_GIVES_BOUNTY, 0 )
call CreateFogModifierRectBJ( true, Player(24), FOG_OF_WAR_VISIBLE,GetPlayableMapRect())

set i=40
loop
exitwhen i>100
set j=li("mobid",i)
set x=li("mobx",i)
set y=li("moby",i)
set u= CreateUnit(Player(24),j,100*x,100*y,0)
set h=GetHandleId(u)
call SaveInteger(H,h,StringHash("index"),i)
set mob[i]=sprite.create()
set mob[i].index=i
call mob[i].born(u)
call mobevent(u)
set i=i+1
endloop

set i=0
loop
exitwhen i>100
set j=li("npcid",i)
set x=li("npcx",i)
set y=li("npcy",i)
set u= CreateUnit(Player(27),j,100*x,100*y,0)
set h=GetHandleId(u)
call SaveInteger(H,h,StringHash("index"),i)
set npc[i]=sprite.create()
set npc[i].index=i
call npc[i].born(u)
set i=i+1
endloop

set u=null
endfunction

function rectswitch takes nothing returns nothing
local player p = GetOwningPlayer(GetTriggerUnit())
local integer a=GetPlayerId(p)
local integer m=0
local unit u = GetTriggerUnit()
local integer j=0
local integer q=0
local integer w=0
loop
exitwhen m>50
if RectContainsUnit(crect[m], u) then
set j=LoadInteger(H,StringHash("rectregion"),m)
if j!=he[a].regionx then
call DisplayTextToPlayer(Player(a),.5,0,LoadStr(H,StringHash("regionname"),j))
set he[a].regionx=j
endif
if m!=he[a].rectx then
call DisplayTextToPlayer(Player(a),.5,0,LoadStr(H,StringHash("rectname"),m))
set he[a].rectx=m
endif
set p=null
set u=null
return
endif
set m=m+1
endloop
set p=null
set u=null
endfunction

endlibrary




//===========================================================================
// library
//===========================================================================
//===========================================================================
// drop
//===========================================================================

library dropinit initializer init needs sys
function setip takes integer a,integer b,integer c,integer d returns nothing
call si("min"+I2S(b),a,c)
call si("max"+I2S(b),a,d)
endfunction
//w 100
//g 10
//b 1
//p 0.1
//o 0.01
function ipinit takes nothing returns nothing
//common
call setip(0,0,1000,1013)
call setip(0,1,1050,1063)
call setip(1,0,1100,1113)
call setip(1,1,1150,1163)
call setip(2,0,1200,1213)
call setip(2,1,1250,1263)




//elite
/*
call setip('h003',0,1000,1002)
call setip('h003',1,1050,1052)
call setip('h004',0,1003,1007)
call setip('h004',1,1053,1057)
call setip('h005',0,1008,1013)
call setip('h005',1,1058,1063)
*/

endfunction

private function init takes nothing  returns nothing
call ipinit()
endfunction
endlibrary

//===========================================================================
// rect
//===========================================================================

library rectx initializer init needs sys
function setrect takes integer a,integer b returns nothing
call SaveInteger(H,StringHash("rectregion"),a,b)
endfunction

function rectinit takes nothing returns nothing
/*
set flyrect[0]=gg_rct_fp0
set flyrect[1]=gg_rct_fp1
set flyrect[2]=gg_rct_fp2
set flyrect[3]=gg_rct_fp3

set crect[0]=gg_rct_cr0
set crect[1]=gg_rct_cr1
set crect[2]=gg_rct_cr2
set crect[3]=gg_rct_cr3
set crect[4]=gg_rct_cr4
set crect[5]=gg_rct_cr5
set crect[6]=gg_rct_cr6
set crect[7]=gg_rct_cr7
set crect[8]=gg_rct_cr8
set crect[9]=gg_rct_cr9
*/
/*
set crect[10]=gg_rct_cr10
set crect[11]=gg_rct_cr11
set crect[12]=gg_rct_cr12
set crect[13]=gg_rct_cr13
set crect[14]=gg_rct_cr14
*/



call setrect(0,0)
call setrect(1,0)
call setrect(2,0)
call setrect(3,0)
call setrect(4,1)
call setrect(5,1)
call setrect(6,1)
call setrect(7,2)
call setrect(8,2)
call setrect(0,0)
call setrect(9,2)
call setrect(10,3)
call setrect(11,3)
call setrect(12,3)
call setrect(13,3)
call setrect(14,3)

endfunction
private function init takes nothing  returns nothing
call rectinit()
endfunction
endlibrary





library itemx initializer init needs sys

function setitem takes integer a ,integer b,integer c,integer d,integer e,integer f,integer g,integer h,integer i,integer j,integer k,integer l,integer m,integer n,integer o returns nothing
    call SaveInteger(H,StringHash("itemtype"),sys.itemx,a)    
    call SaveInteger(H,StringHash("itemclass"),sys.itemx,b)
    call SaveInteger(H,StringHash("itemlevel"),sys.itemx,c)
    call SaveInteger(H,StringHash("icontype"),sys.itemx,d)    
    call SaveInteger(H,StringHash("weapontype"),sys.itemx,e)  
    call SaveInteger(H,StringHash("armor"),sys.itemx,f)
    call SaveInteger(H,StringHash("damage"),sys.itemx,g)
    call SaveInteger(H,StringHash("attackspeed"),sys.itemx,h)
    call SaveInteger(H,StringHash("hp"),sys.itemx,i)
    call SaveInteger(H,StringHash("mp"),sys.itemx,j)
    call SaveInteger(H,StringHash("str"),sys.itemx,k)
    call SaveInteger(H,StringHash("agi"),sys.itemx,l)
    call SaveInteger(H,StringHash("int"),sys.itemx,m)
    call SaveInteger(H,StringHash("movespeed"),sys.itemx,n)
    call SaveInteger(H,StringHash("skill"),sys.itemx,o)
    
    set sys.itemx=sys.itemx+1
endfunction

function iteminit takes nothing returns nothing
//5
local integer i=0//class
local integer j=0//level
local integer m=0//damage
local integer n=0//average
local integer b=0//attr
local integer a=0
local integer c=0
loop
exitwhen j>11
if j<3 then
set i=0
loop
exitwhen i>1
set sys.itemx=1000+100*j+50*i
set m=4*(i+2)*(j+1)
set n=(i+2)*(j+1)/2
set b=(i+2)*(j+1)
call setitem(2,i,j,6,0,0,0,0,0,0,0,0,b,0,0)
call setitem(2,i,j,7,0,0,0,0,0,0,0,b,0,0,0)
call setitem(2,i,j,8,0,0,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,11,1,50,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,12,2,0,m,0,0,0,0,0,b,0,0)
call setitem(3,i,j,13,3,0,m,0,0,0,0,b,0,0,0)
call setitem(3,i,j,14,4,0,m,0,0,0,b,0,0,0,0)
call setitem(3,i,j,15,5,0,m,0,0,0,n,n,n,0,0)
call setitem(4,i,j,16,0,0,0,0,0,0,0,0,b,0,0)
call setitem(4,i,j,17,0,0,0,0,0,0,0,b,0,0,0)
call setitem(4,i,j,18,0,0,0,0,0,0,b,0,0,0,0)
call setitem(5,i,j,21,0,0,0,0,0,0,0,0,b,0,0)
call setitem(5,i,j,22,0,0,0,0,0,0,0,b,0,0,0)
call setitem(5,i,j,23,0,0,0,0,0,0,b,0,0,0,0)

set i=i+1
endloop
endif

if j>2 and j<7 then
set i=0
loop
exitwhen i>2
set sys.itemx=1300+150*(j-3)+50*i
set m=4*(i+2)*(j+1)
set n=(i+2)*(j+1)/2
set b=(i+2)*(j+1)
call setitem(1,i,j,1,0,0,0,0,0,0,0,0,b,0,0)
call setitem(1,i,j,2,0,0,0,0,0,0,0,b,0,0,0)
call setitem(1,i,j,3,0,0,0,0,0,0,b,0,0,0,0)
call setitem(2,i,j,6,0,0,0,0,0,0,0,0,b,0,0)
call setitem(2,i,j,7,0,0,0,0,0,0,0,b,0,0,0)
call setitem(2,i,j,8,0,0,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,11,1,50,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,12,2,0,m,0,0,0,0,0,b,0,0)
call setitem(3,i,j,13,3,0,m,0,0,0,0,b,0,0,0)
call setitem(3,i,j,14,4,0,m,0,0,0,b,0,0,0,0)
call setitem(3,i,j,15,5,0,m,0,0,0,n,n,n,0,0)
call setitem(4,i,j,16,0,0,0,0,0,0,0,0,b,0,0)
call setitem(4,i,j,17,0,0,0,0,0,0,0,b,0,0,0)
call setitem(4,i,j,18,0,0,0,0,0,0,b,0,0,0,0)
call setitem(5,i,j,21,0,0,0,0,0,0,0,0,b,0,0)
call setitem(5,i,j,22,0,0,0,0,0,0,0,b,0,0,0)
call setitem(5,i,j,23,0,0,0,0,0,0,b,0,0,0,0)
if i>0 then
call setitem(6,i,j,26,0,0,0,0,0,0,0,0,b,0,0)
call setitem(6,i,j,27,0,0,0,0,0,0,0,b,0,0,0)
call setitem(6,i,j,28,0,0,0,0,0,0,b,0,0,0,0)
call setitem(6,i,j,29,0,0,0,0,0,0,n,n,n,0,0)
endif
set i=i+1
endloop
endif

if j>6 then
set i=0
loop
exitwhen i>3
set sys.itemx=1900+200*(j-7)+50*i
set m=4*(i+2)*(j+1)
set n=(i+2)*(j+1)/2
set b=(i+2)*(j+1)
call setitem(1,i,j,1,0,0,0,0,0,0,0,0,b,0,0)
call setitem(1,i,j,2,0,0,0,0,0,0,0,b,0,0,0)
call setitem(1,i,j,3,0,0,0,0,0,0,b,0,0,0,0)
call setitem(1,i,j,4,0,0,0,0,0,0,n,n,n,0,0)
call setitem(2,i,j,6,0,0,0,0,0,0,0,0,b,0,0)
call setitem(2,i,j,7,0,0,0,0,0,0,0,b,0,0,0)
call setitem(2,i,j,8,0,0,0,0,0,0,b,0,0,0,0)
call setitem(2,i,j,9,0,0,0,0,0,0,n,n,n,0,0)
call setitem(3,i,j,11,1,50,0,0,0,0,b,0,0,0,0)
call setitem(3,i,j,12,2,0,m,0,0,0,0,0,b,0,0)
call setitem(3,i,j,13,3,0,m,0,0,0,0,b,0,0,0)
call setitem(3,i,j,14,4,0,m,0,0,0,b,0,0,0,0)
call setitem(3,i,j,15,5,0,m,0,0,0,n,n,n,0,0)
call setitem(4,i,j,16,0,0,0,0,0,0,0,0,b,0,0)
call setitem(4,i,j,17,0,0,0,0,0,0,0,b,0,0,0)
call setitem(4,i,j,18,0,0,0,0,0,0,b,0,0,0,0)
call setitem(4,i,j,19,0,0,0,0,0,0,n,n,n,0,0)
call setitem(5,i,j,21,0,0,0,0,0,0,0,0,b,0,0)
call setitem(5,i,j,22,0,0,0,0,0,0,0,b,0,0,0)
call setitem(5,i,j,23,0,0,0,0,0,0,b,0,0,0,0)
call setitem(5,i,j,24,0,0,0,0,0,0,n,n,n,0,0)
if i>0 then
call setitem(6,i,j,26,0,0,0,0,0,0,0,0,b,0,0)
call setitem(6,i,j,27,0,0,0,0,0,0,0,b,0,0,0)
call setitem(6,i,j,28,0,0,0,0,0,0,b,0,0,0,0)
call setitem(6,i,j,29,0,0,0,0,0,0,n,n,n,0,0)
endif
set i=i+1
endloop
endif

set j=j+1
endloop

endfunction

private function init takes nothing  returns nothing
call iteminit()
endfunction
endlibrary




library else initializer init needs sys
function showtip takes nothing returns nothing
local integer i=lx("tips",0)
if i<100 then
set i=i+1
else
set i=0
endif
call DisplayTextToForce(sys.team,text[87]+ls("tip",i))
call sx("tips",0,i)
endfunction



function gameinit takes nothing returns nothing


call ss("itemicon",1,"war3mapImported\\BTNINV_Helmet_15.blp")
call ss("itemicon",2,"war3mapImported\\BTNINV_Helmet_24.blp")
call ss("itemicon",3,"war3mapImported\\BTNINV_Helmet_25.blp")
call ss("itemicon",4,"war3mapImported\\BTNINV_Helmet_23.blp")
call ss("itemicon",6,"war3mapImported\\BTNINV_Chest_Leather_09.blp")
call ss("itemicon",7,"war3mapImported\\BTNINV_Chest_Leather_08.blp")
call ss("itemicon",8,"war3mapImported\\BTNINV_Chest_Plate07.blp")
call ss("itemicon",9,"war3mapImported\\BTNINV_Chest_Chain_14.blp")
call ss("itemicon",11,"ReplaceableTextures\\CommandButtons\\BTNHumanArmorUpThree.blp")
call ss("itemicon",12,"war3mapImported\\BTNINV_Wand_05.blp")
call ss("itemicon",13,"war3mapImported\\BTNINV_Sword_25.blp")
call ss("itemicon",14,"war3mapImported\\BTNINV_Axe_09.blp")
call ss("itemicon",15,"war3mapImported\\BTNINV_Hammer_13.blp")
call ss("itemicon",16,"war3mapImported\\BTNINV_Pants_01.blp")
call ss("itemicon",17,"war3mapImported\\BTNINV_Pants_02.blp")
call ss("itemicon",18,"war3mapImported\\BTNINV_Pants_05.blp")
call ss("itemicon",19,"war3mapImported\\BTNINV_Pants_04.blp")
call ss("itemicon",21,"war3mapImported\\BTNINV_Boots_09.blp")
call ss("itemicon",22,"war3mapImported\\BTNINV_Boots_05.blp")
call ss("itemicon",23,"war3mapImported\\BTNINV_Boots_Plate_09.blp")
call ss("itemicon",24,"war3mapImported\\BTNINV_Boots_Plate_03.blp")
call ss("itemicon",26,"war3mapImported\\BTNINV_Jewelry_Ring_13.blp")
call ss("itemicon",27,"war3mapImported\\BTNINV_Jewelry_Ring_12.blp")
call ss("itemicon",28,"war3mapImported\\BTNINV_Jewelry_Ring_04.blp")
call ss("itemicon",29,"war3mapImported\\BTNINV_Jewelry_Ring_05.blp")

call ss("itemcolor",1,"|c0000ff00")
call ss("itemcolor",2,"|c0000ffff")
call ss("itemcolor",3,"|c00ff00ff")
call ss("itemcolor",4,"|c00ffff00")

call ss("unitcolor",1,"|c00ffff00")
call ss("unitcolor",2,"|c0000ff00")
call ss("unitcolor",3,"|c0000ffff")
call ss("unitcolor",4,"|c0000ff00")
call ss("unitcolor",5,"|c0000ffff")


call ss("qcolor",0,"|c00ff0000")
call ss("qcolor",1,"|c000000ff")
call ss("qcolor",2,"|c0000ffff")
call ss("qcolor",3,"|cff800080")
call ss("qcolor",4,"|cffffff00")
call ss("qcolor",5,"|cffff6600")
call ss("qcolor",6,"|cff00ff00")
call ss("qcolor",7,"|cffff00ff")
call ss("qcolor",8,"|cff808080")
call ss("qcolor",9,"|cffADD8E6")
call ss("qcolor",10,"|cff006400")
call ss("qcolor",11,"|cffA52A2A")
call ss("qcolor",12,"|cff800000")
call ss("qcolor",13,"|cff000080")
call ss("qcolor",14,"|cff40E0D0")
call ss("qcolor",15,"|cffEE82EE")
call ss("qcolor",16,"|cfff5deb3")
call ss("qcolor",17,"|cffFFDAB9")
call ss("qcolor",18,"|cff98FF98")
call ss("qcolor",19,"|cffE6E6FA")


call ss("bonusname",0,"armor")
call ss("bonusname",1,"damage")
call ss("bonusname",2,"attackspeed")
call ss("bonusname",3,"hp")
call ss("bonusname",4,"mp")
call ss("bonusname",5,"str")
call ss("bonusname",6,"agi")
call ss("bonusname",7,"int")
call ss("bonusname",8,"movespeed")

call si("ridespeed",0,0)
call si("ridespeed",1,60)
call si("ridespeed",2,100)

call si("price",0,1)
call si("price",1,10)
call si("price",2,100)
call si("price",3,1000)
call si("price",4,10000)


endfunction

private function init takes nothing  returns nothing
call gameinit()
endfunction
endlibrary




library bonusinit initializer init
function bonusinit takes nothing returns nothing
    call SaveInteger(H,StringHash("bonusclass"),0,10)
    call SaveInteger(H,StringHash("bonusclass"),1,15)
    call SaveInteger(H,StringHash("bonusclass"),2,9)
    call SaveInteger(H,StringHash("bonusclass"),3,15)
    call SaveInteger(H,StringHash("bonusclass"),4,15)
    call SaveInteger(H,StringHash("bonusclass"),5,10)
    call SaveInteger(H,StringHash("bonusclass"),6,10)
    call SaveInteger(H,StringHash("bonusclass"),7,10)
    call SaveInteger(H,StringHash("bonusclass"),8,9)
    call SaveInteger(H,StringHash("armor"),0,'A005')
    call SaveInteger(H,StringHash("armor"),1,'A006')
    call SaveInteger(H,StringHash("armor"),2,'A00D')
    call SaveInteger(H,StringHash("armor"),3,'A00E')
    call SaveInteger(H,StringHash("armor"),4,'A00F')
    call SaveInteger(H,StringHash("armor"),5,'A00G')
    call SaveInteger(H,StringHash("armor"),6,'A00H')
    call SaveInteger(H,StringHash("armor"),7,'A00I')
    call SaveInteger(H,StringHash("armor"),8,'A00J')
    call SaveInteger(H,StringHash("armor"),9,'A00K')
    call SaveInteger(H,StringHash("armor"),10,'A00L')
    call SaveInteger(H,StringHash("damage"),0,'A001')
    call SaveInteger(H,StringHash("damage"),1,'A002')
    call SaveInteger(H,StringHash("damage"),2,'A003')
    call SaveInteger(H,StringHash("damage"),3,'A004')
    call SaveInteger(H,StringHash("damage"),4,'A007')
    call SaveInteger(H,StringHash("damage"),5,'A008')
    call SaveInteger(H,StringHash("damage"),6,'A00C')
    call SaveInteger(H,StringHash("damage"),7,'A009')
    call SaveInteger(H,StringHash("damage"),8,'A00B')
    call SaveInteger(H,StringHash("damage"),9,'A01M')
    call SaveInteger(H,StringHash("damage"),10,'A00A')
    call SaveInteger(H,StringHash("damage"),11,'A01L')
    call SaveInteger(H,StringHash("damage"),12,'A01K')
    call SaveInteger(H,StringHash("damage"),13,'A01J')
    call SaveInteger(H,StringHash("damage"),14,'A01I')
    call SaveInteger(H,StringHash("damage"),15,'A01N')
    call SaveInteger(H,StringHash("attackspeed"),0,'A00M')
    call SaveInteger(H,StringHash("attackspeed"),1,'A02X')
    call SaveInteger(H,StringHash("attackspeed"),2,'A02Y')
    call SaveInteger(H,StringHash("attackspeed"),3,'A02Z')
    call SaveInteger(H,StringHash("attackspeed"),4,'A030')
    call SaveInteger(H,StringHash("attackspeed"),5,'A031')
    call SaveInteger(H,StringHash("attackspeed"),6,'A035')
    call SaveInteger(H,StringHash("attackspeed"),7,'A03T')
    call SaveInteger(H,StringHash("attackspeed"),8,'A044')
    call SaveInteger(H,StringHash("attackspeed"),9,'A04M')
    call SaveInteger(H,StringHash("hp"),0,'A00Y')
    call SaveInteger(H,StringHash("hp"),1,'A00O')
    call SaveInteger(H,StringHash("hp"),2,'A00P')
    call SaveInteger(H,StringHash("hp"),3,'A00Q')
    call SaveInteger(H,StringHash("hp"),4,'A00R')
    call SaveInteger(H,StringHash("hp"),5,'A00S')
    call SaveInteger(H,StringHash("hp"),6,'A00T')
    call SaveInteger(H,StringHash("hp"),7,'A00U')
    call SaveInteger(H,StringHash("hp"),8,'A00V')
    call SaveInteger(H,StringHash("hp"),9,'A00W')
    call SaveInteger(H,StringHash("hp"),10,'A00X')
    call SaveInteger(H,StringHash("hp"),11,'A00Z')
    call SaveInteger(H,StringHash("hp"),12,'A010')
    call SaveInteger(H,StringHash("hp"),13,'A011')
    call SaveInteger(H,StringHash("hp"),14,'A012')
    call SaveInteger(H,StringHash("hp"),15,'A013')
    call SaveInteger(H,StringHash("mp"),0,'A00N')
    call SaveInteger(H,StringHash("mp"),1,'A000')
    call SaveInteger(H,StringHash("mp"),2,'A014')
    call SaveInteger(H,StringHash("mp"),3,'A015')
    call SaveInteger(H,StringHash("mp"),4,'A016')
    call SaveInteger(H,StringHash("mp"),5,'A017')
    call SaveInteger(H,StringHash("mp"),6,'A018')
    call SaveInteger(H,StringHash("mp"),7,'A019')
    call SaveInteger(H,StringHash("mp"),8,'A01A')
    call SaveInteger(H,StringHash("mp"),9,'A01B')
    call SaveInteger(H,StringHash("mp"),10,'A01C')
    call SaveInteger(H,StringHash("mp"),11,'A01D')
    call SaveInteger(H,StringHash("mp"),12,'A01E')
    call SaveInteger(H,StringHash("mp"),13,'A01F')
    call SaveInteger(H,StringHash("mp"),14,'A01G')
    call SaveInteger(H,StringHash("mp"),15,'A01H')
    call SaveInteger(H,StringHash("str"),0,'A01O')
    call SaveInteger(H,StringHash("str"),1,'A01P')
    call SaveInteger(H,StringHash("str"),2,'A01Q')
    call SaveInteger(H,StringHash("str"),3,'A01R')
    call SaveInteger(H,StringHash("str"),4,'A01S')
    call SaveInteger(H,StringHash("str"),5,'A01T')
    call SaveInteger(H,StringHash("str"),6,'A01U')
    call SaveInteger(H,StringHash("str"),7,'A01V')
    call SaveInteger(H,StringHash("str"),8,'A01W')
    call SaveInteger(H,StringHash("str"),9,'A01X')
    call SaveInteger(H,StringHash("str"),10,'A034')
    call SaveInteger(H,StringHash("agi"),0,'A02H')
    call SaveInteger(H,StringHash("agi"),1,'A02G')
    call SaveInteger(H,StringHash("agi"),2,'A02F')
    call SaveInteger(H,StringHash("agi"),3,'A029')
    call SaveInteger(H,StringHash("agi"),4,'A02E')
    call SaveInteger(H,StringHash("agi"),5,'A02D')
    call SaveInteger(H,StringHash("agi"),6,'A02C')
    call SaveInteger(H,StringHash("agi"),7,'A02B')
    call SaveInteger(H,StringHash("agi"),8,'A02A')
    call SaveInteger(H,StringHash("agi"),9,'A028')
    call SaveInteger(H,StringHash("agi"),10,'A032')
    call SaveInteger(H,StringHash("int"),0,'A01Z')
    call SaveInteger(H,StringHash("int"),1,'A01Y')
    call SaveInteger(H,StringHash("int"),2,'A022')
    call SaveInteger(H,StringHash("int"),3,'A024')
    call SaveInteger(H,StringHash("int"),4,'A025')
    call SaveInteger(H,StringHash("int"),5,'A026')
    call SaveInteger(H,StringHash("int"),6,'A020')
    call SaveInteger(H,StringHash("int"),7,'A021')
    call SaveInteger(H,StringHash("int"),8,'A023')
    call SaveInteger(H,StringHash("int"),9,'A027')
    call SaveInteger(H,StringHash("int"),10,'A033')
    call SaveInteger(H,StringHash("movespeed"),0,'A02M')
    call SaveInteger(H,StringHash("movespeed"),1,'A02L')
    call SaveInteger(H,StringHash("movespeed"),2,'A02P')
    call SaveInteger(H,StringHash("movespeed"),3,'A02J')
    call SaveInteger(H,StringHash("movespeed"),4,'A02I')
    call SaveInteger(H,StringHash("movespeed"),5,'A02N')
    call SaveInteger(H,StringHash("movespeed"),6,'A02O')
    call SaveInteger(H,StringHash("movespeed"),7,'A02Q')
    call SaveInteger(H,StringHash("movespeed"),8,'A02R')
    call SaveInteger(H,StringHash("movespeed"),9,'A02K')
    
    
    
    call SaveInteger(H,StringHash("geartype"),0,1)//head
    call SaveInteger(H,StringHash("geartype"),1,2)//shoulder
    call SaveInteger(H,StringHash("geartype"),2,3)//chest
    call SaveInteger(H,StringHash("geartype"),3,4)//back
    call SaveInteger(H,StringHash("geartype"),4,5)//hand
    call SaveInteger(H,StringHash("geartype"),5,6)//pants
    call SaveInteger(H,StringHash("geartype"),6,7)//foot
    call SaveInteger(H,StringHash("geartype"),7,8)//ring
    set z = Location(0.00, 0.00)
    
    call SaveInteger(H,StringHash("bonustype"),0,StringHash("armor"))
    call SaveInteger(H,StringHash("bonustype"),1,StringHash("damage"))
    call SaveInteger(H,StringHash("bonustype"),2,StringHash("attackspeed"))
    call SaveInteger(H,StringHash("bonustype"),3,StringHash("hp"))
    call SaveInteger(H,StringHash("bonustype"),4,StringHash("mp"))
    call SaveInteger(H,StringHash("bonustype"),5,StringHash("str"))
    call SaveInteger(H,StringHash("bonustype"),6,StringHash("agi"))
    call SaveInteger(H,StringHash("bonustype"),7,StringHash("int"))
    call SaveInteger(H,StringHash("bonustype"),8,StringHash("movespeed"))
    
endfunction

private function init takes nothing  returns nothing
call bonusinit()
endfunction
endlibrary
































library mobskill needs sys,heroskill

//===========================================================================
// boss skill
//===========================================================================

/*
function muticast takes unit u,unit v,real y,integer x returns nothing
if y>1 then
if ia==2 then
if ib==1 then
call UnitAddAbility(ub, 'A04D' )
call IssueTargetOrderById(ub, 852095, GetEnumUnit())
set y=.8*y
call solo(u,GetEnumUnit(),y,2)
endif
endif
endif
endfunction

function muti takes unit u,unit v,integer r,real y,integer x,integer z returns nothing
if y>1 then
call GroupClear(ga[10])
call GroupEnumUnitsInRange(ga[10],GetUnitX(v),GetUnitY(v),r,Condition(function isenemy))
set ra=y
set ua=u
set ub=c
set ia=x
set ib=z
call ForGroup(ga[10],function muticast)
call GroupClear(ga[10])
endif
endfunction
*/

function bosskill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction


function elitekill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction


function rarekill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction






function mobkill takes nothing returns nothing
local timer t=GetExpiredTimer()
local unit v
local integer a=lh(t,"a")
local integer j=lh(t,"j")
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("caster"))

call DestroyTimer(t)
set ia=a
if j==1 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852095, v )
endif
if j==2 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852106, v )
endif
if j==3 then
call IssueImmediateOrderById(u, 852127 )
endif
if j==4 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852230, v )
endif
if j==5 then
call IssueImmediateOrderById(u, 852253 )
endif
if j==6 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852527,v)
endif
if j==7 then
set v=ran(u,0)
call IssueTargetOrderById( u, 852587, v )
endif

if j==8 then
set v=ran(u,0)
call IssuePointOrderById(u, 852592, GetUnitX(v), GetUnitY(v) )
endif

if j==9 then
set v=ran(u,0)
call IssuePointOrderById(u, 852218, GetUnitX(v), GetUnitY(v) )
endif

if j==10 then
call IssueImmediateOrderById(u, 852526 )
endif

if j==11 then
set v=ran(u,0)
call IssuePointOrderById(u, 852555, GetUnitX(v), GetUnitY(v) )
endif

if j==12 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852226, v )
endif

if j==13 then
set v=ran(u,1)
call IssueTargetOrderById(u, 852101, v )
endif

if j==14 then
set v=ran(u,0)
call IssueTargetOrderById(u, 852119, v )
endif

/*
if j==15 then
set ib=1
set v=ran(u,0)
call muti(u,v,600,y,2)
endif
*/
set t=null
set u=null
set v=null
endfunction

function mobbit takes unit u, unit v, integer a returns nothing
local integer m=GetUnitTypeId(u)
local integer j=li("unitskill",m)
local integer z=li("unitclass",m)
local integer l=GetUnitLevel(u)
local integer k
local timer t
local integer h

if z<3 then
if GetRandomInt(0,100)<20 then
if j<20 then
if GetUnitManaPercent(u)>=10 then
call SetUnitState(u,ConvertUnitState(2),GetUnitState(u,ConvertUnitState(2))-0.1*GetUnitState(u,ConvertUnitState(3)))
call UnitResetCooldown( u )
set t=CreateTimer()
set h=GetHandleId(t)
call sh(t,"a",a)
call sh(t,"j",j)
call SaveUnitHandle(H,h,StringHash("caster"),u)
if z==0 then
call TimerStart(t,0.01,false,function mobkill)
endif
if z==1 then
call TimerStart(t,0.01,false,function rarekill)
endif
if z==2 then
call TimerStart(t,0.01,false,function elitekill)
endif
endif
endif
endif
endif

if z==3 then
if GetRandomInt(0,100)<20 then
set k=li("boss0",m)
if k<20 then
call UnitResetCooldown(u)
set t=CreateTimer()
set h=GetHandleId(t)
call sh(t,"a",a)
call sh(t,"j",k)
call SaveUnitHandle(H,h,StringHash("caster"),u)
call TimerStart(t,0.01,false,function bosskill)
endif
endif
if GetRandomInt(0,100)<20 then
set k=li("boss1",m)
if k<20 then
call UnitResetCooldown( u )
set t=CreateTimer()
set h=GetHandleId(t)
call sh(t,"a",a)
call sh(t,"j",k)
call SaveUnitHandle(H,h,StringHash("caster"),u)
call TimerStart(t,0.01,false,function bosskill)
endif
endif
endif

/*
if GetUnitTypeId(GetAttacker()) == 'n001' then
    if GetRandomInt(1, 5) == 1 then
        call UnitAddAbility( GetAttacker(), 'Afrz' )
    else
        call UnitRemoveAbility( GetAttacker(), 'Afrz' )
    endif
endif
*/
set u=null
set v=null
set t=null
endfunction

function mobskill takes nothing returns nothing
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
local integer h=0

if GetSpellAbilityId() == 'A402' then
set h=GetHandleId(mob[a+20].u)
call FlushChildHashtable(H,h)
call RemoveUnit(mob[a+20].u)
set h=he[a].petnum
set he[a].petnum=h-1
set h=he[a].petnow
call si("pet"+I2S(h),a,0)
set mob[a+20].b=false
set he[a].peton=false
call DisplayTextToPlayer(Player(a),.5,0,text[88])
endif

if GetSpellAbilityId() == 'A403' then
if GetUnitManaPercent(mob[a+20].u) >= 50.00 then
call SetUnitLifePercentBJ( mob[a+20].u, 100 )
call SetUnitManaPercentBJ( mob[a+20].u, ( GetUnitManaPercent(mob[a+20].u) - 50.00 ) )
else
call DisplayTextToPlayer(Player(a),.5,0,text[89])
endif
endif

endfunction

function hurt takes nothing returns nothing
local unit u=GetEventDamageSource()
local unit v=GetTriggerUnit()
    local real i=GetUnitFacing(u)
    local real j=GetUnitFacing(v)
    local integer a=GetPlayerId(GetOwningPlayer(u))
    local integer b=GetPlayerId(GetOwningPlayer(v))
    local integer h=GetHandleId(u)
    local real y=GetEventDamage()
    local unit w
    if y>1 then
    if ph then
    if a<20 then
    if IsUnitType(u, ConvertUnitType(0))then
    if GetRandomReal(0,1)<he[a].crit then
    set ph=false
    call UnitDamageTarget(u,v,y,true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    call floattext(R2I(y),mob[a].u,0)
    endif

    if mob[a].class>20 then
    if mob[a].class==22 then
    if li("command",a)>0 then
    call command(u,v,a)
    endif
    endif
    if mob[a].class==23 then
    call windfury(u,v,a)
    endif
    endif
    else
    call mobbit(u,v,a)
    endif
    endif
    if a==24 then
    call mobbit(u,v,a)
    if b<20 then
    if i>=j then 
    set i=i-j
    else 
    set i=j-i
    endif
    if i<90 then
    if GetRandomInt(1,10)<=3 then
    if he[b].ride then
    call UnitRemoveAbility(mob[b].u,'B000')
    set he[b].ride=false
    endif
    endif
set w=CreateUnit(Player(24),'e000',GetUnitX(u),GetUnitY(u),0)
call UnitApplyTimedLife(w, 'BHwe', 1.00 )
call ShowUnit(w, false)
call UnitAddAbility(w, 'A04B' )
call IssueTargetOrderById( w, 852075, v )
    endif
    endif
    endif
    else
    set ph=true
    endif
    endif
set u=null
set v=null
set w=null
endfunction


endlibrary


library heroskill needs sys

function homex takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer a=lh(t,"home")
call DestroyEffect(he[a].home)
call FlushChildHashtable(H,GetHandleId(t))
call DestroyTimer(t)
set t=null
endfunction

function caststart takes nothing returns nothing
local timer t
local integer a=GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
if GetSpellAbilityId() == 'A052' then
set t=CreateTimer()
call sh(t,"home",a)
    call DestroyEffect(he[a].home)
    set he[a].home=AddSpecialEffectTarget( "war3mapImported\\jn_huicheng.mdx",GetTriggerUnit(),"origin" )
    call TimerStart(t,5,false,function homex)
endif
set t=null
endfunction


function command takes unit u,unit v,integer a returns nothing
local integer j=li("command",a)
local integer i=GetUnitAbilityLevel(u,'A201')
local integer m=GetUnitAbilityLevel(u,'A202')
local real r=0
if j==1 then
if i>0 then
set r=i*10+mob[a].spell*.7
call mob[a].dama(v,r,4)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Undead\\AbsorbMana\\AbsorbManaBirthMissile.mdl", v, "overhead") )
endif
endif
if j==2 then
if m>0 then
if GetRandomInt(0,100)<40 then
set r=m*.1+.7
set r=r*mob[a].damage+20*m
call mob[a].dama(v,r,2)
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Other\\AcidBomb\\BottleMissile.mdl", v, "overhead") )
endif
endif
endif
endfunction

function windfury takes unit u,unit v,integer a returns nothing
local integer i=GetUnitAbilityLevel(u,'A300')
local integer y=0
local real r=0
if i>0 then
if GetRandomInt(0,100)<20 then
set r=mob[a].damage+50*i
loop
exitwhen y>1
if r>1 then
call mob[a].dama(v,r,1)
endif
if GetRandomInt(0,100)<20 then
call windfury(u,v,a)
endif
set y=y+1
endloop
call DestroyEffect( AddSpecialEffectTarget("Abilities\\Spells\\Human\\ManaFlare\\ManaFlareBoltImpact.mdl", v, "origin") )
endif
endif
endfunction

endlibrary


library warrior requires sys


function retaliation takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("retaliation"))
call DestroyEffect( LoadEffectHandle(H,h,StringHash("retaeffect")))
call UnitRemoveAbility(mob[a].u,'A045')
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function wall takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("wall0"))
local integer k=LoadInteger(H,h,StringHash("wall1"))
set he[a].armorx=he[a].armorx-k
call DestroyEffect(LoadEffectHandle(H,h,StringHash("walleffect")))
call he[a].bonus()
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function rage takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("rage0"))
local integer k=LoadInteger(H,h,StringHash("rage1"))
call DestroyEffect(LoadEffectHandle(H,h,StringHash("rageeffect")))
set he[a].damagex=he[a].damagex-k
call he[a].bonus()
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function avatar takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("avatar"))
local integer b=LoadInteger(H,h,StringHash("amount"))
call DestroyEffect( LoadEffectHandle(H,h,StringHash("avatareffect")))
set he[a].hpx=he[a].hpx-b
call he[a].bonus()
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function charge takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("chargeu"))
local unit v=LoadUnitHandle(H,h,StringHash("chargev"))
local integer a=LoadInteger(H,h,StringHash("chargea"))
if IsUnitInRange(u, v, 100.00) then
call DestroyTimer(t)
call PauseUnit( v, false )
call FlushChildHashtable(H,h)
call PanCameraToTimedForPlayer(Player(a),GetUnitX(u),GetUnitY(u),0)
else
call SetUnitPosition(u, GetUnitX(u)+CosBJ(GetUnitFacing(u))*30,  GetUnitY(u)+SinBJ(GetUnitFacing(u))*30 )
endif
set t=null
set u=null
set v=null
endfunction


function wind takes nothing returns nothing
call mob[ia].dama(GetEnumUnit(),ra,1)
endfunction

function warrior takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer k=0
local real r=0
local integer h=0
local timer t


if GetSpellAbilityId() == 'A100' then
set r=20*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId()=='A103' then
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("chargeu"),u)
call SaveUnitHandle(H,h,StringHash("chargev"),v)
call SaveInteger(H,h,StringHash("chargea"),a)
call PauseUnit( v, true )
call dummy(a,v)
call UnitAddAbility(ub, 'A110' )
call SetUnitAbilityLevel(ub,'A110',i)
call IssueTargetOrderById(ub, 852252, v )
call TimerStart(t,.01,true,function charge)
set r=10*i
call mob[a].dama(v,r,1)
endif


if GetSpellAbilityId()=='A041' then
set t=CreateTimer()
set h=GetHandleId(t)
set k=30+i*20
set he[a].damagex=he[a].damagex+k
call SaveInteger(H,h,StringHash("rage0"),a)
call SaveInteger(H,h,StringHash("rage1"),k)
call SaveEffectHandle(H,h,StringHash("rageeffect"),AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl", u, "origin"))
call he[a].bonus()
call TimerStart(t,15,false,function rage)
endif

if GetSpellAbilityId()=='A046' then
set t=CreateTimer()
set h=GetHandleId(t)
set k=i*500
set he[a].hpx=he[a].hpx+k
call SaveInteger(H,h,StringHash("avatar"),a)
call SaveInteger(H,h,StringHash("amount"),k)
call SaveEffectHandle(H,h,StringHash("avatareffect"),AddSpecialEffectTarget("Abilities\\Spells\\Other\\Doom\\DoomTarget.mdl", u, "origin"))
call he[a].bonus()
call TimerStart(t,20,false,function avatar)
endif

if GetSpellAbilityId()=='A047' then
call IssueTargetOrderById(v, 851983, u )
endif

if GetSpellAbilityId()=='A048' then
set he[a].damagex=he[a].damagex-LoadInteger(H,StringHash("aggress"),a)
call SaveInteger(H,StringHash("aggress"),a,0)
if LoadInteger(H,StringHash("defense"),a)==0 then
set k=2*i
set he[a].armorx=he[a].armorx+k
call SaveInteger(H,StringHash("defense"),a,k)
call DisplayTextToPlayer(Player(a),.5,0,text[90])
else
set he[a].armorx=he[a].armorx-LoadInteger(H,StringHash("defense"),a)
call SaveInteger(H,StringHash("defense"),a,0)
call DisplayTextToPlayer(Player(a),.5,0,text[91])
endif
call he[a].bonus()
endif

if GetSpellAbilityId()=='A049' then
set he[a].armorx=he[a].armorx-LoadInteger(H,StringHash("defense"),a)
call SaveInteger(H,StringHash("defense"),a,0)
if LoadInteger(H,StringHash("aggress"),a)==0 then
set k=5*i
set he[a].damagex=he[a].damagex+k
call SaveInteger(H,StringHash("aggress"),a,k)
call he[a].bonus()
call DisplayTextToPlayer(Player(a),.5,0,text[92])
else
set he[a].damagex=he[a].damagex-LoadInteger(H,StringHash("aggress"),a)
call SaveInteger(H,StringHash("aggress"),a,0)
call he[a].bonus()
call DisplayTextToPlayer(Player(a),.5,0,text[93])
endif
endif


if GetSpellAbilityId()=='A040' then
set t=CreateTimer()
set h=GetHandleId(t)
set k=20+5*i
set he[a].armorx=k+he[a].armorx
call SaveInteger(H,h,StringHash("wall0"),a)
call SaveInteger(H,h,StringHash("wall1"),k)
call SaveEffectHandle(H,h,StringHash("walleffect"),AddSpecialEffectTarget("Abilities\\Spells\\Orc\\Voodoo\\VoodooAura.mdl", u, "origin"))
call he[a].bonus()
call TimerStart(t,10,false,function wall)
endif



if GetSpellAbilityId()=='A043' then
set t=CreateTimer()
set h=GetHandleId(t)
call UnitAddAbility(u,'A045')
call SaveInteger(H,h,StringHash("retaliation"),a)
set k=8+2*i
call SaveEffectHandle(H,h,StringHash("retaeffect"),AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\ThornsAura\\ThornsAura.mdl", u, "origin"))
call TimerStart(t,k,false,function retaliation)
endif


if GetSpellAbilityId()=='A101' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),200,Condition(function isenemy))
set r=i*20+mob[a].damage
set ra=r
set ua=u
call ForGroup(bj_lastCreatedGroup,function wind)
call GroupClear(bj_lastCreatedGroup)
endif

if GetSpellAbilityId()=='A102' then
if GetUnitStatePercent(v,ConvertUnitState(0),ConvertUnitState(1))<30 then
set r=i*50+mob[a].damage
call mob[a].dama(v,r,1)
endif
endif

if GetSpellAbilityId()=='A104' then
set r=i*50+mob[a].damage
call mob[a].dama(v,r,1)
endif

set u=null
set v=null
set t=null
endfunction



endlibrary



library paladin requires sys

function paladin takes nothing returns nothing
local integer a=GetPlayerId(GetTriggerPlayer())
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local real y=0

if GetSpellAbilityId()=='A200' then
set y=i*200+mob[a].spell*2
call mob[a].dama(v,y,5)
endif

if GetSpellAbilityId()=='A04W' then
set y=i*100+mob[a].spell
if IsUnitEnemy(v, Player(a)) then
call mob[a].dama(v,y,4)
else
set y=i*100+mob[a].spell*2
call mob[a].dama(v,y,5)
endif
endif

if GetSpellAbilityId()=='A203' then
if li("command",a)==1 then
set y=i*40+mob[a].spell
call mob[a].dama(v,y,4)
endif
if li("command",a)==2 then
set y=i*40+mob[a].damage
call mob[a].dama(v,y,2)
endif
endif

if GetSpellAbilityId()=='A201' then
call si("command",a,1)
call DisplayTextToPlayer(Player(a),.5,0,text[94])
endif
if GetSpellAbilityId()=='A202' then
call si("command",a,2)
call DisplayTextToPlayer(Player(a),.5,0,text[95])
endif
set u=null
set v=null

endfunction


endlibrary


library shaman  needs sys

function healchain takes nothing returns nothing
call mob[ia].dama(GetEnumUnit(),ra,5)
endfunction

function shaman takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer k=0
local real r=0

if GetSpellAbilityId()=='A05V' then
if GetPlayerState(Player(a), PLAYER_STATE_RESOURCE_GOLD) >=50*GetHeroLevel(mob[a].u) then
call ReviveHero(mob[a].u,mob[a].x,mob[a].y,true )
set k=GetHandleId(he[a].revive)
call DestroyTimer(he[a].revive)
call DestroyTimerDialog(he[a].td)
call FlushChildHashtable(H,k)
set mob[a].b=true
call SetUnitLifePercentBJ(mob[a].u, 30.00 )
call SetUnitManaPercentBJ(mob[a].u, 30.00 )
call RemoveUnit(u)
    call DisplayTextToPlayer(Player(a),.5,0,text[96])
    call SetPlayerState(Player(a), ConvertPlayerState(1), GetPlayerState(Player(a),ConvertPlayerState(1))-100*GetHeroLevel(mob[a].u))
    call SaveInteger(H,StringHash("gold"),a,LoadInteger(H,StringHash("gold"),a)-100*GetHeroLevel(mob[a].u))
    else
    call DisplayTextToPlayer(Player(a),.5,0,text[23]+I2S(100*GetHeroLevel(mob[a].u))+text[97])
endif
endif


if GetSpellAbilityId()=='A042' then
if GetUnitTypeId(v)=='n02V' then
call ReviveHero(mob[b].u,GetUnitX(u), GetUnitY(u), true )
set mob[b].b=true
set k=GetHandleId(he[a].revive)
call DestroyTimer(he[a].revive)
call DestroyTimerDialog(he[a].td)
call FlushChildHashtable(H,k)
call SetUnitLifePercentBJ(mob[b].u, 30.00 )
call SetUnitManaPercentBJ(mob[b].u, 30.00 )
call RemoveUnit(v)
else
    call DisplayTextToPlayer(Player(a),.5,0,text[98])
endif
endif


if GetSpellAbilityId() == 'A04K' then
set r=40*i+mob[a].spell
call mob[a].dama(v,r,3)
endif

if GetSpellAbilityId()=='A301' then
set r=i*160+mob[a].spell*2
call mob[a].dama(v,r,5)
endif

if GetSpellAbilityId()=='A302' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(v),GetUnitY(v),600,Condition(function isally))
set r=2*mob[a].spell+500*i
set ra=r
set ua=u
call ForGroup(bj_lastCreatedGroup,function healchain)
call GroupClear(bj_lastCreatedGroup)
endif

set u=null
set v=null
endfunction


endlibrary



library hunter needs sys



function viper takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer x=GetHandleId(t)
local unit v=LoadUnitHandle(H,x,StringHash("viperv"))
local unit u=LoadUnitHandle(H,x,StringHash("viperu"))
local integer a=LoadInteger(H,x,StringHash("vipera"))
local integer h=GetHandleId(v)
local integer y=LoadInteger(H,h,StringHash("viperx"))
local integer z=LoadInteger(H,h,StringHash("vipery"))
local real r=LoadReal(H,h,StringHash("vipers"))
if y==z or IsUnitType(v, UNIT_TYPE_DEAD) == true or GetUnitAbilityLevel(v, 'B003') == 0 then
call FlushChildHashtable(H,x)
call DestroyTimer(t)
else
call mob[a].dama(v,r,3)
call SaveInteger(H,h,StringHash("viperx"),y+1)
endif
set t=null
set u=null
set v=null
endfunction

function hunter takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer c=GetUnitTypeId(v)
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer k=0
local real r=0
local integer h=0
local timer t

if GetSpellAbilityId() == 'A404' then
set r=20*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A405' then
set r=300*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A406' then
set r=50*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A407' then
set r=40*i+mob[a].spell
call mob[a].dama(v,r,3)
endif

if GetSpellAbilityId() == 'A05S' then
if GetUnitAbilityLevel(v, 'B003') > 0 then
set h=GetHandleId(v)
set t=LoadTimerHandle(H,h,StringHash("vipert"))
set h=GetHandleId(t)
call FlushChildHashtable(H,h)
call DestroyTimer(t)
endif
set r=20*i+mob[a].spell*.3
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("viperv"),v)
call SaveUnitHandle(H,h,StringHash("viperu"),u)
call SaveInteger(H,h,StringHash("vipera"),a)
set h=GetHandleId(v)
call sx("vipery",h,5)
call sx("viperx",h,0)
call sy("vipers",h,r)
call TimerStart(t,3,true,function viper)
endif

if GetSpellAbilityId() == 'A401' then
set k=he[a].petnow
set k=li("unitid",petid[20*k+a])
if he[a].peton then
if mob[a+20].b==false then
call DisplayTextToPlayer(Player(a),.5,0,text[99])
set mob[a+20].u=CreateUnit(Player(a),k,GetUnitX(u),GetUnitY(u),0)
call mob[a+20].born(mob[a+20].u)
call SetUnitLifePercentBJ(mob[a+20].u, 30.00 )
call SetUnitManaPercentBJ(mob[a+20].u, 50.00 )
call TriggerRegisterUnitEvent(damageinit, mob[a+20].u, EVENT_UNIT_DAMAGED )
call TriggerRegisterUnitEvent(mobcast,mob[a+20].u,EVENT_UNIT_SPELL_EFFECT)
call TriggerRegisterUnitEvent(petrez, mob[a+20].u, EVENT_UNIT_DEATH )
set mob[a+20].b=true
call UnitAddAbility(mob[a+20].u,'A402')
call UnitAddAbility(mob[a+20].u,'A403')
call UnitAddAbility(mob[a+20].u,'Aeth')
call BlzSetUnitArmor(mob[a+20].u,0)

if IsUnitType(mob[a+20].u, UNIT_TYPE_ANCIENT) == true then
call UnitRemoveType(mob[a+20].u, UNIT_TYPE_ANCIENT )
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[100])
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[101])
endif
endif

if GetSpellAbilityId() == 'A400' then
if GetPlayerController(Player(b)) == MAP_CONTROL_USER then
call DisplayTextToPlayer(Player(a),.5,0,text[102])
else
if he[a].peton==false then
set h=he[a].petnum
if h<3 then
set k=li("unitclass",c)
if GetRandomInt(1,1000000)<li("petrate",k) then
call DisplayTextToPlayer(Player(a),.5,0,text[103])
set k=GetHandleId(v)
set k=LoadInteger(H,k,StringHash("index"))
set mob[k].b=false
set ia=1
call SetUnitOwner(v, Player(a), true )
call sh(v,"index",20+a)
call TriggerRegisterUnitEvent(petrez, v, EVENT_UNIT_DEATH )
set mob[a+20].b=true
set he[a].peton=true
call UnitAddAbility(v,'Aeth')
call UnitAddAbility(v,'A402')
call UnitAddAbility(v,'A403')
call BlzSetUnitArmor(v,0)
set mob[a+20].u=v
    if IsUnitType(mob[a+20].u, UNIT_TYPE_ANCIENT) == true then
    call UnitRemoveType(mob[a+20].u, UNIT_TYPE_ANCIENT )
    endif
set k=li("unitorder",c)
set he[a].petnum=h+1
set h=he[a].petnow
set petid[20*h+a]=k
else
call DisplayTextToPlayer(Player(a),.5,0,text[104])
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[105])
endif
else
call DisplayTextToPlayer(Player(a),.5,0,text[106])
endif
endif
endif

set u=null
set v=null
set t=null
endfunction
endlibrary

library druid

function druid takes nothing returns nothing
endfunction
endlibrary


library rogue needs sys

function evasion takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local integer a=LoadInteger(H,h,StringHash("evasion0"))
local real r=LoadReal(H,h,StringHash("evasion1"))
call DestroyEffect( LoadEffectHandle(H,h,StringHash("evasioneffect")))
call FlushChildHashtable(H,h)
call DestroyTimer(t)
set t=null
endfunction

function rogue takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local real r=0
local integer h=0
local timer t

if GetSpellAbilityId() == 'A03J' then
set r=20*i+mob[a].damage
call mob[a].dama(v,r,1)
endif

if GetSpellAbilityId() == 'A03M' then
set r=50*i+mob[a].damage
call mob[a].dama(v,r,1)
endif 

if GetSpellAbilityId()=='A04J' then
set t=CreateTimer()
set h=GetHandleId(t)
set r=0.2+0.05*i
call SaveInteger(H,h,StringHash("evasion0"),a)
call SaveReal(H,h,StringHash("evasion1"),r)
call SaveEffectHandle(H,h,StringHash("evasioneffect"),AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Immolation\\ImmolationTarget.mdl", u, "origin"))
call TimerStart(t,15,false,function evasion)
endif


set u=null
set v=null
set t=null
endfunction
endlibrary


library warlock
function warlock takes nothing returns nothing
endfunction
endlibrary


library priest needs sys

function renew takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer x=GetHandleId(t)
local unit v=LoadUnitHandle(H,x,StringHash("renewv"))
local unit u=LoadUnitHandle(H,x,StringHash("renewu"))
local integer h=GetHandleId(v)
local integer y=LoadInteger(H,h,StringHash("renewx"))
local integer z=LoadInteger(H,h,StringHash("renewy"))
local integer a=LoadInteger(H,h,StringHash("renewa"))
local real r=LoadReal(H,h,StringHash("renews"))
call mob[a].dama(v,r,5)
call SaveInteger(H,h,StringHash("renewx"),y+1)
if y==z or IsUnitType(v, UNIT_TYPE_DEAD) == true or GetUnitAbilityLevel(v, 'B002') == 0 then
call FlushChildHashtable(H,x)
call DestroyTimer(t)
endif
set t=null
set u=null
set v=null
endfunction

function pain takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer x=GetHandleId(t)
local unit v=LoadUnitHandle(H,x,StringHash("painv"))
local unit u=LoadUnitHandle(H,x,StringHash("painu"))
local integer a=LoadInteger(H,x,StringHash("paina"))
local integer h=GetHandleId(v)
local integer y=LoadInteger(H,h,StringHash("painx"))
local integer z=LoadInteger(H,h,StringHash("painy"))
local real r=LoadReal(H,h,StringHash("pains"))
call mob[a].dama(v,r,3)
call SaveInteger(H,h,StringHash("painx"),y+1)
if y==z or IsUnitType(v, UNIT_TYPE_DEAD) == true or GetUnitAbilityLevel(v, 'B004') == 0 then
call FlushChildHashtable(H,x)
call DestroyTimer(t)
endif
set t=null
set u=null
set v=null
endfunction

function priest takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer b=GetPlayerId(GetOwningPlayer(v))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local integer h=0
local real r=0
local timer t

if GetSpellAbilityId()=='A04A' then
set r=i*180+mob[a].spell*2
call mob[a].dama(v,r,5)
endif

if GetSpellAbilityId()=='A05R' then
set r=i*30+mob[a].spell
call mob[a].dama(v,r,4)
endif

if GetSpellAbilityId() == 'A05Y' then
if GetUnitAbilityLevel(v, 'B002') > 0 then
set h=GetHandleId(v)
set t=LoadTimerHandle(H,h,StringHash("renewt"))
set h=GetHandleId(t)
call FlushChildHashtable(H,h)
call DestroyTimer(t)
endif
set r=60*i+mob[a].spell*.4
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("renewv"),v)
call SaveUnitHandle(H,h,StringHash("renewu"),u)
set h=GetHandleId(v)
call sx("renewy",h,5)
call sx("renewx",h,0)
call sy("renews",h,r)
call TimerStart(t,3,true,function renew)
endif

if GetSpellAbilityId() == 'A062' then
if GetUnitAbilityLevel(v, 'B004') > 0 then
set h=GetHandleId(v)
set t=LoadTimerHandle(H,h,StringHash("paint"))
set h=GetHandleId(t)
call FlushChildHashtable(H,h)
call DestroyTimer(t)
endif
set r=25*i+mob[a].spell*.4
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("painv"),v)
call SaveUnitHandle(H,h,StringHash("painu"),u)
set h=GetHandleId(v)
call sx("painy",h,6)
call sx("painx",h,0)
call sy("pains",h,r)
call TimerStart(t,3,true,function pain)
endif


endfunction
endlibrary


library mage  needs sys

function frost takes nothing returns nothing
set ub=CreateUnit(Player(ia),'e000',GetUnitX(ua),GetUnitY(ua),0)
call UnitApplyTimedLife(ub, 'BHwe', 1.00 )
call ShowUnit(ub, false)
call UnitAddAbility(ub, 'A065' )
call SetUnitAbilityLevel(ub,'A065',ib)
call IssueTargetOrderById( ub, 852075, GetEnumUnit())
call mob[ia].dama(GetEnumUnit(),ra,3)
endfunction

function blink takes nothing returns nothing
local timer t=GetExpiredTimer()
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(H,h,StringHash("blinku"))
local integer x=LoadInteger(H,h,StringHash("blinkx"))
local integer y=LoadInteger(H,h,StringHash("blinky"))
local integer a=LoadInteger(H,h,StringHash("blinka"))
if x==y  then
call FlushChildHashtable(H,h)
call DestroyTimer(t)
call PanCameraToTimedForPlayer(Player(a),GetUnitX(u),GetUnitY(u),0)
else
call SetUnitPosition(u, GetUnitX(u)+CosBJ(GetUnitFacing(u))*30,  GetUnitY(u)+SinBJ(GetUnitFacing(u))*30 )
call SaveInteger(H,h,StringHash("blinkx"),x+1)
endif
set t=null
set u=null
endfunction


function nova takes nothing returns nothing
set ub=CreateUnit(Player(ia),'e000',GetUnitX(ua),GetUnitY(ua),0)
call UnitApplyTimedLife(ub, 'BHwe', 1.00 )
call ShowUnit(ub, false)
call UnitAddAbility(ub, 'A04Y' )
call SetUnitAbilityLevel(ub,'A04Y',ib)
call IssueTargetOrderById( ub, 852106, GetEnumUnit())
call mob[ia].dama(GetEnumUnit(),ra,3)
endfunction

function mage takes nothing returns nothing
local unit u=GetTriggerUnit()
local unit v=GetSpellTargetUnit()
local integer a=GetPlayerId(GetOwningPlayer(u))
local integer i=GetUnitAbilityLevel(u,GetSpellAbilityId())
local real r=0
local timer t
local integer h

if GetSpellAbilityId() == 'A067' then
call dummy(a,u)
call UnitAddAbility(ub, 'A04X' )
call IssueTargetOrderById(ub, 852075, v )
set r=30*i+mob[a].spell
call mob[a].dama(v,r,3)
endif

if GetSpellAbilityId() == 'A063' then
set t=CreateTimer()
set h=GetHandleId(t)
call SaveUnitHandle(H,h,StringHash("blinku"),u)
call SaveInteger(H,h,StringHash("blinky"),10+i)
call SaveInteger(H,h,StringHash("blinka"),a)
call SaveInteger(H,h,StringHash("blinkx"),0)
call TimerStart(t,.01,true,function blink)
endif

if GetSpellAbilityId()=='A064' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(v),GetUnitY(v),400,Condition(function isenemy))
set r=i*30+mob[a].spell
set ra=r
set ua=u
set ib=i
call ForGroup(bj_lastCreatedGroup,function frost)
call GroupClear(bj_lastCreatedGroup)
endif

if GetSpellAbilityId()=='A03V' then
set ia=a
call GroupClear(bj_lastCreatedGroup)
call GroupEnumUnitsInRange(bj_lastCreatedGroup,GetUnitX(u),GetUnitY(u),600,Condition(function isenemy))
set r=i*10+mob[a].spell
set ra=r
set ua=u
set ib=i
call ForGroup(bj_lastCreatedGroup,function nova)
call GroupClear(bj_lastCreatedGroup)
endif

if GetSpellAbilityId() == 'A04Q' then
set r=50*i+mob[a].spell
call mob[a].dama(v,r,3)
endif
set t=null
set u=null
set v=null
endfunction
endlibrary




































//===========================================================================
// API
//===========================================================================
/*
BLZAPI
native BlzGetTriggerPlayerMouseX takes nothing returns real
native BlzGetTriggerPlayerMouseY takes nothing returns real
native BlzGetTriggerPlayerMousePosition takes nothing returns location
native BlzGetTriggerPlayerMouseButton takes nothing returns mousebuttontype
native BlzSetAbilityTooltip takes integer abilCode, string tooltip, integer level returns nothing
native BlzSetAbilityActivatedTooltip takes integer abilCode, string tooltip, integer level returns nothing
native BlzSetAbilityExtendedTooltip takes integer abilCode, string ExtendedTooltip, integer level returns nothing
native BlzSetAbilityActivatedExtendedTooltip takes integer abilCode, string ExtendedTooltip, integer level returns nothing
native BlzSetAbilityResearchTooltip takes integer abilCode, string researchTooltip, integer level returns nothing
native BlzSetAbilityResearchExtendedTooltip takes integer abilCode, string researchExtendedTooltip, integer level returns nothing
native BlzGetAbilityTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityActivatedTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityExtendedTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityActivatedExtendedTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityResearchTooltip takes integer abilCode, integer level returns string
native BlzGetAbilityResearchExtendedTooltip takes integer abilCode, integer level returns string
native BlzSetAbilityIcon takes integer abilCode, string iconPath returns nothing
native BlzGetAbilityIcon takes integer abilCode returns string
native BlzSetAbilityActivatedIcon takes integer abilCode, string iconPath returns nothing
native BlzGetAbilityActivatedIcon takes integer abilCode returns string
native BlzGetAbilityPosX takes integer abilCode returns integer
native BlzGetAbilityPosY takes integer abilCode returns integer
native BlzSetAbilityPosX takes integer abilCode, integer x returns nothing
native BlzSetAbilityPosY takes integer abilCode, integer y returns nothing
native BlzGetAbilityActivatedPosX takes integer abilCode returns integer
native BlzGetAbilityActivatedPosY takes integer abilCode returns integer
native BlzSetAbilityActivatedPosX takes integer abilCode, integer x returns nothing
native BlzSetAbilityActivatedPosY takes integer abilCode, integer y returns nothing
native BlzGetUnitMaxHP takes unit whichUnit returns integer
native BlzSetUnitMaxHP takes unit whichUnit, integer hp returns nothing
native BlzGetUnitMaxMana takes unit whichUnit returns integer
native BlzSetUnitMaxMana takes unit whichUnit, integer mana returns nothing
native BlzDeleteHeroAbility takes unit whichUnit, integer abilCode returns nothing
native BlzSetItemName takes item whichItem, string name returns nothing
native BlzSetItemDescription takes item whichItem, string name returns nothing
native BlzGetItemDescription takes item whichItem returns string
native BlzSetItemTooltip takes item whichItem, string name returns nothing
native BlzGetItemTooltip takes item whichItem returns string
native BlzSetItemExtendedTooltip takes item whichItem, string name returns nothing
native BlzGetItemExtendedTooltip takes item whichItem returns string
native BlzSetItemIconPath takes item whichItem, string name returns nothing
native BlzGetItemIconPath takes item whichItem returns string
native BlzSetUnitName takes unit whichUnit, string name returns nothing
native BlzSetHeroProperName takes unit whichUnit, string name returns nothing
native BlzGetUnitBaseDamage takes unit whichUnit, integer weaponIndex returns integer
native BlzSetUnitBaseDamage takes unit whichUnit, integer baseDamage, integer weaponIndex returns nothing
native BlzGetUnitDiceNumber takes unit whichUnit, integer weaponIndex returns integer
native BlzSetUnitDiceNumber takes unit whichUnit, integer diceNumber, integer weaponIndex returns nothing
native BlzGetUnitDiceSides takes unit whichUnit, integer weaponIndex returns integer
native BlzSetUnitDiceSides takes unit whichUnit, integer diceSides, integer weaponIndex returns nothing
native BlzGetUnitAttackCooldown takes unit whichUnit, integer weaponIndex returns real
native BlzSetUnitAttackCooldown takes unit whichUnit, real cooldown, integer weaponIndex returns nothing
native BlzSetSpecialEffectColorByPlayer takes effect whichEffect, player whichPlayer returns nothing
native BlzSetSpecialEffectColor takes effect whichEffect, integer r, integer g, integer b returns nothing
native BlzSetSpecialEffectAlpha takes effect whichEffect, integer alpha returns nothing
native BlzSetSpecialEffectScale takes effect whichEffect, real scale returns nothing
native BlzSetSpecialEffectPosition takes effect whichEffect, real x, real y, real z returns nothing
native BlzSetSpecialEffectHeight takes effect whichEffect, real height returns nothing
native BlzSetSpecialEffectTimeScale takes effect whichEffect, real timeScale returns nothing
native BlzSetSpecialEffectTime takes effect whichEffect, real time returns nothing
native BlzSetSpecialEffectOrientation takes effect whichEffect, real yaw, real pitch, real roll returns nothing
native BlzSetSpecialEffectYaw takes effect whichEffect, real yaw returns nothing
native BlzSetSpecialEffectPitch takes effect whichEffect, real pitch returns nothing
native BlzSetSpecialEffectRoll takes effect whichEffect, real roll returns nothing
native BlzSetSpecialEffectX takes effect whichEffect, real x returns nothing
native BlzSetSpecialEffectY takes effect whichEffect, real y returns nothing
native BlzSetSpecialEffectZ takes effect whichEffect, real z returns nothing
native BlzSetSpecialEffectPositionLoc takes effect whichEffect, location loc returns nothing
native BlzGetLocalSpecialEffectX takes effect whichEffect returns real
native BlzGetLocalSpecialEffectY takes effect whichEffect returns real
native BlzGetLocalSpecialEffectZ takes effect whichEffect returns real
native BlzGetUnitArmor takes unit whichUnit returns real
native BlzSetUnitArmor takes unit whichUnit, real armorAmount returns nothing
native BlzUnitHideAbility takes unit whichUnit, integer abilId, boolean flag returns nothing
native BlzUnitDisableAbility takes unit whichUnit, integer abilId, boolean flag, boolean hideUI returns nothing
native BlzUnitCancelTimedLife takes unit whichUnit returns nothing
native BlzIsUnitSelectable takes unit whichUnit returns boolean
native BlzIsUnitInvulnerable takes unit whichUnit returns boolean
native BlzUnitInterruptAttack takes unit whichUnit returns nothing
native BlzGetUnitCollisionSize takes unit whichUnit returns real
native BlzGetAbilityManaCost takes integer abilId, integer level returns integer
native BlzGetAbilityCooldown takes integer abilId, integer level returns real
native BlzSetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level, real cooldown returns nothing
native BlzGetUnitAbilityCooldown takes unit whichUnit, integer abilId, integer level returns real
native BlzGetUnitAbilityCooldownRemaining takes unit whichUnit, integer abilId returns real
native BlzEndUnitAbilityCooldown takes unit whichUnit, integer abilCode returns nothing
native BlzGetUnitAbilityManaCost takes unit whichUnit, integer abilId, integer level returns integer
native BlzGetLocalUnitZ takes unit whichUnit returns real
native BlzDecPlayerTechResearched takes player whichPlayer, integer techid, integer levels returns nothing
native BlzSetEventDamage takes real damage returns nothing
*/
//===========================================================================
// miscdata
//===========================================================================




