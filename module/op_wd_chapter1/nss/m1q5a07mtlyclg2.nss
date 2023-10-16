int StartingConditional()
{
  int l_iResult;

  l_iResult = GetPCSpeaker() == OBJECT_INVALID &&
              GetLocalInt(OBJECT_SELF,"L_TALKTIMES")  == 2;
  return l_iResult;
}
