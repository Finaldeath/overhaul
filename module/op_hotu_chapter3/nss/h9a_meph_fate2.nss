//::///////////////////////////////////////////////
//:: Mephistopheles' Fate, Become Kindhearted (Action Script)
//:: H9a_Meph_Fate2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mephistopheles becomes kindhearted & good.
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
    SetLocalString(GetModule(), "sMephistophelesFate", "Kindhearted");

    //Apply the Coverup effect
    location lMeph = GetLocation(OBJECT_SELF);
    effect eCover = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eCover, lMeph);

    //Swap in the small version
    DestroyObject(OBJECT_SELF);
    object oMephSmall = CreateObject(OBJECT_TYPE_CREATURE, "mephsmall", lMeph);

    //Change his alignment to good
    AdjustAlignment(oMephSmall, ALIGNMENT_GOOD, 100);

    //Apply daze VFX
    effect eDaze = EffectVisualEffect(VFX_IMP_DAZED_S);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eDaze, oMephSmall);

    //Add Journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE);
    DelayCommand(2.7, ExecuteScript("hx_sendpc_to_end", oPC));
    */
    //Destroy Mephistopheles
    DoMephEnd(OBJECT_SELF, GetPCSpeaker(), 2);
}
