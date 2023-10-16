/////Reset Fenthick Talk local on PC

void main()
{
   SetLocalInt(GetPCSpeaker(),"NW_L_FenthickTalk", 0);
   SetLocalInt(OBJECT_SELF,"NW_G_M1Q1A1PlayerConversation",TRUE);
}
