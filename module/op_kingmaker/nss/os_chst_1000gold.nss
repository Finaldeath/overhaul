//::///////////////////////////////////////////////
//:: os_chest_1000gold
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns in 1000 gold.

*/
//:://////////////////////////////////////////////
//:: Created By:   Cori
//:: Created On:   Dec 2003
//:://////////////////////////////////////////////

void main()

{
    if (GetLocalInt(OBJECT_SELF,"NW_DO_ONCE") != 0)
    {
       return;
    }

//    object oOpener = GetLastOpener();
    CreateItemOnObject("nw_it_gold001",OBJECT_SELF,1000);
    SetLocalInt(OBJECT_SELF,"NW_DO_ONCE",1);
}
