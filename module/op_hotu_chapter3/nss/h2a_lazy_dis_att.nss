//::///////////////////////////////////////////////
//:: Lazy the Imp, Dismantle Attempt (Action Script)
//:: H2a_Lazy_Dis_Att.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as having attempted the
     Dismantle check.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 21, 2003
//:://////////////////////////////////////////////

void main()
{
    object oGrinder = GetObjectByTag("QuarryGrinder5");
    SetLocalInt(oGrinder, "bDismantleAttempted", TRUE);
}
