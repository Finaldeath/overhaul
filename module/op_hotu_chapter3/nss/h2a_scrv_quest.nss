//::///////////////////////////////////////////////
//:: Scrivener, Give Quest (Action Script)
//:: H2a_Scrv_Quest.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the Quest as being given and have the
     Scrivener join as a Follower.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    //Flag the Quest as being given.
    SetLocalInt(OBJECT_SELF, "bQuestGiven", TRUE);

    //Add him to the party as a Follower (copied from x2_d1_addfollow.nss)
    object oPC = GetPCSpeaker();
    AddHenchman(oPC, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", TRUE);

    //Set the first Nav Point
    SetLocalString(OBJECT_SELF, "sNavPoint", "Treason");
}
