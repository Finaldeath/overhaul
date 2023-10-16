//::///////////////////////////////////////////////
//:: q2b03_chk_a
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks that the PC has a torch in one of his hands


*/
//:://////////////////////////////////////////////
//:: Created By: Keith W
//:: Created On: September 23/02
//:://////////////////////////////////////////////
int StartingConditional()
{

    object oPC = GetPCSpeaker();
    object oTorch = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
    object oTorch1 =  GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
    if (GetLocalInt(OBJECT_SELF,"nPartsDust") < 6)
        return FALSE;
    if (GetLocalInt(OBJECT_SELF,"nJugsAle") < 3)
        return FALSE;
    if (GetTag(oTorch) == "NW_IT_TORCH001")
        return TRUE;
    if (GetTag(oTorch1) == "NW_IT_TORCH001")
        return TRUE;

    return FALSE;



}
