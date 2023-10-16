//::///////////////////////////////////////////////
//:: x0_portal_act_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(GetObjectByTag("hx_final_fight_pc_start"));
    object oPC = GetPCSpeaker();

    object oRing = OBJECT_INVALID;
    object oTempRing1 = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
    object oTempRing2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

    if(GetTag(oTempRing1) == "hx_puzzle_ring")
        oRing = oTempRing1;
    else if(GetTag(oTempRing2) == "hx_puzzle_ring")
        oRing = oTempRing2;

    if(GetIsObjectValid(oRing))
    {
        DelayCommand(0.5, AssignCommand(oPC, ActionUnequipItem(oRing)));
    }

    //PortalJumpToPlayerDeath(GetPCSpeaker());
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_GREATER), GetLocation(GetObjectByTag("x2_deathdoor")));
    DelayCommand(1.0, AssignCommand(oPC, ActionJumpToLocation(lLoc)));
    //DestroyObject(OBJECT_SELF, 1.5);
}
