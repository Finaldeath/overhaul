//::///////////////////////////////////////////////
//:: AutoSave (Action)
//:: A_AutoSave.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Does an autosave on a DoOnce (saved on the
     object).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 10, 2003
//:://////////////////////////////////////////////

void main()
{
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bAutoSaved");
    if (bDoOnce == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bAutoSaved", TRUE);
        DoSinglePlayerAutoSave();
    }
}
