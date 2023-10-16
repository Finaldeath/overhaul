int StartingConditional()
{
  object oPC = GetLocalObject(GetModule(),"NW_G_M2Q5ContestPC");
  if ((oPC == GetPCSpeaker()) && (GetIsPC(GetPCSpeaker())))
  {
    return TRUE;
  }
  return FALSE;
}

