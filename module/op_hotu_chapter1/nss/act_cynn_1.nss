//::///////////////////////////////////////////////
//:: Name  : act_cynn_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
          Give the PC 30 gp from Cynn
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 23/03
//:://////////////////////////////////////////////

void main()
{
    GiveGoldToCreature(GetPCSpeaker(), 30);
}
