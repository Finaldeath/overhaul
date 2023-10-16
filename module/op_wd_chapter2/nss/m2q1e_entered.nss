//::///////////////////////////////////////////////
//:: Entered
//:: M2Q1E_Entered
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes sure to give any PC, entering
    the area, a stone of recall as long as they do
    not already have one.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();

    if (GetIsPC(oEntered) && !GetIsObjectValid(GetItemPossessedBy(oEntered,"NW_IT_RECALL")))
    {
        CreateItemOnObject("NW_IT_RECALL",oEntered);
    }
    if(GetLocalInt(GetModule(),"NW_G_M2Q1E_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q1E_AUTOSAVE",1);
    }
}
