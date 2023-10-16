//::///////////////////////////////////////////////
//:: Name q1a1_at_town
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Don't let PCs leave until they've talked to
    Ayala once...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 4/03
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetClickingObject();
    if (GetLocalInt(GetModule(), "X1_Q1AAYALATALK") != 1)
    {
        FloatingTextStrRefOnCreature(40416, oClicker);

    }
    else
    {
        SetImmortal(oClicker, FALSE);
        object oTarget = GetTransitionTarget(OBJECT_SELF);
        location lLoc = GetLocation(oTarget);

        AssignCommand(oClicker,JumpToLocation(lLoc));
    }
}
