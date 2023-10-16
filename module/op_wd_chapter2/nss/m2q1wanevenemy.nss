//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1WanevEnemy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wanev goes hostile.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_StoleFromWanev",20);
    AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),OBJECT_SELF,-100);
}
