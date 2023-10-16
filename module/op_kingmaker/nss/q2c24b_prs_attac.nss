//::///////////////////////////////////////////////
//:: Prisoner Attacks Monsters
//:: q2c24b_prs_attac
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The prisoner runs out to attack the monsters
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oWay = GetObjectByTag("q2c24b_way_pris");
    effect eGhost = EffectCutsceneGhost();

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGhost, OBJECT_SELF, 4.0f);
    ChangeToStandardFaction(OBJECT_SELF,STANDARD_FACTION_DEFENDER);
    SetLocalInt(OBJECT_SELF,"OS_PRISONER_FREE",TRUE);
    ActionMoveToObject(oWay,TRUE);
}
