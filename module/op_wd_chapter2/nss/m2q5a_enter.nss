//::///////////////////////////////////////////////
//:: Entered
//:: M2Q5A_Enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:John Winski
//:: Created On: April 29, 2002
//:://////////////////////////////////////////////

void main()
{
    if(GetLocalInt(GetModule(),"NW_G_M2Q5A_AUTOSAVE")==0 && GetIsPC(GetEnteringObject()))
    {
        DoSinglePlayerAutoSave();
        SetLocalInt(GetModule(),"NW_G_M2Q5A_AUTOSAVE",1);
    }
}
