//::///////////////////////////////////////////////
//:: Witch Wake: Death GUI
//:: WW_DeathGUI.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     On player dying, pop up the GUI panel giving
     them the option of respawning or waiting.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 4, 2002
//:://////////////////////////////////////////////
void main()
{
    object oPC = OBJECT_SELF;
    int iHP = GetCurrentHitPoints(oPC);
    string sMessage = "You are severely injured and in dire need of healing. "+
                      "You may either wait for assistance or press the "+
                      "Respawn button to let your soul slip into the Plane of "+
                      "Sorrows.";
    if (iHP < 1)
    {
        PopUpDeathGUIPanel(oPC, TRUE, TRUE, 0, sMessage);
    }

    //Prevent the pop-up from reappearing in the Plane of Sorrows.
    string sAreaTag = GetTag(GetArea(OBJECT_SELF));
    if (sAreaTag != "PlaneofSorrows"  ||
        sAreaTag != "PlaneofSorrows2" ||
        sAreaTag != "PlaneofSorrows3" ||
        sAreaTag != "PlaneofSorrows4" ||
        sAreaTag != "TourofSorrows")
    {
        DelayCommand(12.0, ExecuteScript("ww_deathgui", oPC));
    }
}
