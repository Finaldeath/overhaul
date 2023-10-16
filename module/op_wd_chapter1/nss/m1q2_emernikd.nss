//::///////////////////////////////////////////////
//:: m1q2 Emernik (User-Defined)
//:: m1q2_EmernikD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the creature's Follow
    Mode and responds appropriately to seeing the
    Stairs Down.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 30, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    int iEventNumber = GetUserDefinedEventNumber();

    switch (iEventNumber)
    {
//Follow the nearest PC if I have FollowMode turned on.
/*        case 1001:
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
                        ActionMoveToObject(oPC, TRUE, 4.0);
                    }
                }
            }
*/
//Start appropriate conversation if I come within range of the District Gates.
/*            object oStairsDown = GetNearestObjectByTag("StairsDown");
            float fStairsDistance = GetDistanceToObject(oStairsDown);

            if (GetIsObjectValid(oStairsDown))
            {
                if (fStairsDistance < 15.0)
                {
                    SetLocalInt(OBJECT_SELF, "SeeStairs", TRUE);
                    ActionStartConversation(OBJECT_SELF);
                    DestroyObject(oStairsDown);
                }
            }
        }
        break;
*/

        case 1002:
        {
//Ensure that Emernik's initial line is said the first time he sees the player.
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            int iBubbleNumber = GetLocalInt(OBJECT_SELF, "BubbleNumber");

            if (iBubbleNumber == FALSE)
            {
                SetLocalInt(OBJECT_SELF, "BubbleNumber",1);
                ClearAllActions();
                ActionStartConversation(OBJECT_SELF);
             }

//Start appropriate conversation if I come within range of the District Gates.
/*            object oStairsDown = GetNearestObjectByTag("StairsDown");
            float fDistance = GetDistanceToObject(oStairsDown);

            if (GetIsObjectValid(oStairsDown))
            {
                if (fDistance < 15.0)
                {
                    SetLocalInt(OBJECT_SELF, "SeeStairs", TRUE);
                    ActionStartConversation(OBJECT_SELF);
                }
            } */
        }
        break;

     }
}
