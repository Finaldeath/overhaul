//::///////////////////////////////////////////////////
//:: X0_C2_SPWN_CORP
//:: OnSpawn handler.
//:: Spawn in as a decorative-only corpse. Useful for
//:: making nice-looking corpses.
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/07/2002
//::///////////////////////////////////////////////////

#include "x0_i0_corpses"

void main()
{
    KillAndReplaceDecorative(OBJECT_SELF);
    object oCorpse = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_corpse001", GetLocation(OBJECT_SELF));
    LootInventorySlots(OBJECT_SELF, oCorpse, FALSE, FALSE);
    LootInventory(OBJECT_SELF, oCorpse);
}
