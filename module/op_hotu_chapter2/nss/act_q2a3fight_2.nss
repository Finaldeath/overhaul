//::///////////////////////////////////////////////
//:: Name act_q2a3fight_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The two groups of nobels have at em.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 27/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    //Set variable on PC so post-fight they know the PC didn't stop it
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X2_Q2A3_FightProvoker", 1);

    object oEvil1 = GetObjectByTag("q2a3evilguard1");
    object oEvil2 = GetObjectByTag("q2a3evilguard2");
    object oEvil3 = GetObjectByTag("q2a3evilguard3");
    object oGood1 = GetObjectByTag("q2a3guard1");
    object oGood2 = GetObjectByTag("q2a3guard2");

    //Evil 1 enemies
    SetIsTemporaryEnemy(oGood1, oEvil1);
    SetIsTemporaryEnemy(oGood2, oEvil1);

    //Evil 2 enemies
    SetIsTemporaryEnemy(oGood1, oEvil2);
    SetIsTemporaryEnemy(oGood2, oEvil2);

    //Evil 3 enemies
    SetIsTemporaryEnemy(oGood1, oEvil3);
    SetIsTemporaryEnemy(oGood2, oEvil3);

    //Good enemies
    SetIsTemporaryEnemy(oEvil1, oGood1);
    SetIsTemporaryEnemy(oEvil2, oGood1);
    SetIsTemporaryEnemy(oEvil3, oGood1);

    SetIsTemporaryEnemy(oEvil1, oGood2);
    SetIsTemporaryEnemy(oEvil2, oGood2);
    SetIsTemporaryEnemy(oEvil3, oGood2);

    AssignCommand(oEvil1, ActionEquipMostDamagingMelee());
    AssignCommand(oEvil2, ActionEquipMostDamagingMelee());
    AssignCommand(oEvil3, ActionEquipMostDamagingMelee());

    AssignCommand(oEvil1, ActionDoCommand(ActionAttack(oGood1)));
    AssignCommand(oEvil2, ActionDoCommand(ActionAttack(oGood2)));
    AssignCommand(oEvil3, ActionDoCommand(ActionAttack(oGood2)));

    AssignCommand(oGood1, ActionEquipMostDamagingMelee());
    AssignCommand(oGood2, ActionEquipMostDamagingMelee());
    DelayCommand(2.0, AssignCommand(oGood1, DetermineCombatRound()));
    DelayCommand(2.0, AssignCommand(oGood2, DetermineCombatRound()));
}

