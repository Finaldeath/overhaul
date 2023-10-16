//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: NW_TAV_CustWait.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script sets the customer's NW_L_Drinking
//:: to 10 and resets it to 0 after 30 seconds.
//:: This means that the customer will not bother
//:: the barmaid for 30 seconds.
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
    SetLocalInt(OBJECT_SELF,"NW_L_Drinking",10);
    DelayCommand(30.0,SetLocalInt(OBJECT_SELF,"NW_L_Drinking",0));
}
