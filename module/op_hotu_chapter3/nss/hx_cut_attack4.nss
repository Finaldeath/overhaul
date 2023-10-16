//::///////////////////////////////////////////////
//:: Name hx_cut_attacking
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will keep scriptless chars fighting
     in the cutscenes.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Sept, 29, 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
void AttackEnemy();
void main()
{
    // Feb 26, 2004, Jon: Don't do this unless the fight has actually started.
    if(GetLocalInt(GetArea(OBJECT_SELF), "YJ_FIGHT_STARTED") == 0)
        return;

    object oPC = GetFirstPC();

    int iCut = CutGetActiveCutsceneForObject(oPC);
    if(iCut < 1)
    {
        if(GetArea(OBJECT_SELF) == GetArea(oPC))
        {
            AttackEnemy();
            DelayCommand(1.0, AttackEnemy());
            DelayCommand(2.0, AttackEnemy());
            DelayCommand(3.0, AttackEnemy());
            DelayCommand(4.0, AttackEnemy());
            DelayCommand(5.0, AttackEnemy());
        }
    }
}

void AttackEnemy()
{
    if(GetCurrentAction() != ACTION_ATTACKOBJECT)
    {
        object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

        ActionAttack(oEnemy);
    }
}
