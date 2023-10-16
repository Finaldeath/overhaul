//::///////////////////////////////////////////////
//:: Default On Blocked
//:: NW_C2_DEFAULTE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This will cause blocked creatures to open
    or smash down doors depending on int and
    str.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////
//:: Make sure the refugees are not trying to bash down the locked doors
//:: while they're doing their ambient walking

void main()
{
    object oDoor = GetBlockingDoor();
    if (GetObjectType(oDoor) == OBJECT_TYPE_CREATURE)
    {

        return;
    }
    if(GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 5)
    {
        if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_OPEN) && GetAbilityScore(OBJECT_SELF, ABILITY_INTELLIGENCE) >= 7 )
        {
            DoDoorAction(oDoor, DOOR_ACTION_OPEN);
        }
        else if(GetIsDoorActionPossible(oDoor, DOOR_ACTION_BASH))
        {
            //DoDoorAction(oDoor, DOOR_ACTION_BASH);
            ClearAllActions();
        }
    }
}
