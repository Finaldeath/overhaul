//::///////////////////////////////////////////////
//:: km_deadorc_dist
//:: Copyright (c) 2004 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alert the Orcs Ghost when the orcs corpse is disturbed.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: May 2004
//:://////////////////////////////////////////////
void main()
{
    object oTheif = GetFirstPC();
    object oSelf = OBJECT_SELF;
    object oGhost = GetLocalObject(oSelf, "GHOST");

    FloatingTextStringOnCreature("This corpse's spirit still lingers here. You have angered it by your actions.", oTheif);
    AssignCommand(oGhost, ChangeToStandardFaction(oGhost, STANDARD_FACTION_HOSTILE));
    AssignCommand(oGhost, ClearAllActions(TRUE));
    AssignCommand(oGhost, ActionAttack(oTheif));
}
