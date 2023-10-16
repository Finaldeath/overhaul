//::///////////////////////////////////////////////
//:: Illithid Initiates
//:: q3_init_illithid
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The illithid initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
void main()
{
    object oPC = GetFirstPC();
    object oCheck;
    int iBadFlag = FALSE;

   if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered())
    {
        oCheck = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(oPC));
        while (GetIsObjectValid(oCheck) == TRUE)
        {
            if(GetIsReactionTypeHostile(oPC, oCheck) == TRUE)
            {
                iBadFlag = TRUE;
            }

            oCheck = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_HUGE, GetLocation(oPC));
        }

        if ((GetIsInCombat(oPC) == FALSE) && (iBadFlag == FALSE))
        {
            location lPC = GetLocation(oPC);
            AssignCommand(oPC, ClearAllActions(TRUE));
            object oLight = CreateObject(OBJECT_TYPE_PLACEABLE,"q3_illithidlight", lPC, FALSE, "KM_TRICKLIGHT");
            DelayCommand(0.5, AssignCommand(oLight, ActionStartConversation(oPC, "q3_illithid")));

            os_SetTriggerEntered();
        }
    }
}
