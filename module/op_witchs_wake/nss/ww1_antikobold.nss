//::///////////////////////////////////////////////
//:: Witchwork 1: Cemetery Anti-Kobold Trigger
//:: WW1_AntiKobold.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes all reptilian humanoids that enter the
     trigger area to run away.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 1, 2002
//:://////////////////////////////////////////////

void main()
{
    object oKobold = GetEnteringObject();
    int iRace = GetRacialType(oKobold);
    object oStatue = GetNearestObjectByTag("ww1_FireActivator", oKobold);

    if (iRace == RACIAL_TYPE_HUMANOID_REPTILIAN)
    {
        AssignCommand(oKobold, ClearAllActions());
        AssignCommand(oKobold, ActionMoveAwayFromObject(oStatue, TRUE, 7.0));
    }
}
