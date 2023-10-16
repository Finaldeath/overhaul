//::///////////////////////////////////////////////
//:: act_enivid_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give PC Xbow and bolts
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Oct 17, 2003
//:: Edited by: Cori
//:://////////////////////////////////////////////
void main()
{
    CreateItemOnObject("nw_wammbo002",GetFirstPC(),99);
    //lightning bolts
    CreateItemOnObject("nw_wbwmxh002",GetFirstPC());
    //heavy crossbow +1
}
