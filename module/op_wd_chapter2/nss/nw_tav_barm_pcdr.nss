//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: NW_TAV_BarM_PCDR.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script sets the barmaid's NW_L_Customer
//:: to the PC.
//:: This means that she will bring this PC a
//:: drink after going to the bar.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: November 7, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_BarmaidTalk",0);

    //  The barmaid can store two drink orders at a time.
    if (GetLocalObject(OBJECT_SELF,"NW_L_Customer") == OBJECT_INVALID)
    {
        SetLocalObject(OBJECT_SELF,"NW_L_Customer",GetPCSpeaker());
    }
    else
    {
        SetLocalObject(OBJECT_SELF,"NW_L_Customer2",GetPCSpeaker());
    }
}
