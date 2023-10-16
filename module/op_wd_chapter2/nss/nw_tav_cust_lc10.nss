//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: NW_TAV_CustLC10.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script sets the barmaid's NW_L_BarmaidTalk
//:: and the customer's NW_L_CustomerTalk to 10.
//:: This means that the barmaid and customer are busy
//:: talking to each other.
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

    ClearAllActions();
    SetLocalInt(OBJECT_SELF,"NW_L_CustomerTalk",10);
    SetLocalInt(oBarmaid,"NW_L_BarmaidTalk",10);
}
