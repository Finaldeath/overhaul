int StartingConditional()
{
 int l_iResult;

 l_iResult =GetLocalInt(OBJECT_SELF,"L_TALKTIMES") == 1 &&
               GetLocalObject(OBJECT_SELF,"NW_G_M1Q6A02PartyLeader") ==
GetPCSpeaker();
 return l_iResult;
}
