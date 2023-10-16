int StartingConditional()
{
  int iRoll = d100();
  if ((GetIsPC(GetPCSpeaker())) && (iRoll < 21))
  {
    return TRUE;
  }
  return FALSE;
}

