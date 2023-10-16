//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark PC has bought belt.
     Take 3500 gold.
     Give Boots to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
void main()
{
    object oBelt = (GetObjectByTag("q2_bulgersbelt"));
    SetLocalInt(OBJECT_SELF,"os_boughtbelt",1);
    TakeGoldFromCreature(3500,GetFirstPC());
    ActionGiveItem(oBelt,GetFirstPC());
}
