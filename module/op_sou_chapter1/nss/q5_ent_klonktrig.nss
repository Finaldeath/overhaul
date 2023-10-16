//::///////////////////////////////////////////////
//:: Name q5_ent_klonktrig
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
    object oKlonk = GetEnteringObject();
    if (GetTag(oKlonk) == "Q5_KLONK")
    {
        object oDest = GetWaypointByTag("Q5A_WP_OX3");
        AssignCommand(oKlonk, ClearAllActions(TRUE));
        AssignCommand(oKlonk, ActionMoveToObject(oDest, TRUE));
    }
}
