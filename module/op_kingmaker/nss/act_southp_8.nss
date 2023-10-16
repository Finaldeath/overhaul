//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Mark PC has bought bracers.
     Take 6500 gold.
     Give Bracers to PC.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: July 24, 2003
//:://////////////////////////////////////////////
void main()
{
    object oBracer = (GetObjectByTag("q2_bulgersbracer"));
    SetLocalInt(OBJECT_SELF,"os_boughtbracer",1);
    TakeGoldFromCreature(6500,GetFirstPC());
    ActionGiveItem(oBracer,GetFirstPC());
}
