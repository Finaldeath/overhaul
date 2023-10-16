//::///////////////////////////////////////////////
//:: Ambient Attack placeables
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  This script attacks archery targets or
  training dummies, if a player is around to watch
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  December 2001
//:://////////////////////////////////////////////

void main()
{
    if ((IsInConversation(OBJECT_SELF) == FALSE) && (GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)) == TRUE)&&(GetIsInCombat() == FALSE))
    {
        // 50% chance that the creature attacks the dummy
        if(Random(2)<1)
        {
            ClearAllActions();
            ActionAttack(GetNearestObjectByTag("NW_TARGET"));
        }
    }
    if (GetIsInCombat() == TRUE)
    {
        // 50% chance that the creature stops attacking the target each round.
        if ((GetTag(GetAttackTarget())=="NW_TARGET") && (Random(2)<1))
        {
            ClearAllActions(TRUE);
        }
    }
}
