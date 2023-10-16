//::///////////////////////////////////////////////
//:: Witch Wake 1: Module OnUnacquire
//:: WW1_OnUnacquire.nss
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the de-acquisition of all important
     items in WW1.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 15, 2004
//:://////////////////////////////////////////////

void main()
{
    object oUnacquired = GetModuleItemLost();
    object oUnacquiredBy = GetModuleItemLostBy();
    string sItemTag = GetTag(oUnacquired);

    //Kobold Captain drops the Bridge Key
    if (sItemTag == "ww1_BridgeKey" &&
        GetIsPC(oUnacquiredBy) == FALSE)
    {
        //Spawn in a Sparkly to highlight it.
        location lLoc = GetLocation(oUnacquiredBy);
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_magicwhite", lLoc, FALSE, "ww1_BridgeKey_Sparkly");
    }
}
