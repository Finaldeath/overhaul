//::///////////////////////////////////////////////
//:: Mephistopheles' Fate, Co-Rulership of Baator w PC (Action Script)
//:: H9a_Meph_Fate5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mephistopheles rules Baator along with the
     PC.
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
    SetLocalString(GetModule(), "sMephistophelesFate", "Co-Ruler");

    //Apply the Coverup effect
    location lMeph = GetLocation(OBJECT_SELF);
    effect eCover = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eCover, lMeph);

    //Swap in the small version
    DestroyObject(OBJECT_SELF);
    object oMephSmall = CreateObject(OBJECT_TYPE_CREATURE, "mephsmall", lMeph);

    //Have him and the player salute each other.
    object oPC = GetPCSpeaker();
    AssignCommand(oMephSmall, PlayAnimation(ANIMATION_FIREFORGET_SALUTE));
    AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_SALUTE));

    //Add Journal entry
    AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE);
    DelayCommand(2.7, ExecuteScript("hx_sendpc_to_end", oPC));
    */

    //Destroy Mephistopheles
    DoMephEnd(OBJECT_SELF, GetPCSpeaker(), 5);
}
