//::///////////////////////////////////////////////
//:: Ambient Attack placeables
//:: M3Q1A_TARGET_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  This script attacks archery targets or
  training dummies, if a player is around to watch
*/
//:://////////////////////////////////////////////
//:: Created By:  Cori May
//:: Created On:  April 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == 1001)
    {
        if ((IsInConversation(OBJECT_SELF) == FALSE)
        && (GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)) == TRUE)
        &&(GetIsInCombat() == FALSE))
        {
            if(d4()==1)
            {
                ClearAllActions();
                ActionAttack(GetNearestObjectByTag("NW_TARGET"));
            }
            if(d4()!=1)
            {
                ClearAllActions();
            }
        }
    }
}
