//::///////////////////////////////////////////////
//:: Entered
//:: m2q5gorkanenemy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns Gorkan into the third level of Mutamin's
    challenge if the entering object has the
    crystal egg.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 18, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetEnteringObject(),"M2Q05ICRYSEGG")) &&
        GetLocalInt(GetModule(),"NW_G_GorkanHostile") == 0)
    {
        SetLocalInt(GetModule(),"NW_G_GorkanHostile",10);
        SignalEvent(GetObjectByTag("M2Q05CGORKAN"),EventUserDefined(500));
    }
}
