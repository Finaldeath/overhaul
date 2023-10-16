//::///////////////////////////////////////////////
//:: m1q2 Guard Free (Low Charisma)
//:: m1q2_GuardFreeL (NW_D2_Gen_Check)
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Only available once he's been freed. Low
    Charisma player.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Nov 24, 2001
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

int StartingConditional()
{
    int iSetFree = GetLocalInt(OBJECT_SELF, "SetFree");
    int iTalkedTo = GetLocalInt(OBJECT_SELF, "TalkedTo");
    object oPC = GetPCSpeaker();

    if(iSetFree == TRUE)
    {
        if (iTalkedTo == FALSE)
        {
            if (GetIsObjectValid(oPC))
            {
                return CheckCharismaLow();
            }
        }
    }
    return FALSE;
}
