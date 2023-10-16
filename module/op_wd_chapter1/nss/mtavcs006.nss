int StartingConditional()
{
  int l_iResult;

  l_iResult = (GetIsObjectValid(GetNearestObjectByTag("NWGENBarmaid")) &&

GetLocalInt(OBJECT_SELF,"NW_L_CustomerTalk") == 0 && 

GetLocalInt(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_BarmaidTalk") == 0 &&

GetIsObjectValid(GetLocalObject(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_Customer")) &&

GetLocalObject(GetNearestObjectByTag("NWGENBarmaid"),"NW_L_Customer") != OBJECT_SELF);
  return l_iResult;
}
