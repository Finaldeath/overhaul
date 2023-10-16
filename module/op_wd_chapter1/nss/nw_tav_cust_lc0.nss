//::///////////////////////////////////////////////
//::
//:: End Conversation - Normal or Aborted
//::
//:: NW_TAV_Cust_LC0.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script sets the barmaid's NW_L_BarmaidTalk
//:: and the customer's NW_L_CustomerTalk to 0.
//:: This means that the barmaid and customer are
//:: available for conversation.
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
    SetLocalInt(OBJECT_SELF,"NW_L_CustomerTalk",0);
    SetLocalInt(GetNearestObjectByTag("Barmaid01"),"NW_L_BarmaidTalk",0);
}
