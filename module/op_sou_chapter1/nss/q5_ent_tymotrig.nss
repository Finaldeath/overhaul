//::///////////////////////////////////////////////
//:: Name q5_ent_tymotrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 //
//if dragon enters (being led by a PC in combat would be the only way)
//send the dragon back into his lair
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 6/03
//:://////////////////////////////////////////////

void main()
{
    object oDragon = GetEnteringObject();
    if (GetTag(oDragon) == "NW_DRGWHITE001")
    {
        object oDest = GetWaypointByTag("wp_dragon_goto");
        AssignCommand(oDragon, ClearAllActions(TRUE));
        AssignCommand(oDragon, ActionMoveToObject(oDest, TRUE));
    }
}
