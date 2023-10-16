//::///////////////////////////////////////////////
//:: Inventory Disturbed
//:: M2Q3StealWanev_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If anything is stolen from Wanev's tower.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_StoleFromWanev") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_StoleFromWanev",10);
        SignalEvent(GetObjectByTag("M2Q1CWANEV"),EventUserDefined(300));
    }
}
