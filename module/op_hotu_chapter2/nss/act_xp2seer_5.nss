//::///////////////////////////////////////////////
//:: Name act_xp2seer_5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Take the Mirror from the PC - destroy it.
    Mark the Seer as having it.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Sept 30/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
void main()
{
    object oMirror = GetLocalObject(OBJECT_SELF, "oMirror");
    DestroyObject(oMirror);
    SetGlobalString("sShatteredMirrorGivenTo", "Seer");

    //Reward the PC 1000 xp (only once) for giving the mirror
    if (GetLocalInt(OBJECT_SELF, "nGaveMirrorReward") != 1)
    {
        object oPC = GetPCSpeaker();
        SetLocalInt(OBJECT_SELF, "nGaveMirrorReward", 1);
        Reward_2daXP(oPC, XP_MEDIUM);// 1000 xp

    }
}
