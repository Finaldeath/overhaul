//::///////////////////////////////////////////////
//:: M2Q2_RANDOMWALK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the animal walk randomly.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 8, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();
    if (nUser == 1001)
    {
        if (!GetIsObjectValid(GetAttemptedAttackTarget())
        && !GetIsObjectValid(GetAttemptedSpellTarget())
        && !IsInConversation(OBJECT_SELF))
        {
            ActionRandomWalk();
        }
    }
}
