//::///////////////////////////////////////////////
//:: Witchwork 1: Mines Chest (Respawning Torches)
//:: WW1_Chest_Torch.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Reseeds the chest with more torches for
     multiplayer. May try to modify this script
     in the future for use with the corpses in
     the Dawn area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastOpenedBy();
    string sName = GetName(oPC);
    int bHasOpened = GetLocalInt(OBJECT_SELF, sName+"HasOpened");
    object oItem = GetFirstItemInInventory();
    string sItemTag = GetTag(oItem);

    //If they haven't opened this chest before...
    if (bHasOpened == FALSE)
    {
        //Destroy all instances of items on the respawn list
        while (oItem != OBJECT_INVALID)
        {
            if (sItemTag == "hc_torch")
            {
                DestroyObject(oItem);
            }
            oItem = GetNextItemInInventory();
            sItemTag = GetTag(oItem);
        }

        //Respawn items on the respawn list
        CreateItemOnObject("torch");

        //Flag them as having opened this chest
        SetLocalInt(OBJECT_SELF, sName+"HasOpened", TRUE);
    }
}
