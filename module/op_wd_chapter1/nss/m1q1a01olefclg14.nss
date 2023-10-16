int StartingConditional()
{
 int bCondition = GetLocalInt(GetModule(),"NW_G_M1S2MaskShutDown") == FALSE;
 return bCondition;
}
