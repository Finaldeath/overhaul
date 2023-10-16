//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName hx_mim_transfer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will transfer the mimic stolen armor to
     the dead mimic chest.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 13, 2003
//:://////////////////////////////////////////////

// Transfer the stolen armor.
void TransferItems();

void main()
{
    int nUser = GetUserDefinedEventNumber();
    location lLoc = GetLocation(GetObjectByTag("h4c_spawn_exit_wp"));
    object oMim1 = GetObjectByTag("hx_mimic_center", 0);
    object oMim2 = GetObjectByTag("hx_mimic_center", 1);
    object oMim3 = GetObjectByTag("hx_mimic_center", 2);

    if(nUser == 8888)
    {
        // Destroy center rings.
        DestroyObject(oMim1);
        DestroyObject(oMim2);
        DestroyObject(oMim3);

        // Create the exit.
        //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_X), lLoc);
        //CreateObject(OBJECT_TYPE_PLACEABLE, "h4a_portal_out", lLoc);
        DelayCommand(1.5, TransferItems());
    }
}

// Transfer the stolen armor.
void TransferItems()
{
    object oPC = GetFirstPC();
    object oMimic = GetObjectByTag("hx_mim_chest");
    object oItem = GetFirstItemInInventory();

    while(GetIsObjectValid(oItem))
    {
        CopyItem(oItem, oMimic);
        oItem = GetNextItemInInventory();
    }

    //FloatingTextStringOnCreature("The mimic is dead. An astral door appears beside you.", oMimic);
    //FloatingTextStrRefOnCreature(100976, oMimic);
    AssignCommand(oPC, ClearAllActions(TRUE));
    AssignCommand(oPC, ActionStartConversation(oPC, "hx_mimdem_h_conv", TRUE, FALSE));
}
