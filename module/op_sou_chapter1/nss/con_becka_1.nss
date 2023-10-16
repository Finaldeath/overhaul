//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     check if PC is a male dwarf
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetRacialType(GetPCSpeaker())== GetRacialType(OBJECT_SELF)
        && GetGender(GetPCSpeaker()) != GetGender(OBJECT_SELF))
        return TRUE;
    return FALSE;
}
