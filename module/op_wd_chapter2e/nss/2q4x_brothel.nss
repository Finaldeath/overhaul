//::///////////////////////////////////////////////
//:: One Liner Generic Convo Check
//:: 2Q4X_Brothel
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On:
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetTag(OBJECT_SELF) == "2Q4_BrothelSign")
    {
        return TRUE;
    }
    return FALSE;
}
