//::///////////////////////////////////////////////
//:: Name con_q1dkobold_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Hurc initiates dialogue if:

- Lodar, the cook and the mob commoners are all dead
- Hurc is still friendly and alive
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 19/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetArea(OBJECT_SELF), "nCOMMONSATTACKED") == 1 && GetLocalInt(GetArea(OBJECT_SELF), "nKOBOLDSATTACKED") != 1)
        return TRUE;

    return FALSE;
}
