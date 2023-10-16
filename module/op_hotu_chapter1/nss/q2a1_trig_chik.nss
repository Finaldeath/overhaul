//::///////////////////////////////////////////////
//:: Name : q2a1_trig_chik
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When this crate is destroyed, create a chicken
    that will be mauled by a roving dog.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 14/03
//:://////////////////////////////////////////////

void main()
{
    object oChicken = CreateObject(OBJECT_TYPE_CREATURE, "q2a1_chicken", GetLocation(OBJECT_SELF));
    AssignCommand(oChicken, ActionMoveToObject(GetWaypointByTag("q2a1chickenrun"), TRUE));
}
