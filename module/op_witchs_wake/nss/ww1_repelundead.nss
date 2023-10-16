//::///////////////////////////////////////////////
//:: Witchwork 1: Repel Undead
//:: WW1_RepelUndead.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Used in the Myrkwood to keep undead from
     camping the Ethereal Leak.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 18, 2002
//:://////////////////////////////////////////////

void main()
{
    object oMoveTo = GetObjectByTag("Myrkwood_MoveTo");
    object oEnterer = GetEnteringObject();
    int iRacialType = GetRacialType(oEnterer);

    if (iRacialType == RACIAL_TYPE_UNDEAD)
    {
        AssignCommand(oEnterer, ClearAllActions());
        AssignCommand(oEnterer, ActionMoveToObject(oMoveTo));
        AssignCommand(oEnterer, ActionRandomWalk());
    }
}
