//::///////////////////////////////////////////////
//:: M2Q2E_DEATH4.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets an integer on the player to indicate that s/he has killed the druid
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 6, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    SetLocalInt(oPC,"NW_M2Q2E_LKILLED",4);
    //AssignCommand(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),SpeakString("I win the first circle!"));
    SetLocalInt(oPC,"NW_M2Q2E_LELGARBEAT",TRUE);
}
