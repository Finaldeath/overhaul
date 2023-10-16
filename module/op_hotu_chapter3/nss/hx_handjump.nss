//::///////////////////////////////////////////////
//:: Name hx_handjump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     The hand jumps from the chest to the PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 25, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oChest = GetObjectByTag("hx_mim_chest");

    // Fix for saving and loading here.
    SetLocalInt(GetModule(), "HX_DEMON_ABORTED", TRUE);

    AssignCommand(oChest, ActionCastSpellAtObject(793, oPC, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    CreateItemOnObject("grapple_hook", oPC, 1);
}
