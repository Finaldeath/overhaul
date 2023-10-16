//::///////////////////////////////////////////////
//:: Mephistopheles' Fate, Surrender Cania to Knowes (Action Script)
//:: H9a_Meph_Fate7.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mephistopheles surrenders the Prime Material
     to the player and Cania to the Knowers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Edited By: Brad Prince
//:: Created On: September 10, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
void main()
{
    /*//Set M's Fate local
    SetLocalString(GetModule(), "sMephistophelesFate", "CaniaKnowers");

    //Apply the Coverup effect
    location lMeph = GetLocation(OBJECT_SELF);
    effect eCover = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eCover, lMeph);

    //Swap in the small version
    DestroyObject(OBJECT_SELF);
    object oMephSmall = CreateObject(OBJECT_TYPE_CREATURE, "mephsmall", lMeph);

    //Have him kneel in submission.
    AssignCommand(oMephSmall, PlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0, 5.0));

    //Add Journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE);
    DelayCommand(2.7, ExecuteScript("hx_sendpc_to_end", oPC));
    */

    //Destroy Mephistopheles
    DoMephEnd(OBJECT_SELF, GetPCSpeaker(), 7);
}
