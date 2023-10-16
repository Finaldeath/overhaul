int StartingConditional()
{
  object oWalters = GetLocalObject(GetModule(),"NW_G_oWalters");
  int bCondition =  GetIsObjectValid(oWalters) &&
                    GetArea(oWalters) == GetArea(OBJECT_SELF) &&
                    GetDistanceToObject(oWalters) < 10.0;


  return bCondition;
}
