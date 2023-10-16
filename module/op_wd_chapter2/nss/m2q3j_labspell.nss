//::///////////////////////////////////////////////
//:: m2q3J Wizard Lab Spell Detector
//:: m2q3J_LabSpell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Part of the Wizard Lab template, this script
    is place on the Container's OnSpellCastAt
    event and triggers the creation of the special
    item.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

#include "m2q3J_Lab"

void main()
{
    CreateLabItem(GetLastSpell());
}
