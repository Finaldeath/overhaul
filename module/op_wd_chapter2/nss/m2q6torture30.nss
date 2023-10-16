//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6Torture30
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the ogre torturer local to 30 and attacks.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 13, 2001
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,OBJECT_SELF,1,CREATURE_TYPE_PERCEPTION,PERCEPTION_SEEN);

    SetLocalInt(OBJECT_SELF,"NW_L_Torture",30);
    AdjustReputation(OBJECT_SELF,oPC,-100);
    ActionAttack(oPC);
}
