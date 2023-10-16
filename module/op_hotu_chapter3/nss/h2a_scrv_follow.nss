//::///////////////////////////////////////////////
//:: Scrivener, Follow (Action Script)
//:: H2a_Scrv_Follow.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Have the Scrivener join as a Follower.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    //Add him to the party as a Follower (copied from x2_d1_addfollow.nss)
    object oPC = GetPCSpeaker();
    AddHenchman(oPC, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF, "X2_JUST_A_FOLLOWER", TRUE);
}

