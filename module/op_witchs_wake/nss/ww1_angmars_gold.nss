//::///////////////////////////////////////////////
//:: Witchwork 1: Angmar's Gold
//:: WW1_Angmars_Gold.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does a one-time creation of 63 gold in this
     container's inventory.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 13, 2002
//:://////////////////////////////////////////////

void main()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "DoOnce");

    if (bDoOnce == FALSE)
    {
        CreateItemOnObject("nw_it_gold001", OBJECT_SELF, 63);
        SetLocalInt(OBJECT_SELF, "DoOnce", TRUE);
    }
}
