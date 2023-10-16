//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: NW_TAV_DrinkLC0.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script edits the barmaid's customer list.
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

    //  If there are two customers, put the second customer up on the queue and erase the first one.
    if (GetIsObjectValid(GetLocalObject(oBarmaid,"NW_L_Customer2")))
    {
        SetLocalInt(OBJECT_SELF,"NW_L_CustomerTalk",0);
        SetLocalInt(OBJECT_SELF,"NW_L_NumDrinks",GetLocalInt(OBJECT_SELF,"NW_L_NumDrinks") + 1);
        DelayCommand(60.0,SetLocalInt(OBJECT_SELF,"NW_L_Drinking",0));
        SetLocalObject(oBarmaid,"NW_L_Customer",GetLocalObject(oBarmaid,"NW_L_Customer2"));
        SetLocalObject(oBarmaid,"NW_L_Customer2",OBJECT_INVALID);
    }
    else
    {
        SetLocalInt(oBarmaid,"NW_L_HaveDrink",0);
        SetLocalInt(OBJECT_SELF,"NW_L_CustomerTalk",0);
        SetLocalInt(OBJECT_SELF,"NW_L_NumDrinks",GetLocalInt(OBJECT_SELF,"NW_L_NumDrinks") + 1);
        DelayCommand(60.0,SetLocalInt(OBJECT_SELF,"NW_L_Drinking",0));
        SetLocalObject(oBarmaid,"NW_L_Customer",OBJECT_INVALID);
    }
}
