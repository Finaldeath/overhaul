//::///////////////////////////////////////////////
//:: M3Q3A_ENTER
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Autosaves the game on entering the area.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M3Q3A_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M3Q3A_AUTOSAVE",1);
    }
}
