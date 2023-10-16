int StartingConditional()
{
  //int bCondition = (GetLocalInt(GetModule(),"NW_G_PlotAldo") >= 30);
  int bCondition = (GetTag(GetArea(OBJECT_SELF)) == "SERPENT_LOWER" ||
                   GetTag(GetArea(OBJECT_SELF)) == "TEMPLE_OF_HELM") &&
                   GetLocalInt(GetModule(),"NW_G_PlotAldo") >= 30;
  return bCondition;
}
