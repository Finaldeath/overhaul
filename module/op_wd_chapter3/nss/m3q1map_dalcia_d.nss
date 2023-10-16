//::///////////////////////////////////////////////
//:: M3Q1MAP_DALCIA_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets Dalcia to attack the target on her heartbeat
    if she still has arrows.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 8, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser==1001)
    {
        if ((IsInConversation(OBJECT_SELF) == FALSE) && (GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)) == TRUE)&&(GetIsInCombat() == FALSE))
        {
//            if(GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"nw_wamar001"))==TRUE)
//            {
                ClearAllActions();
                ActionAttack(GetNearestObjectByTag("NW_TARGET"));
//            }
        }

    }
}
