// * if player init'ed this dialog because
// * they tried to open the door, reset the conversation
void main()
{
    SetLocalInt(GetPCSpeaker(),"NW_L_TRIEDTO_OPENDOOR",0) ;
}
