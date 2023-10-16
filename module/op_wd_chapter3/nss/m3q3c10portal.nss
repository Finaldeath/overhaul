//::///////////////////////////////////////////////
//:: M3Q3C10Portal.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transports the player out of the guardian
    dragon lair back to the Inn.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  January 2002
//:://////////////////////////////////////////////

#include "M3PLOTINCLUDE"

void main()
{
    object oClicker = GetLastUsedBy();
    if(GetLocalInt(GetModule(),"NW_G_RECALL_HAED") == 10
        || GetIsObjectValid(GetNearestObjectByTag("Haedraline3Q11", oClicker)))
    {
        AssignCommand(OBJECT_SELF, ActionSpeakStringByStrRef(67133));
    }
    else
    {
        object oOldArea = GetArea(oClicker);
        object oTarget = GetObjectByTag("M3Q1A11BBackFromGlobe");
        location lLoc = GetLocation(oTarget);

//  SetAreaTransitionBMP(AREA_TRANSITION_FOREST);
        CheckGlobeInUse(oOldArea);
        AssignCommand(oClicker,JumpToLocation(lLoc));
    }
}

