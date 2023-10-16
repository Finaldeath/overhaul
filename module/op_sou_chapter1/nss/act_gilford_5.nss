//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take 10 gold from PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
void main()
{
    TakeGoldFromCreature(10,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), "X1_GiveGilford10", GetLocalInt(GetPCSpeaker(), "X1_GiveGilford10") + 1);
}

