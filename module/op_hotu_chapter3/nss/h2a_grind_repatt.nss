//::///////////////////////////////////////////////
//:: Quarry Grinder, Repair Attempt (Action Script)
//:: H2a_Grind_RepAtt.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the player as having attempted the
     Repair check.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "bRepairAttempted", TRUE);
}

