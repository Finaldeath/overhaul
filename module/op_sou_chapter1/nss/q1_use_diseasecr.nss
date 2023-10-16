//::///////////////////////////////////////////////
//:: General Treasure Spawn Script
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in general purpose treasure, usable
    by all classes.
    UPDATE
    Chance of disease from openning this crate
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   February 26 2001
//:://////////////////////////////////////////////
//UPDATE: Feb 19/03 - Keith Warner
#include "NW_O2_CONINCLUDE"

void main()

{
    if (GetLocalInt(OBJECT_SELF,"NW_DO_ONCE") != 0)
    {
       return;
    }
    object oLastOpener = GetLastOpener();
    GenerateLowTreasure(oLastOpener, OBJECT_SELF);
    SetLocalInt(OBJECT_SELF,"NW_DO_ONCE",1);
    ShoutDisturbed();

    //50% chance of disease on openning..
    //if (d20() <= 10)
    //{
        effect eDisease = EffectDisease(DISEASE_FILTH_FEVER);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDisease, oLastOpener, 300.0);
    //}
}
