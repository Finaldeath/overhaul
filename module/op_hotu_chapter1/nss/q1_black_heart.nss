//::///////////////////////////////////////////////
//:: q1_black_heart
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Override script to clear combat state
    while hammering.
*/
//:://////////////////////////////////////////////
//:: Created By: Brent
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    object oAnvil = GetNearestObjectByTag("townanvil");
    if (GetIsObjectValid(oAnvil) == TRUE && IsInConversation(OBJECT_SELF) == FALSE && GetIsInCombat(OBJECT_SELF) == FALSE)
    {
       DelayCommand(1.5, (ClearAllActions(TRUE)));
       ActionAttack(oAnvil);
    }
}
