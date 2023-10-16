//::///////////////////////////////////////////////
//:: Name hx_safetrig_mep2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will reset the trigger.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 9, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
#include "x2_inc_cutscene"
void main()
{
    object oPC = GetExitingObject();
    int iCut = CutGetActiveCutsceneForObject(oPC);

    if(GetTag(oPC) == "HX_PC_COPY_FINAL")
    {
        return;
    }
    else if(iCut < 1)
    {
        // Set an int that the player is up here so Meph can deal with them.
        SetPCNotAtGrapple(oPC);
        SetLavaUnsafe(oPC);
    }
}
