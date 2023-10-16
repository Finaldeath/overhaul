//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Take 100 gold from PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 21, 2003
//:://////////////////////////////////////////////
void main()
{
    TakeGoldFromCreature(100,GetPCSpeaker());
    SetLocalInt(GetPCSpeaker(), "X1_GiveGilford100", GetLocalInt(GetPCSpeaker(), "X1_GiveGilford100") + 1);

}
