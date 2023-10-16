//::///////////////////////////////////////////////
//:: Witch's Wake 1: Module OnPlayerEquipItem
//:: WW_OnEquipItem.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handles time-limited torches and any other
     OnEquip behavior.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 16, 2003
//:://////////////////////////////////////////////

void ExtinguishTorch(object oTorch)
{
    //If the torch is still equipped by the torch owner...
    object oTorchOwner = GetItemPossessor(oTorch);
    object oLeftHandItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTorchOwner);
    if (oLeftHandItem == oTorch)
    {
        //Send a feedback message...
        string sMessage = "Your torch gutters and goes out.";
        SendMessageToPC(oTorchOwner, sMessage);
        //And destroy the torch.
        DestroyObject(oTorch);
    }
}

void main()
{
    object oPC = GetPCItemLastEquippedBy();
    object oEquipped = GetPCItemLastEquipped();
    string sTag = GetTag(oEquipped);

    //Time-limited torches
    if (sTag == "hc_torch" ||
        sTag == "NW_IT_TORCH001")
    {
        //Increment the number of times the torch has been equipped.
        int iNumTimesEquipped = GetLocalInt(oEquipped, "iNumTimesEquipped");
        iNumTimesEquipped++;
        SetLocalInt(oEquipped, "iNumTimesEquipped", iNumTimesEquipped);

        //Use this to guesstimate how long the torch should burn.
        float fBurnTime = 600.0 / iNumTimesEquipped;

        //Extinguish the torch if it's still equpped at that time.
        DelayCommand(fBurnTime, ExtinguishTorch(oEquipped));
    }
}
