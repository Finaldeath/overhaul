//::///////////////////////////////////////////////
//:: Witchwork 1: Memorial, Carving has started
//:: WW1_Mem_Begun_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the memorial has been
     started.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 18, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iBeginningComplete = GetLocalInt(OBJECT_SELF, "iBeginningComplete");

    if (iBeginningComplete > 0)
    {
        return TRUE;
    }
    return FALSE;
}
