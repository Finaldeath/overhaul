//::///////////////////////////////////////////////
//:: M3Q3B09LABCAST
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks in Map 3B Lab's to see
    if a valid item (Staff of Command)
    can be constructed
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

#include "M3Q3B09LAB"

void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_SETUP") == 0)
    {
        SetupLab();
        SetLocalInt(OBJECT_SELF,"NW_SETUP",1);
    }

    CreateLabItem(GetLastSpell());
}
