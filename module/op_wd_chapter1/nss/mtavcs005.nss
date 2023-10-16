int StartingConditional()
{
  int l_iResult;

  l_iResult = (GetIsObjectValid(GetNearestObjectByTag("NWGENBarmaid")) &&

GetLocalInt(OBJECT_SELF,"NW_L_CustomerTalk") == 0 && 

GetLocalInt(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_BarmaidTalk") == 0 &&

GetLocalInt(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_HaveDrink") != 20 &&

GetLocalInt(OBJECT_SELF,"NW_L_NumDrinks") < 5 && 

!GetIsObjectValid(GetLocalObject(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_Customer2")));
  return l_iResult;
}
