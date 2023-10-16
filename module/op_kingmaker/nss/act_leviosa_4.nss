//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     mark pc joined foresters, take 100 gold,
     lower prices in store
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Sept 3, 2003
//:://////////////////////////////////////////////
void main()
{
    TakeGoldFromCreature(100,GetFirstPC());
    SetLocalInt(GetFirstPC(),"os_pcjoinedforesters",1);
}
