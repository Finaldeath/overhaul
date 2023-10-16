//::///////////////////////////////////////////////
//:: General Treasure Spawn Script   Medium
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in general purpose treasure, usable
    by all classes.
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   February 26 2001
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"

void main()

{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int nStack = Random(200) + 50;
    //CreateItemOnObject("nw_it_gold001", OBJECT_SELF, nStack);
    GiveGoldToCreature(GetLastOpenedBy(), nStack);
    AssignCommand(GetLastOpenedBy(), PlaySound("it_coins"));
    DestroyObject(OBJECT_SELF);
    ShoutDisturbed();
}
