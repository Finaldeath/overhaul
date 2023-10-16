void main()
{
    int nDeaths = GetLocalInt(GetArea(OBJECT_SELF),"NW_L_M1AmbushDeaths");
    if(nDeaths < 2)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_L_M1AmbushDeaths",nDeaths + 1);
    }
    else
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_L_M1AmbushDeaths",0);
        SignalEvent(GetNearestObjectByTag("M1_Ambush"),EventUserDefined(0));
    }
}
