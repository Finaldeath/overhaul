//::///////////////////////////////////////////////
//:: Witch Wake: WW Handler, Activate Old Man's Well (WW1)
//:: WW_WWH_WellOn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Activates the Old Man's Well
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bWellActive", TRUE);
    SendMessageToAllDMs("The Old Man's Well is now ACTIVE, allowing players "+
                        "to enter Brogan's Tears.");
}
