//::///////////////////////////////////////////////
//:: Name hx_on_unequip
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will delete all of the ring arrows that
     have been placed (and anything else that is
     set as being a "ring vision" object.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 22, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
void main()
{
    object oPC = GetPCItemLastUnequippedBy();
    object oRing = GetPCItemLastUnequipped();
    string sRing = "hx_puzzle_ring";
    object oArea = GetArea(oPC);

    ExecuteScript("x2_onunequip", OBJECT_SELF);

    // Check to see if special ring was equipped.
    if(GetTag(oRing) == sRing)
    {
        if(GetTag(oArea) != "KnowerofPlaces" && GetTag(oArea) != "Waterdeep")
        {
            AstralPlanePurge(oPC);
        }
        else
        {
            //SendMessageToPC(oPC, "[NOT IN STRING EDITOR] The ring does not seem to function here.");
            SendMessageToPCByStrRef(oPC, 85523);
        }
    }
}
