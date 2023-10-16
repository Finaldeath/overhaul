//::///////////////////////////////////////////////
//:: Baram Panic Line
//:: 2Q4A_PAN_KURTH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shout one liner of specific panic
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 13, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nResult = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4A_PANIC_SHOUT");
    if(nResult == 2)
    {
        return TRUE;
    }
    return FALSE;
}
