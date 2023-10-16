//::///////////////////////////////////////////////
//:: Opened
//:: m2q2jdoor_open
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opening the door to free Bree will allow her to
    start her freed conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oBree = GetObjectByTag("M2Q2JBree");

    if (GetLocalInt(oBree,"NW_L_BreeFreed") == 0)
    {
        SetLocalInt(oBree,"NW_L_BreeFreed",1);
    }
}
