//::///////////////////////////////////////////////
//:: Name q2c_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Setup wandering monster system for level 2 of
       Undermountain
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 9/03
//:://////////////////////////////////////////////

#include "x2_inc_restsys"
void main()
{
    if (GetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT") != TRUE)
    {
        WMSetAreaTable(OBJECT_SELF,"Undermountain2");
        SetLocalInt(OBJECT_SELF,"X2_WM_AREA_INIT",TRUE);
    }
    object oPC = GetEnteringObject();
    if (GetLocalInt(OBJECT_SELF, "nSaved") == 1)
        return;

    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nSaved", 1);
        DoSinglePlayerAutoSave();
    }
}

