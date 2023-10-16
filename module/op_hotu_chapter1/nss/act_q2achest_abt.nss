//::///////////////////////////////////////////////
//:: Name: act_q2achest_abt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When first openning the PCs chest - he will
    pick up the portal stone...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 7/03
//:://////////////////////////////////////////////

void main()
{
    object oDrow = GetObjectByTag("q2adrowassassin");
    object oPC = GetPCSpeaker();                                           \
    object oChest = OBJECT_SELF;
    if (GetIsObjectValid(oDrow) == FALSE)
    {
        DelayCommand(0.5, AssignCommand(oPC, DoPlaceableObjectAction(oChest, PLACEABLE_ACTION_USE)));
    }
    ExecuteScript("q2a_starttam", oPC);
 //OpenInventory(OBJECT_SELF, GetPCSpeaker());

}
