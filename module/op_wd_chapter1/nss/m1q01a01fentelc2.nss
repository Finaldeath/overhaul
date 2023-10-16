/////Set FenthickTalk to 1

void main()
{
   SetLocalInt(GetPCSpeaker(),"NW_L_FenthickTalk", 1);
   SetLocalInt(OBJECT_SELF,"NW_G_M1Q1A1PlayerConversation",TRUE);
}
