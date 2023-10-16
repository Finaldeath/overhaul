//::///////////////////////////////////////////////
//:: Inventory Disturbed
//:: M2Q5RobZamithra
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zamithra's gem has been stolen.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oZamithra = GetNearestObjectByTag("M2Q1CSHAR2");

    SetLocalInt(GetModule(),"NW_G_ZamithraRobbed",10);
    SignalEvent(oZamithra,EventUserDefined(502));
}
