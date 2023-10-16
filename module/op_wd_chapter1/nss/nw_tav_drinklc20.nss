//::///////////////////////////////////////////////
//::
//:: Conversation
//::
//:: NW_TAV_DrinkLC20.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script sets the barmaid's NW_L_HaveDrink
//:: to 20.
//:: This means that the barmaid has gone to the bar
//:: to fill a drink order.
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
    SetLocalInt(OBJECT_SELF,"NW_L_HaveDrink",20);
}
