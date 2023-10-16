//::///////////////////////////////////////////////
//:: Name hx_safetrig_meph
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will remove slow effects from the PC,
     and keep them from taking lava damage.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept 9, 2003
//:://////////////////////////////////////////////
#include "hx_inc_meph"
#include "x2_inc_cutscene"
void main()
{
    object oPC = GetEnteringObject();
    int iCut = CutGetActiveCutsceneForObject(oPC);

    if(GetTag(oPC) == "HX_PC_COPY_FINAL")
    {
        return;
    }
    else if(iCut < 1)
    {
        // Set an int that the player is up here so Meph can deal with them.
        SetPCAtGrapple(oPC);
        // Ditch the ICE slowdown, and make them safe from lava damage.
        RemoveAreaEffects(oPC, GetArea(oPC));
    }
}
