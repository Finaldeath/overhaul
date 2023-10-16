void main()
{
    int nNth = 1;
    object oPC = GetEnteringObject();
    object oMugger;
    if (GetIsPC(oPC) &&
        GetIsObjectValid(GetLocalObject(GetArea(OBJECT_SELF),"NW_G_MuggerPC")) == FALSE)
    {
        SetLocalObject(GetArea(OBJECT_SELF),"NW_G_MuggerPC",oPC);
        oMugger = GetNearestObjectByTag("M1Q04Mugger02",OBJECT_SELF,nNth);
        while(GetIsObjectValid(oMugger))
        {
            SignalEvent(oMugger,EventUserDefined(401));
            nNth++;
            oMugger = GetNearestObjectByTag("M1Q04Mugger02",OBJECT_SELF,nNth);
        }
    }
}
