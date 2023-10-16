//::///////////////////////////////////////////////
//:: Name act_q1dkobold_14
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
the barricade is destroyed
the kobolds become allied with the PC
the cook, Lodar and the mob become hostile

once the battle is done, if the kobolds have not been attacked and
Hurc is alive, he should initiate dialogue.
Otherwise all the kobolds should run out of the tavern.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 19/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
#include "nw_i0_generic"


void main()
{
    //The Players
    object oPC = GetPCSpeaker();
    object oShaman = GetObjectByTag("q1dk_shaman");
    object oKobold1 = GetObjectByTag("q1dk_footpad1");
    object oKobold2 = GetObjectByTag("q1dk_footpad2");
    object oKobold3 = GetObjectByTag("q1dk_footpad3");
    object oKobold4 = GetObjectByTag("q1dk_footpad4");
    object oCook = GetObjectByTag("q1dcook");
    object oLodar = GetObjectByTag("q1dlodar");
    object oMob1 = GetObjectByTag("q1dmob1");
    object oMob2 = GetObjectByTag("q1dmob2");
    object oMob3 = GetObjectByTag("q1dmob3");
    object oMob4 = GetObjectByTag("q1dmob4");
    object oMob5 = GetObjectByTag("q1dmob5");
    object oMob6 = GetObjectByTag("q1dmob6");


    object oBarricade = GetObjectByTag("q1dbaricade_7");
    SetLocalInt(GetArea(oPC), "nKoboldDestroyed", 1);

    object oExit = GetWaypointByTag("wp_q1d_exit");

    effect eDamage = EffectDamage(500);

    if (oBarricade != OBJECT_INVALID)
    {
        AssignCommand(oShaman, ActionAttack(oBarricade));
        AssignCommand(oKobold1, ActionAttack(oBarricade));
        AssignCommand(oKobold2, ActionAttack(oBarricade));
        AssignCommand(oKobold3, ActionAttack(oBarricade));
        AssignCommand(oKobold4, ActionAttack(oBarricade));
        DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));

    }
    else
    {
        DelayCommand(0.5, AssignCommand(oShaman, ActionAttack(oMob1)));
        DelayCommand(0.5, AssignCommand(oKobold1, ActionAttack(oLodar)));
        DelayCommand(0.5, AssignCommand(oKobold2, ActionAttack(oMob3)));
        DelayCommand(0.5, AssignCommand(oKobold3, ActionAttack(oMob4)));
        DelayCommand(0.5, AssignCommand(oKobold4, ActionAttack(oMob5)));
    }
    /*
    DelayCommand(4.0, AssignCommand(oShaman, ActionMoveToObject(oMob3, TRUE)));
    DelayCommand(4.0, AssignCommand(oKobold1, ActionMoveToObject(oMob3, TRUE)));
    DelayCommand(4.0, AssignCommand(oKobold2, ActionMoveToObject(oMob3, TRUE)));
    DelayCommand(4.0, AssignCommand(oKobold3, ActionMoveToObject(oMob3, TRUE)));
    DelayCommand(4.0, AssignCommand(oKobold4, ActionMoveToObject(oMob3, TRUE)));
    */

    DelayCommand(1.0, AssignCommand(oMob1, ActionAttack(oPC)));
    DelayCommand(1.5, AssignCommand(oMob2, ActionAttack(oKobold1)));
    DelayCommand(1.0, AssignCommand(oMob3, ActionAttack(oShaman)));
    DelayCommand(1.2, AssignCommand(oMob4, ActionAttack(oPC)));
    DelayCommand(1.7, AssignCommand(oMob5, ActionAttack(oBarricade)));
    DelayCommand(1.0, AssignCommand(oMob6, ActionAttack(oPC)));
    DelayCommand(1.0, AssignCommand(oCook, ActionAttack(oPC)));

    DelayCommand(4.0, AssignCommand(oShaman, ActionAttack(oMob1)));
    DelayCommand(4.0, AssignCommand(oKobold1, ActionAttack(oLodar)));
    DelayCommand(4.0, AssignCommand(oKobold2, ActionAttack(oMob3)));
    DelayCommand(4.0, AssignCommand(oKobold3, ActionAttack(oMob4)));
    DelayCommand(4.0, AssignCommand(oKobold4, ActionAttack(oMob5)));

    DelayCommand(10.0, AssignCommand(oShaman, DetermineCombatRound()));
    DelayCommand(10.0, AssignCommand(oKobold1, DetermineCombatRound()));
    DelayCommand(10.0, AssignCommand(oKobold2, DetermineCombatRound()));
    DelayCommand(10.0, AssignCommand(oKobold3, DetermineCombatRound()));
    DelayCommand(10.0, AssignCommand(oKobold4, DetermineCombatRound()));


    //Turn kobolds hostile and commoners good and start combat

    //Change all factions

    ChangeToStandardFaction(oCook, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oLodar, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oMob1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oMob2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oMob3, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oMob4, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oMob5, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oMob6, STANDARD_FACTION_HOSTILE);

    //Make sure kobolds hate commoners
    SetIsTemporaryEnemy(oShaman, oLodar);
    SetIsTemporaryEnemy(oShaman, oMob1);
    SetIsTemporaryEnemy(oShaman, oMob2);
    SetIsTemporaryEnemy(oShaman, oMob3);
    SetIsTemporaryEnemy(oShaman, oMob4);
    SetIsTemporaryEnemy(oShaman, oMob5);
    SetIsTemporaryEnemy(oShaman, oMob6);

    SetIsTemporaryEnemy(oKobold1, oLodar);
    SetIsTemporaryEnemy(oKobold1, oMob1);
    SetIsTemporaryEnemy(oKobold1, oMob2);
    SetIsTemporaryEnemy(oKobold1, oMob3);
    SetIsTemporaryEnemy(oKobold1, oMob4);
    SetIsTemporaryEnemy(oKobold1, oMob5);
    SetIsTemporaryEnemy(oKobold1, oMob6);

    SetIsTemporaryEnemy(oKobold2, oLodar);
    SetIsTemporaryEnemy(oKobold2, oMob1);
    SetIsTemporaryEnemy(oKobold2, oMob2);
    SetIsTemporaryEnemy(oKobold2, oMob3);
    SetIsTemporaryEnemy(oKobold2, oMob4);
    SetIsTemporaryEnemy(oKobold2, oMob5);
    SetIsTemporaryEnemy(oKobold2, oMob6);

    SetIsTemporaryEnemy(oKobold3, oLodar);
    SetIsTemporaryEnemy(oKobold3, oMob1);
    SetIsTemporaryEnemy(oKobold3, oMob2);
    SetIsTemporaryEnemy(oKobold3, oMob3);
    SetIsTemporaryEnemy(oKobold3, oMob4);
    SetIsTemporaryEnemy(oKobold3, oMob5);
    SetIsTemporaryEnemy(oKobold3, oMob6);

    SetIsTemporaryEnemy(oKobold4, oLodar);
    SetIsTemporaryEnemy(oKobold4, oMob1);
    SetIsTemporaryEnemy(oKobold4, oMob2);
    SetIsTemporaryEnemy(oKobold4, oMob3);
    SetIsTemporaryEnemy(oKobold4, oMob4);
    SetIsTemporaryEnemy(oKobold4, oMob5);
    SetIsTemporaryEnemy(oKobold4, oMob6);

    DelayCommand(12.0, AssignCommand(oLodar, ActionAttack(oShaman)));
    DelayCommand(12.0, AssignCommand(oMob1, ActionAttack(oKobold3)));
    DelayCommand(12.0, AssignCommand(oMob2, ActionAttack(oShaman)));
    DelayCommand(12.0, AssignCommand(oMob3, ActionAttack(oKobold2)));
    DelayCommand(12.0, AssignCommand(oMob4, ActionAttack(oKobold1)));
    DelayCommand(12.0, AssignCommand(oMob5, ActionAttack(oKobold2)));
    DelayCommand(12.0, AssignCommand(oMob6, ActionAttack(oKobold4)));
    DelayCommand(12.0, AssignCommand(oCook, ActionAttack(oPC)));

    DelayCommand(16.0, AssignCommand(oShaman, DetermineCombatRound(oLodar)));
    DelayCommand(16.0, AssignCommand(oKobold1, DetermineCombatRound(oMob2)));
    DelayCommand(16.0, AssignCommand(oKobold2, DetermineCombatRound(oMob3)));
    DelayCommand(16.0, AssignCommand(oKobold3, DetermineCombatRound(oMob4)));
    DelayCommand(16.0, AssignCommand(oKobold4, DetermineCombatRound(oMob5)));

}


