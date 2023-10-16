//::///////////////////////////////////////////////
//:: m1q2 Former Guard (User-Defined)
//:: m1q2_FormGuardD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the creature's Follow
    Mode and responds appropriately to seeing the
    Stairs Up & Down.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 29, 2001
//:://////////////////////////////////////////////

void main()
{
    int iEventNumber = GetUserDefinedEventNumber();

    switch (iEventNumber)
    {
        case 1001:
        {
            int iFollowMode = GetLocalInt(OBJECT_SELF, "FollowMode");
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            float fDistance = GetDistanceToObject(oPC);

            if (iFollowMode == TRUE)
            {
                if (GetIsObjectValid(GetPCSpeaker()) == FALSE) //Temporary Hack to prevent NPC from breaking out of conversation.
                {
                    if (fDistance < 3.0)
                    {
                        ActionMoveAwayFromObject(oPC);
                        DelayCommand(1.0, ClearAllActions()); //Temporary Hack until ActionMoveAwayFromObject has a timeout parameter.
                    }
                else
                    {
                        ActionMoveToObject(oPC, TRUE, 5.0);
                    }
                }
            }
        }
        break;

        case 1002:
        {
            object oStairsDown = GetNearestObjectByTag("WP_StairsDown");
            float fDistanceDown = GetDistanceToObject(oStairsDown);

            if (GetIsObjectValid(oStairsDown))
            {
                if (fDistanceDown < 10.0)
                {
                    DestroyObject(oStairsDown);
                    SetLocalInt(OBJECT_SELF, "SeeStairsDown", TRUE);
                    ActionStartConversation(OBJECT_SELF);
                }
            }

            object oStairsUp = GetNearestObjectByTag("m1q2B_m1q2A");
            float fDistanceUp = GetDistanceToObject(oStairsUp);

            if (GetIsObjectValid(oStairsUp))
            {
                if (fDistanceUp < 10.0)
                {
                    DestroyObject(oStairsUp);
                    SetLocalInt(OBJECT_SELF, "SeeStairsUp", TRUE);
                    ActionStartConversation(OBJECT_SELF);
                }
            }
        }
        break;
     }
}
