//::///////////////////////////////////////////////
//:: Opened
//:: M2Q5FGATEOPENED
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the Luskan gate is opened without permission
    the guards go hostile.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oOpener = GetLastOpenedBy();
    object oGuard1 = GetNearestObjectByTag("M2Q05CLUSKANGUAR");
    object oGuard2 = GetNearestObjectByTag("M2Q05CLUSKANGUAR",OBJECT_SELF,2);

    if(GetLocalInt(GetArea(OBJECT_SELF),"NW_A_GateOpen") == 0)
    {
        AdjustReputation(oOpener,OBJECT_SELF,-100);
        SignalEvent(oGuard1,EventUserDefined(100));
        SignalEvent(oGuard2,EventUserDefined(100));
    }
}
