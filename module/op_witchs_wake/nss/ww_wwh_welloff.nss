//::///////////////////////////////////////////////
//:: Witch Wake: WW Handler, Deactivate Old Man's Well (WW1)
//:: WW_WWH_WellOff.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Deactivates the Old Man's Well
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bWellActive", FALSE);
    SendMessageToAllDMs("The Old Man's Well is now INACTIVE. Players "+
                        "will not be able to enter Brogan's Tears until it is "+
                        "activated.");
}
