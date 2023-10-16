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

void main()
{

    object oPC = GetLastOpenedBy();
    CTG_CreateTreasure(TREASURE_TYPE_MED, GetLastOpener(), OBJECT_SELF);

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_MUMMY_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_MUMMY_ONCE", 1);

    object oMummy = CreateObject(OBJECT_TYPE_CREATURE, "nw_mummy", GetLocation(oPC));
    AssignCommand(oMummy, SetFacingPoint(GetPosition(oPC)));
    AssignCommand(oMummy, DetermineCombatRound(oPC));
    AssignCommand(oPC, PlaySound("c_mummycom_bat1"));

}

