//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: NW_TAV_BarM_LC10.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script sets the barmaid's NW_L_Customer
//:: to the current customer.
//:: This means that she will bring this customer a
//:: drink after going to the bar.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: June 19, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    object oBarmaid = GetNearestObjectByTag("NWGENBarmaid");
    SetLocalInt(oBarmaid,"NW_L_BarmaidTalk",0);
    SetLocalInt(OBJECT_SELF,"NW_L_Drinking",10);

    //  The barmaid can store two drink orders at a time.
    if (GetLocalObject(oBarmaid,"NW_L_Customer") == OBJECT_INVALID)
    {
        SetLocalObject(oBarmaid,"NW_L_Customer",OBJECT_SELF);
    }
    else
    {
        SetLocalObject(oBarmaid,"NW_L_Customer2",OBJECT_SELF);
    }
}
