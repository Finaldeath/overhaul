//::///////////////////////////////////////////////
//:: m1q2 Commoner (User-Defined)
//:: m1q2_CommonerD
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the creature's Follow
    Mode and responds appropriately to seeing the
    District Gates.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 29, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    int iEventNumber = GetUserDefinedEventNumber();

    switch (iEventNumber)
    {
//Follow the nearest PC if I have FollowMode turned on.
        case 1001:
        {
            object oPC = GetLocalObject(OBJECT_SELF, "M1Q2AFollowTarget");
            if (GetIsObjectValid(oPC))
            {
                ActionForceFollowObject(oPC,5.0);
            }
         }
        break;

//Start appropriate conversation if I come within range of the District Gates.
       /* case 1002:
        {
            object oGate = GetNearestObjectByTag("To City Core");
            float fDistance = GetDistanceToObject(oGate);

            if (GetIsObjectValid(oGate))
            {
                if (fDistance < 15.0)
                {
                    SetLocalInt(OBJECT_SELF, "SeeStairs", TRUE);
                    ActionStartConversation(OBJECT_SELF);
                }
            }
        }
        break;   */
     }
}
