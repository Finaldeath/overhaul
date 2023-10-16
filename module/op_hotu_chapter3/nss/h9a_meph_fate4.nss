//::///////////////////////////////////////////////
//:: Mephistopheles' Fate, Serve the PC (Action Script)
//:: H9a_Meph_Fate4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mephistopheles becomes PC's servant.
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
    SetLocalString(GetModule(), "sMephistophelesFate", "Servant");

    //Apply the Coverup effect
    location lMeph = GetLocation(OBJECT_SELF);
    effect eCover = EffectVisualEffect(VFX_FNF_STRIKE_HOLY);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eCover, lMeph);

    //Swap in the small version
    DestroyObject(OBJECT_SELF);
    object oMephSmall = CreateObject(OBJECT_TYPE_CREATURE, "mephsmall", lMeph);

    //Have him bow in submission.
    AssignCommand(oMephSmall, PlayAnimation(ANIMATION_FIREFORGET_BOW));

    //Add Journal entry
    object oPC = GetPCSpeaker();
    DelayCommand(2.7, ExecuteScript("hx_sendpc_to_end", oPC));
    AddJournalQuestEntry("XP2_Main", 110, oPC, TRUE, TRUE);
    */

    //Destroy Mephistopheles
    DoMephEnd(OBJECT_SELF, GetPCSpeaker(), 4);
}
