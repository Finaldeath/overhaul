//::///////////////////////////////////////////////
//:: M3Q1_YUSAMCURE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If player has elk tribe cure
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
    object oCure = GetItemPossessedBy(oPC,"M3Q2A14_CURE");
    iResult = GetIsObjectValid(oCure);
    return iResult;
}
