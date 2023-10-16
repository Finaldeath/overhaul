//::///////////////////////////////////////////////
//:: M2Q2_RANDOMTALK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the animal walk randomly.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: February 19, 2002
//:://////////////////////////////////////////////

void main()
{
//    int nRandom = Random(30);
//    if (nRandom >= 10)
//    {
        int nUser = GetUserDefinedEventNumber();
        if (nUser == 1001)
        {
            if (!GetIsObjectValid(GetAttemptedAttackTarget())
            && !GetIsObjectValid(GetAttemptedSpellTarget())
            && !IsInConversation(OBJECT_SELF))
            {
                SpeakOneLinerConversation("M2Q2GRelCrazy");
                ActionRandomWalk();
            }
        }
//    }
}
