int StartingConditional()
{
  int iRoll = d100();
  object oPC = GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC");
  if ((oPC == GetPCSpeaker()) && (GetIsPC(GetPCSpeaker())) && (iRoll < 36))
  {
    return TRUE;
  }
  return FALSE;
}
