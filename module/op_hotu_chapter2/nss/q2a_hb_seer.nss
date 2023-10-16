//::///////////////////////////////////////////////
//:: Name q2a_hb_seer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On Heartbeat (after the battles have started)
    If the Seer's conversation variable has been
    set (post-attack wave) - have the seer start
    conversation with the nearest PC
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 18/03
//:://////////////////////////////////////////////

void main()
{
    if (GetAILevel() == AI_LEVEL_VERY_LOW)
        return;

    if (GetLocalInt(OBJECT_SELF, "nWantToTalk") != 1)
        return;

    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    ActionStartConversation(oPC);

}
