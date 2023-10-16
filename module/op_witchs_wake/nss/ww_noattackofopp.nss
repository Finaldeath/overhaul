//::///////////////////////////////////////////////
//:: No Attack of Opportunity
//:: WW_NoAttackOfOpp.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Derrick's fix to the Combat Dummies in the
     Prelude of the Official Campaign. It prevents
     creatures from taking Attacks of Opportunity.
*/
//:://////////////////////////////////////////////
//:: Created By: Derrick Collins
//:: Created On: June 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastAttacker();
    SetIsTemporaryFriend(oPC, OBJECT_SELF, FALSE, 0.001);
    DelayCommand(0.001, SetIsTemporaryEnemy(oPC));
}
