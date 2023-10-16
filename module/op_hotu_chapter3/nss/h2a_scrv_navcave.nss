//::///////////////////////////////////////////////
//:: Scrivener, Go to Cave Nav Point (Action Script)
//:: H2a_Scrv_NavCave.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Exit party and return to cave.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    //Remove from party.
    object oPC = GetPCSpeaker();
    RemoveHenchman(oPC, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", FALSE);

    //Run to Cave
    object oCave = GetObjectByTag("WP_AribethsCave");
    ActionForceMoveToObject(oCave, TRUE, 10.0);
}
