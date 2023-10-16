//::///////////////////////////////////////////////
//:: M4Q1B13_AUTOSAVE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Autosaves the game on entering the area.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    May 2002
//:://////////////////////////////////////////////

void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M4Q1B13_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M4Q1B13_AUTOSAVE",1);
    }
}
