//::///////////////////////////////////////////////
//:: Dice Bag: Module OnActivateItem Event
//:: DiceBag_Activate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script is part of the Dice Bag.erf.
     When placed on the OnActivateItem event on
     Module Properties page, it will allow for the
     use of the Dice Bag item.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel (BioWare Live Team)
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

void main()
{
    object oItem = GetItemActivated();
    object oActivator = GetItemActivator();
    location lActivator = GetLocation(oActivator);
    string sItemTag = GetTag(oItem);

    if (sItemTag == "DiceBag")
    {
        object oPlaceable = CreateObject(OBJECT_TYPE_PLACEABLE, "dicebag", lActivator);
        DelayCommand(1.0, AssignCommand(oPlaceable, ActionStartConversation(oActivator, "", TRUE)));
    }
}
