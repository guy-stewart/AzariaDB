
# Kamioza DFA Virtual Machine Opcode Manual

## Sections

* [Sleep](#sleep)
* [Audio](#audio)

## Opcodes

# Input
## System events:

|opcode |parameters     |description|
|-------|---------------|-----------|
|WAIT|sig_name|Wait for a [signal](#signal) from another machine.|

## User events:
|opcode |parameters     |description|
|-------|---------------|-----------|
|DROP|[SWAP \| IDD]|  -> wObject
|GRAB|[IDD]|wObject ->
|CLICK|
|DRAG||object_def stored in wObject
|DRAGFOCUS    

Notes:
* SWAP :DROP can take SWAP as a parameter
* GRAB object_def retrieved from wObject OR from transition wParm if specified.

# Epsilon
   Z_EPSILON        = 0,    // Just do it.

# Audio
PLAYWAVE - sound id is stored in transition::wAmbient  
STOPWAVE  
PLAYMIDI  
STOPMIDI  

# Sleep

|opcode |parameters     |description|
|-------|---------------|-----------|
|ESTIME|imm|Sleep time in seconds|
|EMTIME|imm|Sleep time in milliseconds|

Notes:
*   the time remaining is stored in the machine::dEtime.

# Mapping

|opcode |parameters     |description|
|-------|---------------|-----------|
|MAP_OBJ||MAP_OBJ map_operation_id|
|MIX|wObject = MAP_OBJ(r1, r2) r1 = operator, r2 = operand.|
|XIM||

wObject = map_operation(wObject)  
if the object cannot be mapped then the transition occurs w/o mapping the object.  

# Relocate

|opcode |parameters     |description|
|-------|---------------|-----------|
|SET_YOFFSET||
|SET_XOFFSET||

## Graphics
 - sprites and video

|opcode |parameters     |description|
|-------|---------------|-----------|
|SHOW|register, cursor/icon/actor| Show as sprite of the stored object.|
|ASHOW||Just like show, but play looped animate|
|ANIMATE|LOOP|
|VIDEO||Show a video clip. Remove the image after the last frame.|

# Arithmetic operations:

|opcode |parameters     |description|
|-------|---------------|-----------|
|ADD|r1, r2 --> r1|
|SUB|r1, r2 --> r1|
|MUL|r1, r2 --> r1|
|DIV|r1, r2 --> r1|
|MOD|r1, r2 --> r1|
|ADDI|r1, value (imm) --> r1|
|SUBI|r1, value (imm) --> r1|
|MULI|r1, value (imm) --> r1|
|DIVI|r1, value (imm) --> r1|
|MODI|r1, value (imm) --> r1|

# Move

|opcode |parameters     |description|
|-------|---------------|-----------|
|ASSIGN|r1, value (imm)| imm --> r1||
|MOV|r1,r2| r2 --> r1|

Notes:
* ASSIGN(R1, 0) will clear a register so unused value is not transmitted with table updates.

# Compare
   IFSTATE - IFSATE state, machine_id  
   IFSTATEi- IFSATE state, machine_id  
   NOTSTATE - NOTSTATE state, machine_id  
   NOTSTATEi - NOTSTATE state, machine_id  
 

## Compare Immediate(Register , Value):

|opcode |parameters     |description|
|-------|---------------|-----------|
|GTi    |register, value|Greater Than or Equal to|
|GTEi   |register, value|Greater Than or Equal to|
|LTi    |register, value|Greater Than or Equal to|
|LTEi   |register, value|Less Than or Equal to|
|EQUALi |register, value|EQUAL to|
|NEQUALi|register, value|Not EQUAL to|

## Compare registers - (Register , Register):

|opcode |parameters     |description|
|-------|---------------|-----------|
|GT|register, register|Greater Than or Equal to.|
|GTE||GTE register, register - Greater Than or Equal to.|
|LT||LTE register, register - Less Than or Equal to|
|LTE||LTE register, register - Less Than or Equal to|
|EQUAL||EQUAL register, register - EQUAL to|
|NEQUAL||NEQUAL register, register - Not EQUAL to|

   IS_A,
   NOT_A,

# Loadview

|opcode |parameters     |description|
|-------|---------------|-----------|
|LOADVIEW|view_id||

# Spell casting

|opcode |parameters     |description|
|-------|---------------|-----------|
|SPELL  |(bParm, wParm)|
|SPELL_ME||dropped a spell on me|
|SPELL_YOU||Dropped a spell on you|

# Signal
|opcode |parameters     |description|
|-------|---------------|-----------|
|SIGNALri|(imm) wParm| wParm is the id of the machine to be signaled. (imm) is the signal id|
|SIGNALi|(imm) wParm| wParm is the id of the machine to be signaled. (imm) is the signal id|
|SIGNAL||(reg) bParm| reg is the register holding the id of of the machine to be signaled. wParm is the to the signaled call.|

# Accept
|opcode |parameters     |description|
|-------|---------------|-----------|
|C_ACCEPT|class|Accept objects of a specific class.|
|O_ACCEPT|idd_object|Accept specific object.|

# TODO
* REF_MACHINE  - reference another machine's registers.
* HANDOFF
* SYNCPOINT
* RAND
* SENDKEYI
* SENDKEY
* SENDMSGI
* SENDMSG
* MAPi
* MAP


