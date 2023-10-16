int StartingConditional()
{
  int bCondition = GetLocalInt(GetModule(),"NW_G_PlotAldo") >=  30 &&
                   GetIsPC(GetPCSpeaker()) == TRUE;
  return bCondition;
}
