//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     PC succeeded in getting an advance from J'Nah
     && Give PC 100 gold.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Mar 12, 2003
//:://////////////////////////////////////////////
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_JNAHADVANCE",20);
    GiveGoldToCreature(GetPCSpeaker(),100);
}

