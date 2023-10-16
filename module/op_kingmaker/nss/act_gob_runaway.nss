//::///////////////////////////////////////////////
//:: Run Away
//:: act_gob_runaway
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The goblin tries to run away
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

void main()
{
//goblin tries to make a run for it
    object oWay = GetNearestObjectByTag("q3_map_exit");
    ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_HOSTILE);
    ActionMoveToObject(oWay,TRUE);
}
