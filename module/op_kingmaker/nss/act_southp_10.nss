//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark PC has bought boots.
     Take 3500 gold.
     Give Boots to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: August 5, 2003
//:://////////////////////////////////////////////
void main()
{
    object oBoots = (GetObjectByTag("q2_bulgersboots"));
    SetLocalInt(OBJECT_SELF,"os_boughtboots",1);
    TakeGoldFromCreature(3500,GetFirstPC());
    ActionGiveItem(oBoots,GetFirstPC());
}
