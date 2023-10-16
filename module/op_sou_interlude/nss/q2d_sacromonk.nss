//::///////////////////////////////////////////////////
//:: X0_O2_ANYMED.NSS
//:: OnOpened/OnDeath script for a treasure container.
//:: Treasure type: Any, random selection from whatever is in base container
//:: Treasure level: TREASURE_TYPE_MED
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 11/21/2002
//::///////////////////////////////////////////////////

#include "x0_i0_treasure"
#include "nw_i0_generic"

void SpawnMonk(object oSac, location lLoc, object oPC)
{
    SetLocalInt(oSac, "DO_MUMMY_ONCE", 1);
    object oMonk = CreateObject(OBJECT_TYPE_CREATURE, "undeadmonk", lLoc);
    AssignCommand(oMonk, SetFacingPoint(GetPosition(oPC)));
    AssignCommand(oMonk, DetermineCombatRound(oPC));
    AssignCommand(oMonk, PlaySound(""));
}

void main()
{

    object oPC = GetLastOpenedBy();
    CTG_CreateTreasure(TREASURE_TYPE_MED, GetLastOpener(), OBJECT_SELF);

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_MUMMY_ONCE");
    if(nDoOnce == 1)
        return;
    AssignCommand(oPC, ClearAllActions());
    SpawnMonk(OBJECT_SELF, GetLocation(OBJECT_SELF), oPC);

    object oSac1 = GetNearestObjectByTag(GetTag(OBJECT_SELF), OBJECT_SELF, 1);
    object oSac2 = GetNearestObjectByTag(GetTag(OBJECT_SELF), OBJECT_SELF, 2);
    object oSac3 = GetNearestObjectByTag(GetTag(OBJECT_SELF), OBJECT_SELF, 3);

    DelayCommand(1.0, SpawnMonk(oSac1, GetLocation(oSac1), oPC));
    DelayCommand(2.0, SpawnMonk(oSac2, GetLocation(oSac2), oPC));
    DelayCommand(3.0, SpawnMonk(oSac3, GetLocation(oSac3), oPC));




}

