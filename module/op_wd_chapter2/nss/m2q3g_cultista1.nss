//::///////////////////////////////////////////////
//:: m2q3G Cultist Action Script #1
//:: m2q3G_CultistA1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes the Cultist to flee from the player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Feb 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    ActionMoveAwayFromObject(oPC, TRUE);
}
