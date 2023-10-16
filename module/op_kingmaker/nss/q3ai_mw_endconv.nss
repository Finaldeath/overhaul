//::///////////////////////////////////////////////
//:: Destroy Object
//:: q3ai_mw_endconv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The light destroys itself
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////
//:: Modified By: Keith K2 Hayward
//:: Modified On: April 2004
//:://////////////////////////////////////////////

void main()
{
    // Make sure no conversation can be started with the
    // vanishing object or the PC will be stuck in cutscene
    SetLocalInt(OBJECT_SELF, "flg_cutclosing", TRUE);

    DelayCommand(1.5,DestroyObject(OBJECT_SELF));
}
