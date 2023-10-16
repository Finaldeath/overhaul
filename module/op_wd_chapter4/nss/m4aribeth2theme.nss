//::///////////////////////////////////////////////
//:: M4Aribeth2Theme
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts playing Aribeth's theme.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_SETONCE") == 0)
    {
        PlayCharacterTheme(52);
        SetLocalInt(OBJECT_SELF, "NW_L_SETONCE", 1) ;
    }
}
