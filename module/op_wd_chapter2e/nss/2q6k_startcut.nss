//::///////////////////////////////////////////////
//:: Start Cut Scene
//:: 2q6k_startcut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Starts the dialogue for the cut scene
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 18, 2002
//:://////////////////////////////////////////////
#include "nw_i0_hostincl"
#include "NW_I0_PLOT"

void main()
{
    int nLocal = GetLocalInt(OBJECT_SELF, "NW_2Q6K_CUT_SCENE");

    if(nLocal == 0)
    {
        PlayCharacterTheme(54);
        SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START", 5);
        SetLocalInt(OBJECT_SELF, "NW_2Q6K_CUT_SCENE", 1);
    }
}
