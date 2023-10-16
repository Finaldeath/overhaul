int StartingConditional()
{
  int l_iResult;

  l_iResult = (GetDistanceToObject(GetNearestObjectByTag("NWGENBarmaid")) <= 3.0 &&

GetLocalInt(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_HaveDrink") == 20 &&

GetLocalObject(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_Customer") == OBJECT_SELF);
  return l_iResult;
}
