//::///////////////////////////////////////////////
//:: M4Q1DA_ATTONEND
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Attack Nearest PC
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: January 25, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
    SetIsTemporaryEnemy(oPC);
    //Shout that I was attacked
    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
    object oWarrior = GetNearestObjectByTag("M4Q1D07Warrior");
    AssignCommand(oWarrior,DetermineCombatRound(oPC));
    DetermineCombatRound(oPC);
}
