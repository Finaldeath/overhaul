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
void AttackEnemy();
void main()
{
    AttackEnemy();
    DelayCommand(1.0, AttackEnemy());
    DelayCommand(2.0, AttackEnemy());
    DelayCommand(3.0, AttackEnemy());
    DelayCommand(4.0, AttackEnemy());
    DelayCommand(5.0, AttackEnemy());
}

void AttackEnemy()
{
    if(GetCurrentAction() != ACTION_ATTACKOBJECT)
    {
        object oEnemy;
        object oEnemy1 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 1);
        object oEnemy2 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 2);
        object oEnemy3 = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF, 3);

        int iRandom = Random(3);

        if(iRandom == 0)
        {
            oEnemy = oEnemy1;
        }
        else if(iRandom == 1)
        {
            oEnemy = oEnemy2;
        }
        else if(iRandom == 2)
        {
            oEnemy = oEnemy3;
        }
        ActionAttack(oEnemy);
    }
}
