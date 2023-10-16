//::///////////////////////////////////////////////
//:: Name q2d_nattrig_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Nathyrra will appear to the PC the first time

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2DNathyrra_1") > 0)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    if (GetIsInCombat(oPC) == TRUE)
        return;

    SetLocalInt(GetModule(), "X2_Q2DNathyrra_1", 1);

    location lSpawn = GetLocation(GetNearestObjectByTag("wp_q2dnathspawn_1"));
    object oNath = CreateObject(OBJECT_TYPE_CREATURE, "x2_hen_nathyrra", lSpawn);
    object oItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oNath);
    object oItem2 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oNath);
    DestroyObject(oItem);
    DestroyObject(oItem2);

    FloatingTextStrRefOnCreature(84137 , oPC);
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oNath, ActionStartConversation(oPC));
}
