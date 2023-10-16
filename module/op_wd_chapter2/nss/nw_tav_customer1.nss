//::///////////////////////////////////////////////
//::
//:: OnHeartBeat
//::
//:: NW_TAV_Customer1.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script makes the customer order drinks.
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
    //  The random number determines how often the
    //  customer asks for a drink.  The higher the number,
    //  the less frequent.
    int nRandomNum = Random(3);

    //  When the barmaid gets close and neither she or the customer are busy
    //  talking, the customer asks for a drink.
    if (nRandomNum == 0 &&
        GetDistanceToObject(oBarmaid) <= 3.0 &&
        GetLocalInt(oBarmaid,"NW_L_BarmaidTalk") == 0 &&
        GetLocalInt(OBJECT_SELF,"NW_L_CustomerTalk") == 0 &&
        GetLocalInt(OBJECT_SELF,"NW_L_Drinking") == 0)
    {
        ActionStartConversation(oBarmaid);
    }

    //  The customer will sober up over time.
    if (GetLocalInt(OBJECT_SELF,"NW_L_NumDrinks") > 0 && GetLocalInt(OBJECT_SELF,"NW_L_SoberUp") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_SoberUp",10);
        DelayCommand(500.0,SetLocalInt(OBJECT_SELF,"NW_L_NumDrinks",GetLocalInt(OBJECT_SELF,"NW_L_NumDrinks") - 1));
        DelayCommand(500.0,SetLocalInt(OBJECT_SELF,"NW_L_SoberUp",0));
    }
}
