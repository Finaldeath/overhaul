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
void AttackEnemy(object oEnemy);
void main()
{
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);

    AttackEnemy(oEnemy);
    DelayCommand(1.0, AttackEnemy(oEnemy));
    DelayCommand(2.0, AttackEnemy(oEnemy));
    DelayCommand(3.0, AttackEnemy(oEnemy));
    DelayCommand(4.0, AttackEnemy(oEnemy));
    DelayCommand(5.0, AttackEnemy(oEnemy));
}

void AttackEnemy(object oEnemy)
{
    if(GetCurrentAction() != ACTION_ATTACKOBJECT)
    {
        ActionAttack(oEnemy);
    }
}
