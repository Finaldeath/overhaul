//::///////////////////////////////////////////////
//::
//:: Escape Area
//::
//:: NW_M2_Escape.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: Moves to nearest transition and escapes area.
//:: Not guaranteed to succeed.  Don't use with plot
//:: important characters.
//::
//:://////////////////////////////////////////////
//::
//:: Created By: Brent
//:: Created On: May 16, 2001
//::
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    TakeGold(100,GetPCSpeaker());
    SpeakString("pretend I just escaped  area.");
    DestroyObject(OBJECT_SELF);
}
