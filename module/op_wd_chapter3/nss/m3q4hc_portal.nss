//::///////////////////////////////////////////////
//:: M3Q4HC_PORTAL.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Transports the player out of Klauth's lair back to the
    door outside the Fire Giant Lair.
*/
//:://////////////////////////////////////////////
//:: Created By:  Cori
//:: Created On:  April 2002
//:://////////////////////////////////////////////

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
        object oTarget = GetObjectByTag("WP_M3Q4E_PORTAL");
        location lLoc = GetLocation(oTarget);
        AssignCommand(oClicker,JumpToLocation(lLoc));
    }
}
